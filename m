Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1133D513;
	Sun,  8 Feb 2026 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548090; cv=none; b=oUscqhgmQfs2fwIt7klZm+pLRoF5kGPPJjpEoyG9ALwowneRU4ruUNfpZ6D3kI7U5EashjQw7MS8PY1RAKE+Pk2LQhRGAlJpHSddC6Cq7TWiRYvQ757cv9qBRmrC/ZJozGp9S/arJGAr41FEvDPvdMeP3EajIHSuxaOiAlAn3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548090; c=relaxed/simple;
	bh=xetTZkxx3L3Krj+DtiixEpZQIJOi8KR6J2CczW+2qnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qK9Hglz6mT6TWhu/3rB14rXH/GsWBplhusMo75exgJZiWCbKEkvDUR5ox8aztyWlq40JtNjms+i2dzR3AV3NrZmRQRFPisUVHwuYlb6i9TVHOciGMo2vEPsPute6e3gKfnN+CmXiWblzugYaznB474SqAYMVePXqDqZOtYcvJIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T87FoNrs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T87FoNrs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29823C4CEF7;
	Sun,  8 Feb 2026 10:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770548090;
	bh=xetTZkxx3L3Krj+DtiixEpZQIJOi8KR6J2CczW+2qnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T87FoNrsr9Th+ksxIAAK+/N4zlx0JauuzjuivjjgKAIWEqSkqvJwu88x3TO/yp8q/
	 FGagAyjK7+QTqpBF+hUb53m9J8ecidrEBCsk0pWkc5SOD2LTjS4yWxsBACG8wrZ8tc
	 onQ3MXScDy38iFDpodP5EFbOINc7GU3tSQKoVQ6n2kld7BXM5WXV1zXHE4cmKcC4wb
	 4YPnlAdN/7vyAAEjlAMcGbZKro+U/JPkfQrXCpsbayRvo2EbRQdxG28AuFcFazBtKh
	 91t7KbqBB3X6kdO0Tar8K7vKOA2Be28y+WaqFFtisIRRiE040UCyWlnQuIWDMz5itN
	 hPyYsubHCVW4A==
Message-ID: <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
Date: Sun, 8 Feb 2026 11:54:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic
 max_brightness
To: Vishnu Sankar <vishnuocv@gmail.com>, hmh@hmh.eng.br,
 derekjohn.clark@gmail.com, ilpo.jarvinen@linux.intel.com,
 mpearson-lenovo@squebb.ca
Cc: ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 vsankar@lenovo.com
References: <20260203232219.11683-1-vishnuocv@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260203232219.11683-1-vishnuocv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vishnu,

On 4-Feb-26 00:22, Vishnu Sankar wrote:
> Dynamically detect keyboard backlight capabilities and set
> max_brightness correctly (2 for old models, 3 for new models
> with Auto mode).

Thank you for your patch.

If I understand this correctly, writing 3 as level does not
make the backlight more bright then writing 2, but instead
it puts the backlight in some auto mode ?

If I've that correct then  userspace should keep seeing
a range of 0 - 2 and the special auto mode value should
be reported / be made settable through a separate als_enabled
sysfs attribute under the LED class device. See:

Documentation/ABI/testing/sysfs-platform-dell-laptop

You can add extra attributes there by setting the groups
member of the struct led_classdev, see kbd_led_groups[]
in drivers/platform/x86/dell/dell-laptop.c, except that
you should use a .is_visible callback to only show this
on hw which supports it and you only need 1 group with
1 attribute.

Regards,

Hans






> 
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 33 ++++++++++++++++++---
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index cc19fe520ea9..f670cdd1791e 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5043,6 +5043,9 @@ static struct ibm_struct video_driver_data = {
>  static enum led_brightness kbdlight_brightness;
>  static DEFINE_MUTEX(kbdlight_mutex);
>  
> +/* Maximum level supported by hardware, will be updated in init */
> +static int kbdlight_max_level = 2;
> +
>  static int kbdlight_set_level(int level)
>  {
>  	int ret = 0;
> @@ -5050,6 +5053,10 @@ static int kbdlight_set_level(int level)
>  	if (!hkey_handle)
>  		return -ENXIO;
>  
> +	/* Validate against detected max level */
> +	if (level < 0 || level > kbdlight_max_level)
> +		return -EINVAL;
> +
>  	mutex_lock(&kbdlight_mutex);
>  
>  	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
> @@ -5075,6 +5082,7 @@ static int kbdlight_get_level(void)
>  	if (status < 0)
>  		return status;
>  
> +	/* Status can be 0, 1, 2, or 3 (Auto) */
>  	return status & 0x3;
>  }
>  
> @@ -5143,7 +5151,7 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
>  static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
>  	.led_classdev = {
>  		.name		= "tpacpi::kbd_backlight",
> -		.max_brightness	= 2,
> +		.max_brightness	= 2,	/*Initial value, will be updated in init*/
>  		.flags		= LED_BRIGHT_HW_CHANGED,
>  		.brightness_set_blocking = &kbdlight_sysfs_set,
>  		.brightness_get	= &kbdlight_sysfs_get,
> @@ -5167,6 +5175,17 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
>  	kbdlight_brightness = kbdlight_sysfs_get(NULL);
>  	tp_features.kbdlight = 1;
>  
> +	/* Detect hardware capabilities and set max_brightness */
> +	if (acpi_evalf(hkey_handle, NULL, "MLCS", "dd", 3)) {
> +		/* MLCS accepts level 3 - new ThinkPad with Auto mode */
> +		kbdlight_max_level = 3;
> +		tpacpi_led_kbdlight.led_classdev.max_brightness = 3;
> +	} else {
> +		/* MLCS rejects level 3 - old ThinkPad */
> +		kbdlight_max_level = 2;
> +		tpacpi_led_kbdlight.led_classdev.max_brightness = 2;
> +	}
> +
>  	rc = led_classdev_register(&tpacpi_pdev->dev,
>  				   &tpacpi_led_kbdlight.led_classdev);
>  	if (rc < 0) {
> @@ -5201,6 +5220,7 @@ static int kbdlight_set_level_and_update(int level)
>  static int kbdlight_read(struct seq_file *m)
>  {
>  	int level;
> +	int i;
>  
>  	if (!tp_features.kbdlight) {
>  		seq_printf(m, "status:\t\tnot supported\n");
> @@ -5210,9 +5230,13 @@ static int kbdlight_read(struct seq_file *m)
>  			seq_printf(m, "status:\t\terror %d\n", level);
>  		else
>  			seq_printf(m, "status:\t\t%d\n", level);
> -		seq_printf(m, "commands:\t0, 1, 2\n");
> -	}
>  
> +		/* Show available commands based on hardware */
> +		seq_puts(m, "commands:\t0");
> +		for (i = 1; i <= tpacpi_led_kbdlight.led_classdev.max_brightness; i++)
> +			seq_printf(m, ", %d", i);
> +		seq_puts(m, "\n");
> +	}
>  	return 0;
>  }
>  
> @@ -5230,7 +5254,8 @@ static int kbdlight_write(char *buf)
>  			return res;
>  	}
>  
> -	if (level >= 3 || level < 0)
> +	/* Validate against max level */
> +	if (level < 0 || level > tpacpi_led_kbdlight.led_classdev.max_brightness)
>  		return -EINVAL;
>  
>  	return kbdlight_set_level_and_update(level);

