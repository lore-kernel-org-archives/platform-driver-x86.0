Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFF27E049;
	Fri, 17 Apr 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776447347; cv=none; b=Ol0ZRUqpnY9h/Q5C+NtJ+9otE3GMQotulO0PHunIolVQJE34kMu3YDUsCDxXMi2cKhq+KuzCnQeNveTJ48iF3nKg0OuGBppx4ZI3Ygw48JhILa0f7OMFwWlbhTJcuuZfSaPVPCDCGZZ4d5aXLcGX51Zj0mLKwl9cXzfHYCl2ep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776447347; c=relaxed/simple;
	bh=etaSjgYSz7HDYj1O9rGmEockmsB0IzvcoqxXzcaFVoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENSyxIi+wbaayW+IyMnSxsmuTHTZqX/mzhMp4+38Dm2ce9VShPZfPHZUyUa+SAVsvtg5N7FlqdxGyAbJsJM6bK1nbPuqPwXurrzbiMNwUHEefW3OJ/mZxhSXjRTTHmi2o8KxMfFARwkiNHVoRdmlz5JHeSB+PhOlYIfyROZXow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKOvcNke; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKOvcNke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138B7C19425;
	Fri, 17 Apr 2026 17:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776447347;
	bh=etaSjgYSz7HDYj1O9rGmEockmsB0IzvcoqxXzcaFVoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hKOvcNkeu6dVzn15vPzWZxAco22k4XtiBigBvbUFAOcjMF0IEdFd89GTTWtiz4Xh3
	 W1CVwnLPqCmJaLWpQRG9VwJ0R0zDQEw4NFwQ1NL5eFCWA9NBbaYyp7eLaoejFXFW/A
	 4o4Zfaj6521YvYxG2s6oE7EBXdh452apH66OVIpWG6tZWA7Vo92e+8ASPOk7e96ukQ
	 VRDNEQng7huNVSzvRd6tHtFFvpANJDJhQ+it9fKq14edqnMAjKK7v81MHS/08HuQ9G
	 YHzFrCmxYCNPHlZ+vxvHf3S964qAr2s8KqlBmbbWve6BHWyxWM4xb+ENzZU/9ePLGh
	 IJj/iU5Q5sTwA==
Message-ID: <a5fd7f2e-bee3-41ff-a0ca-23f5e96f1c64@kernel.org>
Date: Fri, 17 Apr 2026 19:35:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] platform/x86: intel_lpss: add resource conflict
 quirk for Dell Latitude 5285
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: lee@kernel.org, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, djrscally@gmail.com,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
 nicholas@rothemail.net
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
 <20260417163252.15603-2-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260417163252.15603-2-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Apr-26 18:32, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.
> 
> Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
> machine, matching the existing pattern used by other LPSS quirks.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
> index 63406026d..7d0964848 100644
> --- a/drivers/mfd/intel-lpss-acpi.c
> +++ b/drivers/mfd/intel-lpss-acpi.c
> @@ -13,6 +13,8 @@
>  #include <linux/ioport.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_device.h>
> @@ -52,6 +54,15 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
>  	.swnode = &spt_i2c_node,
>  };
>  
> +/* Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
> + * where ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources.
> + */
> +static const struct intel_lpss_platform_info spt_i2c_info_ignore_conflicts = {
> +	.clk_rate = 120000000,
> +	.swnode = &spt_i2c_node,
> +	.quirks = QUIRK_IGNORE_RESOURCE_CONFLICTS,
> +};
> +
>  static const struct property_entry uart_properties[] = {
>  	PROPERTY_ENTRY_U32("reg-io-width", 4),
>  	PROPERTY_ENTRY_U32("reg-shift", 2),
> @@ -172,6 +183,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
>  
> +static const struct dmi_system_id dell5285_lpss_dmi[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static int intel_lpss_acpi_probe(struct platform_device *pdev)
>  {
>  	const struct intel_lpss_platform_info *data;
> @@ -182,6 +203,17 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENODEV;
>  
> +	/* Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
> +	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
> +	 * due to a BIOS bug where both use the same SB04 variable.
> +	 */
> +	if (data == &spt_i2c_info &&
> +	    acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev), "INT3446", NULL) &&
> +	    dmi_check_system(dell5285_lpss_dmi)) {
> +		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");
> +		data = &spt_i2c_info_ignore_conflicts;
> +	}
> +
>  	info = devm_kmemdup(&pdev->dev, data, sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;

