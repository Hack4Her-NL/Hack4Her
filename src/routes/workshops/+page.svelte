<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';
  import { routes } from '$lib/utils/routes';
  import { onMount } from 'svelte';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.workshops;

  // Room data
  const rooms = [
    //{ name: "NU-4A25", capacity: "", size: "" },
    //{ name: "NU-4B43", capacity: "", size: "" },
    //{ name: "NU-4B47", capacity: "", size: "" },
    //{ name: "NU-4B01", capacity: "", size: "" },
    { name: "Room 1", capacity: "", size: "" },
    { name: "Room 2", capacity: "", size: "" },
    { name: "Room 3", capacity: "", size: "" },
    { name: "Room 4", capacity: "", size: "" },
    { name: "Room 5", capacity: "", size: "" }
  ];

  // Time slots
  const timeSlots = [
    "15:30 - 16:25",
    "16:30 - 17:25"
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
    ],
    // Room 2
    [
      { // 15:00 - 16:30, spans two slots
        title: "From Idea to Increment: Creating What Matters",
        presenter: "Valentina, Saeske & Jacco van der Ven",
        company: "Randstad Digital",
        image: "",
        description: "Welcome to the PI-Workshop: \"The Perfect Wedding\". Ever wondered how large teams align on a shared goal and deliver real value under pressure? In this interactive workshop, you'll step into the world of scaled Agile—by planning something as personal (and complex) as a wedding.<br><br>Guided by three experienced Agile professionals, you'll take part in a hands-on simulation of a Program Increment (PI) Planning session. The twist? You're planning a wedding for a key stakeholder with high expectations and limited time.<br><br>Together with your team, you'll need to align priorities, manage dependencies, and balance both emotional and practical needs—just like in the real world of tech.<br><br>This workshop is about more than just planning. It's about feeling what it means to build something meaningful for someone else. You'll get a sense of how your future work as a developer, data scientist, or product owner impacts real people. You'll also experience firsthand how business value, collaboration, and shared goals come together in a SAFe Agile environment.<br><br>Join us if you're curious about how great teams turn complexity into clarity—and want to sharpen the collaboration skills you'll need in any tech career.",
        bio: "About the presenters",
        presenters: [
          {
            name: "Valentina",
            image: "/images/speakers/Valentina.jpg",
            bio: "Meet Valentina – from beta student to enabler of change in IT<br><br>With a technical science education as a foundation and a fascination for how systems and people work, Valentina has grown into a strategic force within IT. In her roles as product manager and implementation manager, she daily drives innovation and improvement for clients of Randstad Digital – with an eye for technology, organization, and people.<br><br>What she shares in this workshop is not just theory, but also practice. These are insights and approaches she applies daily: from translating complex IT solutions into understandable applications, to realizing genuine collaboration between teams and users.<br><br>Valentina shows that with a sharp eye and soft power, you can play a valuable role in IT. And that there is plenty of room for women to direct the digital world of tomorrow as enablers of change."
          },
          {
            name: "Saeske",
            image: "/images/speakers/Saeske.jpg",
            bio: "Meet Saeske – energizer, inspirator, and productmanager with a passion for tech and progress<br><br>With a background in law and business, Saeske didn't take the standard route into tech. But with curiosity, drive, and a love for understanding how things work, she built a career in digital transformation—helping teams move forward, find clarity, and enjoy the process along the way. In this workshop, she brings that same energy to a hands-on simulation of PI Planning. Expect interaction, structure, and fun—because planning can be both powerful and enjoyable when you do it together. Saeske believes that with the right mindset, almost anything is possible. Whether you're just getting started in tech or already deep in the field, this session will give you a fresh look at what's possible when people align around a shared goal—and have fun doing it."
          },
          {
            name: "Jacco van der Ven",
            image: "/images/speakers/Jacco.png",
            bio: "Meet Jacco van der Ven - a passionate and enthusiastic Agile Coach and IT Project Manager<br><br>With a robust background in guiding organizations through Agile transformations and enhancing team collaboration. He brings extensive expertise in Scrum, Kanban, and SAFe methodologies. His experience spans diverse organizations, including prominent names like the Belastingdienst (Dutch Tax and Customs Administration), VodafoneZiggo, and KPN, where he has been instrumental in leading teams through transitions to Agile ways of working.<br><br>His passion extends beyond simply implementing methodologies to truly coaching and motivating people. As a mentor for Product Owners, Scrum Masters, and team members, he fosters a culture of shared vision, openness, and collective responsibility.<br><br>He holds a Bachelor's degree in ICT and Information Management and possesses a strong portfolio of certifications, including Professional Scrum Master (PSM I & II), Professional Product Owner (PSM I), Leading SAFe (SAFe 5 & 6 Agilist), Agile Project Management (DSDM), and PRINCE2 Practitioner.<br><br>Jacco is enthusiastic about leveraging his extensive experience in Agile methodologies, coaching, and project management to help organizations achieve their goals through enhanced collaboration and continuous improvement. He is eager to discuss how his passion for Agile values and his ability to connect and coach people can contribute to an organization's success."
          }
        ],
        rowSpan: 2,
        confirmed: true
      }, 
      null, // covered by previous workshop
      null, // 17:00 - 17:40
      
    ],
    // Room 3
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
      { // 17:50 - 18:30
        title: "From Student to CIO",
        presenter: "Monique De Jong",
        company: "Randstad",
        image: "/images/speakers/monique_de_jong.jpg",
        description: "Ever thought you had your career all planned out—only to end up somewhere completely unexpected? That's exactly what happened to Monique. She started with dreams of becoming a veterinarian, but life steered her into the world of technology. In this talk, Monique will share how she went from computer science student to CIO, navigating a career full of twists, challenges, and surprises. She will talk about how to spot and seize the right opportunities, how to uncover your true strengths and passions, and how to stay confident when things don't go as planned. Monique will also take us through the stages of her career from programmer to tester, test manager, project manager, IT manager, and finally CIO. After reaching the CIO role, she realized her true passion was in the hands-on leadership and team-building aspects of IT management and deliberately stepped back into an IT manager position again to do the work she loves most. Expect to leave the talk inspired to embrace the unexpected and think differently about your own career journey in IT.",
        bio: "Monique holds a drs. in Computer Science from the Free University of Amsterdam and an MBA from Rotterdam School of Management, Erasmus University. Her unique blend of technical depth, drive to achieve the impossible, strong project management, and people leadership has consistently driven successful and innovative IT transformations. Currently shifting into a coaching position at Randstad Groep Nederland, she's dedicated to passing on her insights and experience over three decades in IT to the next generation of IT professionals.",
        linkedin: "https://www.linkedin.com/in/monique-de-jong-3912a6/"
      },
    ],
    // Room 4
    [
      { // 15:00 - 16:30, spans two slots
        title: "Getting familiar with DESFire",
        presenter: "Jezabel & Sebastiaan",
        company: "KPN",
        image: "",
        description: "MIFARE DESFire is the stronger, slightly more expensive sibling of the MIFARE family of smartcards. This workshop aims to cover the basics of the card's functions as well as how the most important crypto works. After a short lecture, it is up to you to analyze captured DESFire traces of vulnerable reader implementations with a Proxmark3 and program your own DESFire card to bypass the reader's security. Proxmark3 devices and DESFire cards will be provided for use during the workshop. \nIMPORTANT: This workshop requires you to bring your own laptop to run the Proxmark3 client software.",
        bio: "Jezabel works as an Ethical Hacker in the KPN internal redteam. After spending 5 years pentesting in France, they relocated to the Netherlands to continue this activity with another perspective. They love tinkering, hacking, hardware, and learning new things. Sebastiaan is an Ethical Hacker at KPN with an interest in binary analysis and exploitation, system security and breaking programs in general. Before that, he worked as an incident responder and forensic analyst at KPN-CERT. Whenever opportunity arises, he can be found at CTF events.",
        rowSpan: 2
      }, 
      null, // covered by previous workshop
      null
    ],
    // Room 5
    [
      { // 15:00 - 15:40
        title: "Chip Design (Logic Synthesis) for AI",
        presenter: "Dr. Marcel Walter",
        company: "Technical University of Munich and MQSC",
        image: "",
        description: "Machine Learning and Artificial Intelligence are the defining technologies of this decade. However, training and running state-of-the-art models require significant computational power, typically provided by large GPU clusters. One promising solution is the development of Application-Specific Integrated Circuits (ASICs), which are custom hardware designed to accelerate specific applications. In this workshop, attendees will learn about the logic synthesis and physical design processes used to create ASIC layouts from specifications. They will apply these techniques to generate custom machine-learning accelerators and inference engines ready for tape-out. The workshop includes a hands-on session for practical experience.",
        bio: "Marcel Walter is a Senior Quantum Software Engineer at the Munich Quantum Software Company (MQSC) and a Postdoctoral Researcher at the Technical University of Munich (TUM). He received his Ph.D. in Computer Science from the University of Bremen in 2021 for his work on algorithms for the physical design of emerging post-CMOS nanotechnologies. Previously, Marcel has also contributed to the German Research Center for Artificial Intelligence (DFKI). Dr. Walter is the initiator and maintainer of the fiction framework, a comprehensive tool for the logic synthesis, physical design, verification, and simulation of Field-coupled Nanotechnologies (FCN). His research is dedicated to bridging the design gap between FCN, such as Quantum-dot Cellular Automata (QCA), Nanomagnet Logic (NML), and Silicon Dangling Bonds (SiDB), and classical CMOS devices. These promising post-CMOS technologies offer the potential for exceptional processing performance with significantly reduced power dissipation. The fiction framework serves as a crucial platform for his experiments, proof-of-concept implementations, and as a foundation for future research in this domain (available on his GitHub). He teaches courses in Emerging Technologies and Physical Design, and Logic Synthesis. His research interests encompass Nanotechnologies, Algorithmics, and Formal Methods. Furthermore, Marcel has experience in Quantum Computing, Reversible Logic, Digital Microfluidic Biochips, Optical Circuits, and DNA Computers.",
        linkedin: "https://www.linkedin.com/in/marcel-walter-94b573195/",
        website: "https://marcelwa.github.io/",
        rowSpan: 2
      }, // 15:00 - 15:40
      null, // 15:50 - 16:30
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
                    <span class="material-icons" style="font-size: 18px; vertical-align: middle; margin-left: 4px;">linkedin</span>
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
