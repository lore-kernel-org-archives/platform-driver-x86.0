Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF0380FE7
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 23:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779924198; cv=none; b=YT+7yEvCmWnkfZ4IKsE4ZRphNQUKHsYvRdBcYi9UfnLoe7gns5C34G55WHa3Mu/0gRej/bV+hCw2nKdczIxiLiwVIrzhVFnVqm0O//hLJ9x3pz6nYQCBGFC6MuxctjPIrcH7bRG/KM+55Sq0MVP/34jC4ttCVdz34hog4C/ib2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779924198; c=relaxed/simple;
	bh=4SpZylhtmu3p7Ab8IY89ocPWOKi8K74E/uignqXdfj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFXDhPRzk43SyZrMZ2vUn6oqRz9plnsN6P/nIQjtDsOytqF0nVYJ2IbKafYkevZEQlZ1igAlsSjeP+A1UtLTr82XKUC34tT/4JaJITlK2RgmUEHeJfcPZDJuF2UkGcI8qdelUaH2X33Sf8hAMXad5usc41rSOS/PwlQsxgk3/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bbFBR/DV; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bbFBR/DV"
Message-ID: <c4256b75-6791-4ae8-a254-4a767e2a7af8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779924193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VhFs7+qvr9R8lcILe30gIC2aDCoc/mJL2lNSB3q7nJI=;
	b=bbFBR/DV+7kF9/hT0mmGUzV6f7gNeQpO++oVjc3muLrJOcB2K+Dc5npNCzwIjNam1tv2ss
	XrUaXMniDajVUE3gwNTpXxSJAQibY9SuXHgqYl3bmjJ5xi8bGPQDbdT2qqbNFu3lIIWM1u
	UZxpWW+k4AJeBafYuQo/OIDJIMzE6fM=
Date: Thu, 28 May 2026 01:22:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-wmi: add keystone dongle support
To: =?UTF-8?Q?Dariusz_Figza=C5=82?= <dariuszfigzal@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, luke@ljones.dev, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org
References: <20260526214439.70142-1-dariuszfigzal@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260526214439.70142-1-dariuszfigzal@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 5/26/26 23:44, Dariusz Figzał wrote:
> The ASUS Keystone is a physical NFC-like dongle that slots into supported
> ASUS laptops. The EC fires WMI notify code 0xB4 on insert/remove events.
>
> Expose the current insert state via a sysfs attribute by querying WMI
> device ID 0x00120091 (DSTS). This devid does not follow the standard DSTS
> convention: PRESENCE_BIT (0x00010000) encodes the insert state rather than
> feature presence, and STATUS_BIT is never set. Presence of a keystone slot
> is detected by a successful DSTS call (any result other than -ENODEV).
Thanks for this!

Ilpo might have some suggestions on how to make the code better,
As we discussed a fair bit about this I say LGTM.

Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Dariusz Figzał <dariuszfigzal@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c            | 75 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  7 ++
>  2 files changed, 82 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412b90..a3fa3921aef3 100644
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
> +	bool keystone_detected;
> +
>  	enum fan_type fan_type;
>  	enum fan_type gpu_fan_type;
>  	enum fan_type mid_fan_type;
> @@ -646,6 +649,66 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
>  	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>  }
>  
> +/* Keystone *******************************************************************/
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
> +static int asus_wmi_keystone_init(struct asus_wmi *asus)
> +{
> +	u32 retval;
> +	int err;
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
> +	err = device_create_file(&asus->platform_device->dev, &dev_attr_keystone);
> +	if (err)
> +		return err;
> +
> +	asus->keystone_detected = true;
> +	return 0;
> +}
> +
> +static void asus_wmi_keystone_exit(struct asus_wmi *asus)
> +{
> +	if (!asus->keystone_detected)
> +		return;
> +
> +	device_remove_file(&asus->platform_device->dev, &dev_attr_keystone);
> +	asus->keystone_detected = false;
> +}
> +
>  /* Input **********************************************************************/
>  static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
>  {
> @@ -4575,6 +4638,12 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  
> +	if (code == NOTIFY_KEYSTONE) {
> +		if (asus->keystone_detected)
> +			asus_wmi_keystone_notify(asus);
> +		return;
> +	}
> +
>  	if (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_TTP) {
>  		if (asus->fan_boost_mode_available)
>  			fan_boost_mode_switch_next(asus);
> @@ -5085,6 +5154,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_sysfs;
>  
> +	err = asus_wmi_keystone_init(asus);
> +	if (err)
> +		dev_warn(&pdev->dev, "Keystone initialization failed: %d\n", err);
> +
>  	err = asus_wmi_input_init(asus);
>  	if (err)
>  		goto fail_input;
> @@ -5170,6 +5243,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  fail_hwmon:
>  	asus_wmi_input_exit(asus);
>  fail_input:
> +	asus_wmi_keystone_exit(asus);
>  	asus_wmi_sysfs_exit(asus->platform_device);
>  fail_sysfs:
>  fail_custom_fan_curve:
> @@ -5191,6 +5265,7 @@ static void asus_wmi_remove(struct platform_device *device)
>  	asus_wmi_backlight_exit(asus);
>  	asus_screenpad_exit(asus);
>  	asus_wmi_input_exit(asus);
> +	asus_wmi_keystone_exit(asus);
>  	asus_wmi_led_exit(asus);
>  	asus_wmi_rfkill_exit(asus);
>  	asus_wmi_debugfs_exit(asus);
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
