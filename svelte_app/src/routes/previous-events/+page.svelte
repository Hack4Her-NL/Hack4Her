<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';
  import { onMount } from 'svelte';
  import { fade } from 'svelte/transition';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.previousEvents;

  // Modal state
  let showModal = false;
  let currentEvent = null;
  let currentProject = null;
  let modalType = ''; // 'event' or 'project'

  // Past events data
  const pastEvents = [
    {
      id: 'hack4her-2024',
      year: '2024',
      title: 'Hack4Her 2024',
      description: 'Focused on AI and machine learning solutions for social good, with specific emphasis on addressing gender-based challenges in technology and society.',
      date: 'April 12-14, 2024',
      location: 'VU Amsterdam',
      participants: 150,
      projects: 42,
      imageUrl: '/images/events/hack4her-2024.jpg'
    },
    {
      id: 'hack4her-2023',
      year: '2023',
      title: 'Hack4Her 2023',
      description: 'Celebrating innovation in health tech with projects addressing women\'s health concerns and promoting accessibility in healthcare services.',
      date: 'March 24-26, 2023',
      location: 'UvA Science Park',
      participants: 120,
      projects: 35,
      imageUrl: '/images/events/hack4her-2023.jpg'
    },
    {
      id: 'hack4her-2022',
      year: '2022',
      title: 'Hack4Her 2022',
      description: 'Empowering women in education technology with solutions for remote learning and accessible educational tools for underprivileged communities.',
      date: 'April 8-10, 2022',
      location: 'TU Delft',
      participants: 90,
      projects: 28,
      imageUrl: '/images/events/hack4her-2022.jpg'
    },
    {
      id: 'hack4her-2021',
      year: '2021',
      title: 'Hack4Her 2021 (Virtual)',
      description: 'Our first virtual hackathon focused on creating solutions for remote work, collaboration, and mental health during the pandemic.',
      date: 'May 14-16, 2021',
      location: 'Virtual Event',
      participants: 80,
      projects: 25,
      imageUrl: '/images/events/hack4her-2021.jpg'
    }
  ];

  // Event photos
  const eventPhotos = [
    {
      url: '/images/gallery/event1.jpg',
      description: 'Opening ceremony at Hack4Her 2024'
    },
    {
      url: '/images/gallery/event2.jpg',
      description: 'Workshop session at Hack4Her 2023'
    },
    {
      url: '/images/gallery/event3.jpg',
      description: 'Participants collaborating at Hack4Her 2022'
    },
    {
      url: '/images/gallery/event4.jpg',
      description: 'Award ceremony at Hack4Her 2023'
    },
    {
      url: '/images/gallery/event5.jpg',
      description: 'Mentorship session at Hack4Her 2024'
    },
    {
      url: '/images/gallery/event6.jpg',
      description: 'Panel discussion at Hack4Her 2022'
    }
  ];

  // Selected project showcases
  const projectShowcases = [
    {
      title: 'SafeSpace',
      description: 'A mobile app that provides resources and community support for women experiencing workplace harassment, featuring anonymous reporting and educational resources.',
      year: '2024',
      team: 'Team Empowered',
      award: 'Grand Prize Winner',
      imageUrl: '/images/projects/project1.jpg'
    },
    {
      title: 'MentorMatch',
      description: 'A platform connecting women in tech with mentors in their field, using an AI algorithm to match based on career goals, skills, and interests.',
      year: '2023',
      team: 'Code Sisters',
      award: 'Best Social Impact',
      imageUrl: '/images/projects/project2.jpg'
    },
    {
      title: 'HealthTrack',
      description: 'A comprehensive women\'s health tracking app with customizable metrics, health insights, and data visualization to help women take control of their health.',
      year: '2022',
      team: 'Wellness Warriors',
      award: 'Most Innovative Solution',
      imageUrl: '/images/projects/project3.jpg'
    }
  ];

  // Function to launch URL
  function launchURL(url) {
    window.open(url, '_blank', 'noopener,noreferrer');
  }
  
  // Function to show event details
  function showEventDetails(event) {
    currentEvent = event;
    modalType = 'event';
    showModal = true;
  }
  
  // Function to show project details
  function showProjectDetails(project) {
    currentProject = project;
    modalType = 'project';
    showModal = true;
  }
  
  // Function to close modal
  function closeModal() {
    showModal = false;
    setTimeout(() => {
      currentEvent = null;
      currentProject = null;
      modalType = '';
    }, 300); // Wait for the fade-out animation to complete
  }

  // Close modal when Escape key is pressed
  function handleKeydown(event) {
    if (event.key === 'Escape' && showModal) {
      closeModal();
    }
  }
