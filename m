From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/5] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Tue, 29 Dec 2015 16:50:05 -0800
Message-ID: <20151230005005.GA29978@malice.jf.intel.com>
References: <1450867456-11366-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35611 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753987AbbL3AuJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 19:50:09 -0500
Content-Disposition: inline
In-Reply-To: <1450867456-11366-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Rafael Wysocki <rjw@rjwysocki.net>
Cc: platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com

On Wed, Dec 23, 2015 at 04:14:16PM +0530, Souvik Kumar Chakravarty wrote:
> This implements debugfs interfaces for reading the telemetry
> samples from SSRAM and configuring firmware trace verbosity.
> Interface created under /sys/kernel/debug/telemetry

What was the rationale for placing this under /sys/kernel/debug/telemetry,
instead of /sys/power/telemetry ?

Rafael, would you like to weigh in on this series? This builds on top of
Qipeng's punit driver queued in my tree for 4.5.

> soc_states: SoC Device and Low Power States
> pss_info: Info from the Primary SubSystem
> ioss_info: Info from IO SubSusytem
> pss_trace_verbosity: Read/Modify PSS F/W trace verbosity
> ioss_trace_verbosity: Read/Modify IOSS F/W trace verbosity.
> 
> Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Hi Souvik,

This particular patche's legibility suffers from a number of very long variables
- or struct paths to variables. A couple of ideas below.

What is the plan for supporting future SoCs here? You have APL incorporated into
this file. Do you intend to add each generation to this file?

> 
> ---
> Changes in v2:
> * Fix issues in code style, indentation & comments
> * Changed Banner to include "All Rights Reserved"
> * Group all ApolloLake specific #defines under banner
> * Change to MODULE_LICENSE to GPL
> ---
>  drivers/platform/x86/intel_telemetry_debugfs.c | 1094 ++++++++++++++++++++++++
>  1 file changed, 1094 insertions(+)
>  create mode 100644 drivers/platform/x86/intel_telemetry_debugfs.c
> 
> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
> new file mode 100644
> index 0000000..5b79899
> --- /dev/null
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
...
> +static u8 suspend_prep_ok;
> +static u32 suspend_shlw_ctr_temp, suspend_deep_ctr_temp;
> +static u64 suspend_shlw_res_temp, suspend_deep_res_temp;
> +
> +struct telemetry_susp_stats {
> +	u32 suspend_shlw_swake_ctr;
> +	u32 suspend_deep_swake_ctr;
> +	u64 suspend_shlw_swake_res;
> +	u64 suspend_deep_swake_res;
> +	u32 suspend_shlw_ctr;
> +	u32 suspend_deep_ctr;
> +	u64 suspend_shlw_res;
> +	u64 suspend_deep_res;
> +};

The suspend_ prefix to every variable seems redundant with the fact that they
are part of a telemetry_suspend_stats structure. Eliminating this would help
legibility considerably below.

...

> +
> +static int telem_soc_states_show(struct seq_file *s, void *unused)
> +{
> +	u32 d3_sts[TELEM_IOSS_DX_D0IX_EVTS], d0ix_sts[TELEM_IOSS_DX_D0IX_EVTS];
> +	u32 pg_sts[TELEM_IOSS_PG_EVTS], pss_idle[TELEM_PSS_IDLE_EVTS];
> +	struct telemetry_evtlog evtlog[TELEM_MAX_OS_ALLOCATED_EVENTS];
> +	u32 s0ix_total_ctr = 0, s0ix_shlw_ctr = 0, s0ix_deep_ctr = 0;
> +	u64 s0ix_total_res = 0, s0ix_shlw_res = 0, s0ix_deep_res = 0;
> +	struct pci_dev *dev = NULL;
> +	int index, idx, ret;
> +	u32 d3_state;
> +	u16 pmcsr;
> +
> +	ret = telemetry_read_eventlog(TELEM_IOSS, evtlog,
> +				      TELEM_MAX_OS_ALLOCATED_EVENTS);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (index = 0; index < ret; index++) {
> +		if (evtlog[index].telem_evtid == debugfs_conf->ioss_d3_id) {
> +			for (idx = 0; idx < debugfs_conf->ioss_d0ix_evts;
> +			     idx++) {

The above can be on one line with a shorter name for debugfs_conf, even if just
a local alias.

> +				d3_sts[idx] =
> +				(evtlog[index].telem_evtlog >>
> +				debugfs_conf->ioss_d0ix_data[idx].bit_pos) &
> +				TELEM_MASK_BIT;

By the time you have indented 4, and really should be 5, the preference is to
determine if this can be refactored into a shallower nesting structure.

Perhaps a macro of some sort as these all seem fairly repetitive.

...

This needs more time for review than I can give today, I'll have to get back to
this one. Hopefully tomorrow.

-- 
Darren Hart
Intel Open Source Technology Center
