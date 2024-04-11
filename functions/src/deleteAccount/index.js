const functions = require('firebase-functions')
const admin = require('firebase-admin')

const db = admin.firestore()

exports.deleteAccount = functions.runWith({ memory: '8GB' }).auth.user().onDelete((user, context) => {
    const { uid } = user

    return db.collection('users').doc(uid).delete()
})