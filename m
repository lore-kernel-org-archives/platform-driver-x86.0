Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED9376A1A
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974617; cv=none; b=P4ppH11k6QSYmoL5KvbKHOj/XHq9JxxFAuMqDMdBoG5ZmnfQfZEH5MSuhVfZgRSVBSvuXyi59eII+VQTpYzP/XbHohPir2SQKWnqbFgvd0pImmInUcFKhYO4Qx7eaCvJAilSFjutcal2RxscaPOvzx6x8de0z3k+u55ouqwmMFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974617; c=relaxed/simple;
	bh=xPew0eVo7R/zYVDxxfBW9xCrccXOy5ezHUnX46aDpPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCy3fxmef6GZ8lGEwlpSLpplf5s0cAJp7n5zwDOLMcdHvMBhXPM0Ot29luQeGo0+SJ01gZnb9YchDvJmJjTFnIJ7ljXO6oWwEWdIUGUr4na0BiD3yx/TMEtq96fCsxoFBImqfh9idbV3t1YiHAfzDkTEnbTXRrxGfHwNUW9S+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UuCPy9uS; arc=none smtp.client-ip=95.215.58.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UuCPy9uS"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xPew0eVo7R/zYVDxxfBW9xCrccXOy5ezHUnX46aDpPI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788974613; v=1; x=1789579413;
 b=UuCPy9uSfGDCtajYqzi78sNTxGliBJLy+8SnE7SJov30l9p0lmpcJR/y36sragzpxl6E17xS
 +b0qlkQbIaNNxnPgZVeu3qb2XglyZDkebCOKVjoGonfrbukOzOK0I1zgHxlwPnS1UDx+OPyaKVI
 l+1l5UjkGr/r71gYbqkVKms0=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a33c50734fea798;
	Wed, 09 Sep 2026 17:23:32 +0000
X-Mizu-Trace-ID: 8a33c50734fea798
X-Migadu-Flow: FLOW_OUT
Message-ID: <2a9e1567-b3c1-4f31-8993-bef74656d1e3@linux.dev>
Date: Wed, 9 Sep 2026 19:23:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: x86: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Lee, Chun-Yi" <jlee@suse.com>, Kenneth Chan <kenneth.t.chan@gmail.com>,
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907085426.3661-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260907085426.3661-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/7/26 10:54, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
Hello Hemanth,

Thanks for this!

I think it's best to split up the thing in one patch per file, or at least driver.

If Ilpo agrees with me don't forget to add my tag:

Reviewed-by : Denis Benato <denis.benato@linux.dev>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/platform/x86/asus-laptop.c          | 2 +-
>  drivers/platform/x86/asus-nb-wmi.c          | 2 +-
>  drivers/platform/x86/hp/hp_accel.c          | 2 +-
>  drivers/platform/x86/intel/vsec_tpmi.c      | 2 +-
>  drivers/platform/x86/msi-laptop.c           | 2 +-
>  drivers/platform/x86/panasonic-laptop.c     | 2 +-
>  drivers/platform/x86/samsung-laptop.c       | 2 +-
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index 449addd1ac7a..de607edb9490 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -865,7 +865,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
>  		len += sysfs_emit_at(page, len, "SFUN value         : %#x\n",
>  			       (uint) temp);
>  	/*
> -	 * The HWRS method return informations about the hardware.
> +	 * The HWRS method return information about the hardware.
>  	 * 0x80 bit is for WLAN, 0x100 for Bluetooth.
>  	 * 0x40 for WWAN, 0x10 for WIMAX.
>  	 * The significance of others is yet to be found.
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index aeb461b1644d..9b729afb34f9 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -573,7 +573,7 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
>  	driver->quirks = quirks;
>  	driver->panel_power = BACKLIGHT_POWER_ON;
>  
> -	/* overwrite the wapf setting if the wapf paramater is specified */
> +	/* overwrite the wapf setting if the wapf parameter is specified */
>  	if (wapf != -1)
>  		quirks->wapf = wapf;
>  	else
> diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
> index 39b73dc473f1..40e1b9fb1b6d 100644
> --- a/drivers/platform/x86/hp/hp_accel.c
> +++ b/drivers/platform/x86/hp/hp_accel.c
> @@ -122,7 +122,7 @@ static int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int reg, u8 *ret)
>  static int lis3lv02d_acpi_write(struct lis3lv02d *lis3, int reg, u8 val)
>  {
>  	struct acpi_device *dev = lis3->bus_priv;
> -	unsigned long long ret; /* Not used when writting */
> +	unsigned long long ret; /* Not used when writing */
>  	union acpi_object in_obj[2];
>  	struct acpi_object_list args = { 2, in_obj };
>  
> diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
> index 0153dd57838e..fbe9c8af4aee 100644
> --- a/drivers/platform/x86/intel/vsec_tpmi.c
> +++ b/drivers/platform/x86/intel/vsec_tpmi.c
> @@ -597,7 +597,7 @@ static const char *intel_tpmi_name(enum intel_tpmi_id id)
>  	}
>  }
>  
> -/* String Length for tpmi-"feature_name(upto 8 bytes)" */
> +/* String Length for tpmi-"feature_name(up to 8 bytes)" */
>  #define TPMI_FEATURE_NAME_LEN	14
>  
>  static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index ddef6b78d2fa..0a0c756a5598 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -117,7 +117,7 @@ struct quirk_entry {
>  	 * Wlan/Bluetooth/3G, those netbook will load the SCM (windows app) to
>  	 * disable the original Wlan/Bluetooth control by BIOS when user press
>  	 * fn key, then control Wlan/Bluetooth/3G by SCM (software control by
> -	 * OS). Without SCM, user cann't on/off 3G module on those 3G netbook.
> +	 * OS). Without SCM, user can't on/off 3G module on those 3G netbook.
>  	 * On Linux, msi-laptop driver will do the same thing to disable the
>  	 * original BIOS control, then might need use HAL or other userland
>  	 * application to do the software control that simulate with SCM.
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 19d194ff37ca..a3597344edef 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -107,7 +107,7 @@
>   *
>   *	Jul.25, 2004	Hiroshi Miura <miura@da-cha.org>
>   *		- v0.4  first post version
> - *		        add function to retrive SIFR
> + *		        add function to retrieve SIFR
>   *
>   *	Jul.24, 2004	Hiroshi Miura <miura@da-cha.org>
>   *		- v0.3  get proper status of hotkey
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index 710f3d5bf84c..18631e96bb17 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -295,7 +295,7 @@ static const struct sabi_config sabi_configs[] = {
>   *   d0, d1, d2, d3   - data fields
>   *   call             - call SABI using command and data
>   *
> - * This allow to call arbitrary sabi commands wihout
> + * This allow to call arbitrary sabi commands without
>   * modifying the driver at all.
>   * For example, setting the keyboard backlight brightness to 5
>   *
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 7a2eeaec4c96..eeead0159828 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1705,7 +1705,7 @@ static int uniwill_kbd_led_mc_brightness_set(struct led_classdev *led_cdev,
>  
>  	/*
>  	 * The EC interprets a RGB value of 0x000000 as a command to restore
> -	 * the device-specfic default RGB value. Work around this by writing
> +	 * the device-specific default RGB value. Work around this by writing
>  	 * a RGB value of 0x010101 (faint white) instead.
>  	 */
>  	if (data->kbd_led_mc_subled_info[0].intensity == 0 &&
