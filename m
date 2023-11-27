Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R4+XU4vV"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7213B125
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 00:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701075198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SsGGF6lrHH4kfEqVm80uOEbmvqsBNvEHOJeUJamBRTw=;
	b=R4+XU4vVbU6Vb7DNka+gQij9iiA6FMNcUYFLiVszHLfogQasiAxBjZRmreNQ7Obs45ZJ/I
	9AYQva8BDIq0qfxtUpsF9P2H0eGChMQR4Z+REXrAlCyN/QaTIWSVvROz0f9pJ/yHImf9WN
	/r111syCnZhZoPCpWOcZTYvrRdopIvQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-TrCnfu2sMF-rbPd9C3Y72A-1; Mon, 27 Nov 2023 03:53:16 -0500
X-MC-Unique: TrCnfu2sMF-rbPd9C3Y72A-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-54b7e11013bso242254a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 00:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075196; x=1701679996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsGGF6lrHH4kfEqVm80uOEbmvqsBNvEHOJeUJamBRTw=;
        b=og98MGzS65TsSvvyjebdoWxuuzCrXCVZWdkEcqoM6v3jfsr7ythc3rTHENFYr7TXnz
         RK96JbwzSNupep3FVw5F3i7UaNXCFPxBkmN9GLAH2+Y80dtZ3Ka5pZQ9FCFVGjYyM7RZ
         dA3HN2y2WGdYhjKdwHMICxcGYbeWk3DRzNsTaeJGd3x907r+3+nzzx1HdqHa1IO7jfKZ
         Qk1VgJTbOlg3cs3WL72cSbJD+xIVovPVhUw+hRxdKsgE7e8Uf3evjvtUp4PTsBSCODnu
         /qEXl3YJgoBxK77PlD9OVlpVp9cBatmXxy2PbaVilXfbIV/A744iPiwJKkC+1tJuDsLW
         O83w==
X-Gm-Message-State: AOJu0YyqaaGQBwlKbk4POSMR+QxB7kDVgvHzBz00B/TvUjE+wbrbwKTV
	K1Sq6NcIuMKYvCnOXwMNt5HX2Wi+IxaSoZ+QzWdfjUCDDsBjYXUFmmukb5PU0D0Rk7oMdaPPphZ
	s4yW999YF1eRArUR+jGbFF1yqALx+C3PCBQ==
X-Received: by 2002:a05:6402:20b:b0:54b:8482:48c8 with SMTP id t11-20020a056402020b00b0054b848248c8mr499193edv.7.1701075195876;
        Mon, 27 Nov 2023 00:53:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj8j5maZS7RvGrJrr1BO4yG8Q4vHuHW/Ek1B2fDOIL34sYWVvYSEpStgbRSpipoeWfYRBGGQ==
X-Received: by 2002:a05:6402:20b:b0:54b:8482:48c8 with SMTP id t11-20020a056402020b00b0054b848248c8mr499188edv.7.1701075195570;
        Mon, 27 Nov 2023 00:53:15 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cx15-20020a05640222af00b0054b6259b44asm1091566edb.83.2023.11.27.00.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 00:53:14 -0800 (PST)
Message-ID: <1c5f3bd2-9f10-4e5d-8c6d-76441b2da850@redhat.com>
Date: Mon, 27 Nov 2023 09:53:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wmi: disable USB0 hub on ROG
 Ally before suspend
To: "Luke D. Jones" <luke@ljones.dev>
Cc: ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231126230521.125708-1-luke@ljones.dev>
 <20231126230521.125708-2-luke@ljones.dev>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231126230521.125708-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/27/23 00:05, Luke D. Jones wrote:
> ASUS have worked around an issue in XInput where it doesn't support USB
> selective suspend, which causes suspend issues in Windows. They worked
> around this by adjusting the MCU firmware to disable the USB0 hub when
> the screen is switched off during the Microsoft DSM suspend path in ACPI.
> 
> The issue we have with this however is one of timing - the call the tells
> the MCU to this isn't able to complete before suspend is done so we call
> this in a prepare() and add a small msleep() to ensure it is done. This
> must be done before the screen is switched off to prevent a variety of
> possible races.
> 
> Further to this the MCU powersave option must also be disabled as it can
> cause a number of issues such as:
> - unreliable resume connection of N-Key
> - complete loss of N-Key if the power is plugged in while suspended
> Disabling the powersave option prevents this.
> 
> Without this the MCU is unable to initialise itself correctly on resume.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thanks, patch looks good to me, except that all the new lines
seem to use 4 spaces rather then a tab char as indent.

