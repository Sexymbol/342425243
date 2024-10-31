
import React, { useState, useEffect } from 'react'
import { ResponsiveContainer, PieChart, Pie, Cell, BarChart, Bar, XAxis, YAxis, Tooltip } from 'recharts'
import { motion, AnimatePresence } from 'framer-motion'


import {
  NextUIProvider,
  Button,
  Input,
  Table,
  TableHeader,
  TableBody,
  TableColumn,
  TableRow,
  TableCell,
  Pagination,
  Card,
  CardHeader,
  CardBody,
  CardFooter,
  Spacer,
  ListboxItem,
  Listbox,
  Chip
} from '@nextui-org/react'
import { Icon } from '../utils/getIconByName'

interface MenuItem {
  name: string
  icon: {
    name: string;
    library: "fa" | "fa6" | "fi" | "io" | "ci" | "vsc" | "md" | "ri" | "pi" | "io5" | "gi" | "si";
    className?: string
  }
}

const menuItems: MenuItem[] = [
  { name: 'Inventario de activos', icon: { name: 'FaBoxes', library: 'fa' } },
  { name: 'Evaluación de valor del activo', icon: { name: 'FaChartPie', library: 'fa' } },
  { name: 'Evaluación de criticidad', icon: { name: 'FaExclamationTriangle', library: 'fa' } },
  { name: 'Identificación de riesgos', icon: { name: 'FaShieldAlt', library: 'fa' } },
  { name: 'Clasificación de activos', icon: { name: 'FaClipboardList', library: 'fa' } },
  { name: 'Definición de planes de acción', icon: { name: 'FaFileAlt', library: 'fa' } },
  { name: 'Gestión de roles y permisos', icon: { name: 'FaUsers', library: 'fa' } },
  { name: 'Notificación de imprevistos', icon: { name: 'FaBell', library: 'fa' } },
  { name: 'Gestión del ciclo de vida del software', icon: { name: 'FaCodeBranch', library: 'fa' } },
  { name: 'Cumplimiento normativo', icon: { name: 'FaBook', library: 'fa' } },
  { name: 'Reportes y auditorías', icon: { name: 'FaChartBar', library: 'fa' } },
]

const riskLevels: string[] = ['Crítico', 'Alto', 'Medio', 'Bajo']
const recentActions: string[] = [
  'Actualización de inventario de servidores',
  'Evaluación de riesgos de seguridad',
  'Nuevo plan de acción para mitigación de vulnerabilidades',
  'Revisión de políticas de acceso',
  'Actualización de software en dispositivos críticos'
]

interface TableItem {
  id: string
  name: string
  status: string
  date: string
}

const tableData: TableItem[] = [
  { id: '001', name: 'Servidor Principal', status: 'Activo', date: '2023-05-15' },
  { id: '002', name: 'Firewall', status: 'En revisión', date: '2023-05-14' },
  { id: '003', name: 'Base de Datos', status: 'Crítico', date: '2023-05-13' },
  { id: '004', name: 'Router de Red', status: 'Activo', date: '2023-05-12' },
  { id: '005', name: 'Sistema de Respaldo', status: 'En mantenimiento', date: '2023-05-11' },
  { id: '006', name: 'Servidor de Correo', status: 'Activo', date: '2023-05-10' },
  { id: '007', name: 'Sistema de Monitoreo', status: 'En revisión', date: '2023-05-09' },
  { id: '008', name: 'Servidor de Aplicaciones', status: 'Activo', date: '2023-05-08' },
  { id: '009', name: 'Sistema de Seguridad', status: 'Crítico', date: '2023-05-07' },
  { id: '010', name: 'Servidor de Archivos', status: 'Activo', date: '2023-05-06' },
]

interface ContentData {
  summary: string
  details: string
  chartData: { name: string; value: number }[]
}

