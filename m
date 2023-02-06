Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B247C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 13:50:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjBFNuo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 08:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBFNua (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 08:50:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2289FF24
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 05:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675691340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D7t65WL/jguZZnvFepWV6wM1ypQrRb0SSpUcwmA5Ktc=;
        b=YMF6noabuyEhR3g0ZTN0AXgY/ALBWVy35wZcud5YGrFAEU0W4zcvDYAOCyA1hLQfkJbpwC
        33pO0wwEeTQrqLtoafea/JLUf6j80zuybyesyY1YgysAb/fyZUNR1khGL3Httmg6a4HodH
        BlnaFLxh9Y42l6n6lz9MI8zMNnkKSEg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-YYy6IWAFOpOBfkHCqV_KGw-1; Mon, 06 Feb 2023 08:45:41 -0500
X-MC-Unique: YYy6IWAFOpOBfkHCqV_KGw-1
Received: by mail-ej1-f71.google.com with SMTP id sa8-20020a170906eda800b0087875c99e6bso8791355ejb.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Feb 2023 05:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7t65WL/jguZZnvFepWV6wM1ypQrRb0SSpUcwmA5Ktc=;
        b=2hMoB7qpiG13Lf0w1FaJsV7sRCKp/g7sw7nArcNXb3yvNyxyNOSLdMaow/+97ngyDX
         /eTH5ByRUKPTMEErlLpd5vJfaT2jZ8SIrYG28YtwDU9AXpEYO86ww7k+r9c+qVy07TJf
         h74BRBYgxtR1GcNH67oJsrSBFFA9/dG67LDo306k4971HY3DuvItyhMyTIKvCRzyfZm3
         j+AyHoVfF2EFfrM/SnWuI/0nxF8CKT9kqUTSmt/fg/Hwse64t22t2VCOQXsbFRSF4ZGb
         MN+7hzxoOso57N9ZiKEEt8Uzo0qkRMr51QvzlCem6sev91l73tmLYehI6FSpZxxcnzsp
         ikNw==
X-Gm-Message-State: AO0yUKWTqm2AeiWiqXkbei7Zn5Jk31PkcvuquQ0YoH9IzOhj/RLDWYXY
        yZmFM/HCSFuF53I/7BA3CJbGke6Qs7EV2zpX2gXVh16jgOGuERvePMgSoMSnAUlWUCnJkj4uytR
        diDndFWM+XOR9ZDUjwx47F1WZSLA6pzBGNA==
X-Received: by 2002:a17:906:e98:b0:88f:926c:c0a7 with SMTP id p24-20020a1709060e9800b0088f926cc0a7mr11557096ejf.18.1675691140269;
        Mon, 06 Feb 2023 05:45:40 -0800 (PST)
X-Google-Smtp-Source: AK7set86XRrP83rvXQCoeK/Ex8ajzpm8ZEVJuSpFk7kKwIKoYnKcr9beQmjxwhE+5bkHKpF3iE8MRw==
X-Received: by 2002:a17:906:e98:b0:88f:926c:c0a7 with SMTP id p24-20020a1709060e9800b0088f926cc0a7mr11557084ejf.18.1675691140142;
        Mon, 06 Feb 2023 05:45:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kd21-20020a17090798d500b008857fe10c5csm5422405ejc.126.2023.02.06.05.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 05:45:39 -0800 (PST)
Message-ID: <a6108a64-8318-6156-d205-f7f401b4ad6d@redhat.com>
Date:   Mon, 6 Feb 2023 14:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86/intel/vsec: Add support for Meteor Lake
Content-Language: en-US, nl
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org
Cc:     Gayatri Kammela <gayatri.kammela@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230203011716.1078003-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230203011716.1078003-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/23 02:17, David E. Box wrote:
> From: Gayatri Kammela <gayatri.kammela@linux.intel.com>
> 
> Add Meteor Lake PMT telemetry support.
> 
> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/intel/vsec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 07ae77a3bbe4..bc38fe4962b2 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -419,14 +419,23 @@ static const struct intel_vsec_platform_info dg1_info = {
>  	.quirks = VSEC_QUIRK_NO_DVSEC | VSEC_QUIRK_EARLY_HW,
>  };
>  
> +/* MTL info */
> +static const struct intel_vsec_platform_info mtl_info = {
> +	.quirks = VSEC_QUIRK_NO_WATCHER | VSEC_QUIRK_NO_CRASHLOG,
> +};
> +
>  #define PCI_DEVICE_ID_INTEL_VSEC_ADL		0x467d
>  #define PCI_DEVICE_ID_INTEL_VSEC_DG1		0x490e
> +#define PCI_DEVICE_ID_INTEL_VSEC_MTL_M		0x7d0d
> +#define PCI_DEVICE_ID_INTEL_VSEC_MTL_S		0xad0d
>  #define PCI_DEVICE_ID_INTEL_VSEC_OOBMSM		0x09a7
>  #define PCI_DEVICE_ID_INTEL_VSEC_RPL		0xa77d
>  #define PCI_DEVICE_ID_INTEL_VSEC_TGL		0x9a0d
>  static const struct pci_device_id intel_vsec_pci_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_ADL, &tgl_info) },
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_DG1, &dg1_info) },
> +	{ PCI_DEVICE_DATA(INTEL, VSEC_MTL_M, &mtl_info) },
> +	{ PCI_DEVICE_DATA(INTEL, VSEC_MTL_S, &mtl_info) },
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_OOBMSM, &(struct intel_vsec_platform_info) {}) },
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_RPL, &tgl_info) },
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_TGL, &tgl_info) },

