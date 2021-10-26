Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88865C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 14:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69AE5603E5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 14:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236102AbhJZOyC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 10:54:02 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56671 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbhJZOyB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 10:54:01 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3187220002;
        Tue, 26 Oct 2021 14:51:36 +0000 (UTC)
Date:   Tue, 26 Oct 2021 16:51:35 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: amd-pmc: Add special handling for
 timer based S0i3 wakeup
Message-ID: <YXgV9+YVKi5r840i@piout.net>
References: <20211020162946.10537-1-mario.limonciello@amd.com>
 <20211020162946.10537-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020162946.10537-2-mario.limonciello@amd.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Mario,

On 20/10/2021 11:29:46-0500, Mario Limonciello wrote:
> RTC based wakeup from s0i3 doesn't work properly on some Green Sardine
> platforms. Because of this, a newer SMU for Green Sardine has the ability
> to pass wakeup time as argument of the upper 16 bits of OS_HINT message.
> 
> With older firmware setting the timer value in OS_HINT will cause firmware
> to reject the hint, so only run this path on:
> 1) Green Sardine
> 2) Minimum SMU FW
> 3) RTC alarm armed during s0i3 entry
> 
> Using this method has some limitations that the s0i3 wakeup will need to
> be between 4 seconds and 18 hours, so check those boundary conditions as
> well and abort the suspend if RTC is armed for too short or too long of a
> duration.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd-pmc.c | 60 +++++++++++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 99ac50616bc3..678bf6874c63 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -17,9 +17,11 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/rtc.h>
>  #include <linux/suspend.h>
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
> @@ -412,20 +414,76 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>  	return -EINVAL;
>  }
>  
> +static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
> +{
> +	struct rtc_device *rtc_device;
> +	time64_t then, now, duration;
> +	struct rtc_wkalrm alarm;
> +	struct rtc_time tm;
> +	int rc;
> +
> +	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
> +		return 0;
> +
> +	rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);

No this will not work as you can see in your and Arnd's patch adding
ifdefery to handle RTC_SYSTOHC_DEVICE not being set. You have no
guarantee that RTC_SYSTOHC_DEVICE is the device you are looking for. You
need to rework that part.

> +	if (!rtc_device)
> +		return 0;
> +	rc = rtc_read_alarm(rtc_device, &alarm);
> +	if (rc)
> +		return rc;
> +	if (!alarm.enabled) {
> +		dev_dbg(pdev->dev, "alarm not enabled\n");
> +		return 0;
> +	}
> +	rc = rtc_valid_tm(&alarm.time);
> +	if (rc)
> +		return rc;

Why do you think the RTC core give you an invalid alarm time?

> +	rc = rtc_read_time(rtc_device, &tm);
> +	if (rc)
> +		return rc;
> +	then = rtc_tm_to_time64(&alarm.time);
> +	now = rtc_tm_to_time64(&tm);
> +	duration = then-now;
> +
> +	/* in the past */
> +	if (then < now)
> +		return 0;
> +
> +	/* will be stored in upper 16 bits of s0i3 hint argument,
> +	 * so timer wakeup from s0i3 is limited to ~18 hours or less
> +	 */
> +	if (duration <= 4 || duration > U16_MAX)
> +		return -EINVAL;
> +
> +	*arg |= (duration << 16);
> +	rc = rtc_alarm_irq_enable(rtc_device, 0);

What if userspace is waiting for the alarm to happen?

> +	dev_info(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
> +

Do you actually need this message, looks like leftover debug to me?

> +	return rc;
> +}
> +
>  static int __maybe_unused amd_pmc_suspend(struct device *dev)
>  {
>  	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
>  	int rc;
>  	u8 msg;
> +	u32 arg = 1;
>  
>  	/* Reset and Start SMU logging - to monitor the s0i3 stats */
>  	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
>  	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
>  
> +	/* Activate CZN specific RTC functionality */
> +	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
> +		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
>  	/* Dump the IdleMask before we send hint to SMU */
>  	amd_pmc_idlemask_read(pdev, dev, NULL);
>  	msg = amd_pmc_get_os_hint(pdev);
> -	rc = amd_pmc_send_cmd(pdev, 1, NULL, msg, 0);
> +	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
>  	if (rc)
>  		dev_err(pdev->dev, "suspend failed\n");
>  
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
