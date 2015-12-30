From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v2 4/5] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Wed, 30 Dec 2015 04:48:42 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42B74AE95@BGSMSX105.gar.corp.intel.com>
References: <1450867456-11366-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151230005005.GA29978@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:27770 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754408AbbL3Esw convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 23:48:52 -0500
In-Reply-To: <20151230005005.GA29978@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Li, Aubrey" <aubrey.li@intel.com>



> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-
> x86-owner@vger.kernel.org] On Behalf Of Darren Hart
> Sent: Wednesday, December 30, 2015 6:20 AM
> To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; Rafael Wysocki
> <rjw@rjwysocki.net>
> Cc: platform-driver-x86@vger.kernel.org; Kasagar, Srinidhi
> <srinidhi.kasagar@intel.com>; Zha, Qipeng <qipeng.zha@intel.com>;
> Muralidhar, Rajeev D <rajeev.d.muralidhar@intel.com>; Ghorai, Sukumar
> <sukumar.ghorai@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Li,
> Aubrey <aubrey.li@intel.com>
> Subject: Re: [PATCH v2 4/5] platform:x86: Add Intel Telemetry Debugfs
> interfaces
> 
> On Wed, Dec 23, 2015 at 04:14:16PM +0530, Souvik Kumar Chakravarty wrote:
> > This implements debugfs interfaces for reading the telemetry samples
> > from SSRAM and configuring firmware trace verbosity.
> > Interface created under /sys/kernel/debug/telemetry
> 
> What was the rationale for placing this under /sys/kernel/debug/telemetry,
> instead of /sys/power/telemetry ?
> 
> Rafael, would you like to weigh in on this series? This builds on top of
> Qipeng's punit driver queued in my tree for 4.5.
> 
> > soc_states: SoC Device and Low Power States
> > pss_info: Info from the Primary SubSystem
> > ioss_info: Info from IO SubSusytem
> > pss_trace_verbosity: Read/Modify PSS F/W trace verbosity
> > ioss_trace_verbosity: Read/Modify IOSS F/W trace verbosity.
> >
> > Signed-off-by: Souvik Kumar Chakravarty
> > <souvik.k.chakravarty@intel.com>
> 
> Hi Souvik,
> 
> This particular patche's legibility suffers from a number of very long variables
> - or struct paths to variables. A couple of ideas below.
> 
> What is the plan for supporting future SoCs here? You have APL incorporated
> into this file. Do you intend to add each generation to this file?

Yes that is the intention.
> 
> >
> > ---
> > Changes in v2:
> > * Fix issues in code style, indentation & comments
> > * Changed Banner to include "All Rights Reserved"
> > * Group all ApolloLake specific #defines under banner
> > * Change to MODULE_LICENSE to GPL
> > ---
> >  drivers/platform/x86/intel_telemetry_debugfs.c | 1094
> > ++++++++++++++++++++++++
> >  1 file changed, 1094 insertions(+)
> >  create mode 100644 drivers/platform/x86/intel_telemetry_debugfs.c
> >
> > diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c
> > b/drivers/platform/x86/intel_telemetry_debugfs.c
> > new file mode 100644
> > index 0000000..5b79899
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> ...
> > +static u8 suspend_prep_ok;
> > +static u32 suspend_shlw_ctr_temp, suspend_deep_ctr_temp; static u64
> > +suspend_shlw_res_temp, suspend_deep_res_temp;
> > +
> > +struct telemetry_susp_stats {
> > +	u32 suspend_shlw_swake_ctr;
> > +	u32 suspend_deep_swake_ctr;
> > +	u64 suspend_shlw_swake_res;
> > +	u64 suspend_deep_swake_res;
> > +	u32 suspend_shlw_ctr;
> > +	u32 suspend_deep_ctr;
> > +	u64 suspend_shlw_res;
> > +	u64 suspend_deep_res;
> > +};
> 
> The suspend_ prefix to every variable seems redundant with the fact that
> they are part of a telemetry_suspend_stats structure. Eliminating this would
> help legibility considerably below.

OK
> 
> ...
> 
> > +
> > +static int telem_soc_states_show(struct seq_file *s, void *unused) {
> > +	u32 d3_sts[TELEM_IOSS_DX_D0IX_EVTS],
> d0ix_sts[TELEM_IOSS_DX_D0IX_EVTS];
> > +	u32 pg_sts[TELEM_IOSS_PG_EVTS],
> pss_idle[TELEM_PSS_IDLE_EVTS];
> > +	struct telemetry_evtlog
> evtlog[TELEM_MAX_OS_ALLOCATED_EVENTS];
> > +	u32 s0ix_total_ctr = 0, s0ix_shlw_ctr = 0, s0ix_deep_ctr = 0;
> > +	u64 s0ix_total_res = 0, s0ix_shlw_res = 0, s0ix_deep_res = 0;
> > +	struct pci_dev *dev = NULL;
> > +	int index, idx, ret;
> > +	u32 d3_state;
> > +	u16 pmcsr;
> > +
> > +	ret = telemetry_read_eventlog(TELEM_IOSS, evtlog,
> > +				      TELEM_MAX_OS_ALLOCATED_EVENTS);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	for (index = 0; index < ret; index++) {
> > +		if (evtlog[index].telem_evtid == debugfs_conf->ioss_d3_id)
> {
> > +			for (idx = 0; idx < debugfs_conf->ioss_d0ix_evts;
> > +			     idx++) {
> 
> The above can be on one line with a shorter name for debugfs_conf, even if
> just a local alias.
OK
> 
> > +				d3_sts[idx] =
> > +				(evtlog[index].telem_evtlog >>
> > +				debugfs_conf->ioss_d0ix_data[idx].bit_pos)
> &
> > +				TELEM_MASK_BIT;
> 
> By the time you have indented 4, and really should be 5, the preference is to
> determine if this can be refactored into a shallower nesting structure.
> 
> Perhaps a macro of some sort as these all seem fairly repetitive.

We can get in a macro or inline function, something like this:  
        for (index = 0; index < ret; index++) {
                seq_printf(s, "%-32s %llu\n",
                           name[index], evtlog[index].telem_evtlog);

                if (evtlog[index].telem_evtid == debugfs_conf->pss_idle_id) 
		TELEM_PARSE_LOG(debugfs_conf->ioss_d3_id, debugfs_conf->ioss_d0ix_evts , d3_sts , debugfs_conf->ioss_d0ix_data)
	If.....

	}

#define TELEM_PARSE_LOG (EVTS, BUF, EVT_DATA)     \    
                        for (int idx = 0; idx < EVTS; idx++) \
                               	BUF[idx] = (evtlog[index].telem_evtlog >> EVT_DATA[idx].bit_pos) & TELEM_MASK_BIT; \
                        continue; \

And something on the same lines for parsing counters.

Or we could have TELEM_CHECK_AND_PARSE where even the 'if' is moved inside the macro.
Does that look OK?
> 
> ...
> 
> This needs more time for review than I can give today, I'll have to get back to
> this one. Hopefully tomorrow.
> 
> --
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html
