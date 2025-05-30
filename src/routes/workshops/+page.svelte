<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';
  import { onMount } from 'svelte';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.workshops;

  // Room data
  const rooms = [
    { name: "Auditorium", capacity: "Large", size: "150 seats" },
    { name: "Multifunctional Room", capacity: "Medium", size: "60 seats" },
    { name: "Room 001", capacity: "Small", size: "20 seats" },
    { name: "Room 002", capacity: "Small", size: "20 seats" },
    { name: "Room 003", capacity: "Small", size: "20 seats" }
  ];

  // Time slots
  const timeSlots = [
    "15:00 - 15:40",
    "15:50 - 16:30",
    "17:00 - 17:40",
    "17:50 - 18:30"
  ];

  // Workshop schedule data - structured by room and time
  const schedule = [
    // Room 1
    [
      { // 15:00 - 16:30, spans two slots
        title: "ServiceNow",
        presenter: "TBD",
        company: "ServiceNow",
        image: "",
        description: "Coming soon!",
        bio: "Coming soon!",
        rowSpan: 2,
        confirmed: false
      }, 
      null, // covered by workshop above
      { // 17:00 - 17:40 and 17:50 - 18:30 (spans 2 slots)
        title: "Amazon Web Services",
        presenter: "TBD",
        company: "Amazon",
        image: "",
        description: "Coming soon!",
        bio: "Coming soon!",
        rowSpan: 2,
        confirmed: false
      },
      null, // 17:50 - 18:30 (filled by the above workshop)
    ],
    // Room 2
    [
      { // 15:00 - 16:30, spans two slots
        title: "Randstad Digital",
        presenter: "TBD",
        company: "Randstad Digital",
        image: "",
        description: "Coming soon!",
        bio: "Coming soon!",
        rowSpan: 2,
        confirmed: false
      }, 
      null, // covered by previous workshop
      {
        title: "Create Your Visual and Verbal Identity",
        presenter: "Serena Giust",
        company: "Booking.com",
        image: "/images/speakers/serena_giust.jpg",
        description: "Join us for a workshop where you'll learn to apply design principles to your personal brand. Just as designers design products, you'll develop your unique identity through a strategic process. In this session, we'll: apply design thinking to personal branding, discover how to articulate core values and mission statement, and reate a coherent visual identity. Whether you're preparing to enter the job market, launching a startup, or simply seeking to present yourself more effectively, this workshop provides practical tools to make you stand out.",
        bio: "Serena is a strategic content design leader who creates experiences that prioritise human connection, positive impact, and lasting value. With experience leading cross-functional teams since 2017, she builds environments where UX, tech, and product speak one language. She is passionate about branding and education, committed to empowering others to find their voice and express themselves. Having worked across different countries with different nationalities and backgrounds, she's a strong advocate for inclusion, creating spaces where everyone feels welcome, valued, and respected.",
        linkedin: "https://www.linkedin.com/in/serenagiust/"
      }, // 17:00 - 17:40
      { // 17:50 - 18:30
        title: "From Student to CIO",
        presenter: "Monique De Jong",
        company: "Randstad",
        image: "/images/speakers/monique_de_jong.jpg",
        description: "Ever thought you had your career all planned out—only to end up somewhere completely unexpected? That’s exactly what happened to Monique. She started with dreams of becoming a veterinarian, but life steered her into the world of technology. In this talk, Monique will share how she went from computer science student to CIO, navigating a career full of twists, challenges, and surprises. She will talk about how to spot and seize the right opportunities, how to uncover your true strengths and passions, and how to stay confident when things don’t go as planned. Monique will also take us through the stages of her career from programmer to tester, test manager, project manager, IT manager, and finally CIO. After reaching the CIO role, she realized her true passion was in the hands-on leadership and team-building aspects of IT management and deliberately stepped back into an IT manager position again to do the work she loves most. Expect to leave the talk inspired to embrace the unexpected and think differently about your own career journey in IT.",
        bio: "Monique holds a drs. in Computer Science from the Free University of Amsterdam and an MBA from Rotterdam School of Management, Erasmus University. Her unique blend of technical depth, drive to achieve the impossible, strong project management, and people leadership has consistently driven successful and innovative IT transformations. Currently shifting into a coaching position at Randstad Groep Nederland, she’s dedicated to passing on her insights and experience over three decades in IT to the next generation of IT professionals.",
        linkedin: "https://www.linkedin.com/in/monique-de-jong-3912a6/"
      },
    ],
    // Room 3
    [
      { // 15:00 - 15:40 and 15:50 - 16:30 (spans 2 slots)
        title: "GenAI Mini-Hackathon",
        presenter: "Deborah Davis-DeWitt",
        company: "Booking.com",
        image: "/images/speakers/deborah_davis-dewitt.jpg",
        description: "Learn how to build an AI chatbot, even with limited experience! In this 1.5 hour workshop, you'll build, innovate, and demo your results, all while being coached by Deborah, a Senior Technical Programme Manager at Booking.com.",
        bio: "Deborah, a Senior Technical Programme Manager in Central Tech, is passionate about technical transformation, working closely with developers and steering diversity, equity and inclusion initiatives to provide better opportunities and solidarity for all.",
        rowSpan: 2,
        linkedin: "https://www.linkedin.com/in/deborahddewitt/"
      },
      null, // 15:50 - 16:30 (filled by the above workshop)
      { // 17:00 - 18:30
        title: "Go Live with Your Personal Website",
        presenter: "Liana Gukasyan",
        company: "JetBrains",
        image: "/images/speakers/liana_gukasyan.jpg",
        description: "In this hands-on workshop, you’ll build and deploy a simple personal website from scratch, using basic HTML and CSS. We’ll also explore how AI tools can support your process. By the end of the session, you’ll have your own digital presence online – a personal website you can continue to customize and grow.",
        bio: "Liana is a Frontend Infrastructure Team Lead with extensive experience in web development and team collaboration. She’s passionate about creating engaging learning experiences and enjoys guiding developers in building practical, real-world projects. She also loves exploring ways to optimize and improve frontend workflows.",
        rowSpan: 2,
        linkedin: "https://www.linkedin.com/in/liana-gukasyan/"
      }
    ],
    // Room 4
    [
      { // 15:00 - 15:40
        title: "Building While Learning",
        presenter: "Yasemin Snoek",
        company: "barri",
        image: "/images/speakers/yasemin_snoek.png",
        description: "Join Yasemin as she shares her journey as the founder of a European tech startup—from the first spark of an idea to navigating the ups and downs of entrepreneurship. Yasemin will dive into the real, behind-the-scenes stories of building a startup, covering everything from securing the first users to handling setbacks. But it won’t just be a story. Yasemin will also share practical tips she’s learned along the way. You’ll get actionable insights on launching a product, building with a small team, and finding your way in an industry where everything feels new. Whether you’re an aspiring entrepreneur, curious about working in a tech startup, or just fascinated by the world of entrepreneurship, this talk is for you. Expect an open, honest look at the highs, the lows, and everything in between.",
        bio: "Yasemin is the founder and engineer of barri, a mobile app designed to help people with dietary restrictions find food. With a background in software engineering, Yasemin is passionate about creating solutions from the ground up and driving growth through constant experimentation.",
        linkedin: "https://www.linkedin.com/in/yasemin-snoek%F0%9F%8C%B1-563a8b12a"
      },
      { // 15:50 - 16:30
        title: "TBD",
        presenter: "Niharika Gupta",
        company: "Booking.com",
        image: "",
        description: "Coming soon!",
        bio: "Coming soon!",
        linkedin: "https://www.linkedin.com/in/niharika-gupta-8bb47882/",
        confirmed: false
      }, 
      null, // 17:00 - 17:40
      null, // 17:50 - 18:30
    ],
    // Room 5
    [
      null, // 15:00 - 15:40
      null, // 15:50 - 16:30
      null, // 17:00 - 17:40
      null, // 17:50 - 18:30
    ],
  ];

  // State for modal
  let selectedWorkshop: { title: any; image: any; presenter: any; company: any; description: any; bio: any; startTime: any; endTime: any; location: any; } | null = null;
  let modalOpen = false;

  function openWorkshopModal(workshop, timeIndex = null, roomIndex = null) {
    if (workshop) {
      // Calculate start and end time based on timeIndex and rowSpan
      let startTime = null;
      let endTime = null;
      if (timeIndex !== null && workshop.rowSpan) {
        startTime = timeSlots[timeIndex].split(' - ')[0];
        const endSlotIndex = timeIndex + workshop.rowSpan - 1;
        endTime = timeSlots[endSlotIndex]?.split(' - ')[1] || timeSlots[timeIndex].split(' - ')[1];
      } else if (timeIndex !== null) {
        // Single slot
        [startTime, endTime] = timeSlots[timeIndex].split(' - ');
      }
      selectedWorkshop = {
        ...workshop,
        location: roomIndex !== null ? rooms[roomIndex].name : workshop.location,
        startTime,
        endTime
      };
      modalOpen = true;
      document.body.style.overflow = 'hidden'; // Prevent scrolling while modal is open
    }
  }

  function closeModal() {
    modalOpen = false;
    document.body.style.overflow = ''; // Re-enable scrolling
  }

  // Close modal when clicking outside
  function handleBackdropClick(e) {
    if (e.target === e.currentTarget) {
      closeModal();
    }
  }

  // Close modal when ESC key is pressed
  function handleKeydown(e) {
    if (e.key === 'Escape' && modalOpen) {
      closeModal();
    }
  }

  onMount(() => {
    window.addEventListener('keydown', handleKeydown);
    return () => {
      window.removeEventListener('keydown', handleKeydown);
    }
  });
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

