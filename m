Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DA6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 10:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbiKGKtB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 05:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbiKGKs5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 05:48:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE23192B1
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 02:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667818076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6uB+o4Cfcmanq/bCzxYHPJLa/HX+1EYHUXSVCbX6GIY=;
        b=AMIp3fltF8R4ZnVhQ28FghEz+NRbThpWv+q8y8GOkP6aDjV+tZhIrDyAKMgtSudq6Ilst6
        utzznhgABX0Gnd3WWdRQMcPHfgz/pS9cxKyZ87x7KdWz1QR/zlrUToYk0olJ4Vs64aK3D1
        vG/1OR6wBdUk+EPTOqVrhTL6vfsYtcw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-cnmJrNCgMNuek4meMYWPJw-1; Mon, 07 Nov 2022 05:47:55 -0500
X-MC-Unique: cnmJrNCgMNuek4meMYWPJw-1
Received: by mail-ej1-f71.google.com with SMTP id sc40-20020a1709078a2800b007ae024e5e82so6086442ejc.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 02:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uB+o4Cfcmanq/bCzxYHPJLa/HX+1EYHUXSVCbX6GIY=;
        b=VOSOlYQEHNCzjHdpZcKZfGdoHPJ5AkXdg/iyFGAeMbX9qSnieE/Niqi0W2mkYFKUg8
         KqtInAHgzOjwEp+v47pOMfjab0MF/BTCPiwskwiz7jj9cfq2e2lY+omtuAVqcY8sYkK1
         iO765vc952/VO8W4+27oV1dtkuej8+1U6gpr5Ap/120ZztBlZ2D1RCXI8uPyreSa9QlE
         d5l7y3jIe8d/5JF0tXIuZfaWYKbMy8h2I2JKiyxBbEqMy2+EE/u4kOCqWh6yX+OwfNo1
         1L1Gm5MJKTFCVum6IUS5Jaw0TyLnC8nu3YxmrM98uEMkwXQoWdpTxgG6irWK8zfY0oNU
         jmaQ==
X-Gm-Message-State: ACrzQf03cVQKkQXbRuMs4zYo3WvNAWkg657Mf3MBiK85i7oCIiBv62wg
        sXkT+gpvH9Z+TeHPR+ruEyQVj9qTU2pgg/XGGmSHu72Q4eTMp3SGIBEXLL+ERz336SiSnsIHMcW
        MNQXHeWnDLKniNLiiVW2z4/DccaunG9wbbg==
X-Received: by 2002:a17:906:cc0e:b0:7ad:a4c4:8745 with SMTP id ml14-20020a170906cc0e00b007ada4c48745mr47653822ejb.175.1667818073864;
        Mon, 07 Nov 2022 02:47:53 -0800 (PST)
X-Google-Smtp-Source: AMsMyM71LlJLwbmqYAfeJQNC0P54b8z/PFnDDLzAmDlLXlICaNUz/YJAACHxPlDuK3fRa72CphMkVg==
X-Received: by 2002:a17:906:cc0e:b0:7ad:a4c4:8745 with SMTP id ml14-20020a170906cc0e00b007ada4c48745mr47653808ejb.175.1667818073664;
        Mon, 07 Nov 2022 02:47:53 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id en6-20020a056402528600b0044e937ddcabsm4021222edb.77.2022.11.07.02.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:47:53 -0800 (PST)
Message-ID: <6d660c14-d7ad-e7d7-31e6-8891b48491a6@redhat.com>
Date:   Mon, 7 Nov 2022 11:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86/intel/pmt: Sapphire Rapids PMT errata fix
Content-Language: en-US
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221105034228.1376677-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221105034228.1376677-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/5/22 04:42, David E. Box wrote:
> On Sapphire Rapids, due to a hardware issue affecting the PUNIT telemetry
> region, reads that are not done in QWORD quantities and alignment may
> return incorrect data. Use a custom 64-bit copy for this region.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

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


> ---
>  drivers/platform/x86/intel/pmt/class.c | 31 +++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 53d7fd2943b4..46598dcb634a 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/kernel.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/pci.h>
> @@ -19,6 +20,7 @@
>  #define PMT_XA_START		0
>  #define PMT_XA_MAX		INT_MAX
>  #define PMT_XA_LIMIT		XA_LIMIT(PMT_XA_START, PMT_XA_MAX)
> +#define GUID_SPR_PUNIT		0x9956f43f
>  
>  bool intel_pmt_is_early_client_hw(struct device *dev)
>  {
> @@ -33,6 +35,29 @@ bool intel_pmt_is_early_client_hw(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(intel_pmt_is_early_client_hw);
>  
> +static inline int
> +pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
> +{
> +	int i, remain;
> +	u64 *buf = to;
> +
> +	if (!IS_ALIGNED((unsigned long)from, 8))
> +		return -EFAULT;
> +
> +	for (i = 0; i < count/8; i++)
> +		buf[i] = readq(&from[i]);
> +
> +	/* Copy any remaining bytes */
> +	remain = count % 8;
> +	if (remain) {
> +		u64 tmp = readq(&from[i]);
> +
> +		memcpy(&buf[i], &tmp, remain);
> +	}
> +
> +	return count;
> +}
> +
>  /*
>   * sysfs
>   */
> @@ -54,7 +79,11 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  	if (count > entry->size - off)
>  		count = entry->size - off;
>  
> -	memcpy_fromio(buf, entry->base + off, count);
> +	if (entry->guid == GUID_SPR_PUNIT)
> +		/* PUNIT on SPR only supports aligned 64-bit read */
> +		count = pmt_memcpy64_fromio(buf, entry->base + off, count);
> +	else
> +		memcpy_fromio(buf, entry->base + off, count);
>  
>  	return count;
>  }
> 
> base-commit: 225469d4acbcb873358d7618bad6e0203b67b964

