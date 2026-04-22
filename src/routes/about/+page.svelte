<script lang="ts">
  import { routes } from '$lib/utils/routes';
  import { pageSeo } from '$lib/utils/seo';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.about;

  interface TeamMember {
    name: string;
    role: string;
    imageFile: string;
    linkedInUrl: string;
    bio?: string;
  }

  const mainTeamMembers: TeamMember[] = [

  ];

  const teamMembers: TeamMember[] = [

  ];

  const sponsors = {
    platinum: [
      { name: 'ServiceNow', logo: '/images/sponsors/Servicenow.jpg', url: 'https://www.servicenow.com/' },
      { name: 'Randstad Digital', logo: '/images/sponsors/randstad.png', url:'https://www.randstaddigital.nl/nl/'},
      { name: 'VU CS Department', logo: '/images/sponsors/VU.png', url: 'https://vu.nl/en/about-vu/faculties/faculty-of-science/departments/computer-science' }
    ],
    gold: [
      { name: 'DuckDB', logo: '/images/sponsors/duckdb.svg', url: 'https://duckdb.org/' },
      { name: 'Network Institute', logo: '/images/sponsors/Network_institute.png', url: 'https://networkinstitute.org/' },
      { name: 'Postcode Loterij', logo: '/images/sponsors/postcode_loterij.png', url: 'https://www.postcodeloterij.nl/' },
      { name: 'Tilburg university', logo: '/images/sponsors/tilburg.png', url: 'https://www.tilburguniversity.edu/' }
    ],
    partners: []
  };

  let selectedMember: TeamMember | null = null;

  function showMemberDetails(member: TeamMember) {
    selectedMember = member;
  }

  function closeMemberDetails() {
    selectedMember = null;
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
    <h1>About Us</h1>
    <p>Learn more about Hack4Her</p>
  </div>
</div>

<!-- History Section (formerly Mission) -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Our History</h2>
    <p class="section-text">
      The story began in October 2021, when Isabella Venancia Gardner (Bella) and Mylène Brown-Coleman founded the first Diversity Committee within the BETA student association, STORM, at VU Amsterdam. This initiative was in response to encountering racist and sexist comments among classmates and identifying a lack of clear channels for reporting and seeking assistance.
    </p>
    <p class="section-text">
      Bella served as the Co-founder and Chair of the Diversity Committee, with Mylène as the Vice Chair, up until their graduation. Their efforts were directed towards fostering an environment of inclusivity and respect.
    </p>
    <p class="section-text">
      During Mylène's time as the AAPPCie committee secretary, she observed a significant underrepresentation of women at the Amsterdam Algorithm Programming Preliminary (AAPP). This lead to the idea of organizing a female-focused hackathon, aimed at creating a more inclusive and supportive environment for women in competitive programming.
    </p>
    <p class="section-text">
      With Dr. Katja Tuma as scientific lead, the first Hack4Her took place in June 2022, at VU Amsterdam. The event was women-only and attracted 35 attendees.
    </p>
    <!-- <p class="section-text">
      In 2023, the event was expanded to welcome all genders while maintaining a focus on women in tech. Held at the Booking.com office with Booking.com as the main sponsor, the participation increased to 75, with a total of 100 attendees. This iteration emphasized a broader learning and networking experience.
    </p> -->
    <p class="section-text">
      Hack4Her was founded to create a supportive and inclusive tech community. Its evolution reflects a commitment to these principles, with each event building upon the last to advance diversity in technology.
    </p>
  </div>
</section>

<!-- Mission Section (formerly Vision) -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Our Mission</h2>
    <p class="section-text">
      Hack4Her is dedicated to fostering a women-centered space in the technology sector. Our mission revolves around providing women with increased opportunities for hackathon participation and project experience, educating all individuals on the importance of women-centered technology and inclusivity, promoting diversity within the tech community, and facilitating connections among people from various backgrounds.
    </p>
  </div>
</section>

<!-- Scientific Committee Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Scientific Committee</h2>
    <p class="section-text">
      Our scientific committee members serve as consultants for our challenges, assist in promotion, and help ensure impartial and fair conduct of our hackathon.
    </p>
    
    <div class="scientific-committee">
      <ul class="committee-list">
        <li>
          <a class="sc-link" href="https://mengyuanzhang.github.io/">Mengyuan (Maggie) Zhang</a>, Assist. Prof. at the Vrije Universiteit Amsterdam
        </li>
        <li>
          <a class="sc-link" href="https://www.uva.nl/en/profile/o/p/a.m.oprescu/a.m.oprescu.html">Ana Oprescu</a>, Assist. Prof. at the University of Amsterdam
        </li>
        <li>
          <a class="sc-link" href="http://annasperotto.org">Anna Sperotto</a>, Associate Prof. at the University of Twente
        </li>
        <li>
          <a class="sc-link" href="https://research.utwente.nl/en/persons/jan-willem-bullée">Jan-Willem Bullée</a>, Assist. Prof. at the University of Twente
        </li>
        <li>
          <a class="sc-link" href="https://research.tue.nl/en/persons/lavinia-paganini">Lavinia Paganini</a>, Doctoral candidate at Eindhoven University of Technology
        </li>
        <li>
          <a class="sc-link" href="https://www.universiteitleiden.nl/en/staffmembers/lu-cao%5B2%5D#tab-1">Lu Cao</a>, Assist. Prof. at Leiden University
        </li>
        <li>
          <a class="sc-link" href="https://mairieli.com">Mairieli Wessel</a>, Assist. Prof. at Radboud University
        </li>
        <li>
          <a class="sc-link" href="https://www.tilburguniversity.edu/staff/c-guven">Çiçek Güven</a>, Assist. Prof. at Tilburg University
        </li>
      </ul>
    </div>
  </div>
</section>

<!-- Partners Section - only show if there are partners -->
{#if sponsors.partners && sponsors.partners.length > 0}
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Our Partners</h2>
    <p class="section-text">
      We collaborate with these organizations to create a diverse and inclusive tech community.
    </p>
    
    <div class="partners-grid">
      {#each sponsors.partners as partner}
        <div class="sponsor-logo partner-logo">
          <img src={partner.logo} alt="{partner.name} logo" />
        </div>
      {/each}
    </div>
  </div>
</section>
{/if}

<!-- Member Details Modal -->
{#if selectedMember}
  <div class="modal-backdrop" on:click={closeMemberDetails}>
    <div class="modal-container" on:click|stopPropagation>
      <div class="modal-header">
        <h2 class="modal-title">{selectedMember.name}</h2>
        <button class="modal-close" on:click={closeMemberDetails} aria-label="Close modal">
          <span class="material-icons">close</span>
        </button>
      </div>
      <div class="modal-content">
        <div class="presenter-section">
          <div class="presenter-image" style="background-image: url('/images/h4h_team/{selectedMember.imageFile}')">
            {#if !selectedMember.imageFile}
              <span class="material-icons">person</span>
            {/if}
          </div>
          <div class="presenter-info">
            <h3 class="presenter-name">{selectedMember.name}</h3>
            <p class="presenter-company">{selectedMember.role}</p>
          </div>
        </div>
        <div class="workshop-details-modal">
          <div class="detail-section">
            <h4>About</h4>
            <p>{selectedMember.bio || 'Bio under construction ;)'}</p>
          </div>
          <div class="detail-section">
            <div class="workshop-meta">
              <div class="meta-item">
                <a 
                  href={selectedMember.linkedInUrl} 
                  class="social-button"
                  target="_blank" 
                  rel="noopener noreferrer"
                >
                  <span class="material-icons">link</span>
                  LinkedIn
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
{/if}

<style>
  /* Link styles */
  .sc-link {
    color: var(--color-primary);
    text-decoration: none;
    font-weight: 500;
  }
  
  .sc-link:hover {
    text-decoration: underline;
  }

  /* Scientific Committee styles */
  .scientific-committee {
    background-color: rgba(0, 0, 0, 0.05);
    border-radius: var(--border-radius);
    padding: var(--spacing-large);
    border: 1px solid rgba(0, 0, 0, 0.1);
    margin: 0 auto;
    text-align: left;
  }
  
  /* Dark mode adjustment for scientific committee */
  :global(body.dark-mode) .scientific-committee {
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.1);
  }
  
  .committee-list {
    list-style-type: none;
    padding: 0;
    margin: 0;
  }
  
  .committee-list li {
    padding: 10px 0;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  }
  
  .committee-list li:last-child {
    border-bottom: none;
  }
  
  :global(body.dark-mode) .committee-list li {
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  }
  
  :global(body.dark-mode) .committee-list li:last-child {
    border-bottom: none;
  }
  
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
    max-width: 800px;
    margin: 0 auto var(--spacing-medium);
    line-height: 1.6;
  }
  
  /* Project lead styling */
  .project-lead {
    display: flex;
    justify-content: center;
    margin-bottom: var(--spacing-large);
  }
  
  .project-lead-card {
    max-width: 350px;
  }
  
  /* Team grid and cards */
  .team-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: var(--spacing-large);
    margin-bottom: var(--spacing-large);
  }
  
  .team-card {
    width: 220px;
    margin: 0 var(--spacing-small);
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease, box-shadow 0.2s ease;
    position: relative;
    padding-bottom: 70px;
  }
  
  .team-card:hover {
    background-color: rgba(255, 255, 255, 0.3);
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
  }
  
  .team-card:active {
    transform: translateY(-1px);
  }
  
  .profile-image {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.3);
    margin-bottom: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-size: cover;
    background-position: center;
  }
  
  .profile-image .material-icons {
    font-size: 60px;
    color: white;
  }
  
  .team-card h3 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 8px;
    text-align: center;
  }
  
  .team-card p {
    font-size: 16px;
    margin-bottom: 16px;
    text-align: center;
  }
  
  .card-buttons {
    display: flex;
    gap: 10px;
    justify-content: center;
    width: 100%;
    position: absolute;
    bottom: 20px;
    left: 0;
  }
  
  .link-button, .info-button {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 6px 8px;
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 20px;
    color: white;
    font-size: 14px;
    text-decoration: none;
    border: none;
    cursor: pointer;
    width: 90px;
    min-height: 36px;
    flex-shrink: 0;
    transition: background-color 0.2s ease, transform 0.1s ease;
  }
  
  .link-button:hover, .info-button:hover {
    background-color: rgba(255, 255, 255, 0.4);
    transform: translateY(-2px);
  }
  
  .link-button:active, .info-button:active {
    transform: translateY(0);
  }
  
  .link-button .material-icons, .info-button .material-icons {
    font-size: 16px;
    margin-right: 4px;
  }
  
  /* Divider */
  .divider {
    display: flex;
    align-items: center;
    margin: 40px 0 30px;
    color: rgba(255, 255, 255, 0.7);
  }
  
  .divider .line {
    flex: 1;
    height: 1px;
    background-color: rgba(255, 255, 255, 0.3);
  }
  
  .divider span {
    padding: 0 16px;
    font-size: 18px;
    font-weight: 500;
  }
  
  /* Compact team grid */
  .compact-team-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 15px;
    max-width: 1000px;
    margin: 0 auto;
  }
  
  /* Compact team card */
  .compact-team-card {
    width: 280px;
    height: 100px;
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: var(--border-radius);
    display: flex;
    overflow: hidden;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease, box-shadow 0.2s ease;
    position: relative;
  }
  
  .compact-team-card:hover {
    background-color: rgba(255, 255, 255, 0.3);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  .compact-team-card:active {
    transform: translateY(0);
  }
  
  .compact-profile-image {
    width: 100px;
    height: 100px;
    background-color: rgba(255, 255, 255, 0.3);
    background-size: cover;
    background-position: center;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-shrink: 0;
  }
  
  .compact-profile-image .material-icons {
    font-size: 40px;
    color: white;
  }
  
  .compact-info {
    flex: 1;
    padding: 8px 6px 30px 6px;
    display: flex;
    flex-direction: column;
    align-items: center;
    overflow: hidden;
    position: relative;
  }
  
  .compact-text {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 8px;
  }
  
  .compact-info h4 {
    font-size: 15px;
    font-weight: bold;
    margin: 0;
    color: white;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    letter-spacing: -0.2px;
    text-align: center;
    max-width: 95%;
  }
  
  .compact-info p {
    font-size: 13px;
    margin: 4px 0;
    color: white;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    letter-spacing: -0.2px;
    text-align: center;
    max-width: 95%;
    opacity: 0.9;
  }
  
  .compact-buttons {
    display: flex;
    justify-content: center;
    position: absolute;
    bottom: 5px;
    left: 0;
    right: 0;
    width: 100%;
  }
  
  .compact-link-button {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 6px 12px;
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 20px;
    color: white;
    font-size: 14px;
    text-decoration: none;
    cursor: pointer;
    min-height: 36px;
    width: 110px;
    transition: background-color 0.2s ease, transform 0.1s ease;
  }
  
  .compact-link-button:hover {
    background-color: rgba(255, 255, 255, 0.4);
    transform: translateY(-2px);
  }
  
  .compact-link-button:active {
    transform: translateY(0);
  }
  
  .compact-link-button .material-icons {
    font-size: 16px;
    margin-right: 4px;
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
    background: var(--gradient-primary);
    border-radius: var(--border-radius-section);
    max-width: 90%;
    width: 600px;
    max-height: 90vh;
    overflow-y: auto;
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
    position: relative;
    color: var(--color-text);
  }
  
  .modal-header {
    padding: 20px 20px 10px;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  }
  
  .modal-title {
    margin: 0;
    font-size: 24px;
    font-weight: bold;
    padding-right: 30px;
    color: var(--color-text);
  }
  
  .modal-close {
    background: none;
    border: none;
    color: var(--color-text);
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
    color: var(--color-text);
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
    background-size: cover;
    background-position: center;
    border-radius: 50%;
    border: 2px solid rgba(255, 255, 255, 0.8);
  }
  
  .presenter-info {
    flex: 1;
  }
  
  .presenter-name {
    margin: 0 0 5px;
    font-size: 18px;
    font-weight: bold;
    color: var(--color-text);
  }
  
  .presenter-company {
    margin: 0;
    font-style: italic;
    opacity: 0.8;
    color:var(--color-text);
  }
  
  .workshop-details-modal {
    color: var(--color-text);
  }
  
  .detail-section {
    margin-bottom: 25px;
  }
  
  .detail-section h4 {
    margin: 0 0 10px;
    font-size: 16px;
    font-weight: bold;
    color: var(--color-text);
  }
  
  .detail-section p {
    margin: 0;
    line-height: 1.5;
    font-size: 15px;
    color: var(--color-text);
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
    color: var(--color-text);
  }
  
  .social-button {
    display: flex;
    align-items: center;
    padding: 8px 16px;
    background-color: var(--color-primary);
    border-radius: 20px;
    color: white;
    text-decoration: none;
    transition: filter 0.2s;
  }
  
  .social-button:hover {
    filter: brightness(1.1);
  }
  
  .social-button .material-icons {
    margin-right: 8px;
  }
  
  @media (max-width: 768px) {
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

  /* Sponsors Section Styles */
  .sponsors-grid, .partners-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: var(--spacing-large);
    margin-bottom: var(--spacing-large);
    max-width: 1000px;
    margin-left: auto;
    margin-right: auto;
  }
  
  .platinum-grid {
    margin-bottom: 2rem;
  }
  
  .sponsor-logo {
    background-color: white;
    border-radius: var(--border-radius);
    padding: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    position: relative;
  }
  
  .sponsor-logo img {
    max-width: 90%;
    max-height: 90%;
    object-fit: contain;
    display: block;
    margin: 0 auto;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  
  .platinum-logo {
    width: 250px;
    height: 150px;
  }
  
  .gold-logo {
    width: 200px;
    height: 120px;
  }
  
  .partner-logo {
    width: 200px;
    height: 120px;
  }
  
  .sponsor-logo, .partner-logo {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  /* Media Queries */
  @media (max-width: 768px) {
    .team-grid {
      grid-template-columns: 1fr;
      justify-items: center;
    }
    
    .team-card {
      width: 180px;
      padding-bottom: 65px;
    }
    
    .link-button, .info-button {
      width: 75px;
      font-size: 12px;
      min-height: 32px;
    }
    
    .small-button, .small-button.linkedin {
      width: 36px;
      height: 36px;
      min-width: 36px;
      min-height: 36px;
    }
    
    .small-button .material-icons {
      font-size: 18px;
    }
    
    .compact-team-grid {
      gap: 10px;
      padding: 0 5px;
    }
    
    .compact-team-card {
      width: 230px;
      height: 100px;
    }
    
    .compact-profile-image {
      width: 90px;
      height: 100px;
    }
    
    .compact-info {
      padding: 8px 6px 30px 6px;
    }
    
    .compact-info h4 {
      font-size: 13px;
    }
    
    .compact-info p {
      font-size: 11px;
    }
    
    .platinum-logo {
      width: 220px;
      height: 130px;
    }
    
    .gold-logo {
      width: 170px;
      height: 100px;
    }
    
    .partner-logo {
      width: 170px;
      height: 100px;
    }
    
    .compact-link-button {
      width: 100px;
      font-size: 13px;
    }
  }
  
  @media (max-width: 480px) {
    .team-card {
      padding-bottom: 60px;
    }
    
    .card-buttons {
      bottom: 15px;
      gap: 8px;
    }
    
    .link-button, .info-button {
      width: 70px;
      padding: 6px 4px;
    }
    
    .small-button, .small-button.linkedin {
      width: 32px;
      height: 32px;
      min-width: 32px;
      min-height: 32px;
    }
    
    .small-button .material-icons {
      font-size: 16px;
    }
    
    .compact-team-card {
      width: 100%;
      max-width: 340px;
      height: 90px;
    }
    
    .compact-profile-image {
      width: 80px;
      height: 90px;
    }
    
    .compact-info {
      padding: 6px 4px 28px 4px;
    }
    
    .compact-text {
      margin-bottom: 4px;
    }
    
    .compact-info h4 {
      font-size: 13px;
      max-width: 100%;
    }
    
    .compact-info p {
      font-size: 11px;
      max-width: 100%;
    }
    
    .compact-buttons {
      bottom: 2px;
      gap: 8px;
    }
    
    .sponsors-grid, .partners-grid {
      gap: 15px;
    }
    
    .platinum-logo {
      width: 180px;
      height: 110px;
      padding: 15px;
    }
    
    .gold-logo, .partner-logo {
      width: 140px;
      height: 90px;
      padding: 10px;
    }
    
    .compact-link-button {
      width: 90px;
      font-size: 12px;
      padding: 5px 8px;
    }
  }
</style> 
