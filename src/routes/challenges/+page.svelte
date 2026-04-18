<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.challenges;

  // Challenge data
  const challenges = [
    {
      title: 'ServiceNow: Ethical AI Agents for Public Services',
      description: 'How do we build AI systems that support—not replace—humans, especially in sensitive public service workflows? In this challenge, you\'ll step into the role of data scientists at a fictional Dutch municipality and design AI agents that help process childcare subsidy applications.',
      sponsor: 'ServiceNow',
      prize: 'TBD',
      tags: ['Responsible AI', 'Gender equity', 'Human-in-the-loop systems'],
      extraInfo: 'Your task is to develop agent workflows using ServiceNow\'s TapeAgents framework. These agents will classify cases, automate decisions, and escalate when human oversight is needed. You\'ll decide where automation helps and where compassion and care matter most.',
      requirements: [
        'Agent design and workflow architecture',
        'Python programming',
        'Ethical AI thinking and implementation',
        'Human-in-the-loop system design'
      ]
    },
    {
      title: 'Randstad Digital: Decoding Gender Bias in Hiring',
      description: 'Language matters. In IT and Finance, the way job ads are written can unintentionally discourage women from applying. This challenge asks teams to rethink how vacancies are structured, using AI tools to analyze and redesign job postings for greater inclusivity.',
      sponsor: 'Randstad Digital',
      prize: 'TBD',
      tags: ['Inclusive hiring', 'Gender equity', 'AI for social impact'],
      extraInfo: 'Working with real and synthetic vacancy data, as well as gender distribution metrics, participants will explore how language shapes opportunity and design tools or prototypes that promote fairer hiring practices.',
      requirements: [
        'Natural Language Processing (NLP)',
        'Large Language Models (LLMs)',
        'Data analysis',
        'Prompt design and UX thinking'
      ]
    },
    {
      title: 'Equileap: Gender Equality Data Hub',
      description: 'Equileap is the leading provider of data on gender equality in the corporate world. For this challenge, participants will reimagine how that data is presented—transforming it from static reports into a compelling, interactive experience.',
      sponsor: 'Equileap',
      prize: 'TBD',
      tags: ['Data visualization', 'Gender equity in business', 'Ethical tech'],
      extraInfo: 'The focus: making global gender equality trends accessible and engaging for everyone, without giving away the raw data that powers Equileap\'s business. Transform static reports into compelling, interactive experiences.',
      requirements: [
        'Creative thinking and innovation',
        'UI/UX design',
        'Frontend/backend development',
        'Data handling and visualization'
      ]
    }
  ];

  // Judging criteria
  const judgingCriteria = [
    {
      title: 'Innovation',
      description: 'Originality and creativity of the solution',
      percentage: '25%'
    },
    {
      title: 'Impact',
      description: 'Potential to create meaningful change',
      percentage: '25%'
    },
    {
      title: 'Technical Implementation',
      description: 'Quality and complexity of technical work',
      percentage: '20%'
    },
    {
      title: 'Design',
      description: 'User experience and interface design',
      percentage: '15%'
    },
    {
      title: 'Presentation',
      description: 'Quality of demo and pitch',
      percentage: '15%'
    }
  ];

  // Expanded challenges state
  let expandedChallenges = new Set();

  function toggleChallenge(index) {
    if (expandedChallenges.has(index)) {
      expandedChallenges.delete(index);
    } else {
      expandedChallenges.add(index);
    }
    expandedChallenges = expandedChallenges; // Trigger reactivity
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
    <h1>Challenges</h1>
    <p>Explore the exciting challenges for this year's hackathon</p>
  </div>
</div>

<!--
<section class="section">
  <div class="section-container">
    <div class="previous-website-info">
      <p>
        Challenges are now live! Choose one of the exciting challenges below.<br>
        Check our <a href={routes.information} class="website-link">schedule</a> on the information page, or <a href={routes.about} class="website-link">learn more</a> about our event here.
      </p>
    </div>
  </div>
</section>
-->
<!--
<section class="section">
  <div class="section-container">
    <p class="section-text">
      Our challenges are designed to inspire innovation and creativity. Choose one or create your own project that aligns with our theme.
    </p>
    <a href={routes.registration} class="btn btn-primary">Register Now</a>
  </div>
</section>
-->


<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Challenges</h2>
    
    <div class="challenges-list">
      {#each challenges as challenge, index}
        <div 
          class="challenge-card" 
          on:click={() => toggleChallenge(index)}
          on:keydown={(e) => e.key === 'Enter' && toggleChallenge(index)}
          tabindex="0"
          role="button"
          aria-expanded={expandedChallenges.has(index)}
        >
          <div class="challenge-header">
            <h3 class="challenge-title">{challenge.title}</h3>
            <div class="challenge-header-right">
              <span class="prize-tag">Prize: {challenge.prize}</span>
              <span class="material-icons expand-icon">
                {expandedChallenges.has(index) ? 'expand_less' : 'expand_more'}
              </span>
            </div>
          </div>
          
          <div class="challenge-sponsor">
            <span class="material-icons sponsor-icon">business</span>
            <span>Sponsored by {challenge.sponsor}</span>
          </div>
          
          <div class="challenge-tags">
            {#each challenge.tags as tag}
              <span class="tag">{tag}</span>
            {/each}
          </div>
          
          {#if expandedChallenges.has(index)}
            <div class="challenge-details">
              <p class="challenge-description">{challenge.description}</p>
              <p class="details-text">{challenge.extraInfo}</p>
              
              <div class="requirements">
                <h4>Skills involved:</h4>
                <ul>
                  {#each challenge.requirements as requirement}
                    <li>{requirement}</li>
                  {/each}
                </ul>
              </div>
            </div>
          {/if}
        </div>
      {/each}
    </div>
  </div>
</section>
<!--
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Judging Criteria</h2>
    
    <div class="criteria-container">
      {#each judgingCriteria as criteria}
        <div class="criteria-card">
          <h3 class="criteria-title">{criteria.title}</h3>
          <div class="criteria-percentage">{criteria.percentage}</div>
          <p class="criteria-description">{criteria.description}</p>
        </div>
      {/each}
    </div>
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
  
  /* Challenges List */
  .challenges-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  .challenge-card {
    background-color: var(--color-surface);
    color: var(--color-text);
    border-radius: var(--border-radius);
    padding: 20px;
    box-shadow: var(--shadow-card);
    cursor: pointer;
    text-align: left;
  }
  
  .challenge-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 10px;
  }
  
  .challenge-title {
    font-size: 20px;
    font-weight: bold;
    margin: 0;
    color: var(--color-text);
  }
  
  .challenge-header-right {
    display: flex;
    align-items: center;
    gap: 5px;
  }
  
  .prize-tag {
    background-color: var(--color-primary);
    color: white;
    font-weight: bold;
    font-size: 14px;
    padding: 6px 12px;
    border-radius: 20px;
  }
  
  .expand-icon {
    color: var(--color-text);
    font-size: 24px;
  }
  
  .challenge-description {
    font-size: 16px;
    color: var(--color-text);
    opacity: 0.8;
    margin-bottom: 15px;
    line-height: 1.5;
  }
  
  .challenge-sponsor {
    display: flex;
    align-items: center;
    gap: 5px;
    margin-bottom: 15px;
    color: var(--color-text);
    opacity: 0.8;
    font-size: 14px;
    font-weight: bold;
  }
  
  .sponsor-icon {
    font-size: 16px;
  }
  
  .challenge-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 15px;
  }
  
  .tag {
    background-color: rgba(var(--color-primary-rgb), 0.1);
    color: var(--color-primary);
    font-size: 12px;
    font-weight: bold;
    padding: 5px 10px;
    border-radius: 15px;
  }
  
  /* Challenge expanded details */
  .challenge-details {
    margin-top: 20px;
  }
  
  .divider {
    border: none;
    height: 1px;
    background-color: var(--color-text);
    opacity: 0.1;
    margin: 15px 0;
  }
  
  .challenge-details h4 {
    font-size: 18px;
    font-weight: bold;
    margin: 15px 0 10px;
    color: var(--color-text);
  }
  
  .challenge-details p {
    font-size: 15px;
    color: var(--color-text);
    opacity: 0.8;
    line-height: 1.6;
    margin-bottom: 15px;
  }
  
  .requirements-list {
    list-style-type: none;
    padding: 0;
    margin: 0 0 20px 0;
  }
  
  .requirement-item {
    display: flex;
    align-items: flex-start;
    gap: 8px;
    margin-bottom: 8px;
    color: var(--color-text);
    opacity: 0.8;
    font-size: 14px;
  }
  
  .check-icon {
    color: var(--color-primary);
    font-size: 16px;
    flex-shrink: 0;
  }
  
  .apply-button {
    background-color: var(--color-primary);
    color: white;
    border: none;
    border-radius: 25px;
    padding: 12px 20px;
    font-weight: bold;
    cursor: pointer;
    font-size: 16px;
    display: block;
    margin: 0 auto;
    transition: all 0.2s;
  }
  
  .apply-button:hover {
    transform: translateY(-2px);
    filter: brightness(1.1);
  }
  
  /* Judging Criteria */
  .criteria-card {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    padding: 20px;
    text-align: left;
    color: white;
  }
  
  .criterion-item {
    display: flex;
    align-items: flex-start;
    gap: 15px;
    margin-bottom: 15px;
  }
  
  .percentage-circle {
    width: 60px;
    height: 60px;
    background-color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }
  
  .percentage-circle span {
    color: var(--color-primary);
    font-weight: bold;
    font-size: 18px;
  }
  
  .criterion-content {
    flex: 1;
  }
  
  .criterion-content h3 {
    font-size: 18px;
    font-weight: bold;
    margin: 0 0 5px 0;
  }
  
  .criterion-content p {
    font-size: 14px;
    margin: 0;
  }
  
  /* Responsive styles */
  @media (max-width: 768px) {
    .challenge-header {
      flex-direction: column;
      gap: 10px;
    }
    
    .challenge-header-right {
      align-self: flex-end;
    }
    
    .criterion-item {
      flex-direction: column;
      align-items: center;
      text-align: center;
      gap: 10px;
    }
    
    .percentage-circle {
      margin-bottom: 5px;
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