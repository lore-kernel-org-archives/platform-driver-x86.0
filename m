Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041DFC7619A
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 Apr 2023 08:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjDHI6v (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 Apr 2023 04:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjDHI6u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 Apr 2023 04:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F154BDD9
        for <platform-driver-x86@vger.kernel.org>; Sat,  8 Apr 2023 01:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680944280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1R8c71HI2AgSEc0HQ9JQ5sIFN8ou94zk5KUQ+KTMNII=;
        b=J1GL6IWfsHBbRPZgeczJsMXgxz81p10i2cztBEBIkfxhk//rZBi/nrsyHzKovuiXl25rw/
        nu8yCKkJhSm8zUzR3Mc3c+g5/b5lJwWFrpTb32GpZXPuOfxtHJJrL1sJxOCyez/ng+2HAQ
        Bcx4uBUovKpFhEflxINjacCaRktf+rQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-FohZO4CWNkmifj3SHZsKWg-1; Sat, 08 Apr 2023 04:57:56 -0400
X-MC-Unique: FohZO4CWNkmifj3SHZsKWg-1
Received: by mail-ed1-f71.google.com with SMTP id a40-20020a509eab000000b005024c025bf4so42750809edf.14
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Apr 2023 01:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680944275; x=1683536275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1R8c71HI2AgSEc0HQ9JQ5sIFN8ou94zk5KUQ+KTMNII=;
        b=CcKQQ59tMI2B5JMeBKsUp58+W3/NK7udYytuYtQrUwwk8264uzT8WmVlX3v+ScWq/v
         UvIdJPG17ctBoFxk4fZNmsO8MFF5cLZBn/oy+fwBUCbuJoqs3Fd/tsuyE/tbm7X5M7Qf
         0GREp6t9h5Hdrf28syhSaOzSslQ+/5qjj31XC6+D9dxMF4EcUNtIPmVldErUTOfGA0N/
         BZWXO+GBM2r1DQK3EOhU/qt1UM99fbD3Ej+LoDch1Dsn2FHk89KcCi/fJ9BYw26YiNhb
         HgSLa0i/hGK2y/H56zRo8217Gy+kwSukIMbSurQAIIvlQm9iCqCxnsnqSZRXY7VjgXTY
         M9lQ==
X-Gm-Message-State: AAQBX9dPFl9lx4jWUbXfXbbvK6pyMZwFPOeILQCJ6HbIqo7W1tMaqpt/
        5ASsJuhIdPSLH3tEjYEiqDqfE6GfuQyyDKEFRRg25THdK57SokNk0NHUDu6vxCyJ4mh5LDkSvT2
        pVSzdcUwMnk/h0Q211yzkdF9me7TZ7GMyog==
X-Received: by 2002:a17:907:c687:b0:930:6e31:3c11 with SMTP id ue7-20020a170907c68700b009306e313c11mr1202145ejc.70.1680944275394;
        Sat, 08 Apr 2023 01:57:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350bg2uMwBGGgDUP9grVKm1lqHJHzxKU+Dny9OoS3jZl0c+ej5ew61PGz1MrsubxpYz+0ks9hsQ==
X-Received: by 2002:a17:907:c687:b0:930:6e31:3c11 with SMTP id ue7-20020a170907c68700b009306e313c11mr1202134ejc.70.1680944275063;
        Sat, 08 Apr 2023 01:57:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b00930d22474dbsm2950402ejc.97.2023.04.08.01.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 01:57:54 -0700 (PDT)
Message-ID: <f7a20a10-3871-8b2d-251f-35b0136d684d@redhat.com>
Date:   Sat, 8 Apr 2023 10:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in D3
To:     "David E. Box" <david.e.box@linux.intel.com>,
        srinivas.pandruvada@linux.intel.com, irenic.rajneesh@gmail.com,
        david.e.box@intel.com, markgross@kernel.org, rjw@rjwysocki.net
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230408022629.727721-1-david.e.box@linux.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230408022629.727721-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 4/8/23 04:26, David E. Box wrote:
> On Meteor Lake, the GNA, IPU, and VPU devices are booted in D0 power state
> and will block the SoC from going into the deepest Package C-state if a
> driver is not present. Put each device in D3hot if no driver is found.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/pmc/mtl.c | 31 ++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
> index eeb3bd8c2502..33aa98b54049 100644
> --- a/drivers/platform/x86/intel/pmc/mtl.c
> +++ b/drivers/platform/x86/intel/pmc/mtl.c
> @@ -8,6 +8,7 @@
>   *
>   */
>  
> +#include <linux/pci.h>
>  #include "core.h"
>  
>  const struct pmc_reg_map mtl_reg_map = {
> @@ -45,8 +46,38 @@ void mtl_core_configure(struct pmc_dev *pmcdev)
>  	pmc_core_send_ltr_ignore(pmcdev, 3);
>  }
>  
> +#define MTL_GNA_PCI_DEV	0x7e4c
> +#define MTL_IPU_PCI_DEV	0x7d19
> +#define MTL_VPU_PCI_DEV	0x7d1d
> +void mtl_set_device_d3(unsigned int device)

As pointed out by "kernel test robot <lkp@intel.com>" this needs to
be static. Otherwise this LGTM. With this fixed please add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

to version 2 of the patch.

Regards,

Hans




> +{
> +	struct pci_dev *pcidev;
> +
> +	pcidev = pci_get_device(PCI_VENDOR_ID_INTEL, device, NULL);
> +	if (pcidev) {
> +		if (!device_trylock(&pcidev->dev)) {
> +			pci_dev_put(pcidev);
> +			return;
> +		}
> +		if (!pcidev->dev.driver) {
> +			dev_info(&pcidev->dev, "Setting to D3hot\n");
> +			pci_set_power_state(pcidev, PCI_D3hot);
> +		}
> +		device_unlock(&pcidev->dev);
> +		pci_dev_put(pcidev);
> +	}
> +}
> +
>  void mtl_core_init(struct pmc_dev *pmcdev)
>  {
>  	pmcdev->map = &mtl_reg_map;
>  	pmcdev->core_configure = mtl_core_configure;
> +
> +	/*
> +	 * Set power state of select devices that do not have drivers to D3
> +	 * so that they do not block Package C entry.
> +	 */
> +	mtl_set_device_d3(MTL_GNA_PCI_DEV);
> +	mtl_set_device_d3(MTL_IPU_PCI_DEV);
> +	mtl_set_device_d3(MTL_VPU_PCI_DEV);
>  }
> 
> base-commit: 4f59630a5ed0a4e7d275bd7e5d253a8f5a425c5a

