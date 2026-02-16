Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FCF2E2F0E;
	Mon, 16 Feb 2026 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771267263; cv=none; b=bxmU2ElcaNFaFHSRkOY/5m86iTqCDBRiSWtemVG4j9vvWCTwNkNXlND/s4GJ/DJpCNBgLzNVbYjkG2/ZUefnyP1Rsi7LKztnpyHm7OUGBj4QrzJ3qrSz0oRi9qeMZkTuS14z/2ndbIsnJRnjo7lQJG61/2MtzVOjGFhZdpBM2T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771267263; c=relaxed/simple;
	bh=3WXxRDZfQSNvB1J7O6gqF/R0HFnROSgEMFX6E7hdgX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNqNzy+rCpV/ZgZKE45BrS0pzClVxq0+GXP/8QwOiuHBO8FV3vnTlt6NebbIHV3gTOx1NzodB7nUfilBK6/8TUvLkVAxsaOjAk44N6EMfUOoWt9Jw3LsJJpsoUo4+V0A6tY9mbSrn8zC7i99PGVDRuhYzbcP0eJHn9QgFLhzfls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8QADAXB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8QADAXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0474C116C6;
	Mon, 16 Feb 2026 18:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771267263;
	bh=3WXxRDZfQSNvB1J7O6gqF/R0HFnROSgEMFX6E7hdgX8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y8QADAXBfch2wR4Cisma/jojBm/TOgqBp/evlNeAnwG1YVZadRCnkYIeaSwIKfguS
	 Ug0WWZ4C/Xi9O8kxneSxKIPJcB9ByTLhG4LIpVuaySfr98w/n35HYhQiQlCqb9NlU1
	 GdWaJHgSsEOdA7962M/WZo6rTq7apKQt1Hlztdk+yx/Mrlgwvc9KcPHhSfUsO0/v+g
	 GZEY2xkJWn7fOjCiWYztk/yhoEO9jAe2QACBrlzT08OV9DT30IJXNYyFb5oTOEMJUK
	 VlL+kprGJacLSJn2nWS/Rx6uj4WaHrPEjiwiR5PAskHkEWyKqD/DXqQGkIy8uVp7ql
	 hZYqMX5ezJtoA==
Message-ID: <6939a5e7-061f-41da-a7be-2f6341096ec9@kernel.org>
Date: Mon, 16 Feb 2026 19:40:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: intel-hid: Add Dell 16 Plus 2-in-1 to
 dmi_vgbs_allow_list
To: Peter Metz <peter.metz@unarin.com>
Cc: alexhung@gmail.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 23edip@gmail.com
References: <21babe2b-89ed-419c-ac08-e9130ba576b4@kernel.org>
 <20260213230310.299974-1-peter.metz@unarin.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260213230310.299974-1-peter.metz@unarin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Feb-26 23:58, Peter Metz wrote:
> The Dell 16 Plus 2-in-1 (model DB06250) requires the VGBS allow list
> entry to correctly enable the tablet mode switch. Without this, the
> chassis state is not reported, and the hinge rotation only emits
> unknown scancodes.
> 
> Link: https://lore.kernel.org/platform-driver-x86/CAP3yi-BWm0LqkhfzTrGy5n-KQ=3+T8eRMoR+Z+7Ke2VJB43kTA@mail.gmail.com/
> Signed-off-by: Peter Metz <peter.metz@unarin.com>
> ---
> Hi Hans,
> 
> Thanks for the review! I'd be happy to help out with more fixes.
> Here is the follow-up patch for the Dell 16 Plus (DB06250)
> to address that report.

Thank you!

patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




>  drivers/platform/x86/intel/hid.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 60ce32f591ff..a8ae2dba7ffd 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -195,6 +195,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14 Plus 2-in-1 DB04250"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 16 Plus 2-in-1 DB06250"),
> +		},
> +	},
>  	{ }
>  };
>  

