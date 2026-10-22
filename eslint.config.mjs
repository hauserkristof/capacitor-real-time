import ionic from '@ionic/eslint-config/recommended.js';

export default [
  {
    ignores: [
      '**/dist/**',
      '**/build/**',
      '**/.build/**',
      'android/.gradle/**',
      'ios/**/Pods/**',
      'example-app/android/**',
      'example-app/ios/**',
    ],
  },
  ...ionic,
];
