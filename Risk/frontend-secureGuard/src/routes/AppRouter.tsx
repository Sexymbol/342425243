
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { AuthForm, HomePage } from '../pages';

const AppRouter = () => {
  return (
    <Router>
      <Routes>
        <Route path="/auth/register" element={<AuthForm isLogin={false}/>} />
        <Route path="/auth/login" element={<AuthForm isLogin/>} />
        <Route path="/" element={<HomePage/>} />
      </Routes>
    </Router>
  );
};

export default AppRouter;