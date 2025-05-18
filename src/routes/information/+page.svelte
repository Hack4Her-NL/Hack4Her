<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';
  import { onMount } from 'svelte';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.information;

  // FAQ data
  const faqItems = [
    {
      question: 'I signed up via the form, is there anything else I need to do?',
      answer: 'Once you\'ve completed the registration form, there are a few next steps depending on your track (Hacking \& Workshops or Workshops only). You will receive an email detailing what you need to do.'
    },
    {
      question: 'I signed up via the form, and received an email that I am on the waitlist. What does that mean?',
      answer: 'Our sign-up procedure operates on a first-come first-served basis. If you have been waitlisted, that means there have been more sign-ups than we have spots. If another participant decides to drop out of the event, your position in the waitlist determines whether you may take their spot.'
    },
    {
      question: 'I signed up for one of the tracks, but now I would like to switch to the other one. How can I do that?',
      answer: 'Email us at info.hack4her@gmail.com stating which track you want to switch to. Please use the same email that you signed up with.'
    },
    {
      question: 'Do I need to know how to code to participate in the hackathon portion?',
      answer: 'Generally not. Most of our challenges can be solved even with limited technical knowledge, though implementing your ideas in code yields extra points. The rubric for each challenge will be posted prior to the hackathon start date, so keep an eye out!'
    },
    {
      question: 'How many women can be in a team?',
      answer: 'Teams consist of at most 4 women, though in special cases you are allowed to compete with fewer. Note that complete teams take precedence in the waitlist over incomplete teams!'
    },
    {
      question: 'I don\'t have a (complete) team. Can you help me find teammates?',
      answer: 'Yes! When you sign up, you can specify whether you would like for us to match you with other incomplete teams. If so, we will do our best to pair you with others such that you form a complete team. Once we notify you of who you\'ve been matched with, we suggest that you meet up at least once before the hackathon to get to know each other!'
    },
    {
      question: 'I identify as a man / I identify as non-binary. Can I still participate?',
      answer: 'Yes, though not as a Hacker. You can participate on Friday, where we\'ll be hosting a bunch of cool workshops and a networking event with several companies, at the Booking.com offices in Amsterdam Central!'
    }
  ];

  // Event highlights
  const eventHighlights = [
    'Open to all students in the Netherlands',
    'Coding, workshops, lectures -- plenty of opportunties to learn and expand your skillset',
    'While all genders are welcome, only women are eligible to compete in the hackathon',
    'Free food and drinks provided',
    'An awesome networking event at the Booking.com offices in Amsterdam!'
  ];

  // Code of conduct
  const codeOfConductSummary = [
    'Non-Discrimination: Participants must not discriminate against or harass others based on race, color, ethnicity, nationality, gender, sexual orientation, religion, disability, or any other protected characteristic. Treat all participants with respect and promote a welcoming environment.',
    'Inclusive Language: Use inclusive language that avoids stereotypes or derogatory terms. Be mindful of the impact your words can have on others and promote an inclusive and diverse atmosphere.',
    'Respectful Communication: Engage in respectful and constructive communication with fellow participants, mentors, organizers, and judges. Disagreements should be approached with courtesy and professionalism.',
    'Collaboration: Encourage teamwork, cooperation, and inclusivity within teams. Foster an environment where everyone\'s opinions and contributions are valued and respected.',
    'Intellectual Property: Respect the intellectual property rights of others. Do not use or incorporate copyrighted material or proprietary information without proper authorization or permission.',
    'Community Support: Foster a supportive community where participants feel comfortable seeking help, sharing knowledge, and collaborating. We encourage participants to support and uplift each other.',
    'Note: The organizers retain the right to expel anyone for going against one of the aforementioned rules and guidelines, as well as any ethical/legal/safety concerns not previously mentioned, at their discretion.'
  ];

  // Free Travel Policy
  const travelPolicy = [
    'Be eligible to participate in our hackathon.',
    'Be signed up to participate in our hackathon.',
    'Be present on Friday, Saturday, and Sunday.',
    'Be traveling from outside of Amsterdam to our event.',
    'Have a travel time to VU of an hour or more (via public transport route).',
    'Reconfirm need once within a timely manner (72 hours).'
  ];

  const travelNotes = [
    'Parking will only be covered in the VU Parking Garage.',
    'Carpooling is encouraged and may include gas compensation.',
    'Group train tickets increase your chances of receiving full compensation.',
    'While we aim to cover as much as possible, we cannot guarantee full compensation. We will inform you promptly before the event regarding the coverage of your costs.'
  ];

  // Schedule data
  const fridaySchedule = [
    {time: '11:30 - 12:00', activity: 'Arrival & Check-In', location: 'Booking.com Offices'},
    {time: '12:00 - 13:00', activity: 'Introduction + Keynote', location: ''},
    {time: '13:00 - 14:00', activity: 'Lunch', location: 'joined by booking.com grads and mentors!'},
    {time: '14:00 - 15:00', activity: 'A Word From Our Sponsors!', location: ''},
    {time: '15:00 - 16:30', activity: 'Workshops Round 1', location: ''},
    {time: '16:30 - 17:00', activity: 'Break and Light Snacks', location: ''},
    {time: '17:00 - 18:30', activity: 'Workshops Round 2', location: ''},
    {time: '18:30 - 21:00', activity: 'Dinner/Drinks and Networking', location: ''},
    {time: '21:00', activity: 'Day Ends', location: ''}
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
      Creating a space where technology and diversity meet. We are a coalition of staff and students from various universities across the Netherlands. Our mission is simple: to create a women-centered space in the tech world.
    </p>
    <h3 class="register-title">Register for the event</h3>
    <p class="section-text">Sign-ups are now open!</p>
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

<!-- Free Travel Policy Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Free Travel Policy</h2>
    <p class="section-text">
      In the past, we have refunded travel costs to Hackers coming from outside the Amsterdam area during the hackathon days. This would not be possible without the support of the universities that the Hackers (you!) come from. To get a better chance at receiving free transport, contact your university to ask whether they would be interested in sponsoring our event!
    </p>
    
    <div class="conduct-card">
      <h3>Eligibility Criteria:</h3>
      
      <ul class="conduct-list">
        {#each travelPolicy as item}
          <li class="bullet-point">
            <span class="bullet">•</span>
            <span>{item}</span>
          </li>
        {/each}
      </ul>
      
      <h3 class="travel-note-header">Note:</h3>
      <ul class="conduct-list">
        {#each travelNotes as note}
          <li class="bullet-point">
            <span class="bullet">•</span>
            <span>{note}</span>
          </li>
        {/each}
      </ul>
    </div>
  </div>

  <p class="section-text">
    We are committed to making the hackathon accessible and ensuring a positive experience for all participants. We look forward to your participation!
  </p>
</section>

<!-- Code of Conduct Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Code of Conduct</h2>
    <p class="section-text">
      All participants must adhere to our code of conduct throughout the event.
    </p>
    
    <div class="conduct-card">
      <ul class="conduct-list">
        {#each codeOfConductSummary as item}
          <li class="bullet-point">
            <span class="bullet">•</span>
            <span>{item}</span>
          </li>
        {/each}
      </ul>
    </div>
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
  
  .register-title {
    font-size: 1.5rem;
    margin-top: var(--spacing-medium);
    margin-bottom: var(--spacing-small);
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
  
  .travel-note-header {
    font-size: 18px;
    font-weight: bold;
    margin-top: var(--spacing-medium);
    margin-bottom: var(--spacing-small);
  }
  
  /* Dark mode adjustment for conduct card */
  :global(body.dark-mode) .conduct-card {
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.1);
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