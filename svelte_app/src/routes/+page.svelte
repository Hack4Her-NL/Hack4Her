<script lang="ts">
  import { onMount } from 'svelte';
  import { routes } from '$lib/utils/routes';
  import { pageSeo } from '$lib/utils/seo';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.home;

  let screenWidth = 1200;
  let isMobile = false;

  onMount(() => {
    // Set initial screen width and update on resize
    screenWidth = window.innerWidth;
    isMobile = screenWidth < 600;

    const handleResize = () => {
      screenWidth = window.innerWidth;
      isMobile = screenWidth < 600;
    };

    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  });

  const highlights = [
    {
      icon: 'people',
      title: 'Networking',
      description: 'Connect with like-minded individuals and industry professionals'
    },
    {
      icon: 'lightbulb',
      title: 'Innovation',
      description: 'Develop creative solutions to real-world challenges'
    },
    {
      icon: 'school',
      title: 'Learning',
      description: 'Attend workshops and gain valuable skills'
    },
    {
      icon: 'emoji_events',
      title: 'Prizes',
      description: 'Win amazing prizes and recognition for your work'
    }
  ];

  const pastEvents = [
    '/images/face0.png',
    '/images/face1.jpg',
    '/images/face2.jpg',
    '/images/face3.jpg',
    '/images/face4.jpg'
  ];

  const sponsors = {
    platinum: [
      '/images/company0.png',
      '/images/company1.png'
    ],
    gold: [
      '/images/company2.png',
      '/images/company3.png',
      '/images/company0.png'
    ]
  };
</script>

