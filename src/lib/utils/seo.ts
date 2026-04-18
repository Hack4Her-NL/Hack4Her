/**
 * SEO utility functions for adding meta tags to improve search engine indexing
 */

export interface SeoMetadata {
  title: string;
  description: string;
  keywords?: string[];
  ogImage?: string;
  ogType?: 'website' | 'article' | 'profile';
  twitterCard?: 'summary' | 'summary_large_image';
  canonicalUrl?: string;
}

/**
 * Default SEO settings for the entire site
 */
export const defaultSeo: SeoMetadata = {
  title: 'Hack4Her - Empowering Women in Technology',
  description: 'A hackathon dedicated to empowering women and non-binary individuals in technology through hackathons and workshops.',
  keywords: ['hackathon', 'women in tech', 'coding', 'programming', 'technology', 'diversity', 'inclusion'],
  ogType: 'website',
  twitterCard: 'summary_large_image',
  ogImage: '/images/og-image.jpg'
};

/**
 * Helper to generate the complete SEO metadata by combining defaults with page-specific values
 */
export function getSeoMetadata(pageSeo: Partial<SeoMetadata>): SeoMetadata {
  return {
    ...defaultSeo,
    ...pageSeo,
    // Combine keywords
    keywords: [
      ...(defaultSeo.keywords || []), 
      ...(pageSeo.keywords || [])
    ]
  };
}

/**
 * Individual page SEO settings
 */
export const pageSeo = {
  home: getSeoMetadata({
    title: 'Hack4Her - Home',
    description: 'Join the Hack4Her community! A hackathon dedicated to empowering women in technology.',
    keywords: ['home', 'events', 'community']
  }),
  
  about: getSeoMetadata({
    title: 'About Hack4Her - Our Mission and Team',
    description: 'Learn about the Hack4Her mission, our team, and our commitment to diversity in technology.',
    keywords: ['about us', 'team', 'mission', 'vision']
  }),
  
  registration: getSeoMetadata({
    title: 'Register for Hack4Her',
    description: 'Register now for the upcoming Hack4Her hackathon and be part of an amazing community.',
    keywords: ['registration', 'sign up', 'join', 'participate']
  }),
  
  information: getSeoMetadata({
    title: 'Hack4Her Information and FAQs',
    description: 'Find everything you need to know about Hack4Her, including schedule, venue, and FAQs.',
    keywords: ['information', 'faq', 'details', 'schedule', 'venue']
  }),
  
  workshops: getSeoMetadata({
    title: 'Hack4Her Workshops',
    description: 'Explore the exciting workshops offered at Hack4Her to enhance your skills.',
    keywords: ['workshops', 'learning', 'skills', 'education', 'training']
  }),
  
  challenges: getSeoMetadata({
    title: 'Hack4Her Challenges',
    description: 'Discover the coding challenges and hackathon problems at Hack4Her.',
    keywords: ['challenges', 'problems', 'coding challenges', 'hackathon projects']
  }),
  
  previousEvents: getSeoMetadata({
    title: 'Previous Hack4Her Events',
    description: 'Explore the past Hack4Her events, winners, and projects.',
    keywords: ['previous events', 'past hackathons', 'winners', 'projects', 'history']
  })
}; 