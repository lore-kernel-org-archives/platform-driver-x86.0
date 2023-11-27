Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HPEQiAtC"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB41A136
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 14:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701124755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3kKUg/fXvYS5tkHqvXRuy+VfqnqaztEk7AoiO6in+nk=;
	b=HPEQiAtCSjo2m+FfXN9cJGbQEtF1+sw56JUWbXRjSIYk2hfuZUKImE5xNhM2EQ39dJvxsP
	6btqR/KW59aSo6SQ1JkJ7w91EpEUzt9Q+/Crqu/OmHnauFiDOc0k2K0PJ6RqF1+BQsqZlo
	93W7Rp7YEItDoTfm9cCJrXXG6xorVfI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-9QebS0ADPVC-p2qwr_L9_Q-1; Mon, 27 Nov 2023 17:39:12 -0500
X-MC-Unique: 9QebS0ADPVC-p2qwr_L9_Q-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-548eadba14dso2870074a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 14:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701124751; x=1701729551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kKUg/fXvYS5tkHqvXRuy+VfqnqaztEk7AoiO6in+nk=;
        b=UyUs4uJZDbwsADkm5rwS5mc8s0joqfX7np6ksfQhA8Faeb/009aUnRYnJA/ju9Y9Lq
         +Vp7V5vkgIpp3l7+XU1fMDYgWV7rd0OfgrhJnzxeHQ9feXs1D3m+hbhXoRKhFvNwecSz
         PIwMITor1czwtpzYrpxL75EVOoZ7jHHIZQxZwcot/RD0Tmj6/8vG07B3xgqaub0z+isB
         pHv+njeux0mBbvn+Y8jKeFtibgfLIk38VNWO4Qk1oLp1WAFw6SNojsbbaXt65hlKHdHK
         Kp4Jp+GAAqwnsHRsreD2l58kB08oJMvyJghvzdU8cNheFvmg7BQYjv/r+WTGWNqe6tFb
         nwHQ==
X-Gm-Message-State: AOJu0Yw3zt3NrPwCOGJDDgV7xGpBwtFFYrLFgQVGIF9XwqHs7wmTrTky
	ZplTRmJk39ZaKK6Sv4upmNw25Gze8jxfd8A3Hq0NeAvgGeodk9bxNCMISY/kw55Kj9Fbr3b453y
	h50/sy3Yh4L01OazqdTDqudWxo4Z/xDjqUA==
X-Received: by 2002:a50:d55e:0:b0:542:eb1f:c70a with SMTP id f30-20020a50d55e000000b00542eb1fc70amr9828694edj.29.1701124751306;
        Mon, 27 Nov 2023 14:39:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaMz4xpYJ1zfVf9EBzF/oR82WnnTyfsu2cVqgWjvDHpeFVDXzwZwXszLhG2SmCp4g9Gh50bw==
X-Received: by 2002:a50:d55e:0:b0:542:eb1f:c70a with SMTP id f30-20020a50d55e000000b00542eb1fc70amr9828680edj.29.1701124750978;
        Mon, 27 Nov 2023 14:39:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s14-20020aa7cb0e000000b005401a4184ddsm5621599edt.27.2023.11.27.14.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 14:39:10 -0800 (PST)
Message-ID: <a62eb1df-2cf9-41cd-a64c-303f73549ce5@redhat.com>
Date: Mon, 27 Nov 2023 23:39:09 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wmi: disable USB0 hub on ROG
 Ally before suspend
Content-Language: en-US, nl
To: Luke Jones <luke@ljones.dev>
Cc: ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231126230521.125708-1-luke@ljones.dev>
 <20231126230521.125708-2-luke@ljones.dev>
 <1c5f3bd2-9f10-4e5d-8c6d-76441b2da850@redhat.com>
 <ZOTS4S.OUOP1DLTNVXP3@ljones.dev>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZOTS4S.OUOP1DLTNVXP3@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/27/23 21:17, Luke Jones wrote:
> 
> 
> On Mon, Nov 27 2023 at 09:53:13 AM +01:00:00, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 11/27/23 00:05, Luke D. Jones wrote:
>>>  ASUS have worked around an issue in XInput where it doesn't support USB
>>>  selective suspend, which causes suspend issues in Windows. They worked
>>>  around this by adjusting the MCU firmware to disable the USB0 hub when
>>>  the screen is switched off during the Microsoft DSM suspend path in ACPI.
>>>
>>>  The issue we have with this however is one of timing - the call the tells
>>>  the MCU to this isn't able to complete before suspend is done so we call
>>>  this in a prepare() and add a small msleep() to ensure it is done. This
>>>  must be done before the screen is switched off to prevent a variety of
>>>  possible races.
>>>
>>>  Further to this the MCU powersave option must also be disabled as it can
>>>  cause a number of issues such as:
>>>  - unreliable resume connection of N-Key
>>>  - complete loss of N-Key if the power is plugged in while suspended
>>>  Disabling the powersave option prevents this.
>>>
>>>  Without this the MCU is unable to initialise itself correctly on resume.
>>>
>>>  Signed-off-by: Luke D. Jones <luke@ljones.dev>
>>
>> Thanks, patch looks good to me, except that all the new lines
>> seem to use 4 spaces rather then a tab char as indent.
> 
> Apologies for the previous HTML email.
> I must be going mad... are you sure? I've checked the patch file I submitted. Run checkpatch on it. Checked my email copy, and checked in lore... I can't see where space chars are?

So I just checked the copy in patchwork:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20231126230521.125708-2-luke@ljones.dev/

and you are rights, no 4 spaces there.

