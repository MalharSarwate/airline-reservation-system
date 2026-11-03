/**
 * AeroLuxe - CSRF Token Handling & Authenticated Fetch Utility
 */

function getCsrfToken() {
    const token = document.querySelector('meta[name="_csrf"]')?.content;
    const header = document.querySelector('meta[name="_csrf_header"]')?.content;
    return { token, header };
}

function fetchWithAuth(url, options = {}) {
    const csrf = getCsrfToken();
    const headers = {
        'Content-Type': 'application/json',
        ...(options.headers || {})
    };
    if (csrf.token && csrf.header) {
        headers[csrf.header] = csrf.token;
    }
    return fetch(url, { ...options, headers });
}
