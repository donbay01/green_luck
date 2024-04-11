const admin = require('firebase-admin')
const db = admin.firestore()

exports.getUserData = async (uid) => {
    const doc = await db.collection('users').doc(uid).get()
    return doc.data()
}

exports.updateUser = (uid, data) => {
    const doc = db.collection('users').doc(uid)
    return doc.update(data)
}

exports.getTokens = async () => {
    const ref = await db.collection('users').where('role', '==', 'Paid').get()
    let tokens = ref.docs.map((e) => e.data().token)
    tokens = tokens.filter((e) => e != null && e != undefined)

    return tokens
}