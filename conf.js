exports.config = {
    framework: 'jasmine',
    directConnect: true,
    specs: ['src/tests/**/*.spec.js'],
    capabilities: {
        'browserName': 'chrome',
        chromeOptions: {
            args: [
                '--disable-web-security', // DISABLE CORS
                '--disable-gpu',          // AVOID CHROME HEADLESS ERROR
                '--ssl-version-max=tls1', // AVOID CREDENTIALS ERROR
                '--disable-extensions',
                '--headless',
                '--no-sandbox'
            ]
        },
    }
}
