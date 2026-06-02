function OcCookieBanner() {
  const obj = {};
  obj.version = '1.0.0';
  obj.categories = [];
  obj.strings = {
    banner: {
      text: '<p>Il nostro sito utilizza cookies. Cliccando su "Gestisci '+
        'cookies" puoi modificare le tue preferenze sui cookies per tipologia.'+
        '</p>',
      handleCookies: 'Gestisci cookies',
      acceptAll: 'Accetta tutti',
      rejectAll: 'Rifiuta tutti',
    },
    settings: {
      title: 'Impostazioni cookies',
      text: '<p>Seleziona le categorie di cookie che vuoi attivare</p>',
      accept: 'Conferma scelte',
      close: 'Chiudi',
      acceptAll: 'Accetta tutti',
      rejectAll: 'Rifiuta tutti',
    },
  },
  obj.getCookieSettings = function () {
    if(
      localStorage.acceptedCookiesData &&
      localStorage.acceptedCookiesVersion === obj.version
    ) {
      let cookiesJson = localStorage.acceptedCookiesData;
      return JSON.parse(cookiesJson);
    }
    return {};
  },
  obj.addCategory = function (atts) {
    if(undefined !== obj.categories.find(el => el.id === atts.id)) {
      return;
    }
    obj.categories.push(atts);
  };
  obj.load = function () {
    if(null !== document.getElementById('ocCookieBanner')) {
      return;
    }
    let userCookieSettings = obj.getCookieSettings();
    let acceptedSettingCallbacks = obj.categories
      .filter(category => true === userCookieSettings[category.id])
      .map(category => category.callback);
    acceptedSettingCallbacks.forEach(callback => callback());
    if(!obj.hasAlreadyAcceptedCookies()) {
      document.body.classList.add('oc-cookie-banner-open');
    }
    let cookieBanner = document.createElement('div');
    cookieBanner.id = 'ocCookieBanner';
    cookieBanner.innerHTML =
      '<div class="cookie-banner-text">'+
        obj.strings.banner.text+
      '</div>'+
      '<div class="cookie-banner-buttons">'+
        '<button class="cookie-banner-button-settings">'+obj.strings.banner.handleCookies+'</button>'+
        '<button class="cookie-banner-button-reject">'+obj.strings.banner.rejectAll+'</button>'+
        '<button class="cookie-banner-button-accept">'+obj.strings.banner.acceptAll+'</button>'+
      '</div>'+
      '<div class="cookie-banner-close-wrapper"><div class="cookie-banner-close"></div></div>';
    document.body.appendChild(cookieBanner);
    document
      .querySelector('#ocCookieBanner .cookie-banner-button-accept')
      .addEventListener('click', obj.acceptCookies);
    document
      .querySelector('#ocCookieBanner .cookie-banner-button-reject')
      .addEventListener('click', obj.rejectCookies);
    document
      .querySelector('#ocCookieBanner .cookie-banner-button-settings')
      .addEventListener('click', obj.openSettings);
    document
      .querySelector('#ocCookieBanner .cookie-banner-close')
      .addEventListener('click', obj.rejectCookies);
    let cookieSettings = document.createElement('div');
    cookieSettings.id = 'ocCookieSettings';
    cookieSettings.innerHTML =
      '<div class="cookie-settings-modal">'+
        '<div class="cookie-settings-text">'+
          '<div class="cookie-settings-title">'+
            '<p>'+obj.strings.settings.title+'</p>'+
            '<div class="cookie-settings-top-close"></div>'+
          '</div>'+
          '<p class="cookie-settings-description">'+
            obj.strings.settings.text+
          '</p>'+
        '</div>'+
        '<div class="cookie-settings-flags"></div>'+
        '<div class="cookie-settings-buttons">'+
          '<button class="cookie-settings-button-accept">'+obj.strings.settings.accept+'</button>'+
          '<button class="cookie-settings-button-close">'+obj.strings.settings.close+'</button>'+
        '</div>'+
      '</div>';
    document.body.appendChild(cookieSettings);
    let cookieFlags = obj.categories.map(category =>
      '<label class="cookie-settings-flag">'+
        '<div class="cookie-settings-flag-checkbox">'+
          '<input type="checkbox" name="cookie-settings[]" value="'+category.id+'"'+(category.mandatory ? ' checked disabled' : '')+' />'+
        '</div>'+
        '<div class="cookie-settings-flag-text">'+
          '<div class="cookie-settings-flag-title">'+
            category.title+
          '</div>'+
          '<div class="cookie-settings-flag-description">'+
            category.description+
          '</div>'+
        '</div>'+
      '</label>'
    ).join('');
    document.querySelector('#ocCookieSettings .cookie-settings-flags').innerHTML = cookieFlags;
    document
      .querySelector('#ocCookieSettings .cookie-settings-button-accept')
      .addEventListener('click', obj.acceptSelectedCookies);
    document
      .querySelector('#ocCookieSettings .cookie-settings-button-close')
      .addEventListener('click', obj.closeSettings);
    document
      .querySelector('#ocCookieSettings .cookie-settings-top-close')
      .addEventListener('click', obj.closeSettings);
    document.querySelectorAll('#ocCookieSettings .cookie-settings-flag-checkbox input[type="checkbox"]').forEach(
      checkbox => {
        let id = checkbox.value;
        if(true === userCookieSettings[id]) {
          checkbox.checked = true;
        }
      }
    )
    let cookieButton = document.createElement('div');
    cookieButton.id = 'ocCookieButton';
    cookieButton.addEventListener('click', obj.openSettings);
    document.body.appendChild(cookieButton);
  };
  obj.acceptCookies = function () {
    let categoryIds = obj.categories.map(category => category.id);
    let acceptedCookies = categoryIds.reduce(
      (carry, item) => {
        carry[item] = true;
        return carry;
      },
      {}
    );
    obj.saveUserSettings(acceptedCookies);
    location.reload();
  };
  obj.rejectCookies = function () {
    let categoryIds = obj.categories.map(category => category.id);
    let acceptedCookies = categoryIds.reduce(
      (carry, item) => {
        carry[item] = false;
        return carry;
      },
      {}
    );
    obj.saveUserSettings(acceptedCookies);
    location.reload();
  };
  obj.openSettings = function () {
    document.body.classList.add('oc-cookie-settings-open');
  };
  obj.closeSettings = function () {
    document.body.classList.remove('oc-cookie-settings-open')
  }
  obj.acceptSelectedCookies = function () {
    let checkboxes = Array.from(document.querySelectorAll('#ocCookieSettings .cookie-settings-flag-checkbox input[type="checkbox"]'));
    let acceptedCookies = checkboxes.reduce((carry, checkbox) => {
      carry[checkbox.value] = checkbox.checked;
      return carry;
    }, {});
    obj.saveUserSettings(acceptedCookies);
    location.reload();
  };
  obj.saveUserSettings = function (settings) {
    let settingsJson = JSON.stringify(settings);
    localStorage.acceptedCookiesVersion = obj.version;
    localStorage.acceptedCookiesData = settingsJson;
  };
  obj.hasAlreadyAcceptedCookies = function () {
    return localStorage.acceptedCookiesVersion === obj.version;
  };
  return obj;
}
