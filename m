Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4F63054E7
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Sep 2025 18:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757356494; cv=none; b=jKAKGmkLwENudaeJMWQsRiLq67IFWyKeySWJ7StEu0druhmRKTfyfH9DH/HAHZqxxVwi8twuBpBZ2o8hN5bzW6bGx+ah/zngtu/L6XWVJHpeCaTYBO6/IQIzjmDTTOQJ9PXwCBhMU9kncxUTsDAsm01Z+/CgpLghhmdcPinVhNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757356494; c=relaxed/simple;
	bh=PAlmJvsmZ46EvvydE/Qv2VdG/HalsbRiL/sQ6GHnA0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=E2m5/0/titzUOGDss78AKY9B3tG5ZXlzAkxW1/mWlyxKYtTPq/qrGhPZWmI984E3bCOoikFP2wYcrBb4wpCLxHY+EvB/IRhaANKXbTnPxvl7c6N27gFNWKIIt+3E8Zr90zA199iTCJW2p1k6PYybCLpRNBsOBJpbCuDPB3UaZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PveKNxtK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PveKNxtK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E964C4CEF1;
	Mon,  8 Sep 2025 18:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757356493;
	bh=PAlmJvsmZ46EvvydE/Qv2VdG/HalsbRiL/sQ6GHnA0U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PveKNxtKnSLRefeyBVKwGVEj7sT6tK5gmLdQuvDZ7DDcHFIvvadg8wH6vhxWH1tAo
	 RLhA91CoA3yLDtUpQG/IPuV7Gm+GvunAVXqebg5/ysINmdzVHBTc+vO2f+1q4g+GPe
	 8XRGwtZ1a+M37hKfKThhvgU6E2cvOat/5YJxISMozSeDOMkRqabM2SR4Z1G/RxmLiT
	 f9rKR5QVFghVItiXcG66wra04Pb7+ZC1dVWoofBxObpbXH9nXe3DVEfbhY/AmI3vaZ
	 WozRFH1zRfXhWhzyJCFjocOQuFMz9LszJRfiffXPu6AYPV/Vf8gS16rJGLxnj9FxsY
	 +4yOTOTpEi80g==
Message-ID: <87ba801a-1467-42c3-9785-663e6f8b2bc8@kernel.org>
Date: Mon, 8 Sep 2025 13:34:52 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add MECHREVO Yilong15Pro to
 spurious_8042 list
To: aprilgrimoire <aprilgrimoire@proton.me>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <IvSc_IN5Pa0wRXElTk_fEl-cTpMZxg6TCQk_7aRUkTd9vJUp_ZeC0NdXZ0z6Tn7B-XiqqqQvCH65lq6FqhuECBMEYWcHQmWm1Jo7Br8kpeg=@proton.me>
Content-Language: en-US
From: "Mario Limonciello (kernel.org)" <superm1@kernel.org>
In-Reply-To: <IvSc_IN5Pa0wRXElTk_fEl-cTpMZxg6TCQk_7aRUkTd9vJUp_ZeC0NdXZ0z6Tn7B-XiqqqQvCH65lq6FqhuECBMEYWcHQmWm1Jo7Br8kpeg=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/7/2025 4:06 AM, aprilgrimoire wrote:
> The firmware of Mechrevo Yilong15Pro emits a spurious keyboard interrupt on
> events including closing the lid. When a user closes the lid on an already
> suspended system this causes the system to wake up.
> Add Mechrevo Yilong15Pro Series (GM5HG7A) to the list of quirk
> spurious_8042 to work around this issue.
> 
> Link: https://lore.kernel.org/linux-pm/6ww4uu6Gl4F5n6VY5dl1ufASfKzs4DhMxAN8BuqUpCoqU3PQukVSVSBCl_lKIzkQ-S8kt1acPd58eyolhkWN32lMLFj4ViI0Tdu2jwhnYZ8=@proton.me/
> 
> Signed-off-by: April Grimoire <aprilgrimoire@proton.me>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
> v2:
>   - Fix subject prefix and wording.
>   - Rebase onto platform-drivers-x86 fixes branch.
> 
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index 18fb44139d..4d0a38e06f 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -239,6 +239,14 @@ static const struct dmi_system_id fwbug_list[] = {
>   			DMI_MATCH(DMI_BOARD_NAME, "WUJIE14-GX4HRXL"),
>   		}
>   	},
> +	{
> +		.ident = "MECHREVO Yilong15Pro Series GM5HG7A",
> +		.driver_data = &quirk_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Yilong15Pro Series GM5HG7A"),
> +		}
> +	},
>   	/* https://bugzilla.kernel.org/show_bug.cgi?id=220116 */
>   	{
>   		.ident = "PCSpecialist Lafite Pro V 14M",

