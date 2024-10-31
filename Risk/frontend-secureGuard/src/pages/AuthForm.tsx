import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { Icon } from "../utils/getIconByName";
import { Link } from "react-router-dom";

interface AuthFormProps {
  isLogin: boolean;
}

export const AuthForm = ({ isLogin }: AuthFormProps) => {
  const [showPassword, setShowPassword] = useState(false);
  const [backPosition, setBackPosition] = useState({ x: 0, y: 0 });

  useEffect(() => {
    const handleMouseMovement = (e: MouseEvent) => {
      const x = e.clientX / window.innerWidth;
      const y = e.clientY / window.innerHeight;
      setBackPosition({ x, y });
    };

    window.addEventListener("mousemove", handleMouseMovement);
    return () => window.removeEventListener("mousemove", handleMouseMovement);
  }, []);

  return (
    <div
      className="min-h-screen flex items-center justify-center bg-gradient-to-br from-teal-900 via-teal-800 to-teal-700 p-4 overflow-hidden"
      style={{
        backgroundPosition: `${backPosition.x * 100}% ${backPosition.y * 100}%`,
        transition: "background-position 0.3s ease-out",
      }}
    >
      <motion.div
        initial={{ opacity: 0, scale: 0.9 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 0.5 }}
        className="relative bg-teal-800 bg-opacity-30 backdrop-blur-xl rounded-3xl shadow-2xl overflow-hidden w-full max-w-4xl flex flex-col md:flex-row"
      >
        <div className="absolute inset-0 bg-gradient-to-br from-teal-500 to-teal-900 opacity-50"></div>
        <div className="relative z-10 p-8 md:w-1/2 flex flex-col justify-center items-center">
          <motion.div
            initial={{ y: -20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.2 }}
            className="mb-8 text-center"
          >
            <Icon
              name="FaShieldAlt"
              library="fa"
              className="text-5xl text-teal-300 mx-auto mb-4"
            />
            <h2 className="text-4xl font-bold text-white mb-2">SecureGuard</h2>
            <p className="text-teal-100">Protegiendo Tu Mundo Digital</p>
          </motion.div>
          <AnimatePresence mode="wait">
            <motion.form
              key={isLogin ? "iniciar-sesion" : "registrarse"}
              initial={{ x: 300, opacity: 0 }}
              animate={{ x: 0, opacity: 1 }}
              exit={{ x: -300, opacity: 0 }}
              transition={{ type: "spring", stiffness: 100, damping: 15 }}
              className="space-y-6 w-full max-w-md"
            >
              {!isLogin && (
                <div className="relative">
                  <Icon
                    name="FaUser"
                    library="fa"
                    className="text-lg absolute left-3 top-1/2 transform -translate-y-1/2 text-teal-200"
                  />
                  <input
                    type="text"
                    placeholder="Nombre Completo"
                    className="w-full pl-10 pr-4 py-3 bg-white bg-opacity-20 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-300 text-white placeholder-teal-200"
                  />
                </div>
              )}
              <div className="relative">
                <Icon
                  name="FaEnvelope"
                  library="fa"
                  className="text-lg absolute left-3 top-1/2 transform -translate-y-1/2 text-teal-200"
                />
                <input
                  type="email"
                  placeholder="Correo Electrónico"
                  className="w-full pl-10 pr-4 py-3 bg-white bg-opacity-20 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-300 text-white placeholder-teal-200"
                />
              </div>
              <div className="relative">
                <Icon
                  name="FaLock"
                  library="fa"
                  className="text-lg absolute left-3 top-1/2 transform -translate-y-1/2 text-teal-200"
                />
                <input
                  type={showPassword ? "text" : "password"}
                  placeholder="Contraseña"
                  className="w-full pl-10 pr-12 py-3 bg-white bg-opacity-20 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-300 text-white placeholder-teal-200"
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-3 top-1/2 transform -translate-y-1/2 text-teal-200 hover:text-white transition-colors"
                >
                  {showPassword ? (
                    <Icon name="FaEyeOff" library="fa" className="text-lg" />
                  ) : (
                    <Icon name="FaEye" library="fa" className="text-lg" />
                  )}
                </button>
              </div>
              <motion.button
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
                className="w-full py-3 bg-gradient-to-r from-teal-400 to-teal-600 text-white font-bold rounded-lg shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1"
              >
                {isLogin ? "Iniciar Sesión" : "Registrarse"}
              </motion.button>
            </motion.form>
          </AnimatePresence>
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.5 }}
            className="mt-6 text-center"
          >
            <Link
              to={isLogin ? "/auth/register" : "/auth/login"}
              className="text-teal-100 hover:text-white transition-colors"
            >
              {isLogin
                ? "¿No tienes una cuenta? Regístrate"
                : "¿Ya tienes una cuenta? Inicia Sesión"}
            </Link>
          </motion.div>
        </div>
        <div className="relative md:w-1/2 hidden md:block overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-t from-teal-900 to-transparent opacity-70"></div>
          <img
            src="https://www.valtx.pe/storage/uploads/estrategias%20para%20desarrollar%20software%20seguro.png"
            alt="Seguridad"
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 flex flex-col justify-center items-center text-white p-8">
            <h3 className="text-3xl font-bold mb-4 text-center">
              Seguridad de Vanguardia
            </h3>
            <p className="text-lg text-center mb-6">
              SecureGuard emplea encriptación de última generación y medidas de
              seguridad avanzadas para proteger tus activos digitales.
            </p>
            <div className="grid grid-cols-2 gap-4 w-full max-w-md">
              <motion.div
                whileHover={{ scale: 1.05 }}
                className="bg-white bg-opacity-20 backdrop-blur-sm rounded-lg p-4 flex flex-col items-center"
              >
                <Icon
                  name="FaLock"
                  library="fa"
                  className="text-teal-300 mb-2 text-3xl"
                />
                <span className="text-sm text-center">
                  Encriptación de extremo a extremo
                </span>
              </motion.div>
              <motion.div
                whileHover={{ scale: 1.05 }}
                className="bg-white bg-opacity-20 backdrop-blur-sm rounded-lg p-4 flex flex-col items-center"
              >
                <Icon
                  name="FaFingerprint"
                  library="fa"
                  className="text-teal-300 mb-2 text-3xl"
                />
                <span className="text-sm text-center">
                  Autenticación biométrica
                </span>
              </motion.div>
              <motion.div
                whileHover={{ scale: 1.05 }}
                className="bg-white bg-opacity-20 backdrop-blur-sm rounded-lg p-4 flex flex-col items-center"
              >
                <Icon
                  name="FaShieldAlt"
                  library="fa"
                  className="text-teal-300 mb-2 text-3xl"
                />
                <span className="text-sm text-center">Comunicación segura</span>
              </motion.div>
              <motion.div
                whileHover={{ scale: 1.05 }}
                className="bg-white bg-opacity-20 backdrop-blur-sm rounded-lg p-4 flex flex-col items-center"
              >
                <Icon
                  name="FaKey"
                  library="fa"
                  className="text-teal-300 mb-2 text-3xl"
                />
                <span className="text-sm text-center">
                  Autenticación de múltiples factores
                </span>
              </motion.div>
            </div>
          </div>
        </div>
      </motion.div>
    </div>
  );
};
