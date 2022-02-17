Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EEFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 14:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242229AbiBQOzK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 09:55:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242212AbiBQOzI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 09:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B3311F5C91
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 06:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645109692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/+CI1qPD5M4rhBxpRSCy0aUrExW3/wsAoTsjWZYSmuc=;
        b=XRlAZ3wezjJXoeRLJhIqBdHZOKwmZq89oKBFkE4UWuLlF9uOnZlKDAMlc4d/JlRwJNNk1z
        Gn2vTUBl6RmRZvBwdmwF87JXaj1c3L5XjK9sfTIVI6Jlpkpf0sizR1KCVpWkoL9pEFkGlI
        E1Ovvzq6cLq2Yfm8DQTx5yJzYcasNXg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-JXr2yk3EMeGFdGGlO5XyLQ-1; Thu, 17 Feb 2022 09:54:51 -0500
X-MC-Unique: JXr2yk3EMeGFdGGlO5XyLQ-1
Received: by mail-ej1-f72.google.com with SMTP id gn20-20020a1709070d1400b006cf1fcb4c8dso1634376ejc.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 06:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/+CI1qPD5M4rhBxpRSCy0aUrExW3/wsAoTsjWZYSmuc=;
        b=cvM7CKUROeL5CG68rFygx47XGfHITEFCxaztUivpN2SVTIpi8rTl+zb2PZ/egVAYvW
         q+UeGPYNieeRFQe52fTixOAgQUett6ZzPhudVWfzTup9PcKiRluX1y1q5rIVUDG2FvEM
         x94obK3ipr6aeMKIQX2Mng+eEs+guAaa+jomRHCl5L/3zei58St/Sq9fdktTeiNSp6WR
         UcvDrvQDm0HhLtJ1BeITJjakDuabpoUQZoXQZwlwlBuzZnhj3ZDfBWUneidTII+rOet9
         0xODiuMInZLNI6NtwcnaB7mHZm/rw9aQmQPSKbCze+/YaBctJC+A2WpgQpN5ZBRj6BxU
         xTRg==
X-Gm-Message-State: AOAM532rtBo+uJhxqEj88ol1znGrcBJxGQ/VRvHmMRNkFLF2faME1oVL
        E6eRuV19NJ/VCHPrQNPhSlDgplXLsGMrZ0eIbAAI28wFdCA28zHHQG86FX2fsvelkhElC5NDIT2
        +YQngidbkIGsut00gnW2oCe/LwH0pxEjOOg==
X-Received: by 2002:a17:907:77c7:b0:6b7:98f2:6fa2 with SMTP id kz7-20020a17090777c700b006b798f26fa2mr2579119ejc.541.1645109689942;
        Thu, 17 Feb 2022 06:54:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBOb5FoSmtHAMkCHvIMm9oAk04ZTkWPmt1GX0fgxIWCjBK3S9qFHCZgWyteoo9/7xu0SwUNw==
X-Received: by 2002:a17:907:77c7:b0:6b7:98f2:6fa2 with SMTP id kz7-20020a17090777c700b006b798f26fa2mr2579108ejc.541.1645109689720;
        Thu, 17 Feb 2022 06:54:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id hs25sm1256788ejc.172.2022.02.17.06.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 06:54:49 -0800 (PST)
Message-ID: <d255cff2-08ff-3173-aac6-0abcd2a8bc57@redhat.com>
Date:   Thu, 17 Feb 2022 15:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/dcdbas: move EXPORT_SYMBOL after function
Content-Language: en-US
To:     =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Stuart Hayes <stuart.w.hayes@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20220212125908.357588-1-mat.jonczyk@o2.pl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220212125908.357588-1-mat.jonczyk@o2.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/12/22 13:59, Mateusz Jończyk wrote:
> The declaration
>         EXPORT_SYMBOL(dcdbas_smi_request);
> was placed after smi_request_store(), which made a false impression that
> dcdbas_smi_request() was not exported.
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>

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
>  drivers/platform/x86/dell/dcdbas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
> index 5e63d6225048..db3633fafbd5 100644
> --- a/drivers/platform/x86/dell/dcdbas.c
> +++ b/drivers/platform/x86/dell/dcdbas.c
> @@ -284,6 +284,7 @@ int dcdbas_smi_request(struct smi_cmd *smi_cmd)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL(dcdbas_smi_request);
>  
>  /**
>   * smi_request_store:
> @@ -351,7 +352,6 @@ static ssize_t smi_request_store(struct device *dev,
>  	mutex_unlock(&smi_data_lock);
>  	return ret;
>  }
> -EXPORT_SYMBOL(dcdbas_smi_request);
>  
>  /**
>   * host_control_smi: generate host control SMI
> 

