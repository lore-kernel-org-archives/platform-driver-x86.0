Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB72C47080
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 13:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A43CE61CAF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 13:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhEaOAc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 May 2021 10:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55967 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232972AbhEaN61 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 09:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622469405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MO7lo/5DUbN/d6FOY4UL8nk9SsCea7uXzsvNa5DO2oc=;
        b=A3YrWuqk+cedpZHgs2Cvnfsn92+ZZnRoWavVaWsu8+VSdlWULC12lMC2yxIYWpLSUAJXHW
        FmA8yfW3fFJ2e7T8UIjDUfgrFk2nTi+OPZR8F7Nqwh+GvHry/8bVd/omuKCLsYRKhocqU1
        ugSHHS+WegO7Cy4kiYKXsUXqojGRGlw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-EqKfUwXWNEmTxB5vgSBBaA-1; Mon, 31 May 2021 09:56:44 -0400
X-MC-Unique: EqKfUwXWNEmTxB5vgSBBaA-1
Received: by mail-ed1-f69.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0so6272543edu.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 May 2021 06:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MO7lo/5DUbN/d6FOY4UL8nk9SsCea7uXzsvNa5DO2oc=;
        b=Me4+fT1PYPPG+xHOJps7FKJ/RLeBqW3WlM59Y7XRDm88kIG/RRJwhRMDqBgB4fNptX
         7ajVms5JXHA4W75C+hamML/OxotfdbL5vqHnEgGEpDrgPB4xMffLYhLnf4GrCKwkY8iH
         Rs+aILHdCSigmL2p1AZPyMOvjKct1R0z6wS9zySHyAZXjObwVwTzIFMmw2pZr1gbc/X1
         I3XEqtugqqdM+O4y9/djXTejOMZACbp61edzK4Htc2755MgX2yL1WATXnrkiAK/eUefl
         //fvod4qv5Aj2CQF4gNLPIMzei/BYREQO51rIr+iEPdKMXl790B9qcS2w9wF8jKGJ9eU
         T52g==
X-Gm-Message-State: AOAM532bsukit/cWztRiDeUFBrOZ3wdHQWL1UdhDrN2hOLHDbLkZw4de
        mX1odMdapQvzVMS6t+AZ45PW1Fga7fXE7qYGm/9G1Z15xHLfPwYFYJDswTDFBf6BkzRDxtl+Hx1
        CTaOcWxHPa5IWTzkPo5ljps3L/Ogk4hnKRA==
X-Received: by 2002:a05:6402:4394:: with SMTP id o20mr26180492edc.357.1622469402957;
        Mon, 31 May 2021 06:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrsUJ7Gpeq+LaXhoWot+klJcBE3qS42V/ls/oqwi22c+z3XcNLx4S/0qW0nBgQ/jfA++AXMA==
X-Received: by 2002:a05:6402:4394:: with SMTP id o20mr26180473edc.357.1622469402739;
        Mon, 31 May 2021 06:56:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q18sm6606912edd.3.2021.05.31.06.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 06:56:42 -0700 (PDT)
Subject: Re: [PATCH v5] platform/x86: firmware_attributes_class: Create helper
 file for handling firmware-attributes class registration events
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     andy.shevchenko@gmail.com, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <markpearson@lenovo.com>
 <20210530223111.25929-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <98d213aa-9500-64f7-9fce-b880a6322d01@redhat.com>
Date:   Mon, 31 May 2021 15:56:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210530223111.25929-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/31/21 12:31 AM, Mark Pearson wrote:
> This will be used by the Dell and Lenovo WMI management drivers to
> prevent both drivers being active.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v2:
>  - This is a new file requested as part of the review of the proposed
> think_lmi.c driver. Labeling as V2 to keep series consistent
> 
> Changes in v3:
>  - Set default in Kconfig, and removed help text
>  - Allow multiple modules to register with module. Change API names to
>     better reflect this.
> 
> Changes in v4:
>  - version bump for consistency in series
> 
> Changes in v5:
>  - Fix issue reported by kernel test robot. Add header file to includes

Thanks Mark,

Unfortunately you squashed the Kconfig and Makefile changes which I made
to v4 when fixing it up during merging into 3/3 instead of having them in
v5 of this patch.

No worries, since this was the only problem which I could see I've fixed
this up in my review-hans branch while merging v5 of this series there
(replacing v4).

I did notice a bit of dead code while reviewing the changes which you
made to 3/3 in response to Andy's review. I'll send a follow-up patch
fixing that.

I'll leave this sit in my review-hans branch for a bit to give Andy
a chance to give his Reviewed-by and then I'll push this to for-next.

Regards,

Hans



> 
>  drivers/platform/x86/Kconfig                  |  4 ++
>  drivers/platform/x86/Makefile                 |  1 +
>  .../platform/x86/firmware_attributes_class.c  | 54 +++++++++++++++++++
>  .../platform/x86/firmware_attributes_class.h  | 13 +++++
>  4 files changed, 72 insertions(+)
>  create mode 100644 drivers/platform/x86/firmware_attributes_class.c
>  create mode 100644 drivers/platform/x86/firmware_attributes_class.h
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2714f7c38..57da8352d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1076,6 +1076,10 @@ config TOUCHSCREEN_DMI
>  	  the OS-image for the device. This option supplies the missing info.
>  	  Enable this for x86 tablets with Silead or Chipone touchscreens.
>  
> +config FW_ATTR_CLASS
> +	tristate "Firmware attributes class helper module"
> +	default n
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
> index 000000000..b407880f0
> --- /dev/null
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/* Firmware attributes class helper module */
> +
> +#include <linux/mutex.h>
> +#include <linux/device/class.h>
> +#include <linux/module.h>
> +#include "firmware_attributes_class.h"
> +
> +static DEFINE_MUTEX(fw_attr_lock);
> +int fw_attr_inuse;
> +
> +static struct class firmware_attributes_class = {
> +	.name = "firmware-attributes",
> +};
> +
> +int fw_attributes_class_get(struct class **fw_attr_class)
> +{
> +	int err;
> +
> +	mutex_lock(&fw_attr_lock);
> +	if (!fw_attr_inuse) { /*first time class is being used*/
> +		err = class_register(&firmware_attributes_class);
> +		if (err) {
> +			mutex_unlock(&fw_attr_lock);
> +			return err;
> +		}
> +	}
> +	fw_attr_inuse++;
> +	*fw_attr_class = &firmware_attributes_class;
> +	mutex_unlock(&fw_attr_lock);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fw_attributes_class_get);
> +
> +int fw_attributes_class_put(void)
> +{
> +	mutex_lock(&fw_attr_lock);
> +	if (!fw_attr_inuse) {
> +		mutex_unlock(&fw_attr_lock);
> +		return -EINVAL;
> +	}
> +	fw_attr_inuse--;
> +	if (!fw_attr_inuse) /* No more consumers */
> +		class_unregister(&firmware_attributes_class);
> +	mutex_unlock(&fw_attr_lock);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fw_attributes_class_put);
> +
> +MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> +MODULE_LICENSE("GPL");
> +
> +
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
> new file mode 100644
> index 000000000..802f12b45
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
> +int fw_attributes_class_get(struct class **fw_attr_class);
> +int fw_attributes_class_put(void);
> +
> +#endif /* FW_ATTR_CLASS_H */
> +
> +
> 

