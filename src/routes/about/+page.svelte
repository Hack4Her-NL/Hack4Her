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
    {
      name: 'Anca Strulea',
      role: 'Project Lead',
      imageFile: 'anca_strulea.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/anca-strulea',
      bio: 'I\'m Anca, a MSc student in Computer Security at the VU. I was a participant in all previous editions of Hack4Her (even won a couple of times ;]), and my goal is now to give back to the community by organizing Hack4Her.'
    },
    {
      name: 'Lieve Jilesen',
      role: 'PR Team Lead',
      imageFile: 'lieve_jilesen.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/lieve-jilesen/',
      bio: 'I am Lieve, a Master student of Artificial Intelligence at the VU. I have been part of Hack4Her since the very first edition, and ever since I have been helping out behind the scenes. I am known to have a "side-quest" addiction, as I love to get myself involved in as many things as possible! As PR Team Lead, my main tasks include reaching out for potential collaborations with various companies, organisations and academic speakers, as well as managing the volunteers in the PR Team. Additionally, I am involved with promotion of the event, such as giving promotional talks, poster-making, social media promotions, etc.'
    },
    {
      name: 'Lara Popović',
      role: 'Finance Team Lead',
      imageFile: 'lara_popovic.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/lara-popovic-478806299/',
      bio: ''
    },
    {
      name: 'Eduardo Emanuele',
      role: 'Challenge Creation Team Lead',
      imageFile: 'eduardo_emanuele.png',
      linkedInUrl: 'https://www.linkedin.com/in/caedemor/',
      bio: ''
    },
    {
      name: 'Katja Tuma',
      role: 'Scientific Lead',
      imageFile: 'katja_tuma.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/katjatuma/',
      bio: 'Dr. Katja Tuma is an Assistant Professor at TU Eindhoven, specializing in cybersecurity. Her work focuses on the intersection of security and system design, particularly in the context of cyber-physical systems. Dr. Tuma\'s research aims to enhance the understanding of security risks and develop strategies for resilient system design. She actively contributes to academic discourse through publications and serves on various conference committees, reflecting her commitment to advancing cybersecurity knowledge and practice.'
    }
  ];

  const teamMembers: TeamMember[] = [
    {
      name: 'Isabella Venancia Gardner',
      role: 'Advisory Board Member',
      imageFile: 'isabella_gardner.jpg',
      linkedInUrl: 'https://www.linkedin.com/in/ivgardner/',
      bio: 'Isabella Venancia Gardner (Bella) is currently doing her Master\'s in Artificial Intelligence at the Universiteit van Amsterdam. She graduated Cum Laude from Vrije Universiteit Amsterdam with a Bachelor\'s in Artificial Intelligence, complemented by a minor in Technology Law and Ethics and completion of the Honour\'s Programme. Isabella co-founded and led the first Diversity Committee within the BETA student association, STORM, at Vrije Universiteit Amsterdam, focusing on reducing discrimination and increasing diversity in CS and AI university programs. Her leadership extended to organizing Hack4Her, the inaugural women-focused hackathon at VU Amsterdam, and expanding the event in collaboration with Booking.com, fostering a community dedicated to inclusivity and innovation in technology. Her commitment to advancing diversity in tech and AI has led to notable recognitions, including being a recipient of the Studienstiftung des Deutschen Volkes scholarship, awarded for remarkable academic and social qualities, and the Qualcomm Diversity AI Fellowship 2023 from the ELLIS Foundation, supporting her Master\'s studies. Beyond her academic and volunteer achievements, Bella is actively involved in teaching and mentoring roles within Vrije Universiteit Amsterdam. She is/has been a course organizer and teaching assistant for a variety of courses including but not limited to Machine Learning, Databases, and Project Conversational Agents.'
    },
    {
      name: 'Mylène Brown-Coleman',
      role: 'Advisory Board Member',
      imageFile: 'mylene_brown-coleman.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/myl%C3%A8ne/',
      bio: 'Mylène Brown-Coleman is currently excelling as an AI Consultant at ServiceNow, where she crafts AI solutions to enhance business processes and operational efficiency for clients. Having recently graduated with a degree in Artificial Intelligence from Vrije Universiteit Amsterdam, her education was distinguished by her role as an Artificial Intelligence Research Intern at Gemeente Amsterdam. Here, she developed an end-to-end pipeline for Google review analysis for her thesis project. This project was part of the Amsterdam for All initiative aimed at improving accessibility for individuals with disabilities, demonstrating Mylène\'s ability to translate academic insights into solutions for societal challenges. Her passion for education shines through her work as an Academic and General Teaching Assistant at Vrije Universiteit Amsterdam, where she has served as a teaching assistant for courses including Data Structures & Algorithms, Computational Thinking, and Project Intelligent Systems. Her leadership qualities and commitment to social impact are evident in her founding of a diversity committee and Hack4Her, the first recurring women-centered hackathon in the Netherlands in the last five years, emphasizing her dedication to inclusivity in technology. These initiatives have significantly increased female participation in programming competitions, underlining her role as a catalyst for change within the community. Her achievements include the Generation Google Scholar, Nutanix Women Heart Technology Scholarship, AnitaB.org GHC Scholar, and notably, the Faculty of Science Student Talent Award in January 2024, which recognises her remarkable contributions to her field and community. Mylène Brown-Coleman\'s story is a vivid illustration of her transition from an ambitious AI student to a consultant and advocates for diversity and inclusivity in technology, reflecting not only her profound passion for AI but also her committed effort to utilize technology for the betterment of society.'
    },
    {
      name: 'Arshana Ramautar',
      role: 'Registration Team Lead, Venue Team',
      imageFile: 'arshana_ramautar.jpg',
      linkedInUrl: 'https://www.linkedin.com/in/arshana-ramautar-5638891ba/',
      bio: ''
    },
    {
      name: 'Carmen Toyas Sanchez',
      role: 'PR Team',
      imageFile: 'carmen_sanchez.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/carments/',
      bio: ''
    },
    {
      name: 'Eda Cetinkaya',
      role: 'Visual Designer, PR Team',
      imageFile: 'eda_cetinkaya.jpg',
      linkedInUrl: 'https://www.linkedin.com/in/eda-cetinkaya-52b26533b/',
      bio: 'Hi, I\'m Eda Cetinkaya, a Computer Science student at VU Amsterdam with a passion for building tech that empowers people, especially in health. I\'m particularly interested in medical AI and I love using creative problem solving to solve real challenges. At Hack4Her, I am excited to collaborate on meaningful, inclusive solutions that make a difference. Outside of tech, I love cooking, exploring the city, and noticing the beauty in everyday moments. I\'m always curious, open to learning, and excited to grow both personally and professionally. Feel free to connect with me!'
    },
    {
      name: 'Joey Laarhoven',
      role: 'WebDev Team',
      imageFile: 'joey_laarhoven.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/joey-laarhoven-084473304/',
      bio: 'Joey Laarhoven is currently pursuing a Master’s degree in Artificial Intelligence at the University of Amsterdam (UvA). He previously completed a Bachelor’s in Computer Science at the Vrije Universiteit Amsterdam (VU), graduating summa cum laude. Alongside his studies, Joey works at Caddy, where he focuses on writing performant and reliable code. He is also a recipient of the ASML scholarship, which supports students with strong academic backgrounds and a passion for technology. Outside of work and academics, Joey contributes to the Hack4Her initiative by managing the event’s website and helping coordinate with sponsors and workshop speakers. He enjoys being part of teams that bring ideas to life and is always looking for ways to grow and make a positive impact through tech.'
    },
    {
      name: 'Josephine Dode',
      role: 'Challenge Team',
      imageFile: 'josephine_dode.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/josephine-dodde/',
      bio: ''
    },
    {
      name: 'Laura Stampf',
      role: 'Workshop Lead, PR Team',
      imageFile: 'laura_stampf.jpg',
      linkedInUrl: 'https://www.linkedin.com/in/laura-stampf/',
      bio: ''
    },
    {
      name: 'Nehir Kirkgoz',
      role: 'Social Media Manager, PR Team',
      imageFile: 'nehir_kirkgoz.jpg',
      linkedInUrl: 'https://www.linkedin.com/in/nehir-kirkgoz-811529257/',
      bio: 'Hi, I am Nehir Kirkgoz! As a Computer Science bachelor\'s student at Vrije Universiteit Amsterdam, I am deeply fascinated by the convergence of technology and its societal impact. My passion lies in promoting ethical innovations and creating inclusive spaces where underprivileged communities and individuals can explore their interests in STEM. Through my role at Hack4Her as the Social Media Marketing Director and PR team volunteer, I actively contribute to fostering diversity and accessibility in tech.'
    },
    {
      name: 'Ruveyda Günsili',
      role: 'PR Team, Finance Team',
      imageFile: 'ruveyda_gunsili.jpg',
      linkedInUrl: 'https://www.linkedin.com/in/ruveyda-gunsili-2586452b1/',
      bio: ''
    },
    {
      name: 'Tuana Durmayuksel',
      role: 'Challenge Team',
      imageFile: 'tuana_durmayuksel.jpeg',
      linkedInUrl: 'https://www.linkedin.com/in/tuana-durmay%C3%BCksel-b64741176/',
      bio: ''
    }
  ];

  const sponsors = {
    platinum: [
      { name: 'ServiceNow', logo: '/images/sponsors/Servicenow.jpg', url: 'https://www.servicenow.com/' },
      { name: 'Randstad Digital', logo: '/images/sponsors/randstad.png', url:'https://www.randstaddigital.nl/nl/'},
      { name: 'Booking.com', logo: '/images/sponsors/Booking.com.png', url: 'https://www.booking.com/' },
      { name: 'VU CS Department', logo: '/images/sponsors/VU.png', url: 'https://vu.nl/en/about-vu/faculties/faculty-of-science/departments/computer-science' }
    ],
    gold: [
      { name: 'DuckDB', logo: '/images/sponsors/duckdb.svg', url: 'https://duckdb.org/' },
      { name: 'Network Institute', logo: '/images/sponsors/Network_institute.png', url: 'https://networkinstitute.org/' },
      { name: 'Postcode Loterij', logo: '/images/sponsors/postcode_loterij.png', url: 'https://www.postcodeloterij.nl/' }
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
    <p>Meet the amazing team behind Hack4Her</p>
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
    <p class="section-text">
      In 2023, the event was expanded to welcome all genders while maintaining a focus on women in tech. Held at the Booking.com office with Booking.com as the main sponsor, the participation increased to 75, with a total of 100 attendees. This iteration emphasized a broader learning and networking experience.
    </p>
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

<!-- Team Section -->
<section class="section gradient-background">
  <div class="section-container">
    <h2 class="section-title text-white">Meet Our Team</h2>
    <p class="section-text text-white">Click on any of the volunteer profiles to find out more!</p>
    
    <!-- Project Lead (Anca) centered above -->
    <div class="project-lead">
      {#each mainTeamMembers as member, i}
        {#if member.role === 'Project Lead'}
          <div 
            class="team-card project-lead-card"
            tabindex="0" 
            role="button"
            aria-label="View {member.name}'s details"
            on:click={() => showMemberDetails(member)}
            on:keydown={(e) => e.key === 'Enter' && showMemberDetails(member)}
          >
            <div 
              class="profile-image"
              style="background-image: url('/images/h4h_team/{member.imageFile}')"
            >
              {#if !member.imageFile}
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
            </div>
          </div>
        {/if}
      {/each}
    </div>
    
    <!-- Other Team Leads -->
    <div class="team-grid">
      {#each mainTeamMembers as member}
        {#if member.role !== 'Project Lead'}
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
              style="background-image: url('/images/h4h_team/{member.imageFile}')"
            >
              {#if !member.imageFile}
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
            </div>
          </div>
        {/if}
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
            style="background-image: url('/images/h4h_team/{member.imageFile}')"
          >
            {#if !member.imageFile}
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
                class="compact-link-button"
                target="_blank" 
                rel="noopener noreferrer"
                aria-label="LinkedIn profile"
                on:click|stopPropagation
              >
                <span class="material-icons">link</span>
                LinkedIn
              </a>
            </div>
          </div>
        </div>
      {/each}
    </div>
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

<!-- Sponsors Section -->
<section class="section">
  <div class="section-container">
    <h2 class="section-title">Our Sponsors</h2>
    <p class="section-text">
      We thank our sponsors for their support in making Hack4Her possible and helping us empower women in technology.
    </p>
    
    <!-- Platinum sponsors (top row, larger) -->
    <div class="sponsors-grid platinum-grid">
      {#each sponsors.platinum as sponsor}
        <div class="sponsor-logo platinum-logo">
          <img src={sponsor.logo} alt="{sponsor.name} logo" />
        </div>
      {/each}
    </div>
    
    <!-- Gold sponsors (bottom row, smaller) -->
    <div class="sponsors-grid gold-grid">
      {#each sponsors.gold as sponsor}
        <div class="sponsor-logo gold-logo">
          <img src={sponsor.logo} alt="{sponsor.name} logo" />
        </div>
      {/each}
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
