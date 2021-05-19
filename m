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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA67C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 16:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF7296124C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 16:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347409AbhESQSh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 12:18:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57530 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240297AbhESQSg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 12:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621441036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3UGipQuTI7e+MdyretrY3cvNtbEdJHzF2mxv3G1FVs0=;
        b=OStotzYvGYAJowOYVRUyCUtd0Nr8PkSfhDSTwuKJb8flnClWpLpOuKqYInknGpSCpEkgtV
        MMG8qQUjiBmfvBo4EF1CsFJNhogBRRkMKydphV68P8HkODPupdnQPOKo3AHJz3J8LQR3i0
        EUqiATnPiZtQ+KQepScCn1YMxHqIaOc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-5MnnKD9sNrC9js16iTHgNA-1; Wed, 19 May 2021 12:17:14 -0400
X-MC-Unique: 5MnnKD9sNrC9js16iTHgNA-1
Received: by mail-ej1-f69.google.com with SMTP id gt39-20020a1709072da7b02903a8f7736a08so3919188ejc.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 09:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3UGipQuTI7e+MdyretrY3cvNtbEdJHzF2mxv3G1FVs0=;
        b=ZNimH1Q0a7SbtlutkFEkGjiJmCmYX8R5eJUdRW+Xhz+W5kCEq3agZrQzVyr5skxKnZ
         KQdbdPTn+wgPACaS9l8eRMdyZKt4CPV/8rl00xCbSYtfej0JgsdAIHipogjzQnLZfuio
         fCILn1qcGkr4vjPexiIwKrtYEIKPtyEQBjRBrxYBU07eIVT9yPl/eUSyz73SD3BYsRQg
         KjVu2T476QW/0/vsCpt33Qxv80M5aYMcbDIvYw6SEe8MXnvwalsTu+u8IP9OpxhF2uRf
         MamdspbhupHqPx4nP6HO1c+i6h1a0na5YXuCqNQTQDr/Swwft0OtrnFZ026eJVtYIwTC
         1oWw==
X-Gm-Message-State: AOAM531jXDuyzq0izM6PMA5Zlzs+gtV9LUOSfyv7LniYn4vtc9ZDvwrg
        3myepx5Htbumcid3Z/LCNRIn+lyeRoCmi7BSGnf846S3PKQUeTMwe1NojWHduhGhXVl8EDTfc3d
        w3yUaR2j7gQFVbZoznhHj4Y2nq/FxOdv/tQ==
X-Received: by 2002:aa7:dd10:: with SMTP id i16mr15553310edv.274.1621441033686;
        Wed, 19 May 2021 09:17:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfDWO+iVGCJyRZnCIeqPhFxcGGzuQ6noJQv9/3c9BV0Xu4/m0JAwNOI8de/vf5ReYhMkgkNQ==
X-Received: by 2002:aa7:dd10:: with SMTP id i16mr15553292edv.274.1621441033537;
        Wed, 19 May 2021 09:17:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g4sm6702927edm.83.2021.05.19.09.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 09:17:13 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] platform/x86: dell-wmi-sysman: Use
 firmware_attributes_class helper
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        divya.bharathi@dell.com, prasanth.ksr@dell.com,
        mario.limonciello@dell.com
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-2-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f509e9f6-9ee5-d154-0d42-5ca4fe110628@redhat.com>
Date:   Wed, 19 May 2021 18:17:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210509015708.112766-2-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/9/21 3:57 AM, Mark Pearson wrote:
> Update Dell WMI sysman driver to use newly implemented helper module.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

(note this will need to be adjusted for the function renames in patch 1/3
 but that is trivial, so feel free to keep my Reviewed-by after those changes).

Regards,

Hans

> ---
> Changes in v2:
>  - firmare_attributes_class.c added as reqested during review of the
>    proposed think_lmi.c driver. Labeling as V2 to keep series
>    consistent (hope that's correct).
>  - Note, compile tested only due to lack of HW to test on. Matching
>    changes were made in the think-lmi.c driver and worked. Please let me
>    know if any problems!
> 
>  drivers/platform/x86/dell/Kconfig              |  1 +
>  .../platform/x86/dell/dell-wmi-sysman/sysman.c | 18 ++++++++----------
>  2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index e0a55337f..931f616ff 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -197,6 +197,7 @@ config DELL_WMI_SYSMAN
>  	depends on ACPI_WMI
>  	depends on DMI
>  	select NLS
> +	select FW_ATTR_CLASS
>  	help
>  	  This driver allows changing BIOS settings on many Dell machines from
>  	  2018 and newer without the use of any additional software.
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index c8d276d78..91ecf49ab 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -13,14 +13,11 @@
>  #include <linux/kernel.h>
>  #include <linux/wmi.h>
>  #include "dell-wmi-sysman.h"
> +#include "../../firmware_attributes_class.h"
>  
>  #define MAX_TYPES  4
>  #include <linux/nls.h>
>  
> -static struct class firmware_attributes_class = {
> -	.name = "firmware-attributes",
> -};
> -
>  struct wmi_sysman_priv wmi_priv = {
>  	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
>  };
> @@ -28,6 +25,7 @@ struct wmi_sysman_priv wmi_priv = {
>  /* reset bios to defaults */
>  static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
>  static int reset_option = -1;
> +struct class *fw_attr_class;
>  
>  
>  /**
> @@ -541,11 +539,11 @@ static int __init sysman_init(void)
>  		goto err_exit_bios_attr_pass_interface;
>  	}
>  
> -	ret = class_register(&firmware_attributes_class);
> +	ret = fw_attributes_class_register(&fw_attr_class);
>  	if (ret)
>  		goto err_exit_bios_attr_pass_interface;
>  
> -	wmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
> +	wmi_priv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
>  				  NULL, "%s", DRIVER_NAME);
>  	if (IS_ERR(wmi_priv.class_dev)) {
>  		ret = PTR_ERR(wmi_priv.class_dev);
> @@ -602,10 +600,10 @@ static int __init sysman_init(void)
>  	release_attributes_data();
>  
>  err_destroy_classdev:
> -	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
>  
>  err_unregister_class:
> -	class_unregister(&firmware_attributes_class);
> +	fw_attributes_class_remove();
>  
>  err_exit_bios_attr_pass_interface:
>  	exit_bios_attr_pass_interface();
> @@ -619,8 +617,8 @@ static int __init sysman_init(void)
>  static void __exit sysman_exit(void)
>  {
>  	release_attributes_data();
> -	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
> -	class_unregister(&firmware_attributes_class);
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +	fw_attributes_class_remove();
>  	exit_bios_attr_set_interface();
>  	exit_bios_attr_pass_interface();
>  }
> 

