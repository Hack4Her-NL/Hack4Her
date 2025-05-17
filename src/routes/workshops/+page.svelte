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
    // Duplicating workshops to fill grid
    {
      title: 'Web Development',
      presenter: 'Jane Doe',
      company: 'FlutterTech',
      image: '/images/face6.jpg',
      time: '10:00 AM - 11:30 AM',
      location: 'Room A',
      description: 'Learn the basics of web development and how to build responsive websites with HTML, CSS, and JavaScript.',
      bio: 'Jane is a senior developer at FlutterTech with over 5 years of experience building web applications. She specializes in frontend development and has contributed to several open-source projects.'
    },
    {
      title: 'Mobile Design',
      presenter: 'John Smith',
      company: 'DesignHub',
      image: '/images/carmen_sanchez.jpeg',
      time: '12:00 PM - 1:30 PM',
      location: 'Room B',
      description: 'Learn how to design effective mobile interfaces that provide great user experiences.',
      bio: 'John is a lead UX designer at DesignHub where he has worked on interfaces for Fortune 500 companies. He has a background in cognitive psychology and over 8 years of experience in the design industry.'
    },
    {
      title: 'Marketing Strategies',
      presenter: 'Alice Johnson',
      company: 'StartupMentor',
      image: '/images/lara_popovic.jpeg',
      time: '2:00 PM - 3:30 PM',
      location: 'Room C',
      description: 'Discover effective marketing strategies for your startup or project.',
      bio: 'Alice is the founder of StartupMentor and has helped over 100 startups develop successful marketing strategies. She previously worked in marketing for tech companies and has an MBA from Harvard Business School.'
    },
    {
      title: 'Leadership Skills',
      presenter: 'Bob Williams',
      company: 'TeamWork Solutions',
      image: '/images/joey_laarhoven.jpeg',
      time: '4:00 PM - 5:30 PM',
      location: 'Room A',
      description: 'Develop leadership skills essential for managing teams and projects.',
      bio: 'Bob is an organizational psychologist specializing in leadership development. At TeamWork Solutions, he consults with tech companies to improve team dynamics and develop effective leaders.'
    },
    {
      title: 'Cloud Computing',
      presenter: 'Jane Doe',
      company: 'FlutterTech',
      image: '/images/face6.jpg',
      time: '10:00 AM - 11:30 AM',
      location: 'Room A',
      description: 'Learn the basics of cloud computing and how to deploy applications to the cloud.',
      bio: 'Jane is a senior developer at FlutterTech with over 5 years of experience working with cloud platforms. She specializes in serverless architecture and has contributed to several open-source cloud projects.'
    },
    {
      title: 'Accessibility Design',
      presenter: 'John Smith',
      company: 'DesignHub',
      image: '/images/carmen_sanchez.jpeg',
      time: '12:00 PM - 1:30 PM',
      location: 'Room B',
      description: 'Learn how to design accessible interfaces that work for everyone, regardless of ability.',
      bio: 'John is a lead UX designer at DesignHub where he has worked on accessible interfaces for Fortune 500 companies. He has a background in cognitive psychology and over 8 years of experience in accessibility design.'
    },
    {
      title: 'Financial Planning',
      presenter: 'Alice Johnson',
      company: 'StartupMentor',
      image: '/images/lara_popovic.jpeg',
      time: '2:00 PM - 3:30 PM',
      location: 'Room C',
      description: 'Learn how to create a financial plan for your startup or project.',
      bio: 'Alice is the founder of StartupMentor and has helped over 100 startups create successful financial plans. She previously worked in venture capital and has an MBA from Harvard Business School.'
    },
    {
      title: 'Conflict Resolution',
      presenter: 'Bob Williams',
      company: 'TeamWork Solutions',
      image: '/images/joey_laarhoven.jpeg',
      time: '4:00 PM - 5:30 PM',
      location: 'Room A',
      description: 'Develop skills for resolving conflicts in team environments.',
      bio: 'Bob is an organizational psychologist specializing in conflict resolution. At TeamWork Solutions, he consults with tech companies to improve team dynamics and resolve workplace conflicts.'
    },
    {
      title: 'Data Science',
      presenter: 'Jane Doe',
      company: 'FlutterTech',
      image: '/images/face6.jpg',
      time: '10:00 AM - 11:30 AM',
      location: 'Room A',
      description: 'Learn the basics of data science and how to analyze data to make informed decisions.',
      bio: 'Jane is a senior data scientist at FlutterTech with over 5 years of experience in data analysis. She specializes in machine learning and has contributed to several open-source data science projects.'
    },
    {
      title: 'Product Design',
      presenter: 'John Smith',
      company: 'DesignHub',
      image: '/images/carmen_sanchez.jpeg',
      time: '12:00 PM - 1:30 PM',
      location: 'Room B',
      description: 'Learn how to design products that solve real user problems.',
      bio: 'John is a lead product designer at DesignHub where he has worked on products for Fortune 500 companies. He has a background in industrial design and over 8 years of experience in product development.'
    },
    {
      title: 'Social Media Strategy',
      presenter: 'Alice Johnson',
      company: 'StartupMentor',
      image: '/images/lara_popovic.jpeg',
      time: '2:00 PM - 3:30 PM',
      location: 'Room C',
      description: 'Develop a social media strategy for your startup or project.',
      bio: 'Alice is the founder of StartupMentor and has helped over 100 startups develop successful social media strategies. She previously worked in digital marketing and has an MBA from Harvard Business School.'
    },
    {
      title: 'Ethical Leadership',
      presenter: 'Bob Williams',
      company: 'TeamWork Solutions',
      image: '/images/joey_laarhoven.jpeg',
      time: '4:00 PM - 5:30 PM',
      location: 'Room A',
      description: 'Explore the principles of ethical leadership and how to apply them in your organization.',
      bio: 'Bob is an organizational psychologist specializing in ethical leadership. At TeamWork Solutions, he consults with tech companies to develop ethical leadership practices and improve organizational culture.'
    },
    {
      title: 'Agile Development',
      presenter: 'Jane Doe',
      company: 'FlutterTech',
      image: '/images/face6.jpg',
      time: '10:00 AM - 11:30 AM',
      location: 'Room A',
      description: 'Learn the principles of agile development and how to implement them in your team.',
      bio: 'Jane is a senior developer at FlutterTech with over 5 years of experience in agile development. She specializes in scrum methodology and has contributed to several open-source agile tools.'
    },
    {
      title: 'Design Thinking',
      presenter: 'John Smith',
      company: 'DesignHub',
      image: '/images/carmen_sanchez.jpeg',
      time: '12:00 PM - 1:30 PM',
      location: 'Room B',
      description: 'Learn how to apply design thinking to solve complex problems.',
      bio: 'John is a lead designer at DesignHub where he has facilitated design thinking workshops for Fortune 500 companies. He has a background in cognitive psychology and over 8 years of experience in design facilitation.'
    },
    {
      title: 'Investor Relations',
      presenter: 'Alice Johnson',
      company: 'StartupMentor',
      image: '/images/lara_popovic.jpeg',
      time: '2:00 PM - 3:30 PM',
      location: 'Room C',
      description: 'Learn how to build and maintain relationships with investors.',
      bio: 'Alice is the founder of StartupMentor and has helped over 100 startups secure investment. She previously worked in venture capital and has an MBA from Harvard Business School.'
    }
  ];

  // State
  let selectedWorkshop = null;
  let modalOpen = false;

  function openWorkshopModal(workshop) {
    selectedWorkshop = workshop;
    modalOpen = true;
    document.body.style.overflow = 'hidden'; // Prevent scrolling while modal is open
  }

  function closeModal() {
    modalOpen = false;
    document.body.style.overflow = ''; // Re-enable scrolling
  }

  // Close modal when clicking outside
  function handleBackdropClick(e) {
    if (e.target === e.currentTarget) {
      closeModal();
    }
  }

  // Close modal when ESC key is pressed
  function handleKeydown(e) {
    if (e.key === 'Escape' && modalOpen) {
      closeModal();
    }
  }

  onMount(() => {
    window.addEventListener('keydown', handleKeydown);
    return () => {
      window.removeEventListener('keydown', handleKeydown);
    }
  });
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
    
    <div class="workshops-grid">
      {#each workshops as workshop, index}
        <div 
          class="workshop-card" 
          on:click={() => openWorkshopModal(workshop)}
          on:keydown={(e) => e.key === 'Enter' && openWorkshopModal(workshop)}
          tabindex="0"
          role="button"
        >
          <div class="workshop-content">
            <h3 class="workshop-title">{workshop.title}</h3>
            <div class="workshop-presenter">
              <span class="material-icons">person</span>
              {workshop.presenter}
            </div>
            <div class="workshop-time">{workshop.time}</div>
          </div>
        </div>
      {/each}
    </div>
  </div>
</section>

<!-- Workshop Modal -->
{#if modalOpen && selectedWorkshop}
  <div 
    class="modal-backdrop" 
    on:click={handleBackdropClick}
    on:keydown={(e) => e.key === 'Escape' && closeModal()}
    tabindex="-1"
  >
    <div class="modal-container">
      <div class="modal-header">
        <h2 class="modal-title">{selectedWorkshop.title}</h2>
        <button class="modal-close" on:click={closeModal}>
          <span class="material-icons">close</span>
        </button>
      </div>
      
      <div class="modal-content">
        <div class="presenter-section">
          <div class="presenter-image" style="background-image: url({selectedWorkshop.image})"></div>
          <div class="presenter-info">
            <h3 class="presenter-name">{selectedWorkshop.presenter}</h3>
            <p class="presenter-company">{selectedWorkshop.company}</p>
          </div>
        </div>
        
        <div class="workshop-details-modal">
          <div class="detail-section">
            <h4>Description</h4>
            <p>{selectedWorkshop.description}</p>
          </div>
          
          <div class="detail-section">
            <h4>About the Presenter</h4>
            <p>{selectedWorkshop.bio}</p>
          </div>
          
          <div class="detail-section">
            <div class="workshop-meta">
              <div class="meta-item">
                <span class="material-icons">access_time</span>
                <span>{selectedWorkshop.time}</span>
              </div>
              <div class="meta-item">
                <span class="material-icons">location_on</span>
                <span>{selectedWorkshop.location}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
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
  
  /* Workshop grid layout */
  .workshops-grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 20px;
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
  }
  
  .workshop-card {
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s ease;
    aspect-ratio: 1 / 1;
    cursor: pointer;
    position: relative;
    display: flex;
    flex-direction: column;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  .workshop-card:hover {
    transform: translateY(-5px) scale(1.03);
    background-color: rgba(255, 255, 255, 0.2);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
  
  .workshop-content {
    padding: 20px;
    display: flex;
    flex-direction: column;
    height: 100%;
    justify-content: space-between;
  }
  
  .workshop-title {
    font-size: 16px;
    font-weight: bold;
    margin: 0 0 10px;
    color: white;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
  
  .workshop-presenter {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 14px;
    margin-bottom: 10px;
  }
  
  .workshop-time {
    font-size: 12px;
    opacity: 0.8;
    margin-top: auto;
  }
  
  .workshop-details {
    margin-top: 15px;
    height: 100%;
    overflow-y: auto;
  }
  
  .presenter-image {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background-size: cover;
    background-position: center;
    margin: 0 auto 10px;
    border: 2px solid rgba(255, 255, 255, 0.8);
  }
  
  .presenter-company {
    text-align: center;
    font-size: 14px;
    margin-bottom: 15px;
    font-style: italic;
  }
  
  .workshop-details h4 {
    font-size: 15px;
    font-weight: bold;
    margin: 15px 0 5px;
  }
  
  .details-text {
    font-size: 13px;
    line-height: 1.4;
    margin: 0 0 10px;
  }
  
  .detail-item {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 13px;
    margin-top: auto;
  }
  
  @media (max-width: 1200px) {
    .workshops-grid {
      grid-template-columns: repeat(4, 1fr);
    }
  }
  
  @media (max-width: 900px) {
    .workshops-grid {
      grid-template-columns: repeat(3, 1fr);
    }
    
    .workshop-card.expanded {
      grid-column: span 2;
      grid-row: span 2;
    }
  }
  
  @media (max-width: 600px) {
    .workshops-grid {
      grid-template-columns: repeat(2, 1fr);
      gap: 15px;
    }
    
    .workshop-card.expanded {
      grid-column: span 2;
      grid-row: span 2;
    }
    
    .section-container {
      padding: 0 10px;
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

  /* Modal Styles */
  .modal-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    padding: 20px;
    backdrop-filter: blur(5px);
  }
  
  .modal-container {
    background: linear-gradient(135deg, #2463c9 0%, #1c4fa0 100%);
    border-radius: 16px;
    max-width: 90%;
    width: 600px;
    max-height: 90vh;
    overflow-y: auto;
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
    position: relative;
    color: white;
  }
  
  .modal-header {
    padding: 20px 20px 10px;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  }
  
  .modal-title {
    margin: 0;
    font-size: 24px;
    font-weight: bold;
    padding-right: 30px;
  }
  
  .modal-close {
    background: none;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 24px;
    opacity: 0.7;
    transition: opacity 0.2s;
    padding: 0;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .modal-close:hover {
    opacity: 1;
  }
  
  .modal-content {
    padding: 20px;
  }
  
  .presenter-section {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
  }
  
  .presenter-section .presenter-image {
    width: 80px;
    height: 80px;
    margin: 0 20px 0 0;
    flex-shrink: 0;
  }
  
  .presenter-info {
    flex: 1;
  }
  
  .presenter-name {
    margin: 0 0 5px;
    font-size: 18px;
    font-weight: bold;
  }
  
  .presenter-company {
    margin: 0;
    font-style: italic;
    opacity: 0.8;
  }
  
  .workshop-details-modal {
    color: rgba(255, 255, 255, 0.9);
  }
  
  .detail-section {
    margin-bottom: 25px;
  }
  
  .detail-section h4 {
    margin: 0 0 10px;
    font-size: 16px;
    font-weight: bold;
    color: white;
  }
  
  .detail-section p {
    margin: 0;
    line-height: 1.5;
    font-size: 15px;
  }
  
  .workshop-meta {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-top: 10px;
  }
  
  .meta-item {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 15px;
  }
  
  @media (max-width: 600px) {
    .modal-container {
      width: 100%;
      max-width: 100%;
      border-radius: 12px;
    }
    
    .modal-title {
      font-size: 20px;
    }
    
    .presenter-section {
      flex-direction: column;
      text-align: center;
    }
    
    .presenter-section .presenter-image {
      margin: 0 auto 15px;
    }
  }
</style> 