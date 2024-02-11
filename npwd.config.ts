import App from './src/App';
import { GarageIcon, NotificationIcon } from './icon';

export const path = '/garage';
export default () => ({
  id: 'garage',
  nameLocale: 'Garage',
  color: '#fff',
  backgroundColor: '#333',
  path,
  icon: GarageIcon,
  app: App,
  notificationIcon: NotificationIcon
});