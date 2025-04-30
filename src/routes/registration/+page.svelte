<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.registration;

  // Registration steps data
  const registrationSteps = [
    {
      number: '1',
      title: 'Complete the Registration Form',
      description: 'Fill out the basic information about yourself and your team.'
    },
    {
      number: '2',
      title: 'Submit Your Application',
      description: 'Review your information and submit your registration.'
    },
    {
      number: '3',
      title: 'Receive Confirmation',
      description: 'You\'ll receive a confirmation email with details about the next steps.'
    },
    {
      number: '4',
      title: 'Select Your Preferences',
      description: 'Prior to the hackathon, you will receive separate forms to choose which workshops and challenge you\'re interested in.'
    }
  ];

  // Eligibility requirements
  const requirements = [
    'Student ID or proof of student status',
    'Laptop and charger',
    'Enthusiasm and willingness to learn',
    'Optional: Team information if you are registering with a team'
  ];

  // Function to launch URL
  function launchURL(url: string) {
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
  {#if metadata.canonicalUrl}
    <link rel="canonical" href={metadata.canonicalUrl} />
  {/if}
</svelte:head>

<!-- Header -->
<div class="page-header gradient-background">
  <div class="header-content">
    <h1>Registration</h1>
    <p>Register for Hack4Her 2024</p>
  </div>
</div>

<!-- Registration Button Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Registration for Hack4Her 2025 opens soon!</h2>
    <p class="section-text">
      Join us June 13-15, 2025 at VU Amsterdam at our 4th annual event, for an exciting weekend of coding, workshops, and collaboration.
    </p>
    <!-- <button
      class="btn btn-primary register-btn"
      on:click={() => launchURL('https://hack4her.github.io/')}
    >
      Register Here
    </button> -->
  </div>
</section>

<!-- Registration Process Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Registration Process</h2>
    <p class="section-text text-white">
      The registration process is simple and straightforward. Here's what you need to know:
    </p>
    
    <div class="process-card">
      <h3>Registration Steps:</h3>
      
      <div class="steps-container">
        {#each registrationSteps as step}
          <div class="registration-step">
            <div class="step-number">{step.number}</div>
            <div class="step-content">
              <h4>{step.title}</h4>
              <p>{step.description}</p>
            </div>
          </div>
        {/each}
      </div>
    </div>
  </div>
</section>

<!-- Eligibility Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Eligibility</h2>
    <p class="section-text">
      Hack4Her is open to all students in the Netherlands. While all genders are welcome to participate in the event, only women are eligible to compete in the hackathon portion.
    </p>
    
    <div class="requirements-card">
      <h3>What You'll Need:</h3>
      
      <ul class="requirements-list">
        {#each requirements as requirement}
          <li class="bullet-point">
            <span class="bullet">•</span>
            <span>{requirement}</span>
          </li>
        {/each}
      </ul>
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
    cursor: pointer;
    border: none;
  }
  
  .btn-primary {
    background-color: var(--color-primary);
    color: white;
  }
  
  .btn:hover {
    transform: translateY(-2px);
    filter: brightness(1.1);
  }
  
  .register-btn {
    padding: 15px 40px;
    font-size: 20px;
    font-weight: bold;
  }
  
  /* Process Card */
  .process-card {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: var(--spacing-large);
    margin: 0 auto;
    text-align: left;
    color: white;
  }
  
  .process-card h3 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: var(--spacing-medium);
  }
  
  /* Registration Steps */
  .steps-container {
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
    margin: 0 0 5px 0;
  }
  
  .step-content p {
    font-size: 14px;
    margin: 0;
  }
  
  /* Requirements Card */
  .requirements-card {
    background-color: rgba(0, 0, 0, 0.05);
    border-radius: var(--border-radius);
    padding: var(--spacing-large);
    border: 1px solid rgba(0, 0, 0, 0.1);
    margin: 0 auto;
    text-align: left;
  }
  
  /* Dark mode adjustment for requirements card */
  :global(body.dark-mode) .requirements-card {
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.1);
  }
  
  .requirements-card h3 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: var(--spacing-medium);
  }
  
  .requirements-list {
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
  
  /* Responsive styles */
  @media (max-width: 768px) {
    .section-container {
      padding: 0 var(--spacing-small);
    }
    
    .process-card, .requirements-card {
      padding: var(--spacing-medium);
    }
  }
</style> 