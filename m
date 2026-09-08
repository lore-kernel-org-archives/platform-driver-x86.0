Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC0580387;
	Tue,  8 Sep 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884609; cv=none; b=cGsm2qnikbAePFjvCyu+7Da2pi12R13ilrUt9WhFS1LJwM04871ylxPIXp6XZf5wjTdnu5QsV1m0cGUmddxFv5cTCCIwGjQlS1wcFnt2GJzt1ceCNuLaKErRG+Jq890PWGM/hzsg2gHNWhpP+HxDDqUV4ziYf3MxBTu0/tMh9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884609; c=relaxed/simple;
	bh=hub5blECutfizzP3hRGexeRhZ5of1o9nSPjFK5WWoKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcRTQSlkMeixWk6IOFye04/0BNFO3dxnEjq+2HQyQjhcZ0ExV9/rMCsuYMLdEX6iHF8fBiRQUhw54aA2nQPLeEjCOyjDZT2vtSfxW+OQOWI/h0TQJ0c1caQpe5pk8qURYyDOJ6zYUmyQTc/5AG1MSqg1G747hkzGpBd0Hxb44RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG4Y+Wt3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG4Y+Wt3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7139C1F00A3E;
	Tue,  8 Sep 2026 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788884607;
	bh=/HXYrbgclYu58RuX0QSm6jSDZFolOyDdWjKM7pSOK80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YG4Y+Wt3V5bhywm4t3ehe2TVwNWw8ZKVGEMXVpEq7x9UhJmXsHXEm7cZP9mO2b6N1
	 SGN2Ep555PkW8ZNGjU83f9gLxMbcGYPboa+pTcIH0ip1UliNWbOFMHxOf6HOfrRya/
	 6gImKNIxC525JNsQEFp15RhmAdaIIodt2yCkUwY1GiUFP1wbVBWy8n0RikTBzhaPxq
	 +WgAQDCEUqyDC8XlOWaR8Y8uBQiI2lPb2xcbzC9qjPWLnGUY3HenmwB3mE74Ay5Wjm
	 dlCh5DUmR1hvN0M9j7fSk2kg1McJLVWoTEqvMqt6MDEoc5JT3ZkkYGwt9tGPNr9GLD
	 1cwQoaHVn0EQw==
Message-ID: <331c0f09-5d81-4cb8-9728-5b13c252540e@kernel.org>
Date: Tue, 8 Sep 2026 18:23:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource
 conflict quirk
To: "D. Manresa" <dmanresa@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Thierry Chatard <tchatard@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20260831160754.9857-2-tchatard@gmail.com>
 <20260908161629.335223-1-dmanresa@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260908161629.335223-1-dmanresa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8-Sep-26 18:16, D. Manresa wrote:
> The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
> the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
> variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
> same variable, so intel_lpss_acpi fails to bind the controller with
> -EBUSY and the front camera sensor (OV5670, INT3479) is never registered
> unless acpi_enforce_resources=lax is passed.
> 
> Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
> applied to INT3446 on it as well.
> 
> Assisted-by: Claude Code:claude-fable-5-1
> Signed-off-by: D. Manresa <dmanresa@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>


Regards,

Hans



> ---
> Applies on top of "mfd: intel-lpss: add resource conflict quirk for Dell
> Latitude 5285" from Thierry Chatard's v10 series [1]. Thierry, feel free
> to fold this into v11 instead if you prefer.
> 
> The conflict was verified in the 7275 DSDT (BIOS 1.18.0): GEXP has
> OperationRegion (BAR0, SystemMemory, SB04, 0x0208) and INT3446._CRS
> returns LCRS (SMD4, SB04, SIR4). With acpi_enforce_resources=lax, which
> has the same effect as the quirk, the controller binds and the camera
> works with the board data from "platform/x86: int3472: Add TPS68470 board
> data for Dell Latitude 7275" [2]. The distribution kernel here builds
> intel-lpss-acpi in, so this exact patch has not been run yet.
> 
> [1] https://lore.kernel.org/linux-media/20260831160754.9857-2-tchatard@gmail.com/
> [2] https://lore.kernel.org/platform-driver-x86/20260908161445.334910-1-dmanresa@gmail.com/
> 
>  drivers/mfd/intel-lpss-acpi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> --- a/drivers/mfd/intel-lpss-acpi.c
> +++ b/drivers/mfd/intel-lpss-acpi.c
> @@ -191,6 +191,12 @@ static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
>  			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
> +		},
> +	},
>  	{ }
>  };
>  

