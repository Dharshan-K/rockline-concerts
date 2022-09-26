/** @format */

import "../styles/globals.css";
import { MoralisProvider } from "react-moralis";

function MyApp({ Component, pageProps }) {
  return (
    <MoralisProvider
      serverUrl="a7eYjdJJHhUIXrXKnYiJUCdT065Pvq6YuswBDACq"
      appId="https://pukmgiuulebb.usemoralis.com:2053/server"
    >
      <Component {...pageProps} />
    </MoralisProvider>
  );
}

export default MyApp;
