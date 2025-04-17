/**
 * Application theme configuration
 * Converted from Flutter app_theme.dart
 */

export const colors = {
  // Primary gradient colors
  primaryPurple: '#8A54E1',
  primaryBlue: '#4485EB',
  lightBlue: '#64B5F6',  // Light blue for light mode
  
  // Dark mode colors
  darkPurple: '#5E35B1',
  deeperPurple: '#4527A0',  // Deeper purple for dark mode
  darkBackground: '#121212',
  darkSurface: '#1E1E1E',
  
  // Text colors
  textDark: '#1A1A1A',
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
    '--color-primary': isDark ? colors.primaryPurple : colors.primaryBlue,
    '--color-secondary': isDark ? colors.deeperPurple : colors.lightBlue,
    '--color-background': isDark ? colors.darkBackground : '#FFFFFF',
    '--color-surface': isDark ? colors.darkSurface : '#FFFFFF',
    '--color-text': isDark ? colors.textLight : colors.textDark,
    
    // Gradients
    '--gradient-background': isDark 
      ? `linear-gradient(to bottom right, ${colors.darkPurple}, ${colors.deeperPurple})`
      : `linear-gradient(to bottom right, ${colors.primaryBlue}, ${colors.lightBlue})`,
    
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