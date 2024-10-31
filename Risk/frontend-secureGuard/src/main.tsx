import './index.css'

import {NextUIProvider} from "@nextui-org/react";

import { createRoot } from 'react-dom/client'
import AppRouter from "./routes/AppRouter.tsx";

createRoot(document.getElementById('root')!).render(
  <NextUIProvider>
    <AppRouter />
  </NextUIProvider>,
)
