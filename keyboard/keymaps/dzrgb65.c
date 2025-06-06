#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT(
        KC_GRV,        KC_1,    KC_2,            KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,              KC_MINS,    KC_EQL,     KC_BSPC,
        LT(5, KC_TAB),  KC_Q,    KC_W,            KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,              KC_LBRC,    KC_RBRC,    KC_BSLS,
        CTL_T(KC_ESC), KC_A,    KC_S,            KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN,           KC_QUOT,                KC_ENT,
        SFT_T(KC_CAPS), KC_Z,    KC_X,            KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  RSFT_T(KC_SLSH),               KC_UP,      LT(3, KC_DEL),
        KC_LCTL,        KC_LGUI, KC_LALT,                            KC_SPC,                    KC_RALT, MO(2),             KC_LEFT,    KC_DOWN,    KC_RGHT
    ),
    [1] = LAYOUT(
        KC_ESC,        KC_1,    KC_2,            KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,              KC_MINS,    KC_EQL,     KC_BSPC,
        KC_TAB,  KC_Q,    KC_W,            KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,              KC_LBRC,    KC_RBRC,    KC_BSLS,
        KC_CAPS, KC_A,    KC_S,            KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN,           KC_QUOT,                KC_ENT,
        KC_LSFT, KC_Z,    KC_X,            KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  RSFT_T(KC_SLSH),               KC_UP,      LT(3, KC_DEL),
        KC_LCTL,        KC_LGUI, KC_LALT,                            KC_SPC,                    KC_RALT, MO(2),             KC_LEFT,    KC_DOWN,    KC_RGHT
    ),
    [2] = LAYOUT(
        TO(4),   KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_KB_POWER,
        _______, _______, KC_UP,   _______, RGB_TOG, RGB_MOD, KC_CALC, _______, KC_INS,  _______, KC_PSCR, _______, KC_PAUS, QK_REBOOT,
        _______, KC_LEFT, KC_DOWN, KC_RGHT, _______, TG(1), TO(0), _______, _______, KC_PGUP, KC_BRID, KC_BRIU,          _______,
        _______,          _______, _______, _______, _______, _______, NK_TOGG, _______, KC_PGDN, KC_END,  KC_MPLY, KC_VOLU, KC_MUTE,
        _______, _______, _______,                            QK_BOOT,                   _______, _______, KC_MPRV, KC_VOLD, KC_MNXT
    ),
    [3] = LAYOUT(
        _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_DEL,
        _______, RGB_TOG, _______, RGB_HUI, RGB_HUD, RGB_SAI, RGB_SAD, RGB_VAI, RGB_VAD, RGB_MOD, _______, _______, _______, QK_REBOOT,
        _______, _______, _______, _______, _______, _______, _______, _______, RGB_SPI, RGB_SPD, _______, _______,          _______,
        _______,          _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
        _______, _______, _______,                            _______,                   _______, _______, _______, _______, _______
    ),
    [4] = LAYOUT(
        _______, KC_PSLS, KC_PAST, KC_PMNS, KC_PPLS, _______, _______, _______, _______, KC_PSLS, KC_PAST, KC_PMNS, KC_PPLS, _______,
        _______, KC_P7,   KC_P8,   KC_P9,   _______, _______, _______, _______, KC_P7,   KC_P8,   KC_P9,   _______, _______, TO(0),
        _______, KC_P4,   KC_P5,   KC_P6,   _______, _______, _______, _______, KC_P4,   KC_P5,   KC_P6,   _______,          KC_PENT,
        _______,          KC_P1,   KC_P2,   KC_P3,   _______, _______, _______, _______, KC_P1,   KC_P2,   KC_P3,   _______, _______,
        _______, KC_P0,   KC_PDOT,                            KC_PENT,                   KC_P0,   KC_PDOT, _______, _______, _______
    ),
    [5] = LAYOUT(
        _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12, _______,
        _______, KC_LSFT,   KC_LCTL,   _______,   _______, _______, _______, _______, KC_UP,   _______,   _______,   _______, _______, _______,
        _______, _______,   _______,   _______,   _______, _______, _______, KC_LEFT, KC_DOWN,   KC_RGHT,   _______,   _______,          _______,
        _______,          _______,    KC_X,       KC_C,    KC_V, _______, _______, _______, _______,   _______,   _______,   _______, _______,
        _______, _______,   _______,                            _______,                   _______,   _______, _______, _______, _______
    )
};
