From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v4 3/5] platform:x86: Add Intel telemetry platform driver
Date: Wed, 30 Dec 2015 04:16:11 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42B74AE72@BGSMSX105.gar.corp.intel.com>
References: <1450867412-11329-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151230005731.GC29978@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:38920 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754017AbbL3EQQ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 23:16:16 -0500
In-Reply-To: <20151230005731.GC29978@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Li, Aubrey" <aubrey.li@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>



> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-
> x86-owner@vger.kernel.org] On Behalf Of Darren Hart
> Sent: Wednesday, December 30, 2015 6:28 AM
> To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; Kasagar, Srinidhi
> <srinidhi.kasagar@intel.com>; Zha, Qipeng <qipeng.zha@intel.com>;
> Muralidhar, Rajeev D <rajeev.d.muralidhar@intel.com>; Ghorai, Sukumar
> <sukumar.ghorai@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Li,
> Aubrey <aubrey.li@intel.com>
> Subject: Re: [PATCH v4 3/5] platform:x86: Add Intel telemetry platform driver
> 
> On Wed, Dec 23, 2015 at 04:13:32PM +0530, Souvik Kumar Chakravarty wrote:
> 
> Hi Souvik,
> 
> In general this series is looking pretty good. Clean and consistent for the
> most part. This one and the debugfs one in particular do have some issues I'd
> like to see addressed.
> 
> > Telemetry platform driver implements the telemetry interfaces.
> > Currently it supports ApolloLake. It uses the PUNIT and PMC IPC
> > interfaces to configure the telemetry samples to read.
> > The samples are read from a Secure SRAM region.
> >
> > Signed-off-by: Souvik Kumar Chakravarty
> > <souvik.k.chakravarty@intel.com>
> >
> > ---
> > Changes in v4:
> > * Patch v3 2/5 is split in 2 patches. This is the second in series.
> > * Change PUNIT CMDs according to changes in intel_punit_ipc.c
> > ---
> > Changes in v3:
> > * Clean code using checkpatch.pl from Kernel v4.3-rc4
> > ---
> > Changes in v2:
> > * Fix issues in code style, indentation & comments
> > * Changed Banner to include "All Rights Reserved"
> > * Remove unnecessary casting between void* and resource_size_t
> > * Split telemetry_setup_evtconfig into two more functions
> > * Use 'ret' consistently instead of 'err'
> > * Change to MODULE_LICENSE to GPL
> > ---
> >  drivers/platform/x86/intel_telemetry_pltdrv.c | 1221
> > +++++++++++++++++++++++++
> >  1 file changed, 1221 insertions(+)
> >  create mode 100644 drivers/platform/x86/intel_telemetry_pltdrv.c
> >
> > diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c
> > b/drivers/platform/x86/intel_telemetry_pltdrv.c
> > new file mode 100644
> > index 0000000..97807ed
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
> 
> ...
> 
> > +/* The following counters are programmed by default during setup.
> > + * Only 20 allocated to kernel driver */
> 
> Nit on multiline formatting:
> 
> /*
>  * First Line.
>  * Second Line.
>  */
> 
> Empty first line, last line * aligns with those above. I'll correct.
> 
> ...
> 
> > +
> > +	/* Add some Events */
> > +	if (action == TELEM_ADD) {
> > +		/* Configure Events */
> > +		for (index = telm_conf->ioss_config.ssram_evts_used, idx =
> 0,
> > +		     evts = 0; idx < num_ioss_evts; index++, idx++) {
> > +			telm_conf->ioss_config.telem_evts[index].evt_id =
> > +			ioss_evtmap[idx];
> > +
> > +			ret = telemetry_plt_config_ioss_event(
> > +				telm_conf-
> >ioss_config.telem_evts[index].evt_id,
> > +				index);
> > +			if (ret)
> > +				pr_err("IOSS TELEM_ADD Fail for Event
> %x\n",
> > +					ioss_evtmap[idx]);
> > +			else
> > +				evts++;
> > +		}
> > +		telm_conf->ioss_config.ssram_evts_used += evts;
> > +	}
> 
> There's quite a bit of code here to use the evts variable rather than
> increment the ssram_evts_used variable directly, but I don't see a particular
> reason to do so. By incrementing the ssram_evts_used directly we could
> eliminate the evts variable, all the evts = 0 assignments in the already long for
> loop initializer, and drop the assignment after each for loop.
> 
> You might consider dropping the else for each of these and adding continue
> in the if (ret) block, and doing the ssram_evts_used increment with one less
> indent:
> 
> 	for (index = telm_conf->ioss_config.ssram_evts_used, idx = 0;
> 	     idx < num_ioss_evts; index++, idx++) {
> 		if (telemtry_plt_config_ioss_event( ... ) {
> 			pr_err("...", ...);
> 			continue;
> 		}
> 		telm_conf->ioss_config.ssram_evts_used++;
> 	}
> 
> This simplifies the logic in my opinion and makes the error path clearly
> distinguishable from the normal execution path.
> 
> Any compelling reason to keep evts as a separate variable?

Yes this seems a good thing to do. Will do this in the next spin....
> 
> (Ditto throughout)
> 
> ...
> 
> > +	/* Add some Events */
> > +	if (action == TELEM_ADD) {
> > +		/* Configure Events */
> > +		for (index = telm_conf->pss_config.ssram_evts_used, idx =
> 0,
> > +		     evts = 0; idx < num_pss_evts; index++, idx++) {
> > +
> > +			telm_conf->pss_config.telem_evts[index].evt_id =
> > +			pss_evtmap[idx];
> > +
> > +			ret = telemetry_plt_config_pss_event(
> > +				telm_conf-
> >pss_config.telem_evts[index].evt_id,
> > +				index);
> > +			if (ret)
> > +				pr_err("PSS TELEM_ADD Fail for Event %x\n",
> > +					pss_evtmap[idx]);
> > +			else
> > +				evts++;
> > +		}
> > +		telm_conf->pss_config.ssram_evts_used += evts;
> > +	}
> > +
> 
> Same comment on evts above...
> 
> > +	/* Enable Periodic Telemetry Events and enable SRAM trace */
> > +	TELEM_CLEAR_SAMPLE_PERIOD(telem_ctrl);
> > +	TELEM_ENABLE_SRAM_EVT_TRACE(telem_ctrl);
> > +	TELEM_ENABLE_PERIODIC(telem_ctrl);
> > +	telem_ctrl |= pss_period;
> > +
> > +	ret =
> intel_punit_ipc_command(IPC_PUNIT_BIOS_WRITE_TELE_EVENT_CTRL,
> > +				      0, 0, &telem_ctrl, NULL);
> > +	if (ret) {
> > +		pr_err("PSS TELEM_CTRL Event Enable Write Failed\n");
> > +		return ret;
> > +	}
> > +
> > +	telm_conf->pss_config.curr_period = pss_period;
> > +
> > +	return 0;
> > +}
> > +
> > +static int telemetry_setup_evtconfig(struct telemetry_evtconfig
> pss_evtconfig,
> > +				     struct telemetry_evtconfig ioss_evtconfig,
> > +				     enum telemetry_action action) {
> > +	int ret = 0;
> 
> Assignment is not necessary.
> 
> > +
> > +	mutex_lock(&(telm_conf->telem_lock));
> > +
> > +	if ((action == TELEM_UPDATE) && (telm_conf->telem_in_use)) {
> > +		ret = -EBUSY;
> > +		goto out;
> > +	}
> > +
> > +	ret = telemetry_check_evtid(TELEM_PSS, pss_evtconfig.evtmap,
> > +				    pss_evtconfig.num_evts, action);
> > +	if (ret)
> > +		goto out;
> > +
> > +	ret = telemetry_check_evtid(TELEM_IOSS, ioss_evtconfig.evtmap,
> > +				    ioss_evtconfig.num_evts, action);
> > +	if (ret)
> > +		goto out;
> > +
> > +	if (ioss_evtconfig.num_evts) {
> > +		ret = telemetry_setup_iossevtconfig(ioss_evtconfig, action);
> > +		if (ret)
> > +			goto out;
> > +	}
> > +
> > +	if (pss_evtconfig.num_evts) {
> > +		ret = telemetry_setup_pssevtconfig(pss_evtconfig, action);
> > +		if (ret)
> > +			goto out;
> > +	}
> > +
> > +	if (action == TELEM_RESET)
> > +		telm_conf->telem_in_use = 0;
> > +	else if ((action == TELEM_UPDATE) || (action == TELEM_ADD))
> > +		telm_conf->telem_in_use = 1;
> 
> And if it's not one of these 3 values, we want to leave telem_in_use at
> whatever value it was previously?
>
Correct
 
> If not, would it make sense to have an if (this or that) set to 1, else set to
> 0 logic block here?
> 
> Can telem_in_use be a bool as that appears to be how it is used here.
I will make this a bool.
> 
> ...
> 
> > +
> > +
> > +static int telemetry_plt_get_sampling_period(u8 *pss_min_period,
> > +					     u8 *pss_max_period,
> > +					     u8 *ioss_min_period,
> > +					     u8 *ioss_max_period)
> > +{
> > +	struct telemetry_plt_config *telem_conf = telm_conf;
> > +
> 
> What is the point of creating *telem_conf here instead of just using
> telm_conf directly? Appears perfectly redundant at first glance to me...
> 
Will Change.
> > +	*pss_min_period = telem_conf->pss_config.min_period;
> > +	*pss_max_period = telem_conf->pss_config.max_period;
> > +	*ioss_min_period = telem_conf->ioss_config.min_period;
> > +	*ioss_max_period = telem_conf->ioss_config.max_period;
> > +
> > +	return 0;
> > +}
> > +
> > +
> > +static int telemetry_plt_reset_events(void) {
> > +	struct telemetry_evtconfig pss_evtconfig, ioss_evtconfig;
> > +	int ret = 0;
> 
> Assignment is not necessary.
> 
> > +
> > +	pss_evtconfig.evtmap = NULL;
> > +	pss_evtconfig.num_evts = TELEM_MAX_OS_ALLOCATED_EVENTS;
> > +	pss_evtconfig.period = TELEM_SAMPLING_DEFAULT_PERIOD;
> > +
> > +	ioss_evtconfig.evtmap = NULL;
> > +	ioss_evtconfig.num_evts = TELEM_MAX_OS_ALLOCATED_EVENTS;
> > +	ioss_evtconfig.period = TELEM_SAMPLING_DEFAULT_PERIOD;
> > +
> > +	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
> > +					TELEM_RESET);
> > +	if (ret)
> > +		pr_err("TELEMTRY Reset Failed\n");
> > +
> > +	return ret;
> > +}
> > +
> > +
> > +static int telemetry_plt_get_eventconfig(struct telemetry_evtconfig
> *pss_config,
> > +					struct telemetry_evtconfig
> *ioss_config,
> > +					int pss_len, int ioss_len)
> > +{
> > +	struct telemetry_plt_config *telem_conf = telm_conf;
> 
> Confused again I guess, why create telem_conf to point at the same struct as
> telm_conf and then use them both interchangeably below... ?

I guess I can merge them.

> 
> > +	u32 *pss_evtmap, *ioss_evtmap;
> > +	u32 index;
> > +
> > +	pss_evtmap = pss_config->evtmap;
> > +	ioss_evtmap = ioss_config->evtmap;
> > +
> > +	mutex_lock(&(telm_conf->telem_lock));
> > +	pss_config->num_evts = telem_conf->pss_config.ssram_evts_used;
> > +	ioss_config->num_evts = telem_conf-
> >ioss_config.ssram_evts_used;
> > +
> > +	pss_config->period = telm_conf->pss_config.curr_period;
> > +	ioss_config->period = telm_conf->ioss_config.curr_period;
> > +
> > +	if ((pss_len < telem_conf->pss_config.ssram_evts_used) ||
> > +	    (ioss_len < telem_conf->ioss_config.ssram_evts_used)) {
> > +		mutex_unlock(&(telm_conf->telem_lock));
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (index = 0; index < telem_conf->pss_config.ssram_evts_used;
> > +	     index++) {
> > +		pss_evtmap[index] =
> > +		telem_conf->pss_config.telem_evts[index].evt_id;
> > +	}
> > +
> > +	for (index = 0; index < telem_conf->ioss_config.ssram_evts_used;
> > +	     index++) {
> > +		ioss_evtmap[index] =
> > +		telem_conf->ioss_config.telem_evts[index].evt_id;
> > +	}
> > +
> > +	mutex_unlock(&(telm_conf->telem_lock));
> > +	return 0;
> > +}
> > +
> > +
> > +static int telemetry_plt_add_events(u8 num_pss_evts, u8
> num_ioss_evts,
> > +				    u32 *pss_evtmap, u32 *ioss_evtmap) {
> > +	struct telemetry_evtconfig pss_evtconfig, ioss_evtconfig;
> > +	struct telemetry_plt_config *telem_conf = telm_conf;
> 
> Ditto on telm_conf... and throughout.
> 
> > +	int ret = 0;
> 
> Assignment is unnecessary, more like this below / throughout.
> 
> ...
> 
> > +static int telemetry_plt_get_trace_verbosity(enum telemetry_unit
> telem_unit,
> > +					     u32 *verbosity)
> > +{
> > +	u32 temp = 0;
> > +	int ret = 0;
> > +
> > +	if (verbosity == NULL)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&(telm_conf->telem_trace_lock));
> > +	switch (telem_unit) {
> > +	case TELEM_PSS:
> > +		ret = intel_punit_ipc_command(
> > +				IPC_PUNIT_BIOS_READ_TELE_TRACE_CTRL,
> > +				0, 0, NULL, &temp);
> > +		if (ret) {
> > +			pr_err("PSS TRACE_CTRL Read Failed\n");
> > +			goto err;
> 
> This should be out: or out_unlock: as it is part of the successful path and not
> specifically an error patth.
OK
> 
> > +
> > +static int telemetry_pltdrv_probe(struct platform_device *pdev) {
> > +	struct resource *res0 = NULL, *res1 = NULL;
> > +	const struct x86_cpu_id *id;
> > +	int size, ret = -ENOMEM;
> > +
> > +	id = x86_match_cpu(telemetry_cpu_ids);
> > +	if (!id)
> > +		return -ENODEV;
> > +
> > +	telm_conf = (struct telemetry_plt_config *)id->driver_data;
> > +
> > +	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res0) {
> > +		dev_err(&pdev->dev, "Fail to get iomem resource\n");
> 
> Please use "Failed" and possible "platform iomem".
> 
> I believe we opted not to emit these errs on the punit driver, relying on the
> calling code to issue their own messages. However, I'm not seeing such
> messages in platform_get_resource or in the
> devm_requeuest_mem_region, something to investigate. I would like these
> to be consistent. If there is a subsystem message already, these could be
> made into debug statements to aid in narrowing down a failure when
> necessary.
Will convert to debug msg or remove.

> 
> Thanks,
> 
> --
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html
