Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D7327C00
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995609; cv=none; b=kUo9HVI43mfeUGTqMO3YveMs6HytF2LnxHjbWK+MdQCPEfB58BhU8cOHCUQ/tqQX0OZaR/REqKTgjep9Sy9KpWVeOLU0L9z0gaxMCKhHcYtDrRSUe3Z9dojHASWAql3Ke8JtMJ3avlSXQ9416o9yEVAxeEDVRxFuuh82JYS0r+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995609; c=relaxed/simple;
	bh=gk2PJQ0KGgKiqYzO5quJ7tjtmxLMXeFcqDj0B0bHSg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQbZ1a58NyFZ8HGHxjKJV9yOttSY0/1NgFiad9vNHEJMuWHWt2pKrJ4XyxaKYyQrz4W7LC2jBJ76uufz3SKiJlXWeGwIpf5DPPLpo0nZ1QtdQOEJc5dmzYdU6D72YRYEzv75h+W9QalHWTk9qZZuW96Crs4+6VnyZPooZ9+MvHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pj/3QAxS; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pj/3QAxS"
Message-ID: <28b15057-3655-4211-be75-5ccbbfcf419d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779995592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fW2NsqaHU7AUgXKF0Wp+txppuoPBiQVg9SURQ3x4sfs=;
	b=Pj/3QAxS/EMsudrepguxr1ZOc4r3Ndmt+9tX3zQA2xESm81uXtk9yK0nGMUj8dv3DC9Asq
	0qPaLXrbPDEKo2hqILfjozasmRRftcR5VRUHDFl7HqyoIsxvhbW2k17p0HxUj1nOSDL/hZ
	HJmPFajIY2Dvs/JJi7bn2US/CF3V08g=
Date: Thu, 28 May 2026 21:12:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] platform/x86: asus-wmi: add keystone dongle support
To: =?UTF-8?Q?Dariusz_Figza=C5=82?= <dariuszfigzal@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, luke@ljones.dev, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org
References: <20260528185752.81563-1-dariuszfigzal@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260528185752.81563-1-dariuszfigzal@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 5/28/26 20:57, Dariusz Figzał wrote:
> The ASUS Keystone is a physical NFC-like dongle that slots into supported
> ASUS laptops. The EC fires WMI notify code 0xB4 on insert/remove events.
>
> Expose the current insert state via a sysfs attribute by querying WMI
> device ID 0x00120091 (DSTS). This devid does not follow the standard DSTS
> convention: PRESENCE_BIT (0x00010000) encodes the insert state rather than
> feature presence, and STATUS_BIT is never set. Presence of a keystone slot
> is detected by a successful DSTS call.
Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Dariusz Figzał <dariuszfigzal@gmail.com>
> ---
>
> Changes in v2:
> - Use .is_visible and platform_attributes[] instead of
>   device_create_file/device_remove_file (Ilpo Järvinen)
>
>  drivers/platform/x86/asus-wmi.c            | 65 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  7 +++
>  2 files changed, 72 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412b90..3c9ef826551d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
>  #define NOTIFY_KBD_TTP			0xae
>  #define NOTIFY_LID_FLIP			0xfa
>  #define NOTIFY_LID_FLIP_ROG		0xbd
> +#define NOTIFY_KEYSTONE			0xb4
>  
>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
>  
> @@ -279,6 +280,8 @@ struct asus_wmi {
>  	u32 tablet_switch_dev_id;
>  	bool tablet_switch_inverted;
>  
> +	bool keystone_available;
> +
>  	enum fan_type fan_type;
>  	enum fan_type gpu_fan_type;
>  	enum fan_type mid_fan_type;
> @@ -646,6 +649,55 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
>  	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>  }
>  
> +/* Keystone *******************************************************************/
> +
> +static int keystone_check_present(struct asus_wmi *asus)
> +{
> +	u32 retval;
> +	int err;
> +
> +	asus->keystone_available = false;
> +
> +	/*
> +	 * Use a raw devstate call rather than asus_wmi_dev_is_present().
> +	 * For this devid, PRESENCE_BIT encodes current insert state, not
> +	 * feature presence, so asus_wmi_dev_is_present() would return false
> +	 * whenever the dongle is absent at boot, even on machines that have
> +	 * a keystone slot.
> +	 * -ENODEV means the firmware doesn't know this devid at all.
> +	 * retval is not examined here, only the return code matters.
> +	 */
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval);
> +	if (err == -ENODEV)
> +		return 0;
> +	if (err)
> +		return err;
> +
> +	asus->keystone_available = true;
> +	return 0;
> +}
> +
> +static ssize_t keystone_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	u32 retval;
> +	int err;
> +
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%d\n", !!(retval & ASUS_WMI_DSTS_PRESENCE_BIT));
> +}
> +
> +static DEVICE_ATTR_RO(keystone);
> +
> +static void asus_wmi_keystone_notify(struct asus_wmi *asus)
> +{
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "keystone");
> +}
> +
>  /* Input **********************************************************************/
>  static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
>  {
> @@ -4575,6 +4627,12 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  
> +	if (code == NOTIFY_KEYSTONE) {
> +		if (asus->keystone_available)
> +			asus_wmi_keystone_notify(asus);
> +		return;
> +	}
> +
>  	if (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_TTP) {
>  		if (asus->fan_boost_mode_available)
>  			fan_boost_mode_switch_next(asus);
> @@ -4698,6 +4756,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_lid_resume.attr,
>  	&dev_attr_als_enable.attr,
>  	&dev_attr_fan_boost_mode.attr,
> +	&dev_attr_keystone.attr,
>  #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  		&dev_attr_charge_mode.attr,
>  		&dev_attr_egpu_enable.attr,
> @@ -4741,6 +4800,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		devid = ASUS_WMI_DEVID_ALS_ENABLE;
>  	else if (attr == &dev_attr_fan_boost_mode.attr)
>  		ok = asus->fan_boost_mode_available;
> +	else if (attr == &dev_attr_keystone.attr)
> +		ok = asus->keystone_available;
>  
>  #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  	if (attr == &dev_attr_charge_mode.attr)
> @@ -5081,6 +5142,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_platform_profile_setup;
>  
> +	err = keystone_check_present(asus);
> +	if (err)
> +		dev_warn(&pdev->dev, "Failed to check Keystone presence: %d\n", err);
> +
>  	err = asus_wmi_sysfs_init(asus->platform_device);
>  	if (err)
>  		goto fail_sysfs;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 554f41b827e1..c29962d5baac 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -147,6 +147,13 @@
>  #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
>  #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
>  
> +/* Keystone dongle insert/remove state.
> + * PRESENCE_BIT (0x00010000) encodes insert state:
> + * 0x00010000 = inserted, 0x00000000 = absent. STATUS_BIT is never set.
> + * 0xFFFFFFFE means no keystone slot on this machine.
> + */
> +#define ASUS_WMI_DEVID_KEYSTONE		0x00120091
> +
>  /* TUF laptop RGB modes/colours */
>  #define ASUS_WMI_DEVID_TUF_RGB_MODE	0x00100056
>  #define ASUS_WMI_DEVID_TUF_RGB_MODE2	0x0010005A
