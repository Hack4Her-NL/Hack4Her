/**
 * Navigation routes configuration
 * Defines the application's main navigation structure
 */

export interface NavigationItem {
  title: string;
  route: string;
}

export const routes = {
  home: '/',
  about: '/about',
  registration: '/registration',
  information: '/information',
  workshops: '/workshops',
  challenges: '/challenges',
  previousEvents: '/previous-events'
};

export const navigationItems: NavigationItem[] = [
  { title: 'Home', route: routes.home },
  { title: 'About Us', route: routes.about },
  { title: 'Information', route: routes.information },
  { title: 'Registration', route: routes.registration },
  { title: 'Workshops', route: routes.workshops },
  { title: 'Challenges', route: routes.challenges },
  { title: 'Previous Events', route: routes.previousEvents }
]; 