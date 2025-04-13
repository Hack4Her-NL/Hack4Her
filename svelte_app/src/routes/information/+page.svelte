<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';
  import { onMount } from 'svelte';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.information;

  // FAQ data
  const faqItems = [
    {
      question: 'What is Hack4Her?',
      answer: 'Hack4Her is the only female-focused student hackathon in the Netherlands, creating a space where technology and diversity meet. We aim to empower women in tech through collaboration, innovation, and competition.'
    },
    {
      question: 'Who can participate?',
      answer: 'All students in the Netherlands are welcome to attend. While all genders are welcome to participate in the event, only women are eligible to compete in the hackathon portion.'
    },
    {
      question: 'Do I need to know how to code?',
      answer: 'No, you don\'t need prior coding experience. Hack4Her is designed to be inclusive and educational. We have workshops and mentors to help you learn and develop your skills.'
    },
    {
      question: 'What should I bring?',
      answer: 'Bring your laptop, charger, any personal items you may need, and most importantly, your enthusiasm and creativity!'
    }
  ];

  // Event highlights
  const eventHighlights = [
    'Open to all students in the Netherlands',
    'Coding, workshops, lectures, and networking opportunities',
    'While all genders are welcome, only women are eligible to compete in the hackathon',
    'Free food and drinks provided',
    'Chance for free accommodation'
  ];

  // Code of conduct
  const codeOfConductSummary = [
    'We are committed to providing a safe and inclusive environment for all participants',
    'Harassment or discrimination of any kind will not be tolerated',
    'Respect the opinions, skills, and boundaries of other participants',
    'Follow the event rules and guidelines at all times',
    'Report any concerns or violations to the event organizers immediately'
  ];

  // Schedule data
  const fridaySchedule = [
    {time: '11:30 - 12:00', activity: 'Participants Arrive', location: ''},
    {time: '12:00 - 13:00', activity: 'Introduction', location: ''},
    {time: '13:00 - 14:00', activity: 'Lunch', location: 'Booking.com grads and mentors join to chat with students over lunch!'},
    {time: '14:00 - 15:00', activity: 'Keynote', location: ''},
    {time: '15:00 - 16:30', activity: 'Workshops Round 1', location: ''},
    {time: '16:30 - 17:00', activity: 'Break and Light Snacks', location: ''},
    {time: '17:00 - 18:30', activity: 'Workshops Round 2', location: ''},
    {time: '18:30 - 21:00', activity: 'Dinner/drinks and networking', location: ''},
    {time: '21:00', activity: 'Participants Leave', location: ''}
  ];

  const saturdaySchedule = [
    {time: '9:00 - 9:30', activity: 'Participants Arrive', location: 'Event Spot'},
    {time: '9:30 - 10:00', activity: 'Breakfast', location: 'Event Spot'},
    {time: '10:00 - 10:15', activity: 'Introduction', location: 'Theatre 1'},
    {time: '10:15 - 11:00', activity: 'Challenge Workshops', location: '2B01, 2B05, 2B12, 2B17, 2B25'},
    {time: '11:00 - 14:00', activity: 'Hacking', location: '2B01, 2B05, 2B12, 2B17, 2B25'},
    {time: '14:00 - 15:00', activity: 'Lunch', location: 'Event Spot'},
    {time: '15:00 - 19:00', activity: 'Hacking', location: '2B01, 2B05, 2B12, 2B17, 2B25'},
    {time: '19:00 - 20:00', activity: 'Dinner', location: 'Event Spot'},
    {time: '20:00 - 22:00', activity: 'Hacking', location: '2B01, 2B05, 2B12, 2B17, 2B25'}
  ];

  const sundaySchedule = [
    {time: '9:00 - 9:30', activity: 'Participants Arrive', location: 'Event Spot'},
    {time: '9:30 - 10:00', activity: 'Breakfast', location: 'Event Spot'},
    {time: '10:00 - 10:05', activity: 'Introduction', location: 'Theatre 1'},
    {time: '10:05 - 14:00', activity: 'Hacking', location: '2B01, 2B05, 2B12, 2B17, 2B25'},
    {time: '14:00 - 15:00', activity: 'Lunch', location: 'Event Spot'},
    {time: '15:00 - 16:00', activity: 'Hacking (Last Hour)', location: '2B01, 2B05, 2B12, 2B17, 2B25'},
    {time: '16:00 - 18:00', activity: 'Judging/Presenting', location: '4A06, 4A25'},
    {time: '18:00 - 18:30', activity: 'Deliberation', location: '4A06, 4A25'},
    {time: '18:30 - 19:30', activity: 'Closing and Presentation of Awards', location: 'Theatre 1'}
  ];

  // Tab handling
  let activeTab = 'friday';
  
  function setActiveTab(tab) {
    activeTab = tab;
  }
  
  // Function to launch URL
  function launchURL(url) {
    window.open(url, '_blank', 'noopener,noreferrer');
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
    <h1>Information</h1>
    <p>Everything you need to know about Hack4Her</p>
  </div>
</div>

<!-- Information Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Hack4Her is the only female-focused student hackathon in the Netherlands</h2>
    <p class="section-text">
      Creating a space where technology and diversity meet. We are a coalition of staff and students from the Vrije Universiteit Amsterdam and Universiteit van Amsterdam. Our mission is simple: to create a women-centered space in the tech world.
    </p>
    <a href={routes.registration} class="btn btn-primary">Register Now</a>
  </div>
</section>

<!-- Event Details Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Event Details</h2>
    <p class="section-text text-white">
      Our 4th Annual Hack4Her event is taking place on June 13-15, 2025, at VU Amsterdam. This weekend is dedicated to empowering women in tech through collaboration, innovation, and competition.
    </p>
    
    <div class="details-card">
      <h3>Event Highlights:</h3>
      
      <ul class="highlights-list">
        {#each eventHighlights as highlight}
          <li class="bullet-point">
            <span class="bullet">•</span>
            <span>{highlight}</span>
          </li>
        {/each}
      </ul>
    </div>
  </div>
</section>

<!-- Schedule Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Event Schedule</h2>
    
    <div class="tabs-container">
      <div class="tabs">
        <button 
          class="tab-button {activeTab === 'friday' ? 'active' : ''}" 
          on:click={() => setActiveTab('friday')}
        >
          Friday
        </button>
        <button 
          class="tab-button {activeTab === 'saturday' ? 'active' : ''}" 
          on:click={() => setActiveTab('saturday')}
        >
          Saturday
        </button>
        <button 
          class="tab-button {activeTab === 'sunday' ? 'active' : ''}" 
          on:click={() => setActiveTab('sunday')}
        >
          Sunday
        </button>
      </div>
      
      <div class="tab-content">
        {#if activeTab === 'friday'}
          <div class="schedule-container">
            {#each fridaySchedule as item}
              <div class="schedule-item">
                <div class="time-column">{item.time}</div>
                <div class="activity-column">
                  <div class="activity-title">{item.activity}</div>
                  {#if item.location}
                    <div class="activity-location">({item.location})</div>
                  {/if}
                </div>
              </div>
            {/each}
          </div>
        {:else if activeTab === 'saturday'}
          <div class="schedule-container">
            {#each saturdaySchedule as item}
              <div class="schedule-item">
                <div class="time-column">{item.time}</div>
                <div class="activity-column">
                  <div class="activity-title">{item.activity}</div>
                  {#if item.location}
                    <div class="activity-location">({item.location})</div>
                  {/if}
                </div>
              </div>
            {/each}
          </div>
        {:else if activeTab === 'sunday'}
          <div class="schedule-container">
            {#each sundaySchedule as item}
              <div class="schedule-item">
                <div class="time-column">{item.time}</div>
                <div class="activity-column">
                  <div class="activity-title">{item.activity}</div>
                  {#if item.location}
                    <div class="activity-location">({item.location})</div>
                  {/if}
                </div>
              </div>
            {/each}
          </div>
        {/if}
      </div>
    </div>
  </div>
</section>

<!-- Eligibility Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Eligibility</h2>
    <p class="section-text">
      All participants must adhere to our code of conduct throughout the event.
    </p>
    
    <div class="conduct-card">
      <h3>Code of Conduct Summary:</h3>
      
      <ul class="conduct-list">
        {#each codeOfConductSummary as item}
          <li class="bullet-point">
            <span class="bullet">•</span>
            <span>{item}</span>
          </li>
        {/each}
      </ul>
    </div>
    
    <button class="text-button" on:click={() => launchURL('https://hack4her.github.io/')}>
      Read Full Code of Conduct
    </button>
  </div>
</section>

<!-- FAQ Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Frequently Asked Questions</h2>
    
    <div class="faq-container">
      {#each faqItems as faq}
        <div class="faq-item">
          <h3 class="faq-question">{faq.question}</h3>
          <p class="faq-answer">{faq.answer}</p>
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
  
  /* Details Card */
  .details-card {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: var(--spacing-large);
    margin: 0 auto;
    text-align: left;
    color: white;
  }
  
  .details-card h3 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: var(--spacing-medium);
  }
  
  .highlights-list {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  
  /* Conduct Card */
  .conduct-card {
    background-color: rgba(0, 0, 0, 0.05);
    border-radius: var(--border-radius);
    padding: var(--spacing-large);
    border: 1px solid rgba(0, 0, 0, 0.1);
    margin: 0 auto;
    text-align: left;
  }
  
  .conduct-card h3 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: var(--spacing-medium);
  }
  
  .conduct-list {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  
  .bullet-point {
    display: flex;
    margin-bottom: 8px;
  }
  
  .bullet {
    font-weight: bold;
    margin-right: 8px;
  }
  
  /* Tabs */
  .tabs-container {
    max-width: 100%;
    margin: 0 auto;
  }
  
  .tabs {
    display: flex;
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: 30px;
    overflow: hidden;
    margin: 0 auto var(--spacing-medium);
    max-width: 400px;
  }
  
  .tab-button {
    flex: 1;
    background: none;
    border: none;
    color: rgba(255, 255, 255, 0.7);
    font-weight: 500;
    padding: 12px;
    cursor: pointer;
    transition: all 0.3s;
  }
  
  .tab-button.active {
    background-color: var(--color-primary);
    color: white;
    border-radius: 30px;
  }
  
  .tab-content {
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: var(--border-radius);
    padding: var(--spacing-medium);
    height: 400px;
    overflow-y: auto;
  }
  
  /* Schedule */
  .schedule-container {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }
  
  .schedule-item {
    display: flex;
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: 15px;
  }
  
  .time-column {
    width: 100px;
    flex-shrink: 0;
    font-weight: bold;
    color: white;
    font-size: 14px;
  }
  
  .activity-column {
    flex: 1;
  }
  
  .activity-title {
    font-weight: bold;
    color: white;
    font-size: 16px;
  }
  
  .activity-location {
    font-style: italic;
    color: rgba(255, 255, 255, 0.7);
    font-size: 14px;
    margin-top: 4px;
  }
  
  /* FAQ */
  .faq-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  .faq-item {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: 20px;
    text-align: left;
  }
  
  .faq-question {
    font-size: 18px;
    font-weight: bold;
    color: white;
    margin-bottom: 10px;
  }
  
  .faq-answer {
    font-size: 16px;
    color: white;
    margin: 0;
  }
  
  /* Scrollbar styling */
  .tab-content {
    scrollbar-width: thin;
    scrollbar-color: rgba(255, 255, 255, 0.3) rgba(255, 255, 255, 0.1);
  }
  
  .tab-content::-webkit-scrollbar {
    width: 6px;
  }
  
  .tab-content::-webkit-scrollbar-track {
    background: rgba(255, 255, 255, 0.1);
    border-radius: 3px;
  }
  
  .tab-content::-webkit-scrollbar-thumb {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 3px;
  }
  
  /* Responsive styles */
  @media (max-width: 768px) {
    .section-container {
      padding: 0 var(--spacing-small);
    }
    
    .tab-content {
      height: 450px;
    }
    
    .time-column {
      width: 80px;
      font-size: 12px;
    }
    
    .activity-title {
      font-size: 14px;
    }
    
    .activity-location {
      font-size: 12px;
    }
  }
</style> 