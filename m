Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038E4C77B6F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Apr 2023 08:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjDKInR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbjDKInQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Apr 2023 04:43:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A64DAB
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681202549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YBm1DJo+O34kGFp5j7ZIGRS2RcBv14D2xSf4Qhrz/60=;
        b=JTpe1v93qhIk0im1BnqiwhhMMOUELts1l7pdSSkWmA5QWWEVbxChaq5qEjT1YetJc3yCX7
        U3rgA8Dhkecjw5EbKsFvnf0bpsTYvwcv83cPbw75vMZoin96hVZNsgfq+LhyYoUJZnyNF5
        i4u66oNm+sWeYszUnoPmkBaCC2lPbz0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-49mNaySVMlGFEiZOeZkiBQ-1; Tue, 11 Apr 2023 04:42:28 -0400
X-MC-Unique: 49mNaySVMlGFEiZOeZkiBQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50489b0fae6so5755720a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681202547; x=1683794547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBm1DJo+O34kGFp5j7ZIGRS2RcBv14D2xSf4Qhrz/60=;
        b=tAcDVFGPNakCZerKmbceWoa3WBe421xcarDvo18A5qoiw1Vk6ppiZBiCf0QShdwmKF
         m/fQly4NwsyFOPkKm5GrGZfMktKEFbmBtKVu9WawcrfK1Sipjz3LA9Y0Ta7JHMG2gAS+
         0vZ4TsLAkRJHbjenEgFZ+LycS/YgzRJPOV2abJgTqVWGBcjNNTceN5qGbo/LW4iom+en
         OwMPzCcWJdbcY+36O11CDi2Nk0vz+LZqwSlQSjQbodWg7QaXJ5qQjHDR5i3Jd2/aQ+yp
         KqjrFWzOqUq2GkNZX1OcAPM8m+6ilf28g/O5e6gfyte5ldvzhP6o/z31p1zpAaCAs/yB
         Wjlw==
X-Gm-Message-State: AAQBX9f2hFLcgeecpHnyGCy+t7slO9Gw3/oVN3f3KgiQ6AmO2HlpEgqD
        Hag40AhAoVxNoBQ8rr5LxCTm9VV0ej7Fn1t42ny2SJ7ic3ex0+Exy56PryXFySf7QtnuzKfYR4T
        Z1OjrC/NHak//w5WhTM0s9dE1NC5hzGK3Eg==
X-Received: by 2002:a05:6402:3550:b0:504:6f39:8d1e with SMTP id f16-20020a056402355000b005046f398d1emr14162226edd.0.1681202547288;
        Tue, 11 Apr 2023 01:42:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350aIUSinhP/9bUwKFEOSeh/E3DYXxAQfvWzJdnl5A9NC/jcS/NRd1jzjEnDwQu+FF+CX3e0fAQ==
X-Received: by 2002:a05:6402:3550:b0:504:6f39:8d1e with SMTP id f16-20020a056402355000b005046f398d1emr14162212edd.0.1681202546909;
        Tue, 11 Apr 2023 01:42:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fy36-20020a1709069f2400b00927f6c799e6sm5839867ejc.132.2023.04.11.01.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:42:26 -0700 (PDT)
Message-ID: <ed988e83-ad6b-f648-4555-d78500fea3b1@redhat.com>
Date:   Tue, 11 Apr 2023 10:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2] platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in
 D3
Content-Language: en-US, nl
To:     "David E. Box" <david.e.box@linux.intel.com>,
        srinivas.pandruvada@linux.intel.com, irenic.rajneesh@gmail.com,
        david.e.box@intel.com, markgross@kernel.org, rjw@rjwysocki.net
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230409192535.914540-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230409192535.914540-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/9/23 21:25, David E. Box wrote:
> On Meteor Lake, the GNA, IPU, and VPU devices are booted in D0 power state
> and will block the SoC from going into the deepest Package C-state if a
> driver is not present. Put each device in D3hot if no driver is found.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> 
> V2 - Fix missing static reported by lkp

Thank you for your patch, I've applied this patch to my review-hans 
branch:
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
> +static void mtl_set_device_d3(unsigned int device)
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

