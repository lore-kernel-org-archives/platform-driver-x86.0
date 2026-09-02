Received: from mta1.migadu.com (out-62.mta1.migadu.com [95.215.58.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6832749C4C4
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 18:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374463; cv=none; b=hYj/WbciidLeihRykSLBDPnLncIC4+uutoy0uS/eW21rdBHeu8F/EECwy01kjuG1Baaf4YCcoi8EphLRzIQuzHFYVvWkTJTBbPdoPUpU5iDcR+/5mUaDmAKgPV/+cK0ohYg1vcdfCo/aP4dh5ay7HDP9XFmNuWw3XkuBypAM7gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374463; c=relaxed/simple;
	bh=B8vD/12HLW8hGA5TFnmzP4fqW6kS8rgzgpxQr3bxrpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8+uMIZqnitTslSHm9W7bEBGQp9yrWr0MjXFMX+6PQHDzQJ8yWZ2iUYHpFHhRdyjLZVXgtm6AnP3TauCFFBWCJu4GmHY4ddXS4AdXLzq/UhZ09NP4DYKFb1oILVlXsZLqEEFVuIFYhF5F4AdB336OGeBmf2ioGSNZgrRQ6bVUJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sGJlKwTo; arc=none smtp.client-ip=95.215.58.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sGJlKwTo"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B8vD/12HLW8hGA5TFnmzP4fqW6kS8rgzgpxQr3bxrpQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788374459; v=1; x=1788979259;
 b=sGJlKwToquqAF0V3qnPHxtZaryDvzER6MZTm5FYur6TPMa27GJAfFPonnSzwEpCSFAtPqDr6
 7Q32gGuoN/bRsvVUnLEcKb09DbfMJyGFkNLB1RVZ7QtJkxx+TWsM3oQ4r9qnvB/XyEP1EceLIpd
 7TTGdG5ThOW4u6f+EMOxYuM0=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 261edd59b917f023;
	Wed, 02 Sep 2026 18:40:58 +0000
X-Mizu-Trace-ID: 261edd59b917f023
X-Migadu-Flow: FLOW_OUT
Message-ID: <6667b5f2-357c-4104-9dc8-c68a2d331796@linux.dev>
Date: Wed, 2 Sep 2026 20:40:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] platform/x86: asus-wmi: enable TUF RGB state for
 FA401 via DMI quirk
To: Idotoho Reimon Simanjuntak <idotohors@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Corentin Chary <corentin.chary@gmail.com>
References: <20260902174718.16228-1-idotohors@gmail.com>
 <20260902174718.16228-3-idotohors@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260902174718.16228-3-idotohors@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/2/26 19:47, Idotoho Reimon Simanjuntak wrote:
> The FA401 (TUF Gaming A14) series does not expose the TUF RGB state
> WMI device (0x00100057) through the standard DSTS probe, yet the EC
> does support the keyboard backlight power-state flags needed for sleep
> strobe functionality.
>
> Add a DMI-based quirk in asus-nb-wmi.c that matches on DMI_SYS_VENDOR
> "ASUSTeK COMPUTER INC." and DMI_BOARD_NAME "FA401", setting
> kbd_rgb_state_available = true in struct quirk_entry.
>
> In asus_wmi_add(), change the kbd_rgb_state_available assignment to
> also consider driver->quirks->kbd_rgb_state_available, so models with
> this quirk get the RGB state sysfs attributes even when DSTS probing
> fails.
>
> No PM/sleep/backlight changes are included in this commit; those will
> be addressed separately once the RGB state interface is available.
I would say get rid of this: doesn't add any value and in general doesn't
conform too well with the rule as "write commit messages as if you were
telling git what to do".

With that phrase removed

Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    |  4 +++-
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index aeb461b16..47ceb6e46 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -155,6 +155,10 @@ static struct quirk_entry quirk_asus_z13 = {
>  	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
>  };
>  
> +static struct quirk_entry quirk_asus_fa401 = {
> +	.kbd_rgb_state_available = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_z13,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUSTeK COMPUTER INC. FA401",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_BOARD_NAME, "FA401"),
> +		},
> +		.driver_data = &quirk_asus_fa401,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index efc730c2c..e7b2402c9 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -5181,7 +5181,9 @@ static int asus_wmi_add(struct platform_device *pdev)
>  
>  	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>  	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
> -	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> +	asus->kbd_rgb_state_available =
> +		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE) ||
> +		asus->driver->quirks->kbd_rgb_state_available;
>  
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>  		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index 5cd4392b9..9bc0b6145 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -52,6 +52,7 @@ struct quirk_entry {
>  	 */
>  	int no_display_toggle;
>  	u32 xusb2pr;
> +	bool kbd_rgb_state_available;
>  };
>  
>  struct asus_wmi_driver {