</script>

<svelte:window on:keydown={handleKeydown}/>

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
    <h1>Previous Events</h1>
    <p>Explore our journey through the years</p>
  </div>
</div>

<!-- Overview Section -->
<section class="section">
  <div class="section-container">
    <p class="section-text">
      Since our founding, Hack4Her has hosted 4 successful hackathons, empowering over 400 women in technology. Discover our past events and the amazing projects created.
    </p>
    
    <div class="previous-website-info">
      <p>
        To get a feel for what the event looked like last year, check out our <a href="https://hack4her.github.io/" target="_blank" rel="noopener noreferrer" class="website-link">old website</a>! Do note it may contain some outdated information. We plan on moving information about all past events here soon, so keep an eye out!
      </p>
    </div>
  </div>
</section>

<!-- Timeline Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Event Timeline</h2>
    
    <div class="timeline-container">
      {#each pastEvents as event}
        <div class="timeline-event" 
          on:click={() => showEventDetails(event)} 
          on:keydown={(e) => e.key === 'Enter' && showEventDetails(event)} 
          tabindex="0" 
          role="button"
          aria-label="View details for {event.title}">
          <div class="year-bubble">{event.year}</div>
          
          <div class="event-content">
            <h3 class="event-title">{event.title}</h3>
            <p class="event-description">{event.description}</p>
            
            <div class="event-details">
              <div class="detail-item">
                <span class="material-icons">event</span>
                <span>{event.date}</span>
              </div>
              <div class="detail-item">
                <span class="material-icons">location_on</span>
                <span>{event.location}</span>
              </div>
            </div>
            
            <div class="event-stats">
              <div class="stat-item">
                <span class="stat-value">{event.participants}</span>
                <span class="stat-label">Participants</span>
              </div>
              <div class="stat-item">
                <span class="stat-value">{event.projects}</span>
                <span class="stat-label">Projects</span>
              </div>
            </div>
            
            <div class="view-details">View Details</div>
          </div>
        </div>
      {/each}
    </div>
  </div>
</section>

<!-- Photo Gallery Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Event Photo Gallery</h2>
    
    <div class="photo-grid">
      {#each eventPhotos as photo}
        <div class="photo-item">
          <img src={photo.url} alt={photo.description} class="event-photo" />
          <div class="photo-caption">{photo.description}</div>
        </div>
      {/each}
    </div>
    
    <button class="text-button" on:click={() => launchURL('https://flickr.com/hack4her')}>
      View More Photos
    </button>
  </div>
</section>

<!-- Project Showcase Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Winning Projects</h2>
    
    <div class="projects-container">
      {#each projectShowcases as project}
        <div class="project-card" 
          on:click={() => showProjectDetails(project)} 
          on:keydown={(e) => e.key === 'Enter' && showProjectDetails(project)} 
          tabindex="0" 
          role="button"
          aria-label="View details for {project.title}">
          <div class="project-image-container">
            <img src={project.imageUrl} alt={project.title} class="project-image" />
          </div>
          
          <div class="project-content">
            <div class="project-header">
              <h3 class="project-title">{project.title}</h3>
              <div class="project-year">{project.year}</div>
            </div>
            
            <p class="project-description">{project.description}</p>
            
            <div class="project-details">
              <div class="detail-item">
                <span class="material-icons">people</span>
                <span>{project.team}</span>
              </div>
              <div class="detail-item">
                <span class="material-icons">emoji_events</span>
                <span>{project.award}</span>
              </div>
            </div>
            
            <button class="view-project-button">
              View Project
            </button>
          </div>
        </div>
      {/each}
    </div>
  </div>
</section>

<!-- Modal -->
{#if showModal}
  <div class="modal-backdrop" on:click={closeModal} transition:fade={{ duration: 200 }}>
    <div class="modal-container" on:click|stopPropagation>
      {#if modalType === 'event' && currentEvent}
        <div class="modal-header">
          <h2>{currentEvent.title}</h2>
          <button class="close-button" on:click={closeModal} aria-label="Close modal">×</button>
        </div>
        <div class="modal-content">
          <div class="modal-image-container">
            <img src={currentEvent.imageUrl} alt={currentEvent.title} class="modal-image" />
          </div>
          <div class="modal-details">
            <p class="modal-description">{currentEvent.description}</p>
            
            <div class="modal-info-grid">
              <div class="modal-info-item">
                <span class="info-label">Date</span>
                <span class="info-value">{currentEvent.date}</span>
              </div>
              <div class="modal-info-item">
                <span class="info-label">Location</span>
                <span class="info-value">{currentEvent.location}</span>
              </div>
              <div class="modal-info-item">
                <span class="info-label">Participants</span>
                <span class="info-value">{currentEvent.participants}</span>
              </div>
              <div class="modal-info-item">
                <span class="info-label">Projects</span>
                <span class="info-value">{currentEvent.projects}</span>
              </div>
            </div>
          </div>
        </div>
      {:else if modalType === 'project' && currentProject}
        <div class="modal-header">
          <h2>{currentProject.title}</h2>
          <button class="close-button" on:click={closeModal} aria-label="Close modal">×</button>
        </div>
        <div class="modal-content">
          <div class="modal-image-container">
            <img src={currentProject.imageUrl} alt={currentProject.title} class="modal-image" />
          </div>
          <div class="modal-details">
            <div class="modal-project-header">
              <span class="project-year-badge">{currentProject.year}</span>
              <span class="project-award-badge">{currentProject.award}</span>
            </div>
            
            <p class="modal-description">{currentProject.description}</p>
            
            <div class="modal-team">
              <span class="info-label">Team</span>
              <span class="info-value">{currentProject.team}</span>
            </div>
          </div>
        </div>
      {/if}
    </div>
  </div>
{/if}

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
  .text-button {
    background: none;
    border: none;
    color: var(--color-primary);
    font-weight: 500;
    cursor: pointer;
    padding: var(--spacing-small) var(--spacing-medium);
    margin-top: var(--spacing-medium);
    text-decoration: underline;
  }
  
  /* Timeline section */
  .timeline-container {
    display: flex;
    flex-direction: column;
    gap: 30px;
    position: relative;
  }
  
  .timeline-container::before {
    content: '';
    position: absolute;
    top: 0;
    bottom: 0;
    left: 24px;
    width: 2px;
    background-color: rgba(255, 255, 255, 0.3);
  }
  
  .timeline-event {
    display: flex;
    align-items: flex-start;
    gap: 20px;
    cursor: pointer;
    position: relative;
    z-index: 2;
    transition: transform 0.2s ease;
  }
  
  .timeline-event:hover {
    transform: translateX(5px);
  }
  
  .timeline-event:hover .event-content {
    background-color: rgba(255, 255, 255, 0.3);
  }
  
  .timeline-event:hover .view-details {
    opacity: 1;
  }
  
  .year-bubble {
    width: 50px;
    height: 50px;
    background-color: white;
    color: var(--color-primary);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 16px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    z-index: 2;
    flex-shrink: 0;
  }
  
  .event-content {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: 20px;
    flex: 1;
    position: relative;
    transition: background-color 0.2s ease;
  }
  
  .event-title {
    font-size: 20px;
    font-weight: bold;
    color: white;
    margin: 0 0 10px;
  }
  
  .event-description {
    font-size: 16px;
    color: rgba(255, 255, 255, 0.9);
    margin-bottom: 15px;
    line-height: 1.5;
  }
  
  .event-details {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    margin-bottom: 15px;
  }
  
  .detail-item {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 14px;
    color: rgba(255, 255, 255, 0.9);
  }
  
  .event-stats {
    display: flex;
    gap: 20px;
  }
  
  .stat-item {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  
  .stat-value {
    font-size: 24px;
    font-weight: bold;
    color: white;
  }
  
  .stat-label {
    font-size: 12px;
    color: rgba(255, 255, 255, 0.8);
  }
  
  .view-details {
    position: absolute;
    bottom: 15px;
    right: 15px;
    background-color: rgba(255, 255, 255, 0.3);
    color: white;
    font-size: 12px;
    font-weight: 500;
    padding: 5px 10px;
    border-radius: 15px;
    opacity: 0;
    transition: opacity 0.2s ease, background-color 0.2s ease;
  }
  
  .view-details:hover {
    background-color: rgba(255, 255, 255, 0.5);
  }
  
  /* Photo gallery */
  .photo-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 15px;
    margin-bottom: 20px;
  }
  
  .photo-item {
    border-radius: var(--border-radius);
    overflow: hidden;
    position: relative;
    aspect-ratio: 3/2;
  }
  
  .event-photo {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s;
  }
  
  .photo-item:hover .event-photo {
    transform: scale(1.05);
  }
  
  .photo-caption {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.7);
    color: white;
    padding: 8px;
    font-size: 12px;
    opacity: 0;
    transition: opacity 0.3s;
  }
  
  .photo-item:hover .photo-caption {
    opacity: 1;
  }
  
  /* Project showcase */
  .projects-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  .project-card {
    display: flex;
    background-color: white;
    border-radius: var(--border-radius);
    overflow: hidden;
    cursor: pointer;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }
  
  .project-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  }
  
  .project-image-container {
    width: 150px;
    flex-shrink: 0;
    background-color: var(--color-primary-light);
  }
  
  .project-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .project-content {
    flex: 1;
    padding: 15px;
    text-align: left;
  }
  
  .project-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
  }
  
  .project-title {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
    color: var(--color-text);
  }
  
  .project-year {
    background-color: var(--color-primary-light);
    color: var(--color-primary);
    padding: 5px 10px;
    border-radius: 15px;
    font-size: 12px;
    font-weight: bold;
  }
  
  .project-description {
    font-size: 14px;
    color: var(--color-text-light);
    margin-bottom: 15px;
    line-height: 1.5;
  }
  
  .project-details {
    display: flex;
    flex-direction: column;
    gap: 5px;
    margin-bottom: 15px;
  }
  
  .project-details .detail-item {
    color: var(--color-text-light);
  }
  
  .view-project-button {
    background-color: transparent;
    border: 1px solid var(--color-primary);
    color: var(--color-primary);
    border-radius: 20px;
    padding: 8px 15px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
  }
  
  .view-project-button:hover {
    background-color: var(--color-primary);
    color: white;
  }
  
  /* Responsive styles */
  @media (max-width: 768px) {
    .timeline-container::before {
      left: 20px;
    }
    
    .year-bubble {
      width: 40px;
      height: 40px;
      font-size: 14px;
    }
    
    .photo-grid {
      grid-template-columns: repeat(2, 1fr);
    }
    
    .project-card {
      flex-direction: column;
    }
    
    .project-image-container {
      width: 100%;
      height: 150px;
    }
    
    .stat-value {
      font-size: 20px;
    }
  }
  
  @media (max-width: 480px) {
    .photo-grid {
      grid-template-columns: 1fr;
    }
    
    .event-stats {
      justify-content: space-around;
      width: 100%;
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
  
  /* Modal Styles */
  .modal-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.75);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    backdrop-filter: blur(3px);
  }
  
  .modal-container {
    background-color: white;
    border-radius: var(--border-radius);
    width: 90%;
    max-width: 800px;
    max-height: 90vh;
    overflow-y: auto;
    box-shadow: 0 5px 30px rgba(0, 0, 0, 0.3);
    animation: modal-appear 0.3s ease;
  }
  
  @keyframes modal-appear {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
  }
  
  .modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    border-bottom: 1px solid #eee;
  }
  
  .modal-header h2 {
    margin: 0;
    font-size: 24px;
    color: var(--color-text);
  }
  
  .close-button {
    background: none;
    border: none;
    font-size: 28px;
    color: #666;
    cursor: pointer;
    padding: 0;
    line-height: 1;
    transition: color 0.2s;
  }
  
  .close-button:hover {
    color: #333;
  }
  
  .modal-content {
    padding: 20px;
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  .modal-image-container {
    width: 100%;
    height: 250px;
    overflow: hidden;
    border-radius: var(--border-radius);
  }
  
  .modal-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .modal-details {
    flex: 1;
  }
  
  .modal-description {
    font-size: 16px;
    line-height: 1.6;
    color: var(--color-text);
    margin-bottom: 20px;
  }
  
  .modal-info-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
  }
  
  .modal-info-item {
    display: flex;
    flex-direction: column;
  }
  
  .info-label {
    font-size: 14px;
    color: #666;
    margin-bottom: 5px;
  }
  
  .info-value {
    font-size: 16px;
    font-weight: 500;
    color: var(--color-text);
  }
  
  .modal-project-header {
    display: flex;
    gap: 10px;
    margin-bottom: 15px;
  }
  
  .project-year-badge, .project-award-badge {
    background-color: var(--color-primary-light);
    color: var(--color-primary);
    padding: 5px 10px;
    border-radius: 15px;
    font-size: 14px;
    font-weight: 500;
  }
  
  .project-award-badge {
    background-color: #fdf2cc;
    color: #e6a700;
  }
  
  .modal-team {
    margin-top: 15px;
  }
  
  /* Responsive modal adjustments */
  @media (min-width: 768px) {
    .modal-content {
      flex-direction: row;
    }
    
    .modal-image-container {
      width: 40%;
      height: auto;
      max-height: 350px;
    }
  }
  
  @media (max-width: 767px) {
    .modal-info-grid {
      grid-template-columns: 1fr;
    }
    
    .modal-header h2 {
      font-size: 20px;
    }
  }
</style> 