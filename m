Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B02DC792;
	Thu,  1 Jan 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767280667; cv=none; b=RsGJncPyCf8xwvnG/ia88DnTvmeqoNtc/ezQVhWXl4mKxnyKZINFcRxT7NluTVgP1C9h6XhYzG4GLZpiKZPTns2jTQWxw54fFpOftx6sVxkmKL7s97DJgzqerei8W5fnG5EIFc9Hc2hewYSeCzj8PxIw+3uFON4Znx+Fzr3MoOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767280667; c=relaxed/simple;
	bh=AGthoQ83Qk02LCLkAGfOhb1kyjZXaS0KB/N89wTI5n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7yTC65+6QwUHxNsOmKvJy+XYl+0jKQzOj+fMQ6Q8sYmA6OPb3Mw7wmsq22TI9vw59tocbApK3uLu9MMcxNxJ4DxZM+HcACC9HD7g21+VXmYNpcBTLDlU8XnPb9XDMW/ZHo44d5AtEMaDLKSAqiOkJHEXYiiA1HpubrQ8VmE9es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwZ4nebh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwZ4nebh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD2DC4CEF7;
	Thu,  1 Jan 2026 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767280667;
	bh=AGthoQ83Qk02LCLkAGfOhb1kyjZXaS0KB/N89wTI5n4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gwZ4nebhSApAzhMgFPxtbJXP7A4d1PcZBhjFmFQgBI8RS2If5bGoz5wSYwinMUOGa
	 7hNTIpqmcS1lNsg8mi3ShOuuneaBS1UfTBkhmbhOe6MDqHMC6GLcBAPbMFCtEqQyj6
	 r+FQbA3vgdVHr/xIrBqDuMxa61xjhUrnAOeLDkDMrOoui5Xm5exKON0wqaOsjfHTiP
	 A0Wyv3EF2Adhz8Tnmj2fxgwIUR1WMQ2qBtTJ7Xt4mhXV1cnPj/SAKZgEBbh9DkobYQ
	 8xT9mEoR0ZwVSDYgFGtTDP/F5+SNKbri9LuhO1AfSVayfPuykdcAFB2sGLeXr2G3ij
	 o920RmStLoqOg==
Message-ID: <01796d96-e164-4b3d-8781-fda8cc7881c0@kernel.org>
Date: Thu, 1 Jan 2026 16:17:43 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: yogabook: Clean up code style
To: Benjamin Philip <benjamin.philip495@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260101141657.54258-1-benjamin.philip495@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260101141657.54258-1-benjamin.philip495@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1-Jan-26 15:16, Benjamin Philip wrote:
> This commit cleans up the following checks flagged by checkpatch in
> yogabook.c:
> 
> - CHECK: Prefer kernel type 'u8' over 'uint8_t'
> - CHECK: Comparison to NULL could be written "!data"
> - CHECK: line length of ... exceeds 100 columns
> 
> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> ---
> Changes in v2:
>   - Drop cleanup for "CHECK: Unnecessary parentheses around '...'" 

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> 
>  drivers/platform/x86/lenovo/yogabook.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/yogabook.c b/drivers/platform/x86/lenovo/yogabook.c
> index 31b298dc5046..69887de36c9b 100644
> --- a/drivers/platform/x86/lenovo/yogabook.c
> +++ b/drivers/platform/x86/lenovo/yogabook.c
> @@ -57,7 +57,7 @@ struct yogabook_data {
>  	struct work_struct work;
>  	struct led_classdev kbd_bl_led;
>  	unsigned long flags;
> -	uint8_t brightness;
> +	u8 brightness;
>  };
>  
>  static void yogabook_work(struct work_struct *work)
> @@ -338,16 +338,18 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
>  	int r;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -	if (data == NULL)
> +	if (!data)
>  		return -ENOMEM;
>  
>  	data->kbd_adev = acpi_dev_get_first_match_dev("GDIX1001", NULL, -1);
>  	if (!data->kbd_adev)
> -		return dev_err_probe(dev, -ENODEV, "Cannot find the touchpad device in ACPI tables\n");
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Cannot find the touchpad device in ACPI tables\n");
>  
>  	data->dig_adev = acpi_dev_get_first_match_dev("WCOM0019", NULL, -1);
>  	if (!data->dig_adev) {
> -		r = dev_err_probe(dev, -ENODEV, "Cannot find the digitizer device in ACPI tables\n");
> +		r = dev_err_probe(dev, -ENODEV,
> +				  "Cannot find the digitizer device in ACPI tables\n");
>  		goto error_put_devs;
>  	}
>  
> @@ -453,7 +455,7 @@ static int yogabook_pdev_probe(struct platform_device *pdev)
>  	int r;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -	if (data == NULL)
> +	if (!data)
>  		return -ENOMEM;
>  
>  	data->kbd_dev = bus_find_device_by_name(&i2c_bus_type, NULL, "i2c-goodix_ts");

