<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';
  import { onMount } from 'svelte';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.workshops;

  const rooms = [
    { name: "Room 1", capacity: "", size: "" },
    { name: "Room 2", capacity: "", size: "" },
    { name: "Room 3", capacity: "", size: "" },
    { name: "Room 4", capacity: "", size: "" },
    { name: "Room 5", capacity: "", size: "" },
  ];

  const timeSlots = [
    "15:30 - 16:30",
    "16:45 - 17:45"
  ];

  const schedule = [
    // Room 1
    [
      {
        title: "Can DRM Keep a Secret? An Attack Case on Spotify",
        presenter: "Dr. Asia Slowinska",
        company: "Vrije Universiteit Amsterdam",
        image: "/images/speakers/asia_slowinska.jpg",
        description: "Every day, we press play on Amazon Music, Spotify or Apple Music, and hear our favourite songs instantly. But behind that simple button is a security question: how do music platforms let us listen, without letting us walk away with a perfect copy? In this workshop, we will unpack Digital Rights Management, or DRM: the technology that protects streamed music using encryption and hardware-backed security. Then we will look at DReaMCatcher, a research project that finds the weak spot in this story. Even when DRM keeps the keys safe, the music still has to leave the protected world and travel to the speakers - and that final journey can be attacked. The workshop is high-level and accessible. No prior knowledge of DRM, hardware security, or reverse engineering is required.",
        bio: "Asia Slowinska is a faculty member at Vrije Universiteit Amsterdam, where she is part of the VUSec systems security group.​​Her work explores what happens when security guarantees meet real computer systems: operating systems, virtualization, hardware, low-level software, and the messy boundaries that attackers often exploit. She teaches Binary and Malware Analysis and Operating Systems, and enjoys making low-level technical ideas understandable without removing the fun. In this workshop, she will use music DRM as a case study to show how security researchers think: follow the data, question the assumptions, and look for the place where “secure in theory” becomes fragile in practice.",
        linkedin: "https://www.linkedin.com/in/aslowinska/",
        website: "https://www.vusec.net/people/asia-slowinska/"
      },
    ],
    // Room 2
    [
      {
        title: "A Practical Guide to Reverse Engineering",
        presenter: "Ugne & Joachim",
        company: "StudSec",
        image: "/images/speakers/studseclogo.png",
        description: "In this workshop we will dive into reverse engineering tools and dissasemblers like Ghidra in addition to dynamic analysis tools such as gdb and strace. We will follow a tutorial like setting with exercises (solved on the board). Please be aware that a surface level understanding of assembly is needed to get the full experience, but you are welcome regardless.<br><br>This workshop is offered by StudSec, a Student CyberSecurity Association based at VU Amsterdam, committed to making the CyberSecurity field more accessible to every student. We do this through hosting workshops and tutorials, playing CTF, and working on side projects. Our goal is to offer a platform for students to learn and grow through practical experience, networking, and knowledge sharing. We hope you join us!",
        presenters: [
          {
            name: "Ugne Ubartaite",
            image: "/images/speakers/ugne_ubartaite.jpg",
            bio: "Hello, I'm Ugne! I am a third year Computer Science BSc Student at Vrije Universiteit Amsterdam with eyes on the Computer Security MSc next year! As chair of Board III of StudSec, I'm interested in all things software, hardware and hacking in general. I'm excited to be here and excited to learn, so let's all learn together!"
          },
          {
            name: "Joachim Bose",
            image: "/images/speakers/joachim_bose.png",
            bio: "Hello I am Joa! My formal title is vice-chair of StudSec, but I am really the workshop guy. I am a MSc Computer Security student who really enjoys low-level stuff and learning how things work. I have had many adventures on the hardware-software interface, and I am always ready for more!"
          }
        ],
        rowSpan: 2
      },
    ],
    // Room 3
    [
      {
        title: "Building Your Career",
        presenter: "Prosus",
        company: "Prosus",
        image: "",
        description: "TBD",
        bio: "TBD",
        linkedin: ""
      },
    ],
    // Room 4
    [
      {
        title: "Interviewing skills",
        presenter: "Gosia Janeczko",
        company: "Universiteit van Amsterdam",
        image: "/images/speakers/gosia_janeczko.jpg",
        description: "TBD",
        bio: "TBD",
        linkedin: "https://www.linkedin.com/in/malgorzatajaneczko/"
      },
      {
        title: "Interviewing skills (repeat)",
        presenter: "Gosia Janeczko",
        company: "Universiteit van Amsterdam",
        image: "/images/speakers/gosia_janeczko.jpg",
        description: "TBD",
        bio: "TBD",
        linkedin: "https://www.linkedin.com/in/malgorzatajaneczko/"
      },
    ],
    // Room 5
    [
      null, // First workshop in this room is not decided yet
      {
        title: "Trustworthy Conversational AI Agents for Human Well-being",
        presenter: "Dr. Jiahuan Pei",
        company: "Vrije Universiteit Amsterdam",
        image: "/images/speakers/jiahuan_pei.png",
        description: "Conversational AI agents are transforming how people learn, create, and connect. As these systems become more integrated into everyday life, trust depends not only on model capability but also on accuracy, transparency, human oversight, and rigorous evaluation frameworks—all with the ultimate goal of supporting human well-being. The talk consists of two parts:<br>First, I will showcase a series of conversational AI agents developed through both published and ongoing research projects focused on enhancing human well-being across diverse application domains. These case studies will highlight practical lessons for designing and evaluating trustworthy AI systems that balance technical performance with human-centered outcomes.<br>Second, I will introduce our research group's current interests and future directions, as well as the vision and initiatives of the AI programme within the education committee (OLC).<br>Together, these efforts highlight opportunities to advance responsible, impactful, and human-centered AI for both learning and research.",
        bio: "Dr. Jiahuan Pei is working as Assistant Professor in the Social AI Group and Chair of AI programme committee (OLC) at Vrije Universiteit Amsterdam. Her research focuses on multimodal agents for conversational AI, with broader expertise in NLP and information retrieval. She has previously worked with the DIS Group at CWI and at Amazon, and has published in leading venues including NeurIPS, ACL, EMNLP, AAAI, SIGIR, and ACM Multimedia.<br>The vision of the Social AI group is to research and develop Smarter Digital Companions. Our mission is to advance AI to improve the way humans and machines understand and interact with each other. Social AI investigates methods and techniques for modelling and analysis of agent systems in the area of human-oriented Ambient Intelligence. Vrije Universiteit Amsterdam is a leader in the field of AI and the social interaction between humans and machines. The AI research programme focuses on some fundamental areas from the field of AI, all of which have connections to the VU-wide Connected World theme.",
        linkedin: "https://www.linkedin.com/in/jiahuan-joanne-pei-b4b507b4/",
        website: "https://jiahuan-pei.github.io/"
      },
    ]
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
      The workshop page is currently under construction! 
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
        {#if selectedWorkshop.presenters && selectedWorkshop.presenters.length > 0}
          <!-- Multiple presenters layout -->
          <div class="presenters-section">
            <h3 class="presenters-title">{selectedWorkshop.presenter}</h3>
            <p class="presenter-company">{selectedWorkshop.company}</p>
          </div>
        {:else}
          <!-- Single presenter layout -->
          <div class="presenter-section">
            <div class="presenter-image" style="background-image: url({selectedWorkshop.image})"></div>
            <div class="presenter-info">
              <h3 class="presenter-name">
                {selectedWorkshop.presenter}
                {#if selectedWorkshop.linkedin}
                  <a
                    href={selectedWorkshop.linkedin}
                    target="_blank"
                    rel="noopener noreferrer"
                    class="linkedin-inline-btn"
                    aria-label="LinkedIn profile"
                  >
                    <span class="material-icons" style="font-size: 18px; vertical-align: middle; margin-left: 4px;">link</span>
                  </a>
                {/if}
                {#if selectedWorkshop.website}
                  <a
                    href={selectedWorkshop.website}
                    target="_blank"
                    rel="noopener noreferrer"
                    class="website-inline-btn"
                    aria-label="Personal website"
                  >
                    <span class="material-icons" style="font-size: 18px; vertical-align: middle; margin-left: 4px;">language</span>
                  </a>
                {/if}
              </h3>
              <p class="presenter-company">{selectedWorkshop.company}</p>
            </div>
          </div>
        {/if}
            
        <div class="workshop-details-modal">
          <div class="detail-section">
            <h4>Description</h4>
            <p>{@html selectedWorkshop.description}</p>
          </div>
          
          {#if selectedWorkshop.presenters && selectedWorkshop.presenters.length > 0}
            <!-- Multiple presenters bios -->
            {#each selectedWorkshop.presenters as presenter}
              <div class="detail-section presenter-detail">
                <div class="presenter-header">
                  <div class="presenter-image" style="background-image: url({presenter.image})"></div>
                  <h4 class="presenter-individual-name">{presenter.name}</h4>
                </div>
                <p>{@html presenter.bio}</p>
              </div>
            {/each}
          {:else}
            <!-- Single presenter bio -->
            <div class="detail-section">
              <h4>About the Presenter</h4>
              <p>{@html selectedWorkshop.bio}</p>
            </div>
          {/if}
          
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
  
  /* Schedule placeholder */
  .workshop-schedule {
    width: 100%;
    overflow-x: auto;
  }

  .schedule-placeholder {
    text-align: center;
    color: white;
    font-size: 1.3rem;
    margin: 0;
    font-weight: bold;
  }

  /* Schedule table styles kept for when the workshop schedule is filled in again */
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
    background-color: rgba(var(--color-primary-rgb), 0.8);
    cursor: pointer;
  }
  
  .has-workshop:hover {
    background-color: rgba(var(--color-secondary-rgb), 0.6);
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
  
  .presenters-section {
    text-align: center;
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  }
  
  .presenters-title {
    margin: 0 0 5px;
    font-size: 20px;
    font-weight: bold;
    color: var(--color-text);
  }
  
  .presenter-detail {
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    padding-bottom: 20px;
  }
  
  .presenter-detail:last-of-type {
    border-bottom: none;
    padding-bottom: 0;
  }
  
  .presenter-header {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
  }
  
  .presenter-header .presenter-image {
    width: 60px;
    height: 60px;
    margin: 0 15px 0 0;
    flex-shrink: 0;
    background-size: cover;
    background-position: center;
    border-radius: 50%;
    border: 2px solid rgba(255, 255, 255, 0.8);
  }
  
  .presenter-individual-name {
    margin: 0;
    font-size: 18px;
    font-weight: bold;
    color: var(--color-text);
  }
  
  .presenter-info {
    flex: 1;
  }
  
  .presenter-name {
    margin: 0 0 5px;
    font-size: 20px;
    font-weight: bold;
    color: var(--color-text);
    display: inline-flex;
    align-items: center;
    gap: 4px;
    line-height: 1.2;
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
  
  /* Inline social buttons */
  .linkedin-inline-btn,
  .website-inline-btn {
    color: var(--color-primary);
    text-decoration: none;
    transition: all 0.2s ease;
    display: inline-flex;
    align-items: center;
    border-radius: 4px;
    padding: 2px;
  }
  
  .linkedin-inline-btn:hover,
  .website-inline-btn:hover {
    color: var(--color-primary);
    background-color: rgba(var(--color-primary-rgb), 0.1);
    transform: scale(1.1);
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
