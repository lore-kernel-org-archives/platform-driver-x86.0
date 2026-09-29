Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076513D5661;
	Tue, 29 Sep 2026 18:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707586; cv=none; b=WeQtQyalFWhilMbJGHoBFhQN6cuF5efJK5lO8CgEv9yBfAGy3yjPoFbtjsq172EFFjPzK/R9lZXCd/hpjogJfwjkpIK7Pd23DIsVXHAkF1/jdpqaZpybesHlfqcL3SpXRZwPuRtcyXI+QuJVIenoxRw5bT4Liw3Fgolh88Q/s7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707586; c=relaxed/simple;
	bh=qQ0lffp+SG62vr/DVXvAlZcQhAoJ5fcbKCSvj9Ov/RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r65hdD0VdYFc6rkOCOw9i+Xf4yaWqETybskaYQvgK8r3fcQzwu5IDusSnel1sFuM1IgZ+CGyK55ACb6wpEurH+MLG18zAHw49fmlNbB7DdTykSI3SjoNBC2o/4edKs3YNf/lbolKeRgopfYKcYtH1fVlFnWJWWQ4ffql7ynoZw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5qIHnd7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5qIHnd7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BB61F000FF;
	Tue, 29 Sep 2026 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790707584;
	bh=GNBP1B5ElGW/DnEs/JpWQBDvoFFLmyeNzTzUB9qB/Ro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Y5qIHnd72D+dXyes8qI9UbjisMK2FQV7LUxMa1hlBSsy8IsjpRtwsaDCNh1Mrl6eD
	 aycixNE8OjVphXGEDaXeFM2w0AldoMC/5zKnDMbCUvdnCiThaKs92dlkhV5/5XGkj5
	 XCOJO2gFouqiVRUB4ZpODLQuKNhTVmvqOV6Ipl9lwPE/Grju3ePqB/fokK+bk7E19d
	 wut3FjwaVonhQKAopL+oUIi0EQD8XBNB9H0rU2Xp0AfYy/u9TEaTqO62NngFUaWp/C
	 WV1bSorXCIZvHfCzUcQc2oMpREd1PK9lSjIpKJQlJSizSD6fA06Jxso8cASp3EEuTH
	 CFTRODSdvPtTA==
Message-ID: <206e75ee-7133-4fd8-964d-1e507002f6cb@kernel.org>
Date: Tue, 29 Sep 2026 13:46:22 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Add spurious_8042 to ASUS ROG Flow
 Z13 GZ302EA
Content-Language: en-US
To: Matthew Schwartz <matthew.schwartz@linux.dev>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929181655.26105-1-matthew.schwartz@linux.dev>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260929181655.26105-1-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/26 13:16, Matthew Schwartz wrote:
> The ASUS ROG Flow Z13 (GZ302EA/GZ302EAC) wakes up from suspend-to-idle
> without any user input. With PM debug messages enabled, each unexpected
> wakeup shows the EC raising IRQ1 at the same time as the ACPI SCI:
> 
>    PM: Triggering wakeup from IRQ 9
>    PM: Triggering wakeup from IRQ 1
>    ACPI: EC: Query(0xa3) started
>    ACPI: PM: Wakeup after ACPI Notify sync
> 
> EC query 0xa3 only notifies the battery of a status change, which
> happens when it transitions between Charging and Full while on AC.
> The ACPI core correctly treats that as a non-wakeup event and cancels
> the SCI wakeup, but the IRQ1 wakeup remains pending and resumes the
> system. i8042 debugging confirms that the keyboard controller has no
> data at that point ("Interrupt 1, without any data").
> 
> The detachable keyboard on this device is a USB device, so disabling
> the i8042 wakeup source does not result in any functional loss. With
> serio0 wakeup disabled, the same battery event is processed during
> suspend-to-idle and the system stays asleep.
> 
> Add the spurious_8042 quirk for it. The GZ302EAC reports sys_vendor
> "ASUS" while the GZ302EA reports "ASUSTeK COMPUTER INC.", so match on
> "ASUS" and on the "GZ302EA" board name to cover both models.
> 
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Good analysis of this issue.  It sounds like the right direction for 
this problem.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index 09a30f333759..ff5c90510c0c 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -143,6 +143,14 @@ static const struct dmi_system_id fwbug_list[] = {
>   			DMI_MATCH(DMI_BOARD_NAME, "RC73YA"),
>   		}
>   	},
> +	{
> +		.ident = "ASUS ROG Flow Z13 GZ302EA",
> +		.driver_data = &quirk_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "GZ302EA"),
> +		}
> +	},
>   	/* https://bugzilla.kernel.org/show_bug.cgi?id=218024 */
>   	{
>   		.ident = "V14 G4 AMN",

