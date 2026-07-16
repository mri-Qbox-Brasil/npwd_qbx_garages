/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_REACT_APP_IN_GAME?: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
