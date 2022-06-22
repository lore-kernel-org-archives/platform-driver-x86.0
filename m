Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B60BC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 10:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbiFVKdL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239237AbiFVKdK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 06:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 28B4D10C3
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655893989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h/O2yUsrR3zbMDOcI6p2EfJi+EXDXu2J4E4lX2eXiss=;
        b=JpA5gECPGF6y3SAFuYRspT726oVwkjZVNGGXA+l/QMH5R1QHWDozy9e8eqIl/5x8AHdVje
        3Q03m5/eL2NfkAQKaTT0eNN5MG7GY/jbzqQDCcVcXcr8y/qa3eByTkOz4WCXb+QXybkegZ
        kKyb7GDGn84sPs/Ccyi5VaJ0t47PLVE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-TFbX6RWcNc6s7KymarodBQ-1; Wed, 22 Jun 2022 06:33:08 -0400
X-MC-Unique: TFbX6RWcNc6s7KymarodBQ-1
Received: by mail-ed1-f72.google.com with SMTP id x8-20020a056402414800b0042d8498f50aso13027640eda.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h/O2yUsrR3zbMDOcI6p2EfJi+EXDXu2J4E4lX2eXiss=;
        b=OrjHw1pzJuEcDoNXWORlyL2BRlVhujq2XEcDmoXbfTt/2pZSS/pFcXeZtzB7VXEBu3
         ICj0/uZBOkAenB4KRQ6rVRJVFeQlZE9i++twDkba0WEOc/BOPDZmdDRZ5rs29ThtZPjg
         4QphUwEg+YD/ng/YE/SN9JHPuzDy09vWppvDL2DDby7n8vy8LK9xgXkV5WDtbjniZZyU
         cvWft15xQAXZ4ccgiMQayt4NW85qQYf1ncHEij8PGeRa3VfruwhFNTP+3fzQN2607Cxt
         lYfeUVIengAbttrkquzXPUhUFs8MGyxPDrc3P7lXvo2bSSf+GwHlPT70IRbWUItTiSHT
         OI8g==
X-Gm-Message-State: AJIora8vTc9nzaecw2XtAr+cmuKCVXsDFaUvhYczI9Go0uYKFApOUSEL
        5PTKz8m2yuuoWbqgipWDpL2A9URiXforrKhtxova0FvI/RedA0q1vYtgsbXIvgH9BmwkrRHYyRJ
        gpR8TcAj/n8ei2t2wOsjaUaQ9FMGpSi2whQ==
X-Received: by 2002:a17:907:9704:b0:711:f441:dbe6 with SMTP id jg4-20020a170907970400b00711f441dbe6mr2433761ejc.26.1655893986880;
        Wed, 22 Jun 2022 03:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUGtmNWueerxyajMELgA1rpfwlIbpcsHiQfl7jJkpWc6IdkKFiMG3zstHY0/rSScR19hrEbQ==
X-Received: by 2002:a17:907:9704:b0:711:f441:dbe6 with SMTP id jg4-20020a170907970400b00711f441dbe6mr2433750ejc.26.1655893986713;
        Wed, 22 Jun 2022 03:33:06 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.135.195])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm8196638edt.85.2022.06.22.03.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:33:06 -0700 (PDT)
Message-ID: <37d1dd8f-109c-a4b1-b813-8b9ecb69ff92@redhat.com>
Date:   Wed, 22 Jun 2022 12:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 1/2] platform/x86: thinkpad_acpi: Sort headers for
 better maintenance
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
References: <20220616224951.66660-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220616224951.66660-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/17/22 00:49, Andy Shevchenko wrote:
> It's quite hard to understand in that zillions of headers that are included
> if any specific one is already listed. Sort headers for better maintenance.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 58 +++++++++++++++-------------
>  1 file changed, 31 insertions(+), 27 deletions(-)

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e6cb4a14cdd4..eab50d47f567 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -34,46 +34,50 @@
>   *			    thanks to Chris Wright <chrisw@osdl.org>
>   */
>  
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/init.h>
> -#include <linux/types.h>
> -#include <linux/string.h>
> -#include <linux/list.h>
> -#include <linux/mutex.h>
> -#include <linux/sched.h>
> -#include <linux/sched/signal.h>
> -#include <linux/kthread.h>
> -#include <linux/freezer.h>
> -#include <linux/delay.h>
> -#include <linux/slab.h>
> -#include <linux/nvram.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <linux/sysfs.h>
> +#include <linux/acpi.h>
>  #include <linux/backlight.h>
>  #include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
>  #include <linux/fb.h>
> -#include <linux/platform_device.h>
> +#include <linux/freezer.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
> +#include <linux/init.h>
>  #include <linux/input.h>
> -#include <linux/leds.h>
> -#include <linux/rfkill.h>
> -#include <linux/dmi.h>
>  #include <linux/jiffies.h>
> -#include <linux/workqueue.h>
> -#include <linux/acpi.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/leds.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvram.h>
>  #include <linux/pci.h>
> -#include <linux/power_supply.h>
> +#include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> -#include <sound/core.h>
> -#include <sound/control.h>
> -#include <sound/initval.h>
> +#include <linux/power_supply.h>
> +#include <linux/proc_fs.h>
> +#include <linux/rfkill.h>
> +#include <linux/sched.h>
> +#include <linux/sched/signal.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
>  #include <linux/uaccess.h>
> +#include <linux/workqueue.h>
> +
>  #include <acpi/battery.h>
>  #include <acpi/video.h>
> +
>  #include <drm/drm_privacy_screen_driver.h>
> +
> +#include <sound/control.h>
> +#include <sound/core.h>
> +#include <sound/initval.h>
> +
>  #include "dual_accel_detect.h"
>  
>  /* ThinkPad CMOS commands */

