/**
 * Batch process array
 * @param {number} len 
 * @param {Array} arr
 * @returns {Array} resultArray
 */

exports.batchArray = (arr, len) => {
    var chunks = [], i = 0, n = arr.length;
    while (i < n) {
        chunks.push(arr.slice(i, i += len));
    }
    return chunks;
}