<section class="section">
  <div class="section-container">
    <p class="section-text">
      Our workshops offer a unique opportunity to learn new skills, get hands-on experience, and connect with industry experts. 
      All workshops are free for registered participants. Click on a workshop to see more details. Note that this schedule is tentative, and is subject to change. More workshops are coming soon! 
    </p>
  </div>
</section>

<section class="section gradient-background">
  <div class="section-container schedule-container">
    <h2 class="section-title text-white">Workshop Schedule</h2>
    
    <div class="workshop-schedule">
      <table class="schedule-table">
        <thead>
          <tr>
            <th class="time-header">Time</th>
            {#each rooms as room}
              <th class="room-header">
                <div class="room-name">{room.name}</div>
                <div class="room-capacity">{room.capacity}</div>
                <div class="room-size">{room.size}</div>
              </th>
            {/each}
          </tr>
        </thead>
        <tbody>
          {#each timeSlots as timeSlot, timeIndex}
            <tr>
              <td class="time-cell">{timeSlot}</td>
              {#each rooms as room, roomIndex}
                {#if schedule[roomIndex][timeIndex] && schedule[roomIndex][timeIndex].rowSpan}
                  <!-- First cell of a multi-slot workshop -->
                  {#if timeIndex === 0 || schedule[roomIndex][timeIndex - 1] !== schedule[roomIndex][timeIndex]}
                    <td 
                      class="workshop-cell has-workshop {schedule[roomIndex][timeIndex].confirmed === false ? 'unconfirmed' : ''}"
                      rowspan={schedule[roomIndex][timeIndex].rowSpan}
                      on:click={() => openWorkshopModal(schedule[roomIndex][timeIndex], timeIndex, roomIndex)}
                      on:keydown={(e) => e.key === 'Enter' && openWorkshopModal(schedule[roomIndex][timeIndex], timeIndex, roomIndex)}
                      tabindex="0"
                      role="button"
                    >
                      <div class="cell-content">
                        <h3 class="workshop-title">{schedule[roomIndex][timeIndex].title}</h3>
                        <div class="workshop-presenter">{schedule[roomIndex][timeIndex].presenter}</div>
                      </div>
                    </td>
                  {/if}
                <!-- Regular single-slot workshop -->
                {:else if schedule[roomIndex][timeIndex]}
                  <td 
                    class="workshop-cell has-workshop {schedule[roomIndex][timeIndex].confirmed === false ? 'unconfirmed' : ''}"
                    on:click={() => openWorkshopModal(schedule[roomIndex][timeIndex], timeIndex, roomIndex)}
                    on:keydown={(e) => e.key === 'Enter' && openWorkshopModal(schedule[roomIndex][timeIndex], timeIndex, roomIndex)}
                    tabindex="0"
                    role="button"
                  >
                    <div class="cell-content">
                      <h3 class="workshop-title">{schedule[roomIndex][timeIndex].title}</h3>
                      <div class="workshop-presenter">{schedule[roomIndex][timeIndex].presenter}</div>
                    </div>
                  </td>
                <!-- Empty slot -->
                {:else if timeIndex === 0 || !schedule[roomIndex][timeIndex - 1] || !schedule[roomIndex][timeIndex - 1].rowSpan || schedule[roomIndex][timeIndex - 1].rowSpan + (timeIndex - 1) <= timeIndex}
                  <td class="workshop-cell empty-cell"></td>
                {/if}
              {/each}
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
</section>

<!-- Workshop Modal -->
{#if modalOpen && selectedWorkshop}
  <!-- svelte-ignore a11y_no_static_element_interactions -->
  <div 
    class="modal-backdrop" 
    on:click={handleBackdropClick}
    on:keydown={(e) => e.key === 'Escape' && closeModal()}
    tabindex="-1"
  >
    <div class="modal-container">
      <div class="modal-header">
        <h2 class="modal-title">{selectedWorkshop.title}</h2>
        <button class="modal-close" on:click={closeModal}>
          <span class="material-icons">close</span>
        </button>
      </div>
      
      <div class="modal-content">
        <div class="presenter-section">
          <div class="presenter-image" style="background-image: url({selectedWorkshop.image})"></div>
          <div class="presenter-info">
            <h3 class="presenter-name">{selectedWorkshop.presenter}</h3>
            <p class="presenter-company">{selectedWorkshop.company}</p>
              </div>
            </div>

            
        <div class="workshop-details-modal">
          <div class="detail-section">
            <h4>Description</h4>
            <p>{selectedWorkshop.description}</p>
            </div>
          
          <div class="detail-section">
            <h4>About the Presenter</h4>
            <p>{selectedWorkshop.bio}</p>
          </div>
          
          <div class="detail-section">
            <div class="workshop-meta">
              <div class="meta-item">
                <span class="material-icons">access_time</span>
                <span>
                  {#if selectedWorkshop.startTime && selectedWorkshop.endTime}
                    {selectedWorkshop.startTime} - {selectedWorkshop.endTime}
                  {:else}
                    Schedule time
                  {/if}
                </span>
              </div>
              <div class="meta-item">
                <span class="material-icons">location_on</span>
                <span>{selectedWorkshop.location}</span>
              </div>
            </div>
          </div>
        </div>
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
  
  .schedule-container {
    max-width: 1400px;
    overflow-x: auto;
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
  
  /* Schedule Table */
  .workshop-schedule {
    width: 100%;
    overflow-x: auto;
  }
  
  .schedule-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 8px;
    margin: 0 auto;
    color: white;
  }
  
  .time-header {
    width: 120px;
    padding: 15px;
    text-align: center;
    font-weight: bold;
    color: white;
  }
  
  .room-header {
    padding: 15px;
    text-align: center;
    width: calc((100% - 120px) / 5);
    min-width: 150px;
    background-color: rgba(0, 0, 0, 0.1);
    border-radius: var(--border-radius-section);
  }
  
  .room-name {
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 5px;
  }
  
  .room-capacity {
    font-size: 16px;
    font-weight: 500;
  }
  
  .room-size {
    font-size: 14px;
    opacity: 0.8;
  }
  
  .time-cell {
    padding: 10px;
    text-align: center;
    font-weight: bold;
    color: white;
    white-space: nowrap;
  }
  
  .workshop-cell {
    padding: 0;
    text-align: center;
    height: 120px;
    background-color: rgba(255, 255, 255, 0.07);
    border-radius: var(--border-radius-section);
    transition: all 0.3s ease;
    vertical-align: middle;
  }

  .workshop-cell.unconfirmed {
    position: relative;
    overflow: hidden;
    background-image: repeating-linear-gradient(
      45deg,
      #d1b3ff 0px,
      #d1b3ff 4px,
      transparent 4px,
      transparent 16px
    );
  }
  
  .has-workshop {
    background-color: rgba(var(--color-primary-rgb), 0.8); /* Using CSS variable to adapt to dark/light mode */
    cursor: pointer;
  }
  
  .has-workshop:hover {
    background-color: rgba(var(--color-secondary-rgb), 0.6); /* Using CSS variable to adapt to dark/light mode */
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  }
  
  .cell-content {
    padding: 15px;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
  
  .workshop-title {
    font-size: 16px;
    font-weight: bold;
    margin: 0 0 10px;
    color: white;
  }
  
  .workshop-presenter {
    font-size: 14px;
  }
  
  .empty-cell {
    background-color: rgba(255, 255, 255, 0.05);
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
    color: var(--color-text);
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
  
  @media (max-width: 1000px) {
    .schedule-container {
      padding: 0 5px;
    }
    
    .schedule-table {
      border-spacing: 5px;
    }
    
    .time-header {
      width: 60px;
      padding: 10px 5px;
    }
    
    .time-cell {
      width: 60px;
      padding: 5px 2px;
      font-size: 13px;
    }
    
    .room-header {
      padding: 10px 5px;
      min-width: 120px;
      width: calc((100% - 60px) / 5);
    }
    
    .room-name {
      font-size: 16px;
    }
    
    .room-capacity, .room-size {
      font-size: 12px;
    }
    
    .workshop-title {
      font-size: 14px;
    }
    
    .workshop-presenter {
      font-size: 12px;
    }
    
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
  
  /* Add smaller sizes for extra small screens */
  @media (max-width: 480px) {
    .time-header {
      width: 45px;
      padding: 8px 2px;
    }
    
    .time-cell {
      width: 45px;
      padding: 4px 2px;
      font-size: 12px;
    }
    
    .room-header {
      width: calc((100% - 45px) / 5);
      min-width: 100px;
    }
    
    .workshop-cell {
      height: 100px;
    }
  }
</style> 
