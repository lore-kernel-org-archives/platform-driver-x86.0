Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B7B147C91
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Oct 2024 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728834647; cv=none; b=lSb9wtsHlV/toGcD3X6eoX7IfEJj+62613zgUCDspAeJMtZfJuP2JNyw7Gl0AZ0jc1zwroJMfzkO5F/7UoVkzMemSX7cJ5tL4QrftLahXGqFCbuR890HxtZXJTterfEm3uhbyy/OyO1aOM9lfeLS2XM81TUAskQDNNf8BdNc45c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728834647; c=relaxed/simple;
	bh=0R/Y2b/MKDgIMJMSdx6mLaqnZefjKZia6qfp+HlKXAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCCeQIusvef4j2tMkkisxqiN7SWAaUMB+ErQUCX3vp/aZ+DpmTsSU9JdYtLb8URB8/gpa1qq1U81JooHhYCpQzsQlCm6f/GCz/JECmKGzGF5uwbGSAzeOt3OUHD6iuGCmiSdDe+cMZZzACFdty7cpoLKIULDr92sibEOhCPy57Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CmlgCxA3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CmlgCxA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728834643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G02ak1LzedJU2TKu9vLgoK07cp+hRCnOCGwnwVYqO00=;
	b=CmlgCxA37reUXmDtHchAA5yl68B/egzaD8NSgsj/IDD9F2Pz375N3jsX4KqxeJfb0ESFsn
	awbMCS5PxkADF0AhsV4ilSBo+ii2PhsjAsiUTvUlD4kCBEBDwf/T98CQRbuIAOpAubTYTt
	zsj+7Y6/FIX9PVjCxezvOl00sC3KYrY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-7w6O4ke8M025UlNk3Sj83Q-1; Sun, 13 Oct 2024 11:50:36 -0400
X-MC-Unique: 7w6O4ke8M025UlNk3Sj83Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a99f43c4c7bso85495566b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Oct 2024 08:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728834635; x=1729439435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G02ak1LzedJU2TKu9vLgoK07cp+hRCnOCGwnwVYqO00=;
        b=tfJXQDfoO5t1DSGISUcxV3FaEIurTJOCiImtT7yu9GoAUenv8rK9pbqXKQo303v+kD
         /tpR7NFWUz8+2grJWtJ0ZwXg2/b6OqEIariZPcO3td1Hq5BNYXT3exTuUErmfumShelj
         zAF4XNYLtxU5g0MYZL5JmmshBg0uJ1jvVe+eeQ6InTjA09npQqpOR29f7bdM1W4cNfYp
         Md/9gSPzyftd9Kgxf5jrC2BOByF8u0T7gdi9hAcoHm6xTessLBASGm9Z4GQSX478ondd
         MYouK7+QlPQQpdB5OjdeCeQRa7aUAM+QW7O9JXyXLYaLOKSab5CZrjYIz+1/3xwVZ0E0
         HUDA==
X-Forwarded-Encrypted: i=1; AJvYcCWy9ChrI9ga5VzouMHiWViYpwXN8rbNaaC+RjWPpNrvnLEp9RxAB7q1ddvXi5CIOCFpcbUkMALu0mJrDQ0kNHWdk5U0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyei0/5jo0p6PtpJmykZ/oPI9zBIbuwkatzAO7xV4gX6Rxazhn+
	W8j5cn0lqT9eF1Q+oWTL1wmCG2qwQ8JX/89Tgd1KljFYdXLvgxYa8ZDK/NO4VeeaDcsBx8Z8tJD
	sC9/z1K8Agcj56NYpYqAShMIX0/R7LP0bSlNjUa88uviIBcC5xcJvv5LYkdz1EvyWVOXAsIQ=
X-Received: by 2002:a17:907:9495:b0:a9a:4a:284a with SMTP id a640c23a62f3a-a9a004a6282mr230089966b.26.1728834635024;
        Sun, 13 Oct 2024 08:50:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE45Z9ZWX6eQhaWsW6UaVDxeNfd+jRAF2cie1RmaSqS28Nwu3JJevSECi/R/MUILknaP5J0fA==
X-Received: by 2002:a17:907:9495:b0:a9a:4a:284a with SMTP id a640c23a62f3a-a9a004a6282mr230085666b.26.1728834634546;
        Sun, 13 Oct 2024 08:50:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80dc5f5sm457709966b.161.2024.10.13.08.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 08:50:34 -0700 (PDT)
