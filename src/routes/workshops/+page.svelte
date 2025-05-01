<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';
  import { onMount } from 'svelte';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.workshops;

  // Workshop data for each day
  const workshopsByDay = [
    // Day 1 workshops
    [
      {
        title: 'Introduction to Flutter',
        presenter: 'Jane Doe',
        time: '10:00 AM - 11:30 AM',
        location: 'Room A',
        category: 'Technical',
        description: 'Learn the basics of Flutter and how to build cross-platform mobile apps with a single codebase.'
      },
      {
        title: 'UI/UX Design Principles',
        presenter: 'John Smith',
        time: '12:00 PM - 1:30 PM',
        location: 'Room B',
        category: 'Design',
        description: 'Discover core principles of effective UI/UX design and how to create intuitive user experiences.'
      },
      {
        title: 'Pitching Your Idea',
        presenter: 'Alice Johnson',
        time: '2:00 PM - 3:30 PM',
        location: 'Room C',
        category: 'Business',
        description: 'Learn how to effectively communicate your ideas and pitch your projects to potential investors or partners.'
      },
      {
        title: 'Team Collaboration',
        presenter: 'Bob Williams',
        time: '4:00 PM - 5:30 PM',
        location: 'Room A',
        category: 'Soft Skills',
        description: 'Develop effective team collaboration skills essential for hackathons and professional environments.'
      },
    ],
    // Day 2 workshops
    [
      {
        title: 'Advanced Flutter State Management',
        presenter: 'Emily Chen',
        time: '9:30 AM - 11:00 AM',
        location: 'Room A',
        category: 'Technical',
        description: 'Deep dive into state management solutions for Flutter applications, including Provider, Riverpod, and Bloc.'
      },
      {
        title: 'Data Visualization',
        presenter: 'Michael Brown',
        time: '11:30 AM - 1:00 PM',
        location: 'Room B',
        category: 'Technical',
        description: 'Learn how to create effective and beautiful data visualizations for your applications.'
      },
      {
        title: 'Accessible Design',
        presenter: 'Sarah Lee',
        time: '2:00 PM - 3:30 PM',
        location: 'Room C',
        category: 'Design',
        description: 'Learn how to make your applications accessible to all users, including those with disabilities.'
      },
      {
        title: 'Project Management',
        presenter: 'David Wilson',
        time: '4:00 PM - 5:30 PM',
        location: 'Room D',
        category: 'Business',
        description: 'Develop project management skills to keep your team organized and on track during the hackathon.'
      },
    ],
    // Day 3 workshops
    [
      {
        title: 'Machine Learning Basics',
        presenter: 'Rachel Green',
        time: '9:30 AM - 11:00 AM',
        location: 'Room A',
        category: 'Technical',
        description: 'Introduction to machine learning concepts and how to integrate ML models into your applications.'
      },
      {
        title: 'Cloud Deployment',
        presenter: 'Thomas Anderson',
        time: '11:30 AM - 1:00 PM',
        location: 'Room B',
        category: 'Technical',
        description: 'Learn how to deploy your applications to the cloud using services like Firebase, AWS, or Azure.'
      },
      {
        title: 'Presentation Skills',
        presenter: 'Jessica Parker',
        time: '2:00 PM - 3:30 PM',
        location: 'Room C',
        category: 'Soft Skills',
        description: 'Develop skills to effectively present your project to judges and audiences.'
      },
      {
        title: 'Final Project Clinic',
        presenter: 'Hack4Her Team',
        time: '4:00 PM - 6:00 PM',
        location: 'All Rooms',
        category: 'Support',
        description: 'Get last-minute help and feedback on your projects before the final submissions.'
      },
    ],
  ];

  // Workshop categories
  const categories = [
    { title: 'Technical', icon: 'code', count: 8 },
    { title: 'Design', icon: 'brush', count: 6 },
    { title: 'Business', icon: 'business', count: 5 },
    { title: 'Soft Skills', icon: 'people', count: 4 }
  ];

  // Registration steps
  const registrationSteps = [
    {
      number: '1',
      title: 'Register for Hack4Her',
      description: 'You must be a registered participant to attend workshops.'
    },
    {
      number: '2',
      title: 'Browse Available Workshops',
      description: 'Check out the workshop schedule and select the ones you\'re interested in.'
    },
    {
      number: '3',
      title: 'Sign Up for Workshops',
      description: 'Use our workshop registration system to secure your spot.'
    },
    {
      number: '4',
      title: 'Receive Confirmation',
      description: 'You\'ll receive a confirmation email with workshop details.'
    }
  ];

  // State
  let selectedDay = 0;
  let expandedWorkshops = new Set();

  function selectDay(index) {
    selectedDay = index;
    expandedWorkshops.clear();
    expandedWorkshops = expandedWorkshops; // Trigger reactivity
  }

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
<section class="section">
  <div class="section-container">
    <div class="previous-website-info">
      <p>
        Workshop schedule and sign-ups will be posted soon! You can expect workshops from Booking.com, ServiceNow, but also independent female researchers and industry experts.<br>
        In the meantime, check our <a href={routes.information} class="website-link">schedule</a> on the information page, or <a href={routes.about} class="website-link">learn more</a> about our event here.
      </p>
    </div>
  </div>