export const HomePage: React.FC = () => {
  const [selectedItem, setSelectedItem] = useState<string>(menuItems[0].name)
  const [isMenuOpen, setIsMenuOpen] = useState<boolean>(false)
  const [isMobile, setIsMobile] = useState<boolean>(false)
  const [currentPage, setCurrentPage] = useState<number>(1)
  const [itemsPerPage] = useState<number>(5)

  useEffect(() => {
    const checkIfMobile = () => setIsMobile(window.innerWidth < 768)
    checkIfMobile()
    window.addEventListener('resize', checkIfMobile)
    return () => window.removeEventListener('resize', checkIfMobile)
  }, [])

  const toggleMenu = () => setIsMenuOpen(!isMenuOpen)

  const getContentForSection = (section: string): ContentData => {
    switch (section) {
      case 'Inventario de activos':
        return { 
          summary: '150 activos', 
          details: 'Servidores: 50, Dispositivos de red: 30, Estaciones de trabajo: 70',
          chartData: [
            { name: 'Servidores', value: 50 },
            { name: 'Dispositivos de red', value: 30 },
            { name: 'Estaciones de trabajo', value: 70 }
          ]
        }
      case 'Evaluación de valor del activo':
        return { 
          summary: '$5.2M en activos', 
          details: 'Críticos: $3M, Altos: $1.5M, Medios: $500K, Bajos: $200K',
          chartData: [
            { name: 'Críticos', value: 3000000 },
            { name: 'Altos', value: 1500000 },
            { name: 'Medios', value: 500000 },
            { name: 'Bajos', value: 200000 }
          ]
        }
      case 'Identificación de riesgos':
        return { 
          summary: '25 riesgos identificados', 
          details: 'Críticos: 5, Altos: 8, Medios: 7, Bajos: 5',
          chartData: [
            { name: 'Críticos', value: 5 },
            { name: 'Altos', value: 8 },
            { name: 'Medios', value: 7 },
            { name: 'Bajos', value: 5 }
          ]
        }
      default:
        return { 
          summary: 'Información no disponible', 
          details: 'Seleccione una sección para ver detalles',
          chartData: []
        }
    }
  }

  const content = getContentForSection(selectedItem)

  // Get current items
  const indexOfLastItem = currentPage * itemsPerPage
  const indexOfFirstItem = indexOfLastItem - itemsPerPage
  const currentItems = tableData.slice(indexOfFirstItem, indexOfLastItem)

  return (
    <NextUIProvider>
      <div className="flex h-screen bg-emerald-900 text-emerald-100">
        {/* Menú Lateral */}
        <AnimatePresence>
          {(isMenuOpen || !isMobile) && (
            <motion.aside
              initial={{ x: -300 }}
              animate={{ x: 0 }}
              exit={{ x: -300 }}
              transition={{ duration: 0.3 }}
              className={`scroll-none fixed inset-y-0 left-0 z-50 w-72 bg-emerald-800 overflow-y-auto ${isMobile ? 'shadow-lg' : ''}`}
            >
              <div className="p-6 flex items-center justify-between">
                <h3 className='text-2xl font-bold'>SecureGuard</h3>
                {isMobile && (
                  <Button 
                    variant="light" 
                    isIconOnly 
                    onClick={toggleMenu}
                    startContent={<Icon name="FaTimes" library="fa" className="text-xl" />}
                    radius='full'
                    color='success'
                  >
                  </Button>
                )}
              </div>
              <nav className="mt-6 space-y-2">
                <Listbox
                  items={menuItems}
                  aria-label="Navigation Menu"
                  onAction={(key) => {
                    key.toLocaleString()
                    setSelectedItem(key.toLocaleString())
                    if (isMobile) setIsMenuOpen(false)
                  }}
                >
                  {(item) => (
                    <ListboxItem
                      key={item.name}
                      color={selectedItem === item.name ? "success" : "default"}
                      variant={selectedItem !== item.name ? "light" : "bordered"}
                      className={`flex items-center w-full px-6 py-4 text-left 
                          ${
                            selectedItem === item.name ? 'bg-emerald-600' : 'text-white'
                          }
                      `}
                      startContent={<Icon {...item.icon} className="mr-4 text-xl" />}
                    >
                      {item.name}
                    </ListboxItem>
                  )}
                </Listbox>
              </nav>

            </motion.aside>
          )}
        </AnimatePresence>

        {/* Área de Contenido */}
        <main className={`flex-1 p-6 md:p-10 overflow-auto ${isMobile ? 'ml-0' : 'ml-72'}`}>
          <div className="flex gap-3 justify-between items-center mb-8">
            {isMobile && (
              <Button 
                variant="light" 
                isIconOnly
                color='success'
                radius='full'
                onClick={toggleMenu}
                startContent={<Icon name="FaBars" library="fa" className="text-xl" />}
              >
                
              </Button>
            )}
            <h2 className='text-xl sm:text-2xl md:text-3xl font-bold'>{selectedItem}</h2>
            <div className="flex items-center space-x-4">
              <Input
                startContent={<Icon name="FaSearch" library="fa" className="text-lg" />}
                className='w-full xs:max-w-[300px] text-white'
                classNames={{
                  innerWrapper: 'text-white hover:bg-emerald-800 bg-emerald-800',
                  inputWrapper: 'text-white hover:bg-emerald-800 bg-emerald-800',
                }}
                variant='bordered'
                color='success'
              />
              <Button className='bg-emerald-800 text-white' radius='full' isIconOnly startContent={<Icon name="FaCog" library="fa" className="text-lg" />}>
                
              </Button>
            </div>
          </div>
          <AnimatePresence mode="wait">
            <motion.div
              key={selectedItem}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              transition={{ duration: 0.3 }}
            >
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
                <CustomCard title="Resumen" icon={{ name: "FaChartPie", library: "fa" }}>
                  <div className="p-4 bg-emerald-700/50 rounded-lg">
                    <p className='text-emerald-500'>Información general sobre {selectedItem}</p>
                    <div className="flex justify-between items-center">
                      <h3>{content.summary}</h3>
                      <Icon name="FaChevronRight" library="fa" className="h-6 w-6 text-emerald-400" />
                    </div>
                  </div>
                  <p className="mt-4 text-emerald-500">{content.details}</p>
                  <div className="mt-4 h-40">
                    <ResponsiveContainer width="100%" height="100%">
                      <PieChart>
                        <Pie
                          data={content.chartData}
                          cx="50%"
                          cy="50%"
                          outerRadius={80}
                          fill="#10b981"
                          dataKey="value"
                          label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
                        >
                          {content.chartData.map((entry, index) => (
                            <Cell key={`cell-${index}`} fill={`hsl(${index * 30}, 70%, 50%)`} />
                          ))}
                        </Pie>
                      </PieChart>
                    </ResponsiveContainer>
                  </div>
                </CustomCard>
                <CustomCard title="Estadísticas" icon={{ name: "FaChartBar", library: "fa" }}>
                  <div className="p-4 bg-emerald-700/50 rounded-lg">
                    <p className='text-emerald-500'>Datos estadísticos relevantes</p>
                    <Spacer y={1} />
                    <div className="space-y-3">
                      {riskLevels.map((level) => (
                        <div key={level} className="flex items-center">
                          <div className="w-full bg-emerald-600 rounded-full h-2.5">
                            <div
                              className="bg-emerald-400 h-2.5 rounded-full"
                              style={{ width: `${Math.floor(Math.random() * 100)}%` }}
                            ></div>
                          </div>
                          <p className="ml-2 min-w-[60px]">{level}</p>
                        </div>
                      ))}
                    </div>
                  </div>
                  <div className="mt-4 h-40">
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={content.chartData}>
                        <XAxis dataKey="name" />
                        <YAxis />
                        <Tooltip />
                        <Bar dataKey="value" fill="#10b981" />
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </CustomCard>
                <CustomCard title="Acciones Recientes" icon={{ name: "FaClipboardList", library: "fa" }}>
                  <div className="p-4 bg-emerald-700/50 rounded-lg">
                    <ul className="space-y-2">
                      {recentActions.map((action, index) => (
                        <li key={index} className="flex items-center text-emerald-300">
                          <div className="w-2 h-2 bg-emerald-400 rounded-full mr-2"></div>
                          <p>{action}</p>
                        </li>
                      ))}
                    </ul>
                  </div>
                  <div className="mt-4">
                    <h4>Próximas tareas</h4>
                    <Spacer y={0.5} />
                    <ul  className="space-y-2">
                      <li className="flex items-center justify-between">
                        <p>Revisión de firewall</p>
                        <p className='text-emerald-500'>Mañana</p>
                      </li>
                      <li className="flex items-center justify-between">
                        <p>Actualización de antivirus</p>
                        <p className='text-emerald-500'>En 2 días</p>
                      </li>
                      <li className="flex items-center justify-between">
                        <p>Auditoría de seguridad</p>
                        <p className='text-emerald-500'>Próxima semana</p>
                      </li>
                    </ul>
                  </div>
                </CustomCard>
              </div>
              <Spacer y={2} />
              <h3>Detalles</h3>
              <Spacer y={1} />
              <Card>
                <Table
                  aria-label="Tabla de detalles"
                  style={{
                    height: "auto",
                    minWidth: "100%",
                  }}
                >
                  <TableHeader>
                    <TableColumn>ID</TableColumn>
                    <TableColumn>Nombre</TableColumn>
                    <TableColumn>Estado</TableColumn>
                    <TableColumn>Última Actualización</TableColumn>
                    <TableColumn>Acciones</TableColumn>
                  </TableHeader>
                  <TableBody>
                    {currentItems.map((item) => (
                      <TableRow key={item.id}>
                        <TableCell>{item.id}</TableCell>
                        <TableCell>{item.name}</TableCell>
                        <TableCell>
                          <Chip variant='flat' size="sm" color={
                            item.status === 'Activo' ? 'success' :
                            item.status === 'En revisión' ? 'warning' :
                            item.status === 'Crítico' ? 'danger' :
                            'primary'
                          }>
                            {item.status}
                          </Chip>
                        </TableCell>
                        <TableCell>{item.date}</TableCell>
                        <TableCell className='flex gap-2'>
                          <Button size="sm" variant="flat" color="success">Editar</Button>
                          <Button size="sm" variant="flat" color="danger">Eliminar</Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
                <CardFooter className='flex justify-center items-center'>
                  <Pagination
                    total={Math.ceil(tableData.length / itemsPerPage)}
                    page={currentPage}
                    onChange={(page) => setCurrentPage(page)}
                    color='success'
                  />
                </CardFooter>
              </Card>
            </motion.div>
          </AnimatePresence>
        </main>
      </div>
    </NextUIProvider>
  )
}

interface CustomCardProps {
  title: string
  children: React.ReactNode
  icon: {
    name: string;
    library: "fa" | "fa6" | "fi" | "io" | "ci" | "vsc" | "md" | "ri" | "pi" | "io5" | "gi" | "si";
    className?: string
  }
}

const CustomCard: React.FC<CustomCardProps> = ({ title, children, icon }) => {
  return (
    <Card>
      <CardHeader>
        <Icon {...icon} className="h-6 w-6 md:h-7 md:w-7 mr-3 text-emerald-400" />
        <p className='font-bold'>{title}</p>
      </CardHeader>
      <CardBody>
        {children}
      </CardBody>
    </Card>
  )
}