Where as if you look further down in this reply, where the original
patch is quoted the 4 spaces are right there, so now I'm wondering
if maybe my mail client introduced the problem when I was replying ?

(replies to other patches preserve the tabs just fine).

So this is weird, but lets just forget about it, just some weird
glitch ...

Regards,

Hans




> 
>>
>> With that fixed you can add my:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> to the next version.
>>
>> Regards,
>>
>> Hans
>>
>>
>>>  ---
>>>   drivers/platform/x86/asus-wmi.c            | 50 ++++++++++++++++++++++
>>>   include/linux/platform_data/x86/asus-wmi.h |  3 ++
>>>   2 files changed, 53 insertions(+)
>>>
>>>  diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>>  index 6a79f16233ab..4ba33dfebfd4 100644
>>>  --- a/drivers/platform/x86/asus-wmi.c
>>>  +++ b/drivers/platform/x86/asus-wmi.c
>>>  @@ -16,6 +16,7 @@
>>>   #include <linux/acpi.h>
>>>   #include <linux/backlight.h>
>>>   #include <linux/debugfs.h>
>>>  +#include <linux/delay.h>
>>>   #include <linux/dmi.h>
>>>   #include <linux/fb.h>
>>>   #include <linux/hwmon.h>
>>>  @@ -132,6 +133,11 @@ module_param(fnlock_default, bool, 0444);
>>>   #define ASUS_SCREENPAD_BRIGHT_MAX 255
>>>   #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
>>>
>>>  +/* Controls the power state of the USB0 hub on ROG Ally which input is on */
>>>  +#define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
>>>  +/* 300ms so far seems to produce a reliable result on AC and battery */
>>>  +#define ASUS_USB0_PWR_EC0_CSEE_WAIT 300
>>>  +
>>>   static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>>>
>>>   static int throttle_thermal_policy_write(struct asus_wmi *);
>>>  @@ -300,6 +306,9 @@ struct asus_wmi {
>>>
>>>       bool fnlock_locked;
>>>
>>>  +    /* The ROG Ally device requires the MCU USB device be disconnected before suspend */
>>>  +    bool ally_mcu_usb_switch;
>>>  +
>>>       struct asus_wmi_debug debug;
>>>
>>>       struct asus_wmi_driver *driver;
>>>  @@ -4488,6 +4497,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>>>       asus->nv_temp_tgt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_NV_THERM_TARGET);
>>>       asus->panel_overdrive_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD);
>>>       asus->mini_led_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE);
>>>  +    asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
>>>  +                        && dmi_match(DMI_BOARD_NAME, "RC71L");
>>>
>>>       err = fan_boost_mode_check_present(asus);
>>>       if (err)
>>>  @@ -4654,6 +4665,43 @@ static int asus_hotk_resume(struct device *device)
>>>           asus_wmi_fnlock_update(asus);
>>>
>>>       asus_wmi_tablet_mode_get_state(asus);
>>>  +
>>>  +    return 0;
>>>  +}
>>>  +
>>>  +static int asus_hotk_resume_early(struct device *device)
>>>  +{
>>>  +    struct asus_wmi *asus = dev_get_drvdata(device);
>>>  +
>>>  +    if (asus->ally_mcu_usb_switch) {
>>>  +        if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
>>>  +            dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
>>>  +        else
>>>  +            msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
>>>  +    }
>>>  +    return 0;
>>>  +}
>>>  +
>>>  +static int asus_hotk_prepare(struct device *device)
>>>  +{
>>>  +    struct asus_wmi *asus = dev_get_drvdata(device);
>>>  +    int result, err;
>>>  +
>>>  +    if (asus->ally_mcu_usb_switch) {
>>>  +        /* When powersave is enabled it causes many issues with resume of USB hub */
>>>  +        result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_MCU_POWERSAVE);
>>>  +        if (result == 1) {
>>>  +            dev_warn(device, "MCU powersave enabled, disabling to prevent resume issues");
>>>  +            err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, 0, &result);
>>>  +            if (err || result != 1)
>>>  +                dev_err(device, "Failed to set MCU powersave mode: %d\n", err);
>>>  +        }
>>>  +        /* sleep required to ensure USB0 is disabled before sleep continues */
>>>  +        if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
>>>  +            dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
>>>  +        else
>>>  +            msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
>>>  +    }
>>>       return 0;
>>>   }
>>>
>>>  @@ -4701,6 +4749,8 @@ static const struct dev_pm_ops asus_pm_ops = {
>>>       .thaw = asus_hotk_thaw,
>>>       .restore = asus_hotk_restore,
>>>       .resume = asus_hotk_resume,
>>>  +    .resume_early = asus_hotk_resume_early,
>>>  +    .prepare = asus_hotk_prepare,
>>>   };
>>>
>>>   /* Registration ***************************************************************/
>>>  diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>>  index 63e630276499..ab1c7deff118 100644
>>>  --- a/include/linux/platform_data/x86/asus-wmi.h
>>>  +++ b/include/linux/platform_data/x86/asus-wmi.h
>>>  @@ -114,6 +114,9 @@
>>>   /* Charging mode - 1=Barrel, 2=USB */
>>>   #define ASUS_WMI_DEVID_CHARGE_MODE    0x0012006C
>>>
>>>  +/* MCU powersave mode */
>>>  +#define ASUS_WMI_DEVID_MCU_POWERSAVE   0x001200E2
>>>  +
>>>   /* epu is connected? 1 == true */
>>>   #define ASUS_WMI_DEVID_EGPU_CONNECTED    0x00090018
>>>   /* egpu on/off */
>>
> 
> 

