Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B523DE45B;
	Mon,  4 May 2026 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905445; cv=none; b=JGbIA82ZACKu27rphZ59xzSUU+pzOXZPkcXm2eCS4y5SGnV/d2A/gKS+NhyvyY/PCutyTDy/lFaSFHbeJn4O32z6WVXz0FbnQabjFzGz4UvY369wH5UJT7bc+zPm/4aqGcDSYAkQjfnur6YnUAXOUAD6lbwE4IheJB0I+CzV0Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905445; c=relaxed/simple;
	bh=dDl5mhNMPNtKmJC6wH5MkDm70SF0R64vWe+oe4dj6iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aD1QWHfmPO7xQ51I+W8kCwJXkHIk+8QGeNHYE0QF+DeP/mTsRdnLxFY80I8wq/WfqOHql81XmGg1aLDVsPW9Y+4qfuGytZ/Attgoc+bfLVYgG5qjmu/PwJZwbesQM6xK0YtZ9PLDO79VwBj8hwTR8sz3m3HjMGYuCiMUh+1ZIvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFIutdy8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFIutdy8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74A0C2BCB8;
	Mon,  4 May 2026 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905444;
	bh=dDl5mhNMPNtKmJC6wH5MkDm70SF0R64vWe+oe4dj6iI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=rFIutdy80XTlw/pKCWplCx8xQYUEDNJIUt+hv+vu7pvRXIoKyQ8Sj6en6WxrlJYyT
	 SOBAYI0c+XOpyLQ0gKJbSQkfDMJHuasSdWZrpO4FST/bMLX/bfrqpiO9lfQ7Zss67q
	 O+gRgyUQBP0MbfPTTM63jgWuh7DjdYA0ppKVk5+kw4q1Xk/iIjSA7bRn8QdDuYCyie
	 bNLZBa90yDnlRvkyFI59/orEYjoMEUxeYBdDG241F81mPvIRKsdBcBg+BlQS/H+DV2
	 f/G/Tn3+JKVMXKEAXowCcwdWMflWwovRq7rQLEXuEz91CDF4/0J4vXXJfOEQuCCxcf
	 tfnnow99n1B/w==
Message-ID: <47b51431-fc8d-425f-a9e0-44ed75399151@kernel.org>
Date: Mon, 4 May 2026 09:37:22 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Add delay_suspend module
 argument
Content-Language: en-US
To: Daniel Gibson <daniel@gibson.sh>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260501032655.283789-1-daniel@gibson.sh>
 <20260501032655.283789-3-daniel@gibson.sh>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260501032655.283789-3-daniel@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/26 22:26, Daniel Gibson wrote:
> [You don't often get email from daniel@gibson.sh. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Enabling it delays suspend for 2.5 seconds which is known to help for
> some AMD-based Lenovo Laptops that otherwise failed to send/receive
> events for key presses or the lid switch after s2idle.
> Apparently the EC needs to do some things in the background before
> suspend or it gets into a bad state.
> 
> There are many reports of AMD-based laptops (mostly but not exclusively
> IdeaPads) about similar issues on the web; this parameter gives
> affected users an easy way to try out if their issues have the same
> root cause and to work around them until their specific device is added
> to the quirks list.
> I added a note to the parameter description encouraging users to report
> their device so it can be added to the quirks list, inspired by a
> similar request in parameter descriptions of the ideapad-laptop module.
> 
> The module parameter can be set to "1" to explicitly enable it,
> "0" to disable it even on devices that are assumed to be affected,
> or -1 (the default) to enable it if the device is assumed to be affected
> (according to fwbug_list[])
> 
> This is related to https://bugzilla.kernel.org/show_bug.cgi?id=221383
> 
> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> Tested-by: Daniel Gibson <daniel@gibson.sh>
> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c604dc7207ed..f76936036d1f 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -89,6 +89,11 @@ static bool disable_workarounds;
>   module_param(disable_workarounds, bool, 0644);
>   MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
> 
> +static int delay_suspend = -1;
> +module_param(delay_suspend, int, 0644);
> +MODULE_PARM_DESC(delay_suspend,
> +                "Delays s2idle by 2.5 seconds to work around buggy ECs, often causing keyboard issues after suspend. 0: don't delay, 1: do delay, -1 (default): let amd_pmc decide. If you need this please report this to: platform-driver-x86@vger.kernel.org");
> +
>   static struct amd_pmc_dev pmc;

Generally speaking; I don't like new module parameters.

Since this is purely for debugging purposes and is going to hopefully 
lead to a new patch; how about if it's done in debugfs?

I have a couple reasons I say this.

1. If you make it "too easy" to make the kernel command line permanent 
people won't report bugs and they never get fixed.

2. It needs to become ABI essentially forever, even if we found out some 
day this was actually something we can fix with other kernel changes 
instead.

But then the problem arguing in the direction of a module parameter is 
discoverability of this debugging knob.  And for that; I would suggest 
to add a bullet here: https://docs.kernel.org/arch/x86/amd-debugging.html

Then when people report this problem we can point them to that document 
indicating they can use it.

> 
>   static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
> @@ -634,11 +639,19 @@ static void amd_pmc_s2idle_check(void)
>          struct amd_pmc_dev *pdev = &pmc;
>          struct smu_metrics table;
>          int rc;
> -       bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
> +       bool ec_needs_sleep;
> +
> +       if (delay_suspend < 0)
> +               ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
> +       else
> +               ec_needs_sleep = delay_suspend != 0;
> 
>          /* Avoid triggering OVP */
>          if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {
> -               dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
> +               if (delay_suspend > 0)
> +                       dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1\n");

Rather than telling them to report to platform-driver-x86@ in the module 
parameter description I would suggest you should be putting it in this 
message.  I think that's what some other drivers do when they want 
people to report bugs.

> +               else
> +                       dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
>                  msleep(2500);
>          }
> 
> --
> 2.48.1
> 

