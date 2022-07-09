Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BAAC43334
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 09:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiGIJqA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 05:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiGIJpr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 05:45:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C59506E886
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657359932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iWvnBMFObBlyOO6QJSeCElG9d75fpXtdy6dwQMRWtN0=;
        b=a2kjd0JTWyqi/pv55ettf9OJ5Y7bk7abqQtPYMt1NIG2bvhtUS6+esZQdmZLnrc9yyObFn
        UwBxVYhRgO13Ol5KjV8ccT6EOLCJ89bOgxHpMQrsUV0nxEpdV7i8ifHgPG8/B6FEZPn1zt
        KoQknbZBpu+HbuTwzhz65LhwmcawxoM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-T5Cbqp-KPbytiFitCPCgdQ-1; Sat, 09 Jul 2022 05:45:30 -0400
X-MC-Unique: T5Cbqp-KPbytiFitCPCgdQ-1
Received: by mail-ej1-f72.google.com with SMTP id l2-20020a170906078200b006fed42bfeacso68758ejc.16
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Jul 2022 02:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iWvnBMFObBlyOO6QJSeCElG9d75fpXtdy6dwQMRWtN0=;
        b=t1/LRud7Nh4UIkVk+HTi+venwkFpJNgTUhZvk5tIsku+hxDHcN1FJTTg66Ay4lnH8v
         j4JUNoTiAHUnkgoVwiQmEs4qBEuzuGBkJ5F8oX4hNxi7522+5B5zqqOwmq/7PF/qWrTO
         DEF+VJugvagniWunW6eUpL6ept9qiBq0t6kjCXtQAILgItXfoib5AK9qnzEw5nyRC27I
         ScR2LMc46aFmdU38FRFe3MV+yjbq4Y7FcLtYOpC0Jdgh2yOPkrMR95ZRmmDDfvprJ7vG
         lcRFEjLb3EPvxHxA/rqNlFIgMW3Gc2kpqOs6fQW2FWXpC44XtmCW65qdqzuF6SC2Ik59
         OvIg==
X-Gm-Message-State: AJIora9q76Me5eyHZaH68cpkxJ34ZUBbwcseh6EFrC+x1IlENE1AAyJh
        HraUeeqDx08evpmv5YpRbGkdoG76fZ09vdi2+zWln4h94FW1IOi7NHCIn9Ma04lbyir66lUO1fc
        sj1TLgxwr6jHdKPkF00vl5E1f3bJ74fnr1w==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id n9-20020a05640205c900b00420aac6257bmr10338731edx.128.1657359929498;
        Sat, 09 Jul 2022 02:45:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sktFAj695Q1qN3O0qx1hrC8DPFEhPTFugT3sudOcjMzshgtIOXHdA/+MZHh2dgOnE5u3d0qw==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id n9-20020a05640205c900b00420aac6257bmr10338720edx.128.1657359929354;
        Sat, 09 Jul 2022 02:45:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kx13-20020a170907774d00b0072aebed5937sm415607ejc.221.2022.07.09.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 02:45:28 -0700 (PDT)
Message-ID: <929f8a53-0529-a4fe-699a-18e8f106368e@redhat.com>
Date:   Sat, 9 Jul 2022 11:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 1/7] platform/x86: serial-multi-instantiate: return
 -ENOENT when no resources found
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>
References: <20220709000636.35550-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220709000636.35550-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 7/9/22 02:06, Andy Shevchenko wrote:
> Distinguish the case when device is present, but there are no resources.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

IMHO it would have been better to squash this together with patch 2/7,
but think patch 2/7 should be dropped, so this one should be dropped
to IMHO.

Regards,

Hans


> ---
>  drivers/platform/x86/serial-multi-instantiate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 1e8063b7c169..97db23243018 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -100,7 +100,7 @@ static int smi_spi_probe(struct platform_device *pdev, struct acpi_device *adev,
>  	if (ret < 0)
>  		return ret;
>  	else if (!ret)
> -		return -ENODEV;
> +		return -ENOENT;
>  
>  	count = ret;
>  
> @@ -184,7 +184,7 @@ static int smi_i2c_probe(struct platform_device *pdev, struct acpi_device *adev,
>  	if (ret < 0)
>  		return ret;
>  	else if (!ret)
> -		return -ENODEV;
> +		return -ENOENT;
>  
>  	count = ret;
>  

