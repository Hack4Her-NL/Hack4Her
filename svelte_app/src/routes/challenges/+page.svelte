<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.challenges;

  // Challenge data
  const challenges = [
    {
      title: 'AI for Good',
      description: 'Develop an AI-powered solution that addresses a social issue affecting women or underrepresented groups.',
      sponsor: 'TechCorp',
      prize: '$2,000',
      tags: ['AI/ML', 'Social Impact'],
      extraInfo: 'This challenge focuses on creating AI solutions that address social issues affecting women or underrepresented groups. Participants are encouraged to consider ethical implications of AI and develop responsible AI systems that promote inclusivity and fairness.',
      requirements: [
        'Must use machine learning or AI components',
        'Should address a clear social issue affecting women',
        'Must include documentation on ethical considerations',
        'Should be accessible to diverse user groups'
      ]
    },
    {
      title: 'Health & Wellness',
      description: 'Create an application that promotes women\'s health and wellness through technology.',
      sponsor: 'HealthTech',
      prize: '$1,500',
      tags: ['Healthcare', 'Mobile'],
      extraInfo: 'Create innovative solutions that address women\'s health concerns, improve wellness monitoring, or provide accessible health information. Consider issues like maternal health, mental wellness, or fitness tracking specifically designed for women\'s needs.',
      requirements: [
        'Must focus on specific health needs of women',
        'Should have an intuitive user interface',
        'Must protect sensitive health information',
        'Should be evidence-based where possible'
      ]
    },
    {
      title: 'Educational Technology',
      description: 'Build a tool that enhances STEM education for young women and girls.',
      sponsor: 'EduSolutions',
      prize: '$1,500',
      tags: ['Education', 'Web App'],
      extraInfo: 'This challenge seeks innovative approaches to make STEM education more engaging and accessible to young women and girls. Solutions might include interactive learning platforms, gamified educational experiences, or tools that connect students with female role models in STEM.',
      requirements: [
        'Must target K-12 or university-level education',
        'Should incorporate STEM educational principles',
        'Must be engaging and interactive',
        'Should track learning outcomes'
      ]
    },
    {
      title: 'Sustainable Future',
      description: 'Design a solution that addresses environmental challenges while promoting diversity in green tech.',
      sponsor: 'GreenFuture',
      prize: '$1,000',
      tags: ['Sustainability', 'IoT'],
      extraInfo: 'Develop technology solutions that address environmental challenges while promoting diversity in green tech. Consider issues like climate change, renewable energy, sustainable consumption, or conservation efforts.',
      requirements: [
        'Must address a specific environmental challenge',
        'Should incorporate data collection or analysis',
        'Must have a clear sustainability impact',
        'Should promote inclusion in environmental tech'
      ]
    },
    {
      title: 'Women in Tech Empowerment',
      description: 'Create an innovative solution that addresses challenges faced by women in technology or empowers women through technology.',
      sponsor: 'Hack4Her',
      prize: '$3,000',
      tags: ['Grand Prize', 'All Teams'],
      extraInfo: 'This is our grand prize challenge! Create solutions that directly address barriers faced by women in technology or use technology to empower women globally. Examples might include mentorship platforms, bias detection tools, or career advancement resources.',
      requirements: [
        'Must directly address challenges women face in tech',
        'Should be scalable to reach many women',
        'Must demonstrate measurable impact',
        'Should incorporate feedback from target users'
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

<!-- Overview Section -->
<section class="section">
  <div class="section-container">
    <p class="section-text">
      Our challenges are designed to inspire innovation and creativity. Choose one or create your own project that aligns with our theme.
    </p>
    <a href={routes.registration} class="btn btn-primary">Register Now</a>
  </div>
</section>

<!-- Challenges Section -->
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
              <span class="prize-tag">{challenge.prize}</span>
              <span class="material-icons expand-icon">
                {expandedChallenges.has(index) ? 'expand_less' : 'expand_more'}
              </span>
            </div>
          </div>
          
          <p class="challenge-description">{challenge.description}</p>
          
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
              <hr class="divider" />
              
              <h4>Challenge Details</h4>
              <p>{challenge.extraInfo}</p>
              
              <h4>Requirements</h4>
              <ul class="requirements-list">
                {#each challenge.requirements as requirement}
                  <li class="requirement-item">
                    <span class="material-icons check-icon">check_circle</span>
                    <span>{requirement}</span>
                  </li>
                {/each}
              </ul>
              
              <button class="apply-button">
                Apply to this Challenge
              </button>
            </div>
          {/if}
        </div>
      {/each}
    </div>
  </div>
</section>

<!-- Judging Criteria Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Judging Criteria</h2>
    
    <div class="criteria-card">
      {#each judgingCriteria as criterion}
        <div class="criterion-item">
          <div class="percentage-circle">
            <span>{criterion.percentage}</span>
          </div>
          <div class="criterion-content">
            <h3>{criterion.title}</h3>
            <p>{criterion.description}</p>
          </div>
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
  
  /* Challenges List */
  .challenges-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  .challenge-card {
    background-color: white;
    border-radius: var(--border-radius);
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
    color: var(--color-text-light);
    font-size: 24px;
  }
  
  .challenge-description {
    font-size: 16px;
    color: var(--color-text-light);
    margin-bottom: 15px;
    line-height: 1.5;
  }
  
  .challenge-sponsor {
    display: flex;
    align-items: center;
    gap: 5px;
    margin-bottom: 15px;
    color: var(--color-text-light);
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
    background-color: rgba(0, 0, 0, 0.1);
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
    color: var(--color-text-light);
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
    color: var(--color-text-light);
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
</style> 