</section>

<!--
<section class="section">
  <div class="section-container">
    <p class="section-text">
      Our workshops offer a unique opportunity to learn new skills, get hands-on experience, and connect with industry experts. All workshops are free for registered participants.
    </p>
    <a href={routes.registration} class="btn btn-primary">Register Now</a>
  </div>
</section>

<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Workshop Schedule</h2>
    
    <div class="days-tabs">
      <button class={selectedDay === 0 ? 'day-tab active' : 'day-tab'} on:click={() => selectDay(0)}>
        Day 1 <span class="tab-date">Friday</span>
      </button>
      <button class={selectedDay === 1 ? 'day-tab active' : 'day-tab'} on:click={() => selectDay(1)}>
        Day 2 <span class="tab-date">Saturday</span>
      </button>
      <button class={selectedDay === 2 ? 'day-tab active' : 'day-tab'} on:click={() => selectDay(2)}>
        Day 3 <span class="tab-date">Sunday</span>
      </button>
    </div>
    
    <div class="workshops-list">
      {#each workshopsByDay[selectedDay] as workshop, index}
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
                {workshop.presenter}
              </div>
            </div>
            
            <div class="workshop-meta">
              <div class="category-badge">{workshop.category}</div>
              <span class="material-icons expand-icon">
                {expandedWorkshops.has(index) ? 'expand_less' : 'expand_more'}
              </span>
            </div>
          </div>
          
          {#if expandedWorkshops.has(index)}
            <div class="workshop-details">
              <p class="details-text">{workshop.description}</p>
              
              <div class="detail-item">
                <span class="material-icons">location_on</span>
                <span>{workshop.location}</span>
              </div>
              
              <button class="register-button">
                Sign Up for Workshop
              </button>
            </div>
          {/if}
        </div>
      {/each}
    </div>
  </div>
</section>

<section class="section">
  <div class="section-container">
    <h2 class="section-title">Workshop Categories</h2>
    
    <div class="categories-grid">
      {#each categories as category}
        <div class="category-card">
          <span class="material-icons category-icon">{category.icon}</span>
          <h3>{category.title}</h3>
          <div class="category-count">{category.count} workshops</div>
        </div>
      {/each}
    </div>
  </div>
</section>

<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">How to Register</h2>
    
    <div class="registration-steps">
      {#each registrationSteps as step}
        <div class="step-card">
          <div class="step-number">{step.number}</div>
          <div class="step-content">
            <h3 class="step-title">{step.title}</h3>
            <p class="step-description">{step.description}</p>
          </div>
        </div>
      {/each}
    </div>
    
    <a href={routes.registration} class="btn btn-white">Register Now</a>
  </div>
</section>
-->

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
  .workshops-container {
    display: flex;
    flex-direction: column;
    gap: 15px;
  }
  
  .workshop-item {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: 20px;
    cursor: pointer;
    text-align: left;
    color: white;
    transition: all 0.3s;
  }
  
  .workshop-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 10px;
  }
  
  .workshop-title {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
    flex: 1;
  }
  
  .workshop-header-right {
    display: flex;
    align-items: center;
    gap: 5px;
  }
  
  .category-tag {
    background-color: rgba(255, 255, 255, 0.3);
    padding: 5px 10px;
    border-radius: 15px;
    font-size: 12px;
    font-weight: bold;
    color: white;
  }
  
  .expand-icon {
    font-size: 20px;
  }
  
  .workshop-subheader {
    margin-bottom: 5px;
  }
  
  .workshop-presenter {
    font-size: 14px;
    margin: 0;
  }
  
  .workshop-info {
    display: flex;
    justify-content: space-between;
    font-size: 14px;
  }
  
  .workshop-time, .workshop-location {
    margin: 0;
  }
  
  /* Workshop expanded details */
  .workshop-details {
    margin-top: 20px;
  }
  
  .divider {
    border: none;
    height: 1px;
    background-color: rgba(255, 255, 255, 0.3);
    margin: 15px 0;
  }
  
  .workshop-details h4 {
    font-size: 16px;
    font-weight: bold;
    margin: 15px 0 10px;
  }
  
  .workshop-details p {
    font-size: 14px;
    margin: 0 0 15px;
    line-height: 1.5;
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