With that fixed you can add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

to the next version.

Regards,

Hans


> ---
>  drivers/platform/x86/asus-wmi.c            | 50 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  3 ++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 6a79f16233ab..4ba33dfebfd4 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -16,6 +16,7 @@
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
>  #include <linux/debugfs.h>
> +#include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/fb.h>
>  #include <linux/hwmon.h>
> @@ -132,6 +133,11 @@ module_param(fnlock_default, bool, 0444);
>  #define ASUS_SCREENPAD_BRIGHT_MAX 255
>  #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
>  
> +/* Controls the power state of the USB0 hub on ROG Ally which input is on */
> +#define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
> +/* 300ms so far seems to produce a reliable result on AC and battery */
> +#define ASUS_USB0_PWR_EC0_CSEE_WAIT 300
> +
>  static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>  
>  static int throttle_thermal_policy_write(struct asus_wmi *);
> @@ -300,6 +306,9 @@ struct asus_wmi {
>  
>  	bool fnlock_locked;
>  
> +	/* The ROG Ally device requires the MCU USB device be disconnected before suspend */
> +	bool ally_mcu_usb_switch;
> +
>  	struct asus_wmi_debug debug;
>  
>  	struct asus_wmi_driver *driver;
> @@ -4488,6 +4497,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	asus->nv_temp_tgt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_NV_THERM_TARGET);
>  	asus->panel_overdrive_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD);
>  	asus->mini_led_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE);
> +	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> +						&& dmi_match(DMI_BOARD_NAME, "RC71L");
>  
>  	err = fan_boost_mode_check_present(asus);
>  	if (err)
> @@ -4654,6 +4665,43 @@ static int asus_hotk_resume(struct device *device)
>  		asus_wmi_fnlock_update(asus);
>  
>  	asus_wmi_tablet_mode_get_state(asus);
> +
> +	return 0;
> +}
> +
> +static int asus_hotk_resume_early(struct device *device)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(device);
> +
> +	if (asus->ally_mcu_usb_switch) {
> +		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
> +			dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
> +		else
> +			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +	return 0;
> +}
> +
> +static int asus_hotk_prepare(struct device *device)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(device);
> +	int result, err;
> +
> +	if (asus->ally_mcu_usb_switch) {
> +		/* When powersave is enabled it causes many issues with resume of USB hub */
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_MCU_POWERSAVE);
> +		if (result == 1) {
> +			dev_warn(device, "MCU powersave enabled, disabling to prevent resume issues");
> +			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, 0, &result);
> +			if (err || result != 1)
> +				dev_err(device, "Failed to set MCU powersave mode: %d\n", err);
> +		}
> +		/* sleep required to ensure USB0 is disabled before sleep continues */
> +		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
> +			dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
> +		else
> +			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
>  	return 0;
>  }
>  
> @@ -4701,6 +4749,8 @@ static const struct dev_pm_ops asus_pm_ops = {
>  	.thaw = asus_hotk_thaw,
>  	.restore = asus_hotk_restore,
>  	.resume = asus_hotk_resume,
> +	.resume_early = asus_hotk_resume_early,
> +	.prepare = asus_hotk_prepare,
>  };
>  
>  /* Registration ***************************************************************/
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 63e630276499..ab1c7deff118 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -114,6 +114,9 @@
>  /* Charging mode - 1=Barrel, 2=USB */
>  #define ASUS_WMI_DEVID_CHARGE_MODE	0x0012006C
>  
> +/* MCU powersave mode */
> +#define ASUS_WMI_DEVID_MCU_POWERSAVE   0x001200E2
> +
>  /* epu is connected? 1 == true */
>  #define ASUS_WMI_DEVID_EGPU_CONNECTED	0x00090018
>  /* egpu on/off */

