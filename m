Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87204C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 May 2022 17:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242969AbiESRoK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 May 2022 13:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239575AbiESRoJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 May 2022 13:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 28B7B674F4
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 10:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652982245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TbKUDAKlg/Ogjr+4QtQJqlmidAs8wGDhpgalHiP6hOo=;
        b=GncvwfsXmWksaV2D/D5dcRUcq2QlVL2Vurwa27vjeFOviWblnoM8H49ltvuZgG8HV5gdas
        hOu5Kn/4mqGiNqZ1ZZFLmPI3X2Mmx6NyM+i2b7ikKLcf2++j8xA8gqX7P6VhrSb1jaUW3B
        QQz0V+QcyzpgLBxtEfDgkZRSDcaBW/4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-jj7lnYWoOEqIRkDOBaXYQA-1; Thu, 19 May 2022 13:44:04 -0400
X-MC-Unique: jj7lnYWoOEqIRkDOBaXYQA-1
Received: by mail-ed1-f69.google.com with SMTP id i22-20020aa7dd16000000b0042a9f9e2272so4044935edv.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 10:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TbKUDAKlg/Ogjr+4QtQJqlmidAs8wGDhpgalHiP6hOo=;
        b=m1ZtHY+A5Ozidbt2gaCnVZjo5GtY81VF4BHS9dil6N5uHL/SA6bBPDpVx/nTTIg1N7
         0ONCaFvsa6YyDfMswXONKe/vC5ON/ESZLdulJ0LjzLfyywAo5wLvA+wPZcr4/SaXI4ce
         ++nxeRf4/zIvcJSYhyZJ2AEMo4VJG3AKzCB2Yoq5ntXfeys2HOHpi1hVE6bJCBz7FSoi
         BJC3qldoKqkuPJu2hO3ThpVHYdAM+Qy0FDmIb3QjIKDsqbU3BM/bKenlvonJFVlIh20f
         YtIp2A0J/A7dYyF3ny5m5sNHwoOpAQZPv9fmmzH+NNAcM1/VmFBHofjH9lvd5hzYzkE5
         N0lg==
X-Gm-Message-State: AOAM531//bAe2eCy4e4MVsAGIPyX5E0nUrry5iI3xBN+pY7esvEPqSg/
        CkiQYlOt8gWpzaNwPeYYM935zF6xs/Vt45MOikwyDEu8V3iPVOeFrgbXHA1lXX1sgcRPPWKhdlx
        JFeftcaWn6t0VHRF4xU4o7laoEJZ2JxDzmA==
X-Received: by 2002:a05:6402:2999:b0:428:bb4d:6cea with SMTP id eq25-20020a056402299900b00428bb4d6ceamr6631356edb.29.1652982242776;
        Thu, 19 May 2022 10:44:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvMbOp5T/ObRZXQ6Jq5u59322uAqzlrp5apy+zFigpuah5J4H5qKyzhYRShJqiKytyVEbuWA==
X-Received: by 2002:a05:6402:2999:b0:428:bb4d:6cea with SMTP id eq25-20020a056402299900b00428bb4d6ceamr6631339edb.29.1652982242610;
        Thu, 19 May 2022 10:44:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v18-20020a056402349200b0042ac43be19dsm3339522edc.3.2022.05.19.10.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 10:44:02 -0700 (PDT)
Message-ID: <b08e3ae2-18b8-fe4d-7658-c51baf2dd197@redhat.com>
Date:   Thu, 19 May 2022 19:44:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: intel_cht_int33fe: Set driver data
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220519122103.78546-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220519122103.78546-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/19/22 14:21, Heikki Krogerus wrote:
> Module removal fails because cht_int33fe_typec_remove()
> tries to access driver data that does not exist. Fixing by
> assigning the data at the end of probe.
> 
> Fixes: 915623a80b5a ("platform/x86: intel_cht_int33fe: Switch to DMI modalias based loading")
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

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
>  drivers/platform/x86/intel/chtwc_int33fe.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/x86/intel/chtwc_int33fe.c
> index 0de509fbf0209..c52ac23e23315 100644
> --- a/drivers/platform/x86/intel/chtwc_int33fe.c
> +++ b/drivers/platform/x86/intel/chtwc_int33fe.c
> @@ -389,6 +389,8 @@ static int cht_int33fe_typec_probe(struct platform_device *pdev)
>  		goto out_unregister_fusb302;
>  	}
>  
> +	platform_set_drvdata(pdev, data);
> +
>  	return 0;
>  
>  out_unregister_fusb302:

