/**
 * Application theme configuration
 * Converted from Flutter app_theme.dart
 */

export const colors = {
  // Primary color palette
  primaryMauve: '#E7C6FF',     // Mauve
  primaryBlue: '#BDE0FE',      // Uranian Blue
  accentPink: '#FFC8DD',       // Fairy Tale Pink (for nav)
  accentDarkPink: '#F178B6',   // Darker Pink
  tertiaryTurquoise: '#50D8D7', // Turquoise (for hero)
  tertiaryDarkTurquoise: '#40C4C4', // Darker Turquoise
  
  // Additional palette colors
  paleYellow: '#FCF6BD',       // Lemon Chiffon
  paleGreen: '#D0F4DE',        // Nyanza
  
  // Deep dark mode colors (from temp.py/app.css)
  darkMauve: '#9e16a8',         // Deep dark purple
  darkBlue: '#006ff9',          // Deep dark blue
  darkPink: '#741336',          // Deep accent
  darkestPink: '#62286e',       // For nav gradient
  darkTurquoise: '#00ffff',     // Cyan (as in temp.py)
  darkestTurquoise: '#0a0a79',  // For gradient background
  darkBackground: '#0A0A0A',    // Background
  darkSurface: '#121212',       // Surface
  
  // Text colors
  textDark: '#333333',
  textLight: '#f5f5f5'
};

// Responsive breakpoints
export const breakpoints = {
  mobile: '600px',
  tablet: '1024px'
};

// CSS variables to be injected into :root
export const getCssVariables = (isDark: boolean): Record<string, string> => {
  return {
    // Colors
    '--color-primary': isDark ? colors.darkMauve : colors.primaryMauve,
    '--color-primary-rgb': isDark ? '158, 22, 168' : '231, 198, 255',
    '--color-secondary': isDark ? colors.darkBlue : colors.primaryBlue,
    '--color-secondary-rgb': isDark ? '0, 111, 249' : '189, 224, 254',
    '--color-accent': isDark ? colors.darkPink : colors.accentPink,
    '--color-accent-rgb': isDark ? '116, 19, 54' : '255, 200, 221',
    '--color-tertiary': isDark ? colors.darkTurquoise : colors.tertiaryTurquoise,
    '--color-tertiary-rgb': isDark ? '0, 255, 255' : '80, 216, 215',
    '--color-background': isDark ? colors.darkBackground : '#FFFFFF',
    '--color-surface': isDark ? colors.darkSurface : '#FFFFFF',
    '--color-text': isDark ? colors.textLight : colors.textDark,
    
    // Gradients
    '--gradient-background': isDark 
      ? `linear-gradient(to bottom right, #090b12, #0a0a79)`
      : `linear-gradient(to bottom right, ${colors.tertiaryTurquoise}, ${colors.tertiaryDarkTurquoise})`,
    '--gradient-nav': isDark 
      ? '#62286e'
      : `linear-gradient(to right, rgba(241, 108, 173, 1), ${colors.accentPink})`,
    '--gradient-primary': isDark 
      ? `linear-gradient(to bottom right, #006ff9, #9e16a8)`
      : `linear-gradient(to bottom right, ${colors.primaryBlue}, ${colors.primaryMauve})`,
    
    // Shadows
    '--shadow-card': isDark 
      ? '0 4px 10px rgba(0, 0, 0, 0.51)'
      : '0 4px 10px rgba(0, 0, 0, 0.26)',
    
    // Typography
    '--font-size-heading-large': '86px',
    '--font-size-heading-medium': '42px',
    '--font-size-body': '16px',
    '--font-size-button': '22px',
    
    // Spacing
    '--spacing-small': '8px',
    '--spacing-medium': '16px',
    '--spacing-large': '24px',
    
    // Border radius
    '--border-radius': '12px',
    '--border-radius-button': '30px'
  };
};

// Helper for responsive font sizing
export const getResponsiveFontSize = (baseSize: number, screenWidth: number): number => {
  const mobileBreakpoint = 600;
  const tabletBreakpoint = 1024;
  
  if (screenWidth < mobileBreakpoint) {
    return baseSize * 0.6;
  } else if (screenWidth < tabletBreakpoint) {
    return baseSize * 0.8;
  }
  return baseSize;
}; 