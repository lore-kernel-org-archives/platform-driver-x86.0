Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44216C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 15:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1506A60F02
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 15:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJZPb1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:31:27 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:39705 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhJZPb1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 11:31:27 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 46306100008;
        Tue, 26 Oct 2021 15:29:01 +0000 (UTC)
Date:   Tue, 26 Oct 2021 17:29:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: amd-pmc: Add special handling for
 timer based S0i3 wakeup
Message-ID: <YXgevKbZupN4kXsJ@piout.net>
References: <20211020162946.10537-1-mario.limonciello@amd.com>
 <20211020162946.10537-2-mario.limonciello@amd.com>
 <YXgV9+YVKi5r840i@piout.net>
 <9b848381-db2b-c060-f012-c049c3b3276e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b848381-db2b-c060-f012-c049c3b3276e@amd.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 26/10/2021 10:15:06-0500, Limonciello, Mario wrote:
> > 
> > > +	if (!rtc_device)
> > > +		return 0;
> > > +	rc = rtc_read_alarm(rtc_device, &alarm);
> > > +	if (rc)
> > > +		return rc;
> > > +	if (!alarm.enabled) {
> > > +		dev_dbg(pdev->dev, "alarm not enabled\n");
> > > +		return 0;
> > > +	}
> > > +	rc = rtc_valid_tm(&alarm.time);
> > > +	if (rc)
> > > +		return rc;
> > 
> > Why do you think the RTC core give you an invalid alarm time?
> 
> It doesn't matter "why" to me.  It's defensive programming.
> The function has a return code to check for problems.  If an invalid alarm
> time was somehow programmed, we shouldn't be using it.
> 

The question was not why it would happen, but why you think it could.
The RTC core will not return an invalid alarm, else, you'd already
catch that checking the return value of rtc_read_alarm. This is not
defensive programming, this is useless.

> > 
> > > +	rc = rtc_read_time(rtc_device, &tm);
> > > +	if (rc)
> > > +		return rc;
> > > +	then = rtc_tm_to_time64(&alarm.time);
> > > +	now = rtc_tm_to_time64(&tm);
> > > +	duration = then-now;
> > > +
> > > +	/* in the past */
> > > +	if (then < now)
> > > +		return 0;
> > > +
> > > +	/* will be stored in upper 16 bits of s0i3 hint argument,
> > > +	 * so timer wakeup from s0i3 is limited to ~18 hours or less
> > > +	 */
> > > +	if (duration <= 4 || duration > U16_MAX)
> > > +		return -EINVAL;
> > > +
> > > +	*arg |= (duration << 16);
> > > +	rc = rtc_alarm_irq_enable(rtc_device, 0);
> > 
> > What if userspace is waiting for the alarm to happen?
> 
> They won't receive it.  Note; this is no different than before the patch on
> these affected systems.
> 

But then shouldn't that be fixed? Why does the alarm need to be
disabled?

> > 
> > > +	dev_info(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
> > > +
> > 
> > Do you actually need this message, looks like leftover debug to me?
> 
> Yes it was definitely used in debugging to produce this patch in the first
> place.
> 
> I left it for two reasons:
> 1) It makes it clear if someone is using this functionality when they report
> an error.
> 
> 2) It shows if they were operating really close to the boundary conditions
> (and thus it may be required to adjust).
> 
> I am amenable to downgrading it to dev_dbg and on reported issues around
> this asking people to +p dynamic debugging for amd_pmc.
> 
> > 
> > > +	return rc;
> > > +}
> > > +
> > >   static int __maybe_unused amd_pmc_suspend(struct device *dev)
> > >   {
> > >   	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
> > >   	int rc;
> > >   	u8 msg;
> > > +	u32 arg = 1;
> > >   	/* Reset and Start SMU logging - to monitor the s0i3 stats */
> > >   	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
> > >   	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
> > > +	/* Activate CZN specific RTC functionality */
> > > +	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
> > > +		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
> > > +		if (rc < 0)
> > > +			return rc;
> > > +	}
> > > +
> > >   	/* Dump the IdleMask before we send hint to SMU */
> > >   	amd_pmc_idlemask_read(pdev, dev, NULL);
> > >   	msg = amd_pmc_get_os_hint(pdev);
> > > -	rc = amd_pmc_send_cmd(pdev, 1, NULL, msg, 0);
> > > +	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
> > >   	if (rc)
> > >   		dev_err(pdev->dev, "suspend failed\n");
> > > -- 
> > > 2.25.1
> > > 
> > 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
