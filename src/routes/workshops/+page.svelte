<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';
  import { onMount } from 'svelte';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.workshops;

  // Workshop data - only using Day 1 workshops
  const workshops = [
    {
      title: 'Introduction to Flutter',
      presenter: 'Jane Doe',
      company: 'FlutterTech',
      image: '/images/face6.jpg',
      time: '10:00 AM - 11:30 AM',
      location: 'Room A',
      description: 'Learn the basics of Flutter and how to build cross-platform mobile apps with a single codebase.',
      bio: 'Jane is a senior developer at FlutterTech with over 5 years of experience building mobile applications. She specializes in cross-platform development and has contributed to several open-source Flutter projects.'
    },
    {
      title: 'UI/UX Design Principles',
      presenter: 'John Smith',
      company: 'DesignHub',
      image: '/images/carmen_sanchez.jpeg',
      time: '12:00 PM - 1:30 PM',
      location: 'Room B',
      description: 'Discover core principles of effective UI/UX design and how to create intuitive user experiences.',
      bio: 'John is a lead UX designer at DesignHub where he has worked on interfaces for Fortune 500 companies. He has a background in cognitive psychology and over 8 years of experience in the design industry.'
    },
    {
      title: 'Pitching Your Idea',
      presenter: 'Alice Johnson',
      company: 'StartupMentor',
      image: '/images/lara_popovic.jpeg',
      time: '2:00 PM - 3:30 PM',
      location: 'Room C',
      description: 'Learn how to effectively communicate your ideas and pitch your projects to potential investors or partners.',
      bio: 'Alice is the founder of StartupMentor and has helped over 100 startups secure funding. She previously worked as a venture capitalist and has an MBA from Harvard Business School.'
    },
    {
      title: 'Team Collaboration',
      presenter: 'Bob Williams',
      company: 'TeamWork Solutions',
      image: '/images/joey_laarhoven.jpeg',
      time: '4:00 PM - 5:30 PM',
      location: 'Room A',
      description: 'Develop effective team collaboration skills essential for hackathons and professional environments.',
      bio: 'Bob is an organizational psychologist specializing in team dynamics. At TeamWork Solutions, he consults with tech companies to improve collaboration and productivity in diverse teams.'
    },
  ];

  // State
  let expandedWorkshops = new Set();

  function toggleWorkshop(index) {
    if (expandedWorkshops.has(index)) {
      expandedWorkshops.delete(index);
    } else {
      expandedWorkshops.add(index);
    }
    expandedWorkshops = expandedWorkshops; // Trigger reactivity
  }
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

<!-- Header -->
<div class="page-header gradient-background">
  <div class="header-content">
    <h1>Workshops</h1>
    <p>Expand your skills with our interactive workshops</p>
  </div>
</div>

<!-- Coming Soon Section -->
<!-- Remove this section since we're now showing workshops -->
<!--
<section class="section">
  <div class="section-container">
    <div class="previous-website-info">
      <p>
        Workshop schedule and sign-ups will be posted soon!<br>
        In the meantime, check our <a href={routes.information} class="website-link">schedule</a> on the information page, or <a href={routes.about} class="website-link">learn more</a> about our event here.
      </p>
    </div>
  </div>
</section>
-->

<section class="section">
  <div class="section-container">
    <p class="section-text">
      Our workshops offer a unique opportunity to learn new skills, get hands-on experience, and connect with industry experts. All workshops are free for registered participants.
    </p>
  </div>
</section>

