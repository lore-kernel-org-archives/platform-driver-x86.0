Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC1312837;
	Wed, 11 Feb 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770811285; cv=none; b=QKAWcmlrcoAify5J5obwk1WLkCkACoTk+Ys8L4y1ihMN6c23Rou9RejfER5ZdMTVhPSP1akPEmO+kCsFvxx0HFk/2WggX4inJFq3pEWq3jL9vCmJBy8ZGdhwj5JH5KD4mlKF+pzPbmGC6bHWgyRHO7a6rX5hD/UsWc4BNEFcIjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770811285; c=relaxed/simple;
	bh=c7Qny4ppxyvbIOmPjwfXHM1+NDzTPzDVRGUPiQ05juo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TX10JmpeSukJbQo9J3I6kq1cAhXwDKs30R8YQ+ZsIfhG9LmSh4cCp1l6r+BnBo8c0FpF0EyKrcuxBeB6eTgT8F3qTsi2F9jD8G9ZpxgoE3wlstp+DwrZp3hYgtk8I4fs6TNG2dctECNRc0Hv8Bw4RYBhkFeWQx1OWF2weMwKdFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTAlvILX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTAlvILX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8FAC19421;
	Wed, 11 Feb 2026 12:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770811284;
	bh=c7Qny4ppxyvbIOmPjwfXHM1+NDzTPzDVRGUPiQ05juo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YTAlvILXS4IMkLXvnxNsuXf8eInAqKi/dEG/4NLottT70KDLLVGLmcvI+UVqsgmjL
	 7L0Mk38k6qq654MA0NC7Go0NqUn/LDvWsKJebsIg+hZyyXzAFbGtyVWbfBeHedwkpu
	 gMR0sY8c0slG4N8DxUzXVkPiVCKcrsOXo/7nrY3/tAcuhkXqQJos2Tr+u9LmxGx4XU
	 WcVqrm7G4PzNpfEoyxeSIywsC9QYFVlt38g5ek4q3y+YhyXKEVOAcr5Q7XQopHNtSJ
	 rDJ4NQfALa/Y5YQmk7Pa93DMQt8Y0UpRR9ITUIaIM4KpeEHy3jKAqPNXlGqoN3OfmA
	 zlZrC+bz0MjPw==
Message-ID: <44e9e403-55f6-4601-9ba5-991619d09d88@kernel.org>
Date: Wed, 11 Feb 2026 13:01:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260211092640.3231-1-atharvatiwarilinuxdev@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260211092640.3231-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Feb-26 10:26, Atharva Tiwari wrote:
> Make apple-gmux save the current backlight brightness to EFI on shutdown,
> so the brightness level is preserved across reboots.
> 
> (tested on iMac20,1)
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
> v3:
> - Only save the brightness when it differs from the boot brightness.

Thanks this looks much better.

> v2:
> - Used correct size for efi_data
> ---
>  drivers/platform/x86/apple-gmux.c | 61 +++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 1417e230edbd..08b9f48c11b8 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -22,6 +22,7 @@
>  #include <linux/pci.h>
>  #include <linux/vga_switcheroo.h>
>  #include <linux/debugfs.h>
> +#include <linux/efi.h>
>  #include <acpi/video.h>
>  #include <asm/io.h>
>  
> @@ -78,6 +79,11 @@ struct apple_gmux_data {
>  	/* debugfs data */
>  	u8 selected_port;
>  	struct dentry *debug_dentry;
> +
> +	/* efi data */
> +	efi_status_t efi_status;
> +	u32 efi_attr;
> +	u16 efi_data;
>  };
>  
>  static struct apple_gmux_data *apple_gmux_data;
> @@ -107,6 +113,9 @@ struct apple_gmux_config {
>  
>  # define MMIO_GMUX_MAX_BRIGHTNESS	0xffff
>  
> +#define EFI_BRIGHTNESS_NAME		L"backlight-level"
> +#define EFI_BRIGHTNESS_GUID		EFI_GUID(0x7c436110, 0xab2a, 0x4bbb, 0xa8, 0x80, 0xfe, 0x41, 0x99, 0x5c, 0x9f, 0x82)
> +
>  static u8 gmux_pio_read8(struct apple_gmux_data *gmux_data, int port)
>  {
>  	return inb(gmux_data->iostart + port);
> @@ -751,6 +760,35 @@ static void gmux_fini_debugfs(struct apple_gmux_data *gmux_data)
>  	debugfs_remove_recursive(gmux_data->debug_dentry);
>  }
>  
> +#ifdef CONFIG_EFI
> +MODULE_IMPORT_NS("EFIVAR");
> +static void gmux_init_efi(struct apple_gmux_data *gmux_data)
> +{
> +	unsigned long size = sizeof(gmux_data->efi_data);
> +
> +	gmux_data->efi_status = EFI_UNSUPPORTED;
> +
> +	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
> +		return;
> +
> +	if (efivar_lock())
> +		return;
> +
> +	gmux_data->efi_status = efivar_get_variable(EFI_BRIGHTNESS_NAME, &EFI_BRIGHTNESS_GUID,
> +					&gmux_data->efi_attr, &size, &gmux_data->efi_data);
> +
> +	efivar_unlock();
> +}
> +
> +#else /* CONFIG_EFI */
> +
> +static void gmux_init_efi(struct apple_gmux_data *gmux_data)
> +{
> +	return;
> +}
> +
> +#endif /* CONFIG_EFI */
> +
>  static int gmux_suspend(struct device *dev)
>  {
>  	struct pnp_dev *pnp = to_pnp_dev(dev);
> @@ -960,6 +998,8 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  	}
>  
>  	gmux_init_debugfs(gmux_data);
> +	gmux_init_efi(gmux_data);
> +
>  	return 0;
>  
>  err_register_handler:
> @@ -1012,6 +1052,26 @@ static void gmux_remove(struct pnp_dev *pnp)
>  	kfree(gmux_data);
>  }
>  
> +static void gmux_shutdown(struct pnp_dev *pnp)
> +{
> +	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
> +	u16 brightness = (u16)gmux_get_brightness(gmux_data->bdev);
> +
> +#ifdef CONFIG_EFI
> +	if (gmux_data->efi_status == EFI_SUCCESS && gmux_data->efi_data != brightness) {
> +		gmux_data->efi_status = efivar_set_variable(EFI_BRIGHTNESS_NAME,
> +						&EFI_BRIGHTNESS_GUID,
> +						gmux_data->efi_attr,
> +						sizeof(brightness),
> +						&brightness);


I think this is missing efivar_lock() + unlock() calls ?

Regards,

Hans




> +		if (gmux_data->efi_status != EFI_SUCCESS)
> +			pr_info("Unable to save brightness: 0x%lx\n", gmux_data->efi_status);
> +	}
> +#endif /* CONFIG_EFI */
> +
> +	gmux_remove(pnp);
> +}
> +
>  static const struct pnp_device_id gmux_device_ids[] = {
>  	{GMUX_ACPI_HID, 0},
>  	{"", 0}
> @@ -1026,6 +1086,7 @@ static struct pnp_driver gmux_pnp_driver = {
>  	.name		= "apple-gmux",
>  	.probe		= gmux_probe,
>  	.remove		= gmux_remove,
> +	.shutdown	= gmux_shutdown,
>  	.id_table	= gmux_device_ids,
>  	.driver		= {
>  			.pm = &gmux_dev_pm_ops,

