<script lang="ts">
  import { routes } from '$lib/utils/routes';
  import { pageSeo } from '$lib/utils/seo';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.about;

  interface TeamMember {
    name: string;
    role: string;
    imagePath: string;
    linkedInUrl: string;
    bio?: string;
  }

  const mainTeamMembers: TeamMember[] = [
    {
      name: 'Katja Tuma',
      role: 'Scientific Lead',
      imagePath: '/images/face0.png',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Anca Strulea',
      role: 'Project Lead',
      imagePath: '/images/face1.jpg',
      linkedInUrl: 'https://linkedin.com'
    }
  ];

  const teamMembers: TeamMember[] = [
    {
      name: 'Isabella Venancia Gardner',
      role: 'Advisory Board Member',
      imagePath: '/images/face2.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Mylène Brown-Coleman',
      role: 'Advisory Board Member',
      imagePath: '/images/face3.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Lieve Jilesen',
      role: 'PR Team Lead',
      imagePath: '/images/face4.jpg',
      linkedInUrl: 'https://linkedin.com',
      bio: 'I am Lieve, a Master student of Artificial Intelligence at the VU. I have been part of Hack4Her since the very first edition, and ever since I have been helping out behind the scenes. I am known to have a "side-quest" addiction, as I love to get myself involved in as many things as possible! As PR Team Lead, my main tasks include reaching out for potential collaborations with various companies, organisations and academic speakers, as well as managing the volunteers in the PR Team. Additionally, I am involved with promotion of the event, such as giving promotional talks, poster-making, social media promotions, etc.'
    },
    {
      name: 'Lara Popović',
      role: 'Finance Team Lead',
      imagePath: '/images/face5.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Eduardo Emanuele',
      role: 'Challenge Creation Team Lead',
      imagePath: '/images/face6.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Arshana Ramautar',
      role: 'Registration Team Lead, Venue Team',
      imagePath: '/images/face7.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Carmen Toyas Sanchez',
      role: 'PR Team',
      imagePath: '/images/face8.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Eda Cetinkaya',
      role: 'Visual Designer, PR Team',
      imagePath: '/images/face9.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Joey Laarhoven',
      role: 'WebDev Team',
      imagePath: '/images/face10.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Josephine Dode',
      role: 'Challenge Team',
      imagePath: '/images/face0.png',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Laura Stampf',
      role: 'PR Team',
      imagePath: '/images/face1.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Nehir Kirkgoz',
      role: 'Social Media Manager, PR Team',
      imagePath: '/images/face2.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Ruveyda Günsili',
      role: 'PR Team, Finance Team',
      imagePath: '/images/face3.jpg',
      linkedInUrl: 'https://linkedin.com'
    },
    {
      name: 'Tuana Durmayuksel',
      role: 'Challenge Team',
      imagePath: '/images/face4.jpg',
      linkedInUrl: 'https://linkedin.com'
    }
  ];

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
    <p>Meet the amazing team behind Hack4Her</p>
  </div>
</div>

<!-- History Section (formerly Mission) -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Our History</h2>
    <p class="section-text">
      Hack4Her originated in October 2021, established by Isabella Venancia Gardner (Bella) and Mylène Brown-Coleman. They founded the first Diversity Committee within the BETA student association, STORM, at VU Amsterdam. This initiative was in response to encountering racist and sexist comments among classmates and identifying a lack of clear channels for reporting and seeking assistance.
    </p>
    <p class="section-text">
      Bella served as the Co-founder and Chair of the Diversity Committee, with Mylène as the Vice Chair, up until their graduation. Their efforts were directed towards fostering an environment of inclusivity and respect.
    </p>
    <p class="section-text">
      During Mylène's time as the AAPCie committee secretary, she observed a significant underrepresentation of women at the Amsterdam Algorithm Programming Preliminary (AAPP). This led to the concept of Hack4Her, aimed at creating a more inclusive and supportive environment for women in competitive programming.
    </p>
    <p class="section-text">
      Supported by BETA faculty member Katja Tuma, the first Hack4Her hackathon took place in June 2022 at VU Amsterdam. The event was women-only and attracted 35 attendees.
    </p>
    <p class="section-text">
      In 2023, the event was expanded to welcome all genders while maintaining a focus on women in tech. Held at the Booking.com office with Booking.com as the main sponsor, the participation increased to 75, with a total of 100 attendees. This iteration emphasized a broader learning and networking experience.
    </p>
    <p class="section-text">
      Hack4Her was founded to create a supportive and inclusive tech community. Its evolution reflects a commitment to these principles, with each event building upon the last to advance diversity in technology.
    </p>
  </div>
</section>

