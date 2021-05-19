Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC755C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 16:19:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF14F61244
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 16:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347447AbhESQUi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 12:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40501 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347476AbhESQUg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 12:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621441156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zplHlqdmyh9xHo1BJSCqx1eIqMJOcDQLchn/L9ujRsk=;
        b=Uo5jAnOW9HrKlT0HM9nAyLXdQHuBeu0cg2esiPP5fw9CHL7jlOaaCTN1GpjF9RPAXmsMMq
        TiSCFiZSh4EPrKWBvV7gmRKWlMXJF/GoMgfO8ey/L9QTM4YJmiwnEHFDOE2dx5iCfEf7VK
        Ue0yL0U2fgS9SrU6R+fScjCDe9ZWkPs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-BPN_2zIRMiKq66XJ2G6gEg-1; Wed, 19 May 2021 12:19:14 -0400
X-MC-Unique: BPN_2zIRMiKq66XJ2G6gEg-1
Received: by mail-ed1-f70.google.com with SMTP id d4-20020aa7ce040000b029038d1d0524d0so7234190edv.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 09:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zplHlqdmyh9xHo1BJSCqx1eIqMJOcDQLchn/L9ujRsk=;
        b=fXxGGdU2HJ5Y91e/YD4EkNIHBdrlwsdABETCHMXpVc6bDIC/vix1Cg6ikxJWQEswQB
         xBO0o/95TMNXVAxL5mOc0nmbiMWWYVaBUnWt5uZpv74wWBHJJRbyTtmGXSLTt01Ob13c
         Xy2x1kYtcryMYbZbVGC6Lt1mvfrafoMorlhkFtQ+jFpza3hqjssXAl9F0T1j4IKj6cRU
         XayrtVq41l+lJjNbUwKFLq7pJgZMkWOTGPvCurQ+rz1GlYnoey+5fXsgek2eBb4aALuz
         fRHv0uOd5d6/g7GWt32sJl2R9AFqpuYe39GBbSc6dd16/CcADJaCMXr+YTqw9fR8EZyc
         8NeA==
X-Gm-Message-State: AOAM531tfEPNOJrgUmI8xidBG5jg0dZ3xP3vcNgVy6AxmQ8gWYvdByOv
        AW01PXzrhCCMwPERsXvHECa7cdU8mIcS3mKoTTR9Pxa82tfC0kvPrdBG+U22jxI/NjBaLBSDl/2
        EWaAeRmxUrfGu0C9pNtsAKEYQ7jxIxcHxiw==
X-Received: by 2002:a17:907:abc:: with SMTP id bz28mr13240346ejc.262.1621441153538;
        Wed, 19 May 2021 09:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVVI087pKCON/Xc3CtM2twam2voksurvgOz4Ee9yBcx9KabgpxrYeOLL6n1UlNwQaut8jDYg==
X-Received: by 2002:a17:907:abc:: with SMTP id bz28mr13240334ejc.262.1621441153392;
        Wed, 19 May 2021 09:19:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c7sm16309837ede.37.2021.05.19.09.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 09:19:13 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] platform/x86: firmware_attributes_class: Create
 helper file for handling firmware-attributes class registration events
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        divya.bharathi@dell.com, prasanth.ksr@dell.com
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3bc0e76a-818f-ce2c-b534-024e6fb42056@redhat.com>
Date:   Wed, 19 May 2021 18:19:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210509015708.112766-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

p.s.

I'm getting bounces for: mario.limonciello@dell.com (Mario has a new (also Linux related) job elsewhere),
for the next version of the series please replace the Cc to Mario with a Cc to Dell.Client.Kernel@dell.com.





On 5/9/21 3:57 AM, Mark Pearson wrote:
> This will be used by the Dell and Lenovo WMI management drivers to
> prevent both drivers being active.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v2:
>  This is a new file requested as part of the review of the proposed
> think_lmi.c driver. Labeling as V2 to keep series consistent (hope
> that's correct).
> 
>  drivers/platform/x86/Kconfig                  |  6 +++
>  drivers/platform/x86/Makefile                 |  1 +
>  .../platform/x86/firmware_attributes_class.c  | 51 +++++++++++++++++++
>  .../platform/x86/firmware_attributes_class.h  | 13 +++++
>  4 files changed, 71 insertions(+)
>  create mode 100644 drivers/platform/x86/firmware_attributes_class.c
>  create mode 100644 drivers/platform/x86/firmware_attributes_class.h
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2714f7c38..b0e1e5f65 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1076,6 +1076,12 @@ config TOUCHSCREEN_DMI
>  	  the OS-image for the device. This option supplies the missing info.
>  	  Enable this for x86 tablets with Silead or Chipone touchscreens.
>  
> +config FW_ATTR_CLASS
> +	tristate "Firmware attributes class helper module"
> +	help
> +	  This option should be enabled by any modules using the firmware
> +	  attributes class.
> +
>  config INTEL_IMR
>  	bool "Intel Isolated Memory Region support"
>  	depends on X86_INTEL_QUARK && IOSF_MBI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index dcc8cdb95..147573f69 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -115,6 +115,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>  obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
>  obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
> +obj-$(CONFIG_FW_ATTR_CLASS)             += firmware_attributes_class.o
>  
>  # Intel uncore drivers
>  obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> new file mode 100644
> index 000000000..4ed959d6c
> --- /dev/null
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/* Firmware attributes class helper module */
> +
> +#include <linux/mutex.h>
> +#include <linux/device/class.h>
> +#include <linux/module.h>
> +
> +static DEFINE_MUTEX(fw_attr_lock);
> +bool fw_attr_inuse;
> +
> +static struct class firmware_attributes_class = {
> +	.name = "firmware-attributes",
> +};
> +
> +int fw_attributes_class_register(struct class **fw_attr_class)
> +{
> +	int err;
> +
> +	mutex_lock(&fw_attr_lock);
> +	/* We can only have one active FW attribute class */
> +	if (fw_attr_inuse) {
> +		mutex_unlock(&fw_attr_lock);
> +		return -EEXIST;
> +	}
> +
> +	err = class_register(&firmware_attributes_class);
> +	if (err) {
> +		mutex_unlock(&fw_attr_lock);
> +		return err;
> +	}
> +	fw_attr_inuse = true;
> +	*fw_attr_class = &firmware_attributes_class;
> +	mutex_unlock(&fw_attr_lock);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fw_attributes_class_register);
> +
> +void fw_attributes_class_remove(void)
> +{
> +	mutex_lock(&fw_attr_lock);
> +	fw_attr_inuse = false;
> +	class_unregister(&firmware_attributes_class);
> +	mutex_unlock(&fw_attr_lock);
> +}
> +EXPORT_SYMBOL_GPL(fw_attributes_class_remove);
> +
> +MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> +MODULE_LICENSE("GPL");
> +
> +
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
> new file mode 100644
> index 000000000..e479a5720
> --- /dev/null
> +++ b/drivers/platform/x86/firmware_attributes_class.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/* Firmware attributes class helper module */
> +
> +#ifndef FW_ATTR_CLASS_H
> +#define FW_ATTR_CLASS_H
> +
> +int fw_attributes_class_register(struct class **fw_attr_class);
> +void fw_attributes_class_remove(void);
> +
> +#endif /* FW_ATTR_CLASS_H */
> +
> +
> 