<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Workshop Schedule</h2>
    
    <div class="workshops-list">
      {#each workshops as workshop, index}
        <div class="workshop-card" class:expanded={expandedWorkshops.has(index)}>
          <div 
            class="workshop-header" 
            on:click={() => toggleWorkshop(index)}
            on:keydown={(e) => e.key === 'Enter' && toggleWorkshop(index)}
            tabindex="0"
            role="button"
            aria-expanded={expandedWorkshops.has(index)}
          >
            <div class="workshop-time">{workshop.time}</div>
            
            <div class="workshop-main">
              <h3 class="workshop-title">{workshop.title}</h3>
              <div class="workshop-presenter">
                <span class="material-icons">person</span>
                {workshop.presenter} | {workshop.company}
              </div>
            </div>
            
            <div class="workshop-meta">
              <span class="material-icons expand-icon">
                {expandedWorkshops.has(index) ? 'expand_less' : 'expand_more'}
              </span>
            </div>
          </div>
          
          {#if expandedWorkshops.has(index)}
            <div class="workshop-details">
              <div class="bio-container">
                <div class="presenter-image" style="background-image: url({workshop.image})">
                </div>
                <div class="bio-content">
                  <h4>About the Presenter</h4>
                  <p class="details-text">{workshop.bio}</p>
                </div>
              </div>
              
              <h4>Description</h4>
              <p class="details-text">{workshop.description}</p>
              
              <div class="detail-item">
                <span class="material-icons">location_on</span>
                <span>{workshop.location}</span>
              </div>
            </div>
          {/if}
        </div>
      {/each}
    </div>
  </div>
</section>

<style>
  /* Header styles */
  .page-header {
    padding: 80px 20px;
    text-align: center;
    color: white;
  }
  
  .header-content {
    max-width: 800px;
    margin: 0 auto;
  }
  
  .header-content h1 {
    margin-bottom: var(--spacing-small);
  }
  
  .header-content p {
    font-size: 1.2rem;
  }
  
  /* Section styles */
  .section {
    padding: var(--spacing-large) var(--spacing-medium);
  }
  
  .section-container {
    max-width: 800px;
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
    max-width: 700px;
    margin: 0 auto var(--spacing-large);
    line-height: 1.6;
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
  
  .btn:hover {
    transform: translateY(-2px);
    filter: brightness(1.1);
  }
  
  /* Day tabs */
  .day-tabs {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 30px;
  }
  
  .day-tab {
    border: none;
    padding: 12px 20px;
    border-radius: 20px;
    font-weight: bold;
    cursor: pointer;
    background-color: rgba(255, 255, 255, 0.2);
    color: white;
    transition: all 0.3s;
  }
  
  .day-tab.active {
    background-color: white;
    color: var(--color-primary);
  }
  
  /* Workshop items */
  .workshops-list {
    display: flex;
    flex-direction: column;
    gap: 15px;
  }

  .workshop-card {
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s ease;
    margin-bottom: 15px;
  }
  
  .workshop-card.expanded {
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  }

  .workshop-header {
    display: flex;
    padding: 20px;
    cursor: pointer;
    transition: background-color 0.2s ease;
  }
  
  .workshop-header:hover {
    background-color: rgba(255, 255, 255, 0.2);
  }
  
  .workshop-time {
    flex: 0 0 180px;
    font-weight: 500;
    opacity: 0.9;
    align-self: center;
  }
  
  .workshop-main {
    flex: 1;
  }
  
  .workshop-meta {
    display: flex;
    align-items: center;
  }
  
  .expand-icon {
    transition: transform 0.3s ease;
  }
  
  .workshop-title {
    margin: 0 0 8px;
    font-size: 18px;
  }
  
  .workshop-presenter {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 14px;
    opacity: 0.9;
  }
  
  /* Workshop expanded details */
  .workshop-details {
    padding: 20px;
    background-color: rgba(0, 90, 180, 0.5);
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    text-align: left;
  }
  
  .bio-container {
    display: flex;
    margin-bottom: 20px;
    gap: 15px;
    align-items: flex-start;
  }
  
  .presenter-image {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background-size: cover;
    background-position: center;
    flex-shrink: 0;
    border: 2px solid rgba(255, 255, 255, 0.8);
  }
  
  .bio-content {
    flex: 1;
  }
  
  .workshop-details h4 {
    font-size: 16px;
    font-weight: bold;
    margin: 15px 0 10px;
    color: rgba(255, 255, 255, 0.9);
  }
  
  .details-text {
    margin: 0 0 15px;
    line-height: 1.5;
    font-size: 14px;
  }
  
  .detail-item {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 8px;
    font-size: 14px;
  }
  
  .detail-icon {
    font-size: 16px;
  }
  
  /* Categories grid */
  .categories-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
  }
  
  .category-card {
    width: 150px;
    height: 150px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.05);
    border-radius: var(--border-radius);
    border: 1px solid rgba(0, 0, 0, 0.1);
    padding: 20px;
  }
  
  .category-icon {
    font-size: 50px;
    color: var(--color-primary);
    margin-bottom: 10px;
  }
  
  .category-title {
    font-size: 18px;
    font-weight: bold;
    margin: 0 0 5px;
  }
  
  .category-count {
    font-size: 14px;
    color: var(--color-text-light);
    margin: 0;
  }
  
  /* Registration process */
  .registration-card {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: 20px;
    text-align: left;
    color: white;
  }
  
  .registration-card h3 {
    font-size: 18px;
    font-weight: bold;
    margin: 0 0 20px;
  }
  
  .registration-steps {
    display: flex;
    flex-direction: column;
    gap: 15px;
  }
  
  .registration-step {
    display: flex;
    align-items: flex-start;
  }
  
  .step-number {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background-color: white;
    color: var(--color-primary);
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    flex-shrink: 0;
  }
  
  .step-content {
    margin-left: 10px;
  }
  
  .step-content h4 {
    font-size: 16px;
    font-weight: bold;
    margin: 0 0 5px;
  }
  
  .step-content p {
    font-size: 14px;
    margin: 0;
  }
  
  /* Responsive styles */
  @media (max-width: 768px) {
    .categories-grid {
      gap: 10px;
    }
    
    .category-card {
      width: 135px;
      height: 135px;
    }
    
    .category-icon {
      font-size: 40px;
    }
    
    .day-tab {
      padding: 10px 15px;
      font-size: 14px;
    }
    
    .workshop-time {
      flex: 0 0 auto;
      margin-bottom: 10px;
    }
    
    .workshop-header {
      flex-direction: column;
      padding: 15px;
    }
    
    .bio-container {
      flex-direction: column;
      align-items: center;
      text-align: center;
    }
    
    .presenter-image {
      margin-bottom: 10px;
    }
    
    .workshop-details h4 {
      text-align: center;
    }
    
    .details-text {
      text-align: center;
    }
    
    .detail-item {
      justify-content: center;
    }
  }
  
  /* Previous website info styles */
  .previous-website-info {
    margin-top: 2rem;
    padding: 1.5rem;
    background-color: var(--color-primary-light);
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
  }
  
  .previous-website-info p {
    margin: 0 0 1rem;
    font-size: 1.2rem;
    line-height: 1.6;
  }
  
  .previous-website-info p:last-child {
    margin-bottom: 0;
  }
  
  .website-link {
    color: var(--color-primary);
    font-weight: 600;
    text-decoration: underline;
    transition: color 0.2s ease;
  }
  
  .website-link:hover {
    color: var(--color-secondary);
  }
</style> 