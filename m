Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B031B838;
	Mon, 13 Apr 2026 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080988; cv=none; b=q0S6PEpH0hwvo9wuwlCsD8Tu//7lUj1NapfxGeKm7ky29l0e2lXYCibabGaK7sYf1R6Kxvef4JvadJcEoyfl6r/Se46VqrN9WDXAf0kzxm2FCMIVDE1fK9rTzmiz/sa6ZtchixpWUHmUtOXsPAzJnnTZ9OnCe/mK5v3CQMt6d48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080988; c=relaxed/simple;
	bh=MsSXT+W3VVQQZ8xNSlKhNPfWT6AUnVU8MaCq9K2L8eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0TnzyUqmwkbsPYTe4Hx0CSIjuJZDt/sAeyRiByWxfqjJDLEWfD9Fn5nwLLQPfu2hvPWkoJLp2JCo/pL3J1CnNRULs7G92jjGr+OOZ/vJkt25rFK6uQoYCuRtVqtd6jbV12aaF2qjiwX2L90fvqYLTVHFb3F7TDCdAjPTnpRgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BByiCn/Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BByiCn/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FBFC116C6;
	Mon, 13 Apr 2026 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776080987;
	bh=MsSXT+W3VVQQZ8xNSlKhNPfWT6AUnVU8MaCq9K2L8eg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BByiCn/ZvIpbcl/PWla63GJ06k6rCbD6nHUK0Ssp3j8y52G5HwLY/xKMAbdBy6kd8
	 nB2vcwdATUdBW3HCTwPhyhQxi6ozybiAfaS8PMaCEOqDCDYPtzTjgTwVvgG+QaAoGr
	 q4rs8B+2HBjir9gSSAfVAV8BQqt/XzBYevI79i+pX7nmmB2J14A6inxGw089YdCDjB
	 lFr/Fy5K5P9cqui6RQtP6JC5soOavyD3Vc19ficah2dGEP/zw1zJqpoqVW9S0ym/q9
	 7BP09HaBXnnzjl/xSfobWsGk2DsoGff82yKRELepVsBIoSbPABesMwTSV2Wz3adL58
	 qmWzmn51B2ICg==
Message-ID: <eec034b8-7fa3-4169-915d-6e7173779d6c@kernel.org>
Date: Mon, 13 Apr 2026 13:49:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: add quirk for Vivobook X7400PC
To: =?UTF-8?B?WsO8aHTDvCBFcmVuIMSwbmNla2FyYQ==?= <incekarazuhtu04@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260321104540.68643-1-incekarazuhtu04@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260321104540.68643-1-incekarazuhtu04@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thank you for your efforts to get this laptop to work properly with Linux.

On 21-Mar-26 11:45 AM, Zühtü Eren İncekara wrote:
> The ASUS Vivobook X7400PC BIOS (version 303) contains ACPI errors leading
> to namespace collisions and missing thermal symbols.
> 
> Specifically, the TcssSsdt table attempts to redefine objects in the
> TXHC scope that already exist in the DSDT, causing AE_ALREADY_EXISTS
> errors during boot and power state transitions. This leads to system
> hangs during suspend/resume cycles.
> 
> Error logs observed:
> [    0.148580] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.TXHC.RHUB.APLD], AE_ALREADY_EXISTS (20250807/dswload2-326)

I think this is your real problem, this will cause the entire SSDT this is
part of to not get loaded, which in turn is likely causing the missing 
thermal zone vars.

We are seeing cases like this were a DSDT "redefines" an existing object
instead of using Scope(path) to add new attributes to an existing object.

I believe that the proper fix here is likely to treat an error like the above
in a DSDT as a warning instead and when hitting this lookup (already done?)
and return the existing object instead of error-ing out.

Can you write an ACPICA core patch to give that a try ?