Message-ID: <b6374c77-b192-4c54-9504-5806f00a11da@redhat.com>
Date: Sun, 13 Oct 2024 17:50:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/20] platform/x86: intel_atomisp2: Move to intel
 sub-directory
To: Robert Mast <rn.mast@zonnet.nl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kate Hsuan <hpa@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Dell.Client.Kernel@dell.com, mchehab@redhat.com,
 laurent.pinchart@ideasonboard.com, kitakar@gmail.com
Cc: Mark Gross <mgross@linux.intel.com>, Alex Hung <alex.hung@canonical.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Zha Qipeng <qipeng.zha@intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 AceLan Kao <acelan.kao@canonical.com>, Jithu Joseph
 <jithu.joseph@intel.com>, Maurice Ma <maurice.ma@intel.com>
References: <20210820110458.73018-1-andriy.shevchenko@linux.intel.com>
 <20210820110458.73018-15-andriy.shevchenko@linux.intel.com>
 <e0c8c98f-64ec-4297-bbc8-de489414515c@zonnet.nl>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e0c8c98f-64ec-4297-bbc8-de489414515c@zonnet.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Robert,

I have just Cc-ed you on a series which make streaming video
from the mt9m114 sensor on the T100TA work.

On 6-Oct-24 6:54 PM, Robert Mast wrote:
> Hi,
> 
> In an attempt to put the camera led on the T100ta (baytrail) back on to repeat the success of Mauro on the ov2680 on cherry trail for the MT9M114 I compiled this led-driver in the media-atomisp branch of hgoede to try to put the camera back on by writing 1 to /sys/class/leds/atomisp::camera/brightness
> 
> However nothing happened. At boot the camera led is on, but with my Debian 12.7 install of bootia32.efi and the like the camera is already off at the boot menu, so there is another trick used to shut it off even before the kernel has been boot. Does any of you have any clue how to get that camera back on for use in v4l? Mauro did so on the 20th of may 2020 for the ov2680 on Cherry Trail with a little help of Intel.
> 
> Or am I just too short sighted for trying to get light in /dev/video0 because of the lack of libcamera support?
> 
> Should v4l2-ctl have an answer about /dev/video0 as long as there is no userspace-driver, or should I test differently?
> 
> Here a blog of my progress: https://github.com/jfwells/linux-asus-t100ta/issues/4 with some dmesg and config dumps.

About the [atomisp-]mt9m114 driver vs the intel_atomisp2_led driver,
they control different GPIOs.

There appear to be 3 different GPIOs one to force the LED off and
2 for turning the sensor on/off (reset and powerdown signals).

The LED is initially off because the GPIO forcing it off is
initially set to force it off. But as soon as asus-wmi loads
and call the ACPI WMI init method the ACPI code run on init
changes the GPIO causing the LED to turn on.

The main purpose of intel_atomisp2_led is to turn it back off,
I have now learned that this is only necessary because so far
we have been lacking a working driver for the mt9m114. Once
that has a driver and it is properly power-managed the LED
will only turn on when the sensor is on (if we don't have
intel_atomisp2_led).

With intel_atomisp2_led the LED will stay off when using
the sensor except when its brightness is set to 1, then it
will follow the sensor state (with a working mt9m114 driver).

The sensor will work fine independent of the state of
the GPIO which can force the LED off (but not on it
is only on when not forced off and the sensor is
powered). So for now if the intel_atomisp2_led driver
is build / used does not matter.

We can figure out what to do with the intel_atomisp2_led
driver once we have proper support for the mt9m114.

Regards,

Hans


p.s.

I did also see your private email to me, but I'm rather swamped with work so I did not
get around to looking at this until today.



