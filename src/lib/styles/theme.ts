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
  
  // Dark mode colors
  darkMauve: '#AA82AD',         // Much darker Mauve for dark mode
  darkBlue: '#6B8BB3',          // Much darker Uranian Blue for dark mode
  darkPink: '#B95C7E',          // Much darker Pink for dark mode
  darkestPink: '#9A3F61',       // Darkest Pink
  darkTurquoise: '#207575',     // Much darker Turquoise for dark mode
  darkestTurquoise: '#165050',  // Darkest Turquoise
  darkBackground: '#0A0A0A',    // Almost black background
  darkSurface: '#121212',       // Dark surface
  
  // Text colors
  textDark: '#333333',
  textLight: '#FFFFFF'
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
    '--color-primary-rgb': isDark ? '170, 130, 173' : '231, 198, 255',
    '--color-secondary': isDark ? colors.darkBlue : colors.primaryBlue,
    '--color-secondary-rgb': isDark ? '107, 139, 179' : '189, 224, 254',
    '--color-accent': isDark ? colors.darkPink : colors.accentPink,
    '--color-accent-rgb': isDark ? '185, 92, 126' : '255, 200, 221',
    '--color-tertiary': isDark ? colors.darkTurquoise : colors.tertiaryTurquoise,
    '--color-tertiary-rgb': isDark ? '32, 117, 117' : '80, 216, 215',
    '--color-background': isDark ? colors.darkBackground : '#FFFFFF',
    '--color-surface': isDark ? colors.darkSurface : '#FFFFFF',
    '--color-text': isDark ? colors.textLight : colors.textDark,
    
    // Gradients
    '--gradient-background': isDark 
      ? `linear-gradient(to bottom right, ${colors.darkTurquoise}, ${colors.darkestTurquoise})`
      : `linear-gradient(to bottom right, ${colors.tertiaryTurquoise}, ${colors.tertiaryDarkTurquoise})`,
    
    // Updated gradient nav with horizontal gradient (darker on left)
    '--gradient-nav': isDark 
      ? `linear-gradient(to right, ${colors.darkestTurquoise}, ${colors.darkPink})` // Darker at left for dark mode
      : `linear-gradient(to right, ${colors.darkestTurquoise}, ${colors.accentPink})`, // Darker at left for light mode
    
    '--gradient-primary': isDark 
      ? `linear-gradient(to bottom right, ${colors.darkBlue}, ${colors.darkMauve})`
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