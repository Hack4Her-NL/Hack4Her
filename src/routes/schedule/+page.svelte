<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';

  // Set page-specific SEO metadata
  export const metadata = {
    title: 'Schedule - Hack4Her',
    description: 'Full schedule for Hack4Her 2025 - workshops, hackathon, networking events, and more',
    keywords: ['hackathon schedule', 'tech events', 'workshops', 'women in tech', 'programming'],
    ogType: 'website'
  };

  // Schedule data
  const fridaySchedule = [
    {time: '13:45 - 14:00', activity: 'Arrival & Check-In', location: 'Vrije Universiteit Amsterdam NU Building Ground Floor'},
    {time: '14:00 - 14:15', activity: 'Introduction', location: 'NU-Theatre 1'},
    {time: '14:15 - 15:00', activity: 'A word from our sponsors!', location: 'NU-Theatre 1'},
    {time: '15:00 - 15:30', activity: 'Keynote', location: 'NU-Theatre 1'},
    {time: '15:30 - 16:25', activity: 'Workshops Round 1', location: ''},
    {time: '16:30 - 17:30', activity: 'Workshops Round 2', location: ''},
    {time: '17:30 - 19:00', activity: 'Networking Event', location: 'Vrije Universiteit NU Building Ground Floor'},
    {time: '19:00', activity: 'Day Ends', location: ''}
  ];

  const saturdaySchedule = [
    {time: '9:00 - 9:30', activity: 'Arrival & Check-In', location: 'Vrije Universiteit NU Building Ground Floor'},
    {time: '9:30 - 10:00', activity: 'Breakfast', location: 'Vrije Universiteit NU Building Ground Floor'},
    {time: '10:00 - 10:15', activity: 'Introduction', location: 'NU-Theatre 1'},
    {time: '10:15 - 11:00', activity: 'Challenge Workshops', location: 'NU-2B01, NU-2B05, NU-2B12, NU-2B17, NU-2B25'},
    {time: '11:00 - 14:00', activity: 'Hacking', location: 'NU-2B01, NU-2B05, NU-2B12, NU-2B17, NU-2B25'},
    {time: '14:00 - 15:00', activity: 'Lunch', location: 'Vrije Universiteit NU Building Ground Floor'},
    {time: '15:00 - 19:00', activity: 'Hacking', location: 'NU-2B01, NU-2B05, NU-2B12, NU-2B17, NU-2B25'},
    {time: '19:00 - 20:00', activity: 'Dinner', location: 'Vrije Universiteit NU Building Ground Floor'},
    {time: '20:00 - 22:00', activity: 'Hacking', location: 'NU-2B01, NU-2B05, NU-2B12, NU-2B17, NU-2B25'}
  ];

  const sundaySchedule = [
    {time: '9:00 - 9:30', activity: 'Arrival & Check-In', location: 'Vrije Universiteit NU Building Ground Floor'},
    {time: '9:30 - 10:00', activity: 'Breakfast', location: 'Vrije Universiteit NU Building Ground Floor'},
    {time: '10:00 - 10:05', activity: 'Introduction', location: 'NU-Theatre 1'},
    {time: '10:05 - 14:00', activity: 'Hacking', location: 'NU-2B01, NU-2B05, NU-2B12, NU-2B17, NU-2B25'},
    {time: '14:00 - 15:00', activity: 'Lunch', location: 'Vrije Universiteit NU Building Ground Floor'},
    {time: '15:00 - 16:00', activity: 'Hacking (Last Hour)', location: 'NU-2B01, NU-2B05, NU-2B12, NU-2B17, NU-2B25'},
    {time: '16:00 - 18:00', activity: 'Judging/Presenting', location: 'NU-4A06, NU-4A25'},
    {time: '18:00 - 18:30', activity: 'Deliberation', location: 'NU-4A06, NU-4A25'},
    {time: '18:30 - 19:30', activity: 'Closing and Presentation of Awards', location: 'NU-Theatre 1'}
  ];

  // Tab handling
  let activeTab = 'friday';
  
  function setActiveTab(tab) {
    activeTab = tab;
  }
  
  // Helper function to check if an activity is workshop-related
  function isWorkshopActivity(activity) {
    return activity.toLowerCase().includes('workshop');
  }
  
  // Helper function to check if an activity is challenge workshop
  function isChallengeWorkshop(activity) {
    return activity.toLowerCase().includes('challenge workshop');
  }
  
  // Helper function to check if an activity is regular workshop
  function isRegularWorkshop(activity) {
    return activity.toLowerCase().includes('workshop') && !activity.toLowerCase().includes('challenge workshop');
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
  <meta name="twitter:card" content="summary" />
  <meta name="twitter:title" content={metadata.title} />
  <meta name="twitter:description" content={metadata.description} />
</svelte:head>

<!-- Header -->
<div class="page-header gradient-background">
  <div class="header-content">
    <h1>Event Schedule</h1>
    <p>Full schedule for Hack4Her 2025</p>
  </div>
</div>

<!-- Schedule Overview -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">June 13-15, 2025</h2>
    <p class="section-text">
      Hack4Her has revised its collaborations and location to ensure full alignment with our core values of inclusivity. This has resulted in a time and location change on Friday, June 13th.
      This schedule is subject to some slight changes due to the last-minute edits. We apologize for the inconvenience, and due to these sponsor changes, we do not have the funding to provide full meals on Friday. We are trying to remedy this.
      Saturday and Sunday remain the same.
    </p>
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
            <div class="day-header">
              <h3>Friday, June 13</h3>
              <p>Workshops & Networking</p>
            </div>
            {#each fridaySchedule as item}
              <div class="schedule-item">
                <div class="time-column">{item.time}</div>
                <div class="activity-column">
                  {#if isChallengeWorkshop(item.activity)}
                    <a href={routes.challenges} class="activity-link">
                      <div class="activity-title">{item.activity}</div>
                    </a>
                  {:else if isRegularWorkshop(item.activity)}
                    <a href={routes.workshops} class="activity-link">
                      <div class="activity-title">{item.activity}</div>
                    </a>
                  {:else}
                    <div class="activity-title">{item.activity}</div>
                  {/if}
                  {#if item.location}
                    <div class="activity-location">({item.location})</div>
                  {/if}
                </div>
              </div>
            {/each}
          </div>
        {:else if activeTab === 'saturday'}
          <div class="schedule-container">
            <div class="day-header">
              <h3>Saturday, June 14</h3>
              <p>Hackathon Day 1</p>
            </div>
            {#each saturdaySchedule as item}
              <div class="schedule-item">
                <div class="time-column">{item.time}</div>
                <div class="activity-column">
                  {#if isChallengeWorkshop(item.activity)}
                    <a href={routes.challenges} class="activity-link">
                      <div class="activity-title">{item.activity}</div>
                    </a>
                  {:else if isRegularWorkshop(item.activity)}
                    <a href={routes.workshops} class="activity-link">
                      <div class="activity-title">{item.activity}</div>
                    </a>
                  {:else}
                    <div class="activity-title">{item.activity}</div>
                  {/if}
                  {#if item.location}
                    <div class="activity-location">({item.location})</div>
                  {/if}
                </div>
              </div>
            {/each}
          </div>
        {:else if activeTab === 'sunday'}
          <div class="schedule-container">
            <div class="day-header">
              <h3>Sunday, June 15</h3>
              <p>Hackathon Day 2 & Awards</p>
            </div>
            {#each sundaySchedule as item}
              <div class="schedule-item">
                <div class="time-column">{item.time}</div>
                <div class="activity-column">
                  {#if isChallengeWorkshop(item.activity)}
                    <a href={routes.challenges} class="activity-link">
                      <div class="activity-title">{item.activity}</div>
                    </a>
                  {:else if isRegularWorkshop(item.activity)}
                    <a href={routes.workshops} class="activity-link">
                      <div class="activity-title">{item.activity}</div>
                    </a>
                  {:else}
                    <div class="activity-title">{item.activity}</div>
                  {/if}
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

<!-- Additional Info -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Important Notes</h2>
    <div class="info-grid">
      <div class="info-card">
        <h3>Friday - Workshops Only</h3>
        <p>Open to all genders. Focus on learning new skills through interactive workshops and networking with industry professionals.</p>
      </div>
      <div class="info-card">
        <h3>Saturday & Sunday - Hackathon</h3>
        <p>Open to women only for the hackathon competition. Teams will work on challenges and present their solutions.</p>
      </div>
      <div class="info-card">
        <h3>Location</h3>
        <p>All events take place at VU Amsterdam NU Building.</p>
      </div>
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
    font-size: 2.5rem;
  }
  
  .header-content p {
    font-size: 1.2rem;
    opacity: 0.9;
  }
  
  /* Section styles */
  .section {
    padding: var(--spacing-large) var(--spacing-medium);
  }
  
  .section-container {
    max-width: 1000px;
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
    font-size: 1.1rem;
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
    max-height: 600px;
    overflow-y: auto;
  }
  
  /* Day header */
  .day-header {
    text-align: center;
    margin-bottom: var(--spacing-medium);
    padding-bottom: var(--spacing-small);
    border-bottom: 2px solid rgba(255, 255, 255, 0.3);
  }
  
  .day-header h3 {
    color: white;
    font-size: 1.5rem;
    margin-bottom: 5px;
  }
  
  .day-header p {
    color: rgba(255, 255, 255, 0.8);
    font-size: 1rem;
    margin: 0;
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
    transition: background-color 0.2s;
  }
  
  .schedule-item:hover {
    background-color: rgba(255, 255, 255, 0.25);
  }
  
  .time-column {
    width: 120px;
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
    margin-bottom: 2px;
  }
  
  .activity-link {
    text-decoration: none;
    color: inherit;
    transition: all 0.2s;
  }
  
  .activity-link:hover {
    color: var(--color-primary);
    transform: translateX(2px);
  }
  
  .activity-link .activity-title {
    transition: color 0.2s;
  }
  
  .activity-link:hover .activity-title {
    color: var(--color-primary);
  }
  
  .activity-location {
    font-style: italic;
    color: rgba(255, 255, 255, 0.7);
    font-size: 14px;
  }
  
  /* Info grid */
  .info-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: var(--spacing-medium);
    margin-top: var(--spacing-large);
  }
  
  .info-card {
    background-color: rgba(0, 0, 0, 0.05);
    border-radius: var(--border-radius);
    padding: var(--spacing-large);
    text-align: left;
    border: 1px solid rgba(0, 0, 0, 0.1);
  }
  
  .info-card h3 {
    color: var(--color-primary);
    margin-bottom: var(--spacing-small);
    font-size: 1.2rem;
  }
  
  .info-card p {
    margin: 0;
    line-height: 1.5;
  }
  
  /* Dark mode adjustment */
  :global(body.dark-mode) .info-card {
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.1);
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
    .header-content h1 {
      font-size: 2rem;
    }
    
    .section-container {
      padding: 0 var(--spacing-small);
    }
    
    .tab-content {
      max-height: 500px;
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
    
    .info-grid {
      grid-template-columns: 1fr;
    }
  }
</style> 