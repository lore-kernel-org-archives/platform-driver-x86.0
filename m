Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCA8299A87;
	Fri, 13 Feb 2026 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771001525; cv=none; b=EKjoOWVHufXfWGyIqbVQOAuvpp8X34G2wqfk2c7Pi3PfmL0Z2RXE+4Mhd+9M/f0HTsZarO3AFwdER19j1ryf9VlaUjyJxDDGRg0GKedJsECgQTQHKArcnt6vf5mflrfPuvC6y8LEGnayyE5LnmbdT3UtAEwtwjDYZN/dPj5DI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771001525; c=relaxed/simple;
	bh=wWrV3LC4eFJWkMMAXZdPfVe6l73sx48idXwDk7w9Lfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK2Qs5cvRu9wv+9v7rSBVRqDF2gTcRXSdnFFfiOgURAKeKhdSKQlvDzJKPhFoXtizkNcDwv1F1mZICY/WZXJgOLwE/bSUDEU64aMlqXfUZ0/xUJwvPSTgV+AC/4FTczcNZ7e24/3xNnPtC3JMZaLJYDbZYe/6FzuieR/iNqYvFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+11uzOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+11uzOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E21C116C6;
	Fri, 13 Feb 2026 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771001525;
	bh=wWrV3LC4eFJWkMMAXZdPfVe6l73sx48idXwDk7w9Lfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I+11uzOAPdHi40ahmzFeK+tjuqknFD2DAhz7puhQSDYVN6aLyuiSU2j1s3mwiOvmJ
	 a3bJHO3gZO0QHL8s/Ql4otWps3dLN4NIjqszHvCqjYf5tjRdeivEn/ZATKrteiiwK3
	 r70uSXVvoUSBY4Nrk5de2yr02Uu04RwPCFHu+tG7QQGXtm3WhHOQvn4o5QiJLIQk8b
	 y9mZATj9ZrE25/Gx6tnxBIJqGwL6WK1THgQOoocnMYOeb/uTFr/e+9fdhcakVs5gwH
	 df6xLIO0AWCWl9nT3/iS2dGpgBj/YMc2c3dcOozi1INrg5LkZKQ5OoT2L084KuhWeA
	 Ge3n2GWgtQVpg==
Message-ID: <614aea0f-d17b-4a6b-8b2a-168fb387541e@kernel.org>
Date: Fri, 13 Feb 2026 17:52:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to
 dmi_vgbs_allow_list
To: Peter Metz <peter.metz@unarin.com>, alexhung@gmail.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213044627.203638-1-peter.metz@unarin.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260213044627.203638-1-peter.metz@unarin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Feb-26 05:46, Peter Metz wrote:
> The Dell 14 Plus 2-in-1 (model DB04250) requires the VGBS allow list
> entry to correctly enable the tablet mode switch. Without this, the
> chassis state is not reported, and the hinge rotation only emits
> unknown scancodes.
> 
> Verified on Dell 14 Plus 2-in-1 DB04250.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221090
> Signed-off-by: Peter Metz <peter.metz@unarin.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/platform/x86/intel/hid.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 560cc0631..5b475a096 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -189,6 +189,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 12 Tablet RA02260"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14 Plus 2-in-1 DB04250"),
> +		},
> +	},
>  	{ }
>  };
>  