> Op 20-8-2021 om 13:04 schreef Andy Shevchenko:
>> From: Kate Hsuan <hpa@redhat.com>
>>
>> Move Intel AtomISP v2 drivers to intel sub-directory
>> to improve readability.
>>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>   MAINTAINERS                                   |  4 +-
>>   drivers/platform/x86/Kconfig                  | 34 ---------------
>>   drivers/platform/x86/Makefile                 |  2 -
>>   drivers/platform/x86/intel/Kconfig            |  1 +
>>   drivers/platform/x86/intel/Makefile           |  1 +
>>   drivers/platform/x86/intel/atomisp2/Kconfig   | 43 +++++++++++++++++++
>>   drivers/platform/x86/intel/atomisp2/Makefile  |  9 ++++
>>   .../atomisp2/led.c}                           |  0
>>   .../atomisp2/pm.c}                            |  0
>>   9 files changed, 56 insertions(+), 38 deletions(-)
>>   create mode 100644 drivers/platform/x86/intel/atomisp2/Kconfig
>>   create mode 100644 drivers/platform/x86/intel/atomisp2/Makefile
>>   rename drivers/platform/x86/{intel_atomisp2_led.c => intel/atomisp2/led.c} (100%)
>>   rename drivers/platform/x86/{intel_atomisp2_pm.c => intel/atomisp2/pm.c} (100%)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cf29f7154889..429b8b5c5283 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9212,13 +9212,13 @@ INTEL ATOMISP2 DUMMY / POWER-MANAGEMENT DRIVER
>>   M:    Hans de Goede <hdegoede@redhat.com>
>>   L:    platform-driver-x86@vger.kernel.org
>>   S:    Maintained
>> -F:    drivers/platform/x86/intel_atomisp2_pm.c
>> +F:    drivers/platform/x86/intel/atomisp2/pm.c
>>     INTEL ATOMISP2 LED DRIVER
>>   M:    Hans de Goede <hdegoede@redhat.com>
>>   L:    platform-driver-x86@vger.kernel.org
>>   S:    Maintained
>> -F:    drivers/platform/x86/intel_atomisp2_led.c
>> +F:    drivers/platform/x86/intel/atomisp2/led.c
>>     INTEL BIOS SAR INT1092 DRIVER
>>   M:    Shravan S <s.shravan@intel.com>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 55820fc60a63..81eaa00983bd 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -668,40 +668,6 @@ config THINKPAD_LMI
>>     source "drivers/platform/x86/intel/Kconfig"
>>   -config INTEL_ATOMISP2_LED
>> -    tristate "Intel AtomISP2 camera LED driver"
>> -    depends on GPIOLIB && LEDS_GPIO
>> -    help
>> -      Many Bay Trail and Cherry Trail devices come with a camera attached
>> -      to Intel's Image Signal Processor. Linux currently does not have a
>> -      driver for these, so they do not work as a camera. Some of these
>> -      camera's have a LED which is controlled through a GPIO.
>> -
>> -      Some of these devices have a firmware issue where the LED gets turned
>> -      on at boot. This driver will turn the LED off at boot and also allows
>> -      controlling the LED (repurposing it) through the sysfs LED interface.
>> -
>> -      Which GPIO is attached to the LED is usually not described in the
>> -      ACPI tables, so this driver contains per-system info about the GPIO
>> -      inside the driver, this means that this driver only works on systems
>> -      the driver knows about.
>> -
>> -      To compile this driver as a module, choose M here: the module
>> -      will be called intel_atomisp2_led.
>> -
>> -config INTEL_ATOMISP2_PM
>> -    tristate "Intel AtomISP2 dummy / power-management driver"
>> -    depends on PCI && IOSF_MBI && PM
>> -    depends on !INTEL_ATOMISP
>> -    help
>> -      Power-management driver for Intel's Image Signal Processor found on
>> -      Bay Trail and Cherry Trail devices. This dummy driver's sole purpose
>> -      is to turn the ISP off (put it in D3) to save power and to allow
>> -      entering of S0ix modes.
>> -
>> -      To compile this driver as a module, choose M here: the module
>> -      will be called intel_atomisp2_pm.
>> -
>>   config INTEL_HID_EVENT
>>       tristate "INTEL HID Event"
>>       depends on ACPI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index 1b1f4337a77f..6c682114e4fe 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -71,8 +71,6 @@ obj-$(CONFIG_THINKPAD_LMI)    += think-lmi.o
>>   # Intel
>>   obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)        += intel/
>>   -obj-$(CONFIG_INTEL_ATOMISP2_LED)    += intel_atomisp2_led.o
>> -obj-$(CONFIG_INTEL_ATOMISP2_PM)        += intel_atomisp2_pm.o
>>   obj-$(CONFIG_INTEL_HID_EVENT)        += intel-hid.o
>>   obj-$(CONFIG_INTEL_INT0002_VGPIO)    += intel_int0002_vgpio.o
>>   obj-$(CONFIG_INTEL_OAKTRAIL)        += intel_oaktrail.o
>> diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
>> index 0c044b31e822..e8e1bad38113 100644
>> --- a/drivers/platform/x86/intel/Kconfig
>> +++ b/drivers/platform/x86/intel/Kconfig
>> @@ -16,6 +16,7 @@ menuconfig X86_PLATFORM_DRIVERS_INTEL
>>     if X86_PLATFORM_DRIVERS_INTEL
>>   +source "drivers/platform/x86/intel/atomisp2/Kconfig"
>>   source "drivers/platform/x86/intel/int1092/Kconfig"
>>   source "drivers/platform/x86/intel/int33fe/Kconfig"
>>   source "drivers/platform/x86/intel/int3472/Kconfig"
>> diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
>> index 9858657f3f39..8ce9894e5efe 100644
>> --- a/drivers/platform/x86/intel/Makefile
>> +++ b/drivers/platform/x86/intel/Makefile
>> @@ -4,6 +4,7 @@
>>   # Intel x86 Platform-Specific Drivers
>>   #
>>   +obj-$(CONFIG_INTEL_ATOMISP2_PDX86)    += atomisp2/
>>   obj-$(CONFIG_INTEL_SAR_INT1092)        += int1092/
>>   obj-$(CONFIG_INTEL_CHT_INT33FE)        += int33fe/
>>   obj-$(CONFIG_INTEL_SKL_INT3472)        += int3472/
>> diff --git a/drivers/platform/x86/intel/atomisp2/Kconfig b/drivers/platform/x86/intel/atomisp2/Kconfig
>> new file mode 100644
>> index 000000000000..35dd2be9d2a1
>> --- /dev/null
>> +++ b/drivers/platform/x86/intel/atomisp2/Kconfig
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Intel x86 Platform Specific Drivers
>> +#
>> +
>> +config INTEL_ATOMISP2_PDX86
>> +    bool
>> +
>> +config INTEL_ATOMISP2_LED
>> +    tristate "Intel AtomISP v2 camera LED driver"
>> +    depends on GPIOLIB && LEDS_GPIO
>> +    select INTEL_ATOMISP2_PDX86
>> +    help
>> +      Many Bay Trail and Cherry Trail devices come with a camera attached
>> +      to Intel's Image Signal Processor. Linux currently does not have a
>> +      driver for these, so they do not work as a camera. Some of these
>> +      camera's have a LED which is controlled through a GPIO.
>> +
>> +      Some of these devices have a firmware issue where the LED gets turned
>> +      on at boot. This driver will turn the LED off at boot and also allows
>> +      controlling the LED (repurposing it) through the sysfs LED interface.
>> +
>> +      Which GPIO is attached to the LED is usually not described in the
>> +      ACPI tables, so this driver contains per-system info about the GPIO
>> +      inside the driver, this means that this driver only works on systems
>> +      the driver knows about.
>> +
>> +      To compile this driver as a module, choose M here: the module
>> +      will be called intel_atomisp2_led.
>> +
>> +config INTEL_ATOMISP2_PM
>> +    tristate "Intel AtomISP v2 dummy / power-management driver"
>> +    depends on PCI && IOSF_MBI && PM
>> +    depends on !INTEL_ATOMISP
>> +    select INTEL_ATOMISP2_PDX86
>> +    help
>> +      Power-management driver for Intel's Image Signal Processor found on
>> +      Bay Trail and Cherry Trail devices. This dummy driver's sole purpose
>> +      is to turn the ISP off (put it in D3) to save power and to allow
>> +      entering of S0ix modes.
>> +
>> +      To compile this driver as a module, choose M here: the module
>> +      will be called intel_atomisp2_pm.
>> diff --git a/drivers/platform/x86/intel/atomisp2/Makefile b/drivers/platform/x86/intel/atomisp2/Makefile
>> new file mode 100644
>> index 000000000000..96b1e877d1f1
>> --- /dev/null
>> +++ b/drivers/platform/x86/intel/atomisp2/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Intel x86 Platform Specific Drivers
>> +#
>> +
>> +intel_atomisp2_led-y            := led.o
>> +obj-$(CONFIG_INTEL_ATOMISP2_LED)    += intel_atomisp2_led.o
>> +intel_atomisp2_pm-y            += pm.o
>> +obj-$(CONFIG_INTEL_ATOMISP2_PM)        += intel_atomisp2_pm.o
>> diff --git a/drivers/platform/x86/intel_atomisp2_led.c b/drivers/platform/x86/intel/atomisp2/led.c
>> similarity index 100%
>> rename from drivers/platform/x86/intel_atomisp2_led.c
>> rename to drivers/platform/x86/intel/atomisp2/led.c
>> diff --git a/drivers/platform/x86/intel_atomisp2_pm.c b/drivers/platform/x86/intel/atomisp2/pm.c
>> similarity index 100%
>> rename from drivers/platform/x86/intel_atomisp2_pm.c
>> rename to drivers/platform/x86/intel/atomisp2/pm.c
> 

