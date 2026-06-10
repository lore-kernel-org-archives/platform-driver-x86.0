Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17913ACEE9;
	Wed, 10 Jun 2026 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080620; cv=none; b=mO6JF8tdJ0js/BEOSeS52KPCYNFQBiPczPW8UaOEOpFdtv3l+RowJmgGDZ20NzY2rLlI7PpXOV8mNaeKcKXmZEtiO1hLT066EjUutI0wmw3VOIABfCRqYZU9q79GFhb+SyzTptxQ7f8hiz8+iNO7/m2WMost30ULSg/2KDIGOxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080620; c=relaxed/simple;
	bh=VZYJVcswh86nonz3W+T8jOCr5j6sOjcMyhQArXCh7ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQ8f/iP3w2IIvoDQlQtHOwDmk3OIE1x0HDH5EOsqWmCUrKgmpg6vyvw3/tn2hwydhzXvQjXgSXHGWt1woPpoa5b+SdrW94pyA6u3WzIRbYLoDbjYUipmuZ3J4x4gzNJK3GSd9QLrkqYaSNbI79R+cByhNomhXIKwLwPlkI2tFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEhd/+S6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEhd/+S6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DC61F00893;
	Wed, 10 Jun 2026 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781080619;
	bh=avjVV5YkLzGl3Drs5EsLVeHMu1BkJHW9LpvWQ3L7tQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hEhd/+S6i4XsTa7xyHP9go8wWsK0XJM5UHFYldWny8N418znSbJ1tyY0YTbACy2ut
	 tUhSOB2AI7DZKiveUrmSFxOtLubquy1V0lQL+feX3lejTFrcDf2Str+WJ4wffShLYT
	 XuOn2+dGfy2nzwwzLjU6T0Gafd5cgM5BH3JVAzBIjWnVOZR1esO+AcG6lvIKBozi5i
	 KTGNpmEIwLwLssOWhBRUd53F0q7s/Xqxqc/lSR0xrJrRpF5S5CoC75d4J7ITPgTuBA
	 Hf2Qljx5jfJ9aGes6eVyv9ePDdVwB4v6UhVmP3avgEsPCYzUVHlP4s20eKs4//Jvas
	 BTHTksSDwH05w==
Message-ID: <57f139a9-e724-474c-8d77-080c4e61c134@kernel.org>
Date: Wed, 10 Jun 2026 10:36:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: intel-hid: Add HP ProBook x360 440 G1 to
 button_array_table
To: Nikolay Metchev <nikolaymetchev@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alex Hung <alexhung@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6f0e5451-0ce5-d4c2-8ade-3489701c9df6@linux.intel.com>
 <20260609213309.445019-1-nikolaymetchev@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260609213309.445019-1-nikolaymetchev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Jun-26 23:33, Nikolay Metchev wrote:
> The volume rocker buttons on the HP ProBook x360 440 G1 convertible emit
> events 0xc4-0xc7 via the intel-hid ACPI device (INT33D5). These codes are
> only present in intel_array_keymap, which is used when the "5 button
> array" input device exists. On this machine button_array_present()
> returns false because the firmware does not advertise the array through
> the HEBC method, so notify_handler() routes the events to a NULL
> priv->array and they are dropped as "unknown event 0xc4". As a result
> the side volume keys do nothing.
> 
> Add the machine to button_array_table so the array device is created and
> the volume rocker emits KEY_VOLUMEUP / KEY_VOLUMEDOWN. This is equivalent
> to booting with the enable_5_button_array=1 module parameter, which was
> used to confirm the fix on the affected hardware.
> 
> Signed-off-by: Nikolay Metchev <nikolaymetchev@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
> Changes since v1:
> - Resend the patch inline instead of as an attachment, as requested.
> - No code changes.
> 
>  drivers/platform/x86/intel/hid.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 085093506..73874d436 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -156,6 +156,13 @@ static const struct dmi_system_id button_array_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 4"),
>  		},
>  	},
> +	{
> +		.ident = "HP ProBook x360 440 G1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP ProBook x360 440 G1"),
> +		},
> +	},
>  	{ }
>  };
>  

