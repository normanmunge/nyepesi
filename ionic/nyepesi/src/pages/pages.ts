import { TabsPage } from './tabs/tabs';
import { ListMasterPage } from './list-master/list-master';
import { ListAgentsPage } from './list-agents/list-agents';
import { SearchPage } from './search/search';
import { MenuPage } from './menu/menu';
import { SettingsPage } from './settings/settings';
import { LoginPage } from './login/login';
import {SuperadminPage} from './superadmin/superadmin';
import {DisplayPage} from './display/display';

// The page the user lands on after opening the app and without a session
export const FirstRunPage = LoginPage;

// The main page the user will see as they use the app over a long period of time.
// Change this if not using tabs
export const MainPage = MenuPage;

//super admin main page
export const SuperPage = SuperadminPage;

// The initial root pages for our tabs (remove if not using tabs)
export const Tab1Root = ListMasterPage;
export const Tab2Root = SearchPage;
export const Tab3Root = SettingsPage;
export const Tab4Root = DisplayPage;
export const Tab5Root = ListAgentsPage;