<!-- Team Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Meet Our Team</h2>
    <p class="section-text text-white">Click on any of the volunteer profiles to find out more!</p>
    
    <!-- Main Team Members -->
    <div class="team-grid">
      {#each mainTeamMembers as member}
        <div 
          class="team-card"
          tabindex="0" 
          role="button"
          aria-label="View {member.name}'s details"
          on:click={() => showMemberDetails(member)}
          on:keydown={(e) => e.key === 'Enter' && showMemberDetails(member)}
        >
          <div 
            class="profile-image"
            style="background-image: url({member.imagePath})"
          >
            {#if !member.imagePath}
              <span class="material-icons">person</span>
            {/if}
          </div>
          <h3>{member.name}</h3>
          <p>{member.role}</p>
          <div class="card-buttons">
            <a 
              href={member.linkedInUrl} 
              class="link-button"
              target="_blank" 
              rel="noopener noreferrer"
              on:click|stopPropagation
            >
              <span class="material-icons">link</span>
              LinkedIn
            </a>
            <button 
              class="info-button"
              on:click|stopPropagation
            >
              <span class="material-icons">info_outline</span>
              Details
            </button>
          </div>
        </div>
      {/each}
    </div>
    
    <!-- Team Members Divider -->
    <div class="divider">
      <div class="line"></div>
      <span>Team Members</span>
      <div class="line"></div>
    </div>
    
    <!-- Rest of Team -->
    <div class="compact-team-grid">
      {#each teamMembers as member}
        <div 
          class="compact-team-card"
          on:click={() => showMemberDetails(member)}
          on:keydown={(e) => e.key === 'Enter' && showMemberDetails(member)}
          tabindex="0"
          role="button"
          aria-label="View {member.name}'s details"
        >
          <div 
            class="compact-profile-image"
            style="background-image: url({member.imagePath})"
          >
            {#if !member.imagePath}
              <span class="material-icons">person</span>
            {/if}
          </div>
          <div class="compact-info">
            <div class="compact-text">
              <h4>{member.name}</h4>
              <p>{member.role}</p>
            </div>
            <div class="compact-buttons">
              <a 
                href={member.linkedInUrl} 
                class="small-button linkedin"
                target="_blank" 
                rel="noopener noreferrer"
                aria-label="LinkedIn profile"
                on:click|stopPropagation
              >
                <span class="material-icons">link</span>
              </a>
              <button 
                class="small-button info"
                aria-label="View details"
                on:click|stopPropagation
              >
                <span class="material-icons">info_outline</span>
              </button>
            </div>
          </div>
        </div>
      {/each}
    </div>
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

<!-- Member Details Modal -->
{#if selectedMember}
  <div class="modal-overlay" on:click={closeMemberDetails}>
    <div class="modal" on:click|stopPropagation>
      <button class="close-button" on:click={closeMemberDetails}>
        <span class="material-icons">close</span>
      </button>
      
      <div 
        class="modal-profile-image"
        style="background-image: url({selectedMember.imagePath})"
      >
        {#if !selectedMember.imagePath}
          <span class="material-icons">person</span>
        {/if}
      </div>
      
      <h2>{selectedMember.name}</h2>
      <h4>{selectedMember.role}</h4>
      
      <p class="modal-bio">
        {selectedMember.bio || 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.'}
      </p>
      
      <div class="modal-social">
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
    max-width: 800px;
    margin: 0 auto var(--spacing-medium);
    line-height: 1.6;
  }
  
  /* Team grid styles */
  .team-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 30px;
    margin-bottom: 40px;
  }
  
  .team-card {
    width: 220px;
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
    gap: 10px;
    justify-content: center;
    position: absolute;
    bottom: 5px;
    left: 0;
    right: 0;
    width: 100%;
  }
  
  .small-button {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.3);
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    cursor: pointer;
    flex-shrink: 0;
    transition: background-color 0.2s ease, transform 0.1s ease;
    min-width: 40px;
    min-height: 40px;
    padding: 0;
    box-sizing: border-box;
  }
  
  .small-button.linkedin {
    width: 40px;
    height: 40px;
    min-width: 40px;
    min-height: 40px;
    padding: 0;
  }
  
  .small-button .material-icons {
    font-size: 20px;
    line-height: 1;
  }
  
  .small-button:hover {
    background-color: rgba(255, 255, 255, 0.4);
    transform: translateY(-2px);
  }
  
  .small-button:active {
    transform: translateY(0);
  }
  
  /* Modal */
  .modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0, 0, 0, 0.7);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    padding: 20px;
  }
  
  .modal {
    position: relative;
    max-width: 500px;
    width: 100%;
    background-color: var(--color-surface);
    border-radius: 16px;
    padding: 24px;
    text-align: center;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
  }
  
  .close-button {
    position: absolute;
    top: 10px;
    right: 10px;
    background: none;
    border: none;
    color: var(--color-text);
    opacity: 0.7;
    cursor: pointer;
    padding: 5px;
  }
  
  .close-button:hover {
    opacity: 1;
  }
  
  .modal-profile-image {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    background-color: rgba(0, 0, 0, 0.1);
    margin: 0 auto 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-size: cover;
    background-position: center;
  }
  
  .modal-profile-image .material-icons {
    font-size: 60px;
    color: var(--color-primary);
  }
  
  .modal h2 {
    margin-bottom: 5px;
    color: var(--color-text);
  }
  
  .modal h4 {
    color: var(--color-primary);
    margin-bottom: 20px;
    font-weight: normal;
  }
  
  .modal-bio {
    line-height: 1.6;
    margin-bottom: 20px;
    color: var(--color-text);
  }
  
  .modal-social {
    display: flex;
    justify-content: center;
    gap: 10px;
  }
  
  .social-button {
    display: flex;
    align-items: center;
    padding: 8px 16px;
    background-color: var(--color-primary);
    border-radius: 20px;
    color: white;
    text-decoration: none;
  }
  
  .social-button:hover {
    filter: brightness(1.1);
  }
  
  .social-button .material-icons {
    margin-right: 8px;
  }
  
  /* Responsive styles */
  @media (max-width: 768px) {
    .team-grid {
      gap: 15px;
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
  }
</style> 