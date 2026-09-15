Received: from mta0.migadu.com (out-233.mta0.migadu.com [91.218.175.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D5449B3D
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 19:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501415; cv=none; b=nkKEgyqQKm7abSCUuDDL7M7pqPFIRWBOL7s7kDZUQE/A84oPpRj2qqOQ96BMnkLzagj2r/n6iiuo5o30WH+vgI0cDyiE91kk1/9Hc+6c9HwppQpNICMzYruADZ2mtq/IISwZoZaDKARaULVJo8pbWypwcZsawkk9JGeOvYuceXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501415; c=relaxed/simple;
	bh=bejGejOi3XB0BD4iPs0eKkqgKaLzUvW7zzsFhINP+rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjsS3VdO2nqVB1pZJu45IS+OO/ZZDB1LW307BRE2Q23C8mjIkG6oD28ubNqVuOYnPV/k42V8RNLp0YZ1eFbyrK2jul2Z9L1tuw0Ms+XYqWfjWK9Ucn9m+Ita4QjsdcmE57zs4/AF0GQzTDoY/mJhsfXJeJX20jYk/LxivHbjCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mzarfBSs; arc=none smtp.client-ip=91.218.175.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mzarfBSs"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bejGejOi3XB0BD4iPs0eKkqgKaLzUvW7zzsFhINP+rQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789501411; v=1; x=1790106211;
 b=mzarfBSsurAgX+9ZPBZ1JsfY3ss/8IUE855sjmGmGZBl0u6bDhXt4QldIFhKgJV7GrQj3BwV
 E2MMtuk8L4bxaDuxj+Pjr4hseAaTQL1zce/Qpu8F0lN+QsGwZsGzEoRvdtDKw76DH+A8zO3kq1i
 PFANYhFACPLGA+CZYtHZx320=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 42a97ccdf7443d1a;
	Tue, 15 Sep 2026 19:43:31 +0000
X-Mizu-Trace-ID: 42a97ccdf7443d1a
X-Migadu-Flow: FLOW_OUT
Message-ID: <f4512c6a-8ae3-4cb2-8a50-c2b1d2b55e53@linux.dev>
Date: Tue, 15 Sep 2026 21:43:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: Add mute LED support
To: patryk.dankow@protonmail.com, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, luke@ljones.dev, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org
References: <20260915174110.67871-1-patryk.dankow@protonmail.com>
 <20260915174110.67871-2-patryk.dankow@protonmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260915174110.67871-2-patryk.dankow@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/15/26 19:41, patryk.dankow@protonmail.com wrote:
> From: Patryk Dańków <patryk.dankow@protonmail.com>
>
> Add support for WMI device 0x0004001c and register it as the
> platform::mute LED using the audio-mute trigger.
>
> The device ID is present in the PM3406CKA DSDT and is also used
> by GHelper for controlling the same LED.
>
> Tested on ASUS ExpertBook PM3406CKA.
Hi Patryk,

Thank you for this! I haven't received the 2/2 but I saw it on lore,
please next time also send to me :)

Also I think that since this is a cross-subsystem patchset you
are supposed to send the patchset as a whole to both
lists.

Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Patryk Dańków <patryk.dankow@protonmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c            | 26 +++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a65090429ca7..d7c100dc2020 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -262,6 +262,7 @@ struct asus_wmi {
>  	struct led_classdev lightbar_led;
>  	int lightbar_led_wk;
>  	struct led_classdev micmute_led;
> +	struct led_classdev mute_led;
>  	struct led_classdev camera_led;
>  	struct workqueue_struct *led_workqueue;
>  	struct work_struct tpd_led_work;
> @@ -2054,6 +2055,16 @@ static int micmute_led_set(struct led_classdev *led_cdev,
>  	return err < 0 ? err : 0;
>  }
>  
> +static int mute_led_set(struct led_classdev *led_cdev,
> +			enum led_brightness brightness)
> +{
> +	int state = brightness != LED_OFF;
> +	int err;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MUTE_LED, state, NULL);
> +	return err < 0 ? err : 0;
> +}
> +
>  static enum led_brightness camera_led_get(struct led_classdev *led_cdev)
>  {
>  	struct asus_wmi *asus;
> @@ -2084,6 +2095,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
>  	led_classdev_unregister(&asus->wlan_led);
>  	led_classdev_unregister(&asus->lightbar_led);
>  	led_classdev_unregister(&asus->micmute_led);
> +	led_classdev_unregister(&asus->mute_led);
>  	led_classdev_unregister(&asus->camera_led);
>  
>  	if (asus->led_workqueue)
> @@ -2176,7 +2188,19 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  		asus->micmute_led.default_trigger = "audio-micmute";
>  
>  		rv = led_classdev_register(&asus->platform_device->dev,
> -						&asus->micmute_led);
> +					   &asus->micmute_led);
> +		if (rv)
> +			goto error;
> +	}
> +
> +	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MUTE_LED)) {
> +		asus->mute_led.name = "platform::mute";
> +		asus->mute_led.max_brightness = 1;
> +		asus->mute_led.brightness_set_blocking = mute_led_set;
> +		asus->mute_led.default_trigger = "audio-mute";
> +
> +		rv = led_classdev_register(&asus->platform_device->dev,
> +					   &asus->mute_led);
>  		if (rv)
>  			goto error;
>  	}
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index b5ed8c83ace1..3810c4a0da23 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -54,6 +54,7 @@
>  #define ASUS_WMI_DEVID_LED5		0x00020015
>  #define ASUS_WMI_DEVID_LED6		0x00020016
>  #define ASUS_WMI_DEVID_MICMUTE_LED		0x00040017
> +#define ASUS_WMI_DEVID_MUTE_LED	0x0004001C
>  
>  /* Disable Camera LED */
>  #define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 = on (unused) */