<svelte:head>
  <title>{metadata.title}</title>
  <meta name="description" content={metadata.description} />
  {#if metadata.keywords && metadata.keywords.length > 0}
    <meta name="keywords" content={metadata.keywords.join(', ')} />
  {/if}
  <meta property="og:title" content={metadata.title} />
  <meta property="og:description" content={metadata.description} />
  <meta property="og:type" content={metadata.ogType || 'website'} />
  {#if metadata.ogImage}
    <meta property="og:image" content={metadata.ogImage} />
  {/if}
  <meta name="twitter:card" content={metadata.twitterCard || 'summary'} />
  <meta name="twitter:title" content={metadata.title} />
  <meta name="twitter:description" content={metadata.description} />
  {#if metadata.ogImage}
    <meta name="twitter:image" content={metadata.ogImage} />
  {/if}
  {#if metadata.canonicalUrl}
    <link rel="canonical" href={metadata.canonicalUrl} />
  {/if}
</svelte:head>

<!-- Hero Section -->
<section class="hero gradient-background">
  <div class="hero-content">
    <h1>Hack4Her</h1>
    <p class="hero-subtitle">A hackathon dedicated to empowering women in technology</p>
    <div class="button-group">
      <a href={routes.information} class="btn btn-outline">Learn More</a>
      <a href={routes.registration} class="btn btn-white">Register Now</a>
    </div>
  </div>
  <div class="hero-overlay">
    <img 
      src="/female-symbol-svgrepo-com.svg" 
      alt="Female symbol" 
      class="female-icon"
    />
  </div>
</section>

<!-- About Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">About Hack4Her</h2>
    <p class="section-text">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    </p>
    <a href={routes.about} class="btn btn-primary">Learn More</a>
  </div>
</section>

<!-- Event Highlights -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Event Highlights</h2>
    <div class="highlights-grid">
      {#each highlights as highlight}
        <div class="highlight-card">
          <span class="material-icons highlight-icon">{highlight.icon}</span>
          <h3 class="highlight-title">{highlight.title}</h3>
          <p class="highlight-description">{highlight.description}</p>
        </div>
      {/each}
    </div>
  </div>
</section>

<!-- Past Events Gallery -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Images from Past Events</h2>
    <div class="gallery">
      {#each pastEvents as image}
        <div class="gallery-item" style="background-image: url({image})"></div>
      {/each}
    </div>
  </div>
</section>

<!-- Sponsors Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Our Sponsors</h2>
    
    <div class="sponsors-grid platinum">
      {#each sponsors.platinum as sponsor}
        <div class="sponsor-logo platinum">
          <img src={sponsor} alt="Sponsor logo" />
        </div>
      {/each}
    </div>
    
    <div class="sponsors-grid gold">
      {#each sponsors.gold as sponsor}
        <div class="sponsor-logo gold">
          <img src={sponsor} alt="Sponsor logo" />
        </div>
      {/each}
    </div>
  </div>
</section>

<!-- CTA Section -->
<section class="cta gradient-background">
  <div class="cta-content">
    <h2 class="cta-title">Ready to Join Hack4Her?</h2>
    <p class="cta-text">Register now and be part of this amazing experience</p>
    <a href={routes.registration} class="btn btn-white">Register Now</a>
  </div>
</section>

<style>
  /* Hero Section */
  .hero {
    position: relative;
    height: 70vh;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    padding: 0 var(--spacing-medium);
  }
  
  .hero-content {
    text-align: center;
    z-index: 2;
    max-width: 800px;
  }
  
  .hero h1 {
    color: white;
    margin-bottom: var(--spacing-medium);
  }
  
  .hero-subtitle {
    color: white;
    font-size: 1.5rem;
    margin-bottom: var(--spacing-large);
  }
  
  .button-group {
    display: flex;
    justify-content: center;
    gap: var(--spacing-medium);
    flex-wrap: wrap;
  }
  
  .hero-overlay {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
  }
  
  .female-icon {
    position: absolute;
    right: 5%;
    top: 10%;
    width: 25%;
    height: auto;
    opacity: 0.2;
    filter: invert(1);
  }
  
  /* Section styles */
  .section {
    padding: var(--spacing-large) var(--spacing-medium);
  }
  
  .section-container {
    max-width: 1200px;
    margin: 0 auto;
    text-align: center;
  }
  
  .section-title {
    margin-bottom: var(--spacing-large);
  }
  
  .text-white {
    color: white;
  }
  
  .section-text {
    max-width: 800px;
    margin: 0 auto var(--spacing-large);
    line-height: 1.6;
  }
  
  /* Highlights Grid */
  .highlights-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: var(--spacing-large);
  }
  
  .highlight-card {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: var(--spacing-large);
    width: 250px;
    color: white;
  }
  
  .highlight-icon {
    font-size: 3rem;
    margin-bottom: var(--spacing-medium);
  }
  
  .highlight-title {
    margin-bottom: var(--spacing-small);
    font-size: 1.25rem;
  }
  
  .highlight-description {
    font-size: 0.875rem;
  }
  
  /* Gallery */
  .gallery {
    display: flex;
    overflow-x: auto;
    gap: var(--spacing-medium);
    padding-bottom: var(--spacing-medium);
    margin-bottom: var(--spacing-medium);
  }
  
  .gallery-item {
    flex: 0 0 auto;
    width: 300px;
    height: 200px;
    border-radius: var(--border-radius);
    background-size: cover;
    background-position: center;
  }
  
  /* Sponsors */
  .sponsors-grid {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: var(--spacing-large);
    margin-bottom: var(--spacing-large);
  }
  
  .sponsor-logo {
    background-color: white;
    border-radius: var(--border-radius);
    border: 1px solid rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: var(--spacing-medium);
  }
  
  .sponsor-logo.platinum {
    width: 200px;
    height: 120px;
  }
  
  .sponsor-logo.gold {
    width: 170px;
    height: 90px;
  }
  
  .sponsor-logo img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
  }
  
  /* CTA section */
  .cta {
    padding: 60px var(--spacing-medium);
    text-align: center;
  }
  
  .cta-content {
    max-width: 800px;
    margin: 0 auto;
  }
  
  .cta-title {
    color: white;
    font-size: 2.25rem;
    margin-bottom: var(--spacing-medium);
  }
  
  .cta-text {
    color: white;
    font-size: 1.125rem;
    margin-bottom: var(--spacing-large);
  }
  
  /* Button styles */
  .btn {
    display: inline-block;
    padding: var(--spacing-small) var(--spacing-large);
    border-radius: var(--border-radius-button);
    font-weight: 500;
    font-size: var(--font-size-button);
    text-decoration: none;
    transition: all 0.2s;
  }
  
  .btn-primary {
    background-color: var(--color-primary);
    color: white;
  }
  
  .btn-outline {
    background-color: rgba(255, 255, 255, 0.2);
    color: white;
    border: 1px solid white;
  }
  
  .btn-white {
    background-color: white;
    color: var(--color-primary);
  }
  
  .btn:hover {
    transform: translateY(-2px);
    filter: brightness(1.1);
  }
  
  /* Responsive adjustments */
  @media (max-width: 768px) {
    .button-group {
      flex-direction: column;
      align-items: center;
    }
    
    .hero h1 {
      font-size: calc(var(--font-size-heading-large) * 0.6);
    }
    
    .hero-subtitle {
      font-size: 1.2rem;
    }
    
    .gallery-item {
      width: 200px;
      height: 150px;
    }
  }
</style>
