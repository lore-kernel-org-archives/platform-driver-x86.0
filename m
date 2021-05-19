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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DE7C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 16:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16AAE6124C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 16:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240754AbhESQRN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 12:17:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53067 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240333AbhESQRM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 12:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621440952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=77cHkK2hvb+GvsAQaYSSj8SDaVTxG+Dru1Y2Pn0b9M8=;
        b=GsRNOkCSXk0mv9GMBNw8w66zd2WsQaBaM5NvTXjPDmrwVpU6jSQU7+JSC7NWLmCxxJfhEu
        zaQVH4hvj32YR7/pN7w2l5+ng+IxlO5A/FO9tk506SPR92d2UvmJw4KQP0CCQMHT/io9rP
        pnfE2V0C3cViomC86cdTF0knR9siE8c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-ibbKYnreM0mIIIrv3uxAnQ-1; Wed, 19 May 2021 12:15:50 -0400
X-MC-Unique: ibbKYnreM0mIIIrv3uxAnQ-1
Received: by mail-ed1-f71.google.com with SMTP id ba15-20020a0564021acfb029038d3b33d7ffso5324436edb.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 09:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=77cHkK2hvb+GvsAQaYSSj8SDaVTxG+Dru1Y2Pn0b9M8=;
        b=kRiURlfWuYr94A/cYVYcn2za2TfMlzErZod30PkF4GNL5z0TyZPcMBIOmTuWjNzBOC
         nrLsn1UtPIH9KKTu3yLfP8jA3AXKyI8HLqYOpSOLmu8obzrosOMz+Y/+hed62kbz2a/a
         JmGQqVgEGjtTN6/6m/QHKlzx2pIJiQjr2EtHToa5nc/kSWpEaoSsckooxdkSc4FylKvW
         YCzQi1SzfVk7VgZIbJ1CBIO2+mnomv0lyK2tjBiASoPYdh7xWXDpVKCc8Fj8jyshR8gf
         2KyMOCTZYtYiRAsxd0D6I31e8hhPAa7E3jiyK4hQo7naQ6iaGvBVJ9Z9ADdHW++p/O4f
         onxg==
X-Gm-Message-State: AOAM531+rqjfwWbpYE1IIHNgUrRYao/3cmJEaNSF1MJkGuRycVVUfVtM
        lmBaCYUdmgl2vccQEmJ0rVNQ9mAoDawBWTDov4n7pVFhFSjak9a3WMnOyHrR/2bWJCQbXo+fBRe
        A5fihcUrBZdg4bUIixr/RcK3Xea3CcjVy5w==
X-Received: by 2002:aa7:c499:: with SMTP id m25mr15203544edq.109.1621440949101;
        Wed, 19 May 2021 09:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsbooKlOI79/LoGGgHLG2SgA99b0RGCFYsiqU2ET8KKASo115q9gqlZ3hpNMr9la15Tpgy/Q==
X-Received: by 2002:aa7:c499:: with SMTP id m25mr15203517edq.109.1621440948893;
        Wed, 19 May 2021 09:15:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id l11sm15699403edw.42.2021.05.19.09.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 09:15:48 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] platform/x86: firmware_attributes_class: Create
 helper file for handling firmware-attributes class registration events
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        divya.bharathi@dell.com, prasanth.ksr@dell.com,
        mario.limonciello@dell.com
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5eafa0be-e44c-e8fd-a9ea-db5e30c47788@redhat.com>
Date:   Wed, 19 May 2021 18:15:48 +0200
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

Hi Mark,

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

Yes that is correct; and thank you for taking care of making
the code for registering the firmware_attribute class shared.

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
> +	tristate "Firmware attributes class helper module"> +	help
> +	  This option should be enabled by any modules using the firmware
> +	  attributes class.

My idea here was to have this be a kernel-library which drivers which need it
select. In this case it should not be visible to end-users and does not need a
help text, so this should look like this:

config FW_ATTR_CLASS
	tristate
	default n

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

I think it should be allowed to have multiple drivers
using the firmware_attributes class, e.g. besides the main system
BIOS an Ethermet or FiberChannel; card with an option ROM which supports
booting from iSCSI/FCoE or FiberChannel SCSI disks / LUNs could expose
settings to configure which disk/LUN to boot from this way.

And there is nothing wrong with multiple drivers calling device_create
with the same class.

So I suggest renaming fw_attributes_class_register to
fw_attributes_class_get (and unregister to put) and to make
fw_attr_inuse a counter and create the class when the counter
goes from 0 -> 1 and free it when it goes from 1 to 0 again.

Otherwise this looks good. I like that you already thought about
races and have protected fw_attr_inuse with a mutex.

Regards,

Hans






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

