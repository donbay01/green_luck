/**
 * Get game code
 */
if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'newFreeCode') {
    exports.newFreeCode = require('./src/newCode').newFreeCode;
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'newPremiumCode') {
    exports.newPremiumCode = require('./src/newCode').newPremiumCode;
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'newWorksheetCode') {
    exports.newWorksheetCode = require('./src/newCode').newWorksheetCode;
}


/**
 * Delete Account
 */
if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'deleteAccount') {
    exports.deleteAccount = require('./src/deleteAccount').deleteAccount;
}


/**
 * Gen link
 */
if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'genLink') {
    exports.genLink = require('./src/paystack').genLink;
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'webhook') {
    exports.webhook = require('./src/paystack/webhook').webhook;
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'accountcleanup') {
    exports.accountcleanup = require('./src/paystack/expiration').accountcleanup;
}