> [    4.587627] ACPI BIOS Error (bug): Could not resolve symbol [\CTDP], AE_NOT_FOUND (20250807/psargs-332)
> [    4.587636] ACPI Error: Aborting method \_SB.IETM.IDSP due to previous error (AE_NOT_FOUND) (20250807/psparse-529)
> 
> This patch introduces a model-specific quirk for the X7400PC to:
> 1. Handle the TXHC RHUB namespace collision to prevent power-state hangs.
> 2. Proactively check for missing thermal symbols to avoid ACPI
>    interpreter aborts in thermal zone methods.
> 
> Signed-off-by: Zühtü Eren İncekara <incekarazuhtu04@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 14 ++++++++++
>  drivers/platform/x86/asus-wmi.c    | 42 ++++++++++++++++++++++++++++++
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 57 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 6a62bc5b0..64ff62122 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -155,6 +155,11 @@ static struct quirk_entry quirk_asus_z13 = {
>  	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
>  };
>  
> +/* Quirk for ASUS Vivobook X7400PC to manage ACPI collisions and missing symbols */
> +static struct quirk_entry quirk_asus_x7400pc = {
> +	.x7400pc_acpi_fix = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -553,6 +558,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_z13,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS Vivobook X7400PC",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop X7400PC_N7400PC"),
> +		},
> +		.driver_data = &quirk_asus_x7400pc,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 8e3300f5c..7b8c15c1f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4599,6 +4599,48 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
>  		asus_wmi_set_devstate(ASUS_WMI_DEVID_CWAP,
>  				      asus->driver->quirks->wapf, NULL);
>  
> +	if (asus->driver->quirks->x7400pc_acpi_fix) {
> +		acpi_status status;
> +		acpi_handle handle;
> +		int i;
> +
> +		/*
> +		 * List of thermal threshold variables missing from the Vivobook X7400PC BIOS.
> +		 * These are referenced by the EC0 thermal zones but not defined in ACPI tables,
> +		 * leading to AE_NOT_FOUND errors and thermal management failures.
> +		 */
> +		static const char * const thermal_vars[] = {
> +			"CTDP", "S1CT", "S1HT", "S1PT", "S1AT",
> +			"S2CT", "S2HT", "S2PT", "S2AT",
> +			"S3CT", "S3HT", "S3PT", "S3AT",
> +			"S4CT", "S4HT", "S4PT", "S4AT"
> +		};
> +
> +		pr_info("Vivobook X7400PC: Applying ACPI quirk fixes for stability\n");
> +
> +		/*
> +		 * 1. Thermal Symbol Management (Fixes AE_NOT_FOUND)
> +		 * By checking these handles, we ensure the ACPI interpreter acknowledges
> +		 * their absence gracefully instead of aborting thermal zone methods.
> +		 */
> +		for (i = 0; i < ARRAY_SIZE(thermal_vars); i++) {
> +			status = acpi_get_handle(NULL, (char *)thermal_vars[i], &handle);
> +			if (ACPI_FAILURE(status))
> +				pr_debug("Vivobook X7400PC: Managed missing thermal symbol: %s\n",
> +					 thermal_vars[i]);
> +		}
> +
> +		/*
> +		 * 2. TXHC Collision Avoidance (Fixes AE_ALREADY_EXISTS)
> +		 * The BIOS TcssSsdt table attempts to redefine objects already present in DSDT.
> +		 * This quirk ensures the USB-C Root Hub (RHUB) is managed
> +		 * without power-state hangs.
> +		 */
> +		status = acpi_get_handle(NULL, "\\_SB.PC00.TXHC.RHUB", &handle);
> +		if (ACPI_SUCCESS(status))
> +			pr_info("Vivobook X7400PC: Managed TXHC RHUB namespace collision\n");

I'm not sure how this helps. The thing already exists (that is the whole problem
in a way), so this is just a no-op ?

Regards,

Hans



> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index 5cd4392b9..e09656b38 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -41,6 +41,7 @@ struct quirk_entry {
>  	bool wmi_force_als_set;
>  	bool wmi_ignore_fan;
>  	bool filter_i8042_e1_extended_codes;
> +	bool x7400pc_acpi_fix; /* Fix for Vivobook X7400PC ACPI namespace and thermal issues */
>  	int key_wlan_event;
>  	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
>  	int wapf;

