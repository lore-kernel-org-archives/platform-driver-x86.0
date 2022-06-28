Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EF7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Jun 2022 21:25:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiF1VZG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Jun 2022 17:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiF1VZF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Jun 2022 17:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D49603A731
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2022 14:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656451503;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xl/Fq3aI5MxcGRQwvCytnZREphBAGecmNnGHoTX9/fA=;
        b=cANikGApbagCw/83Jhp8mxf7CJIkRQk1kFcRxeWsFleD0wthvfYjpZ6U/E770MYpTmH/kY
        MuSwGbvy8AYjEzWgKWgo3ZTZFTOJhAOBD6EeSKyOYL+YoW3uDvNPOJs7jyVRoonekAs60X
        hD/koNiHVCBJssdTngpeHUljdolfLf0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-TOsbV9kxN368zmzWFFFSQw-1; Tue, 28 Jun 2022 17:25:01 -0400
X-MC-Unique: TOsbV9kxN368zmzWFFFSQw-1
Received: by mail-ed1-f72.google.com with SMTP id w8-20020a056402268800b004379267f163so5486099edd.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2022 14:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xl/Fq3aI5MxcGRQwvCytnZREphBAGecmNnGHoTX9/fA=;
        b=nq1JA8cOCLnWHzm7367ql8YcX5Z7iKQ05QY3ly5NSSZfW1pt1qKhs1K7k+3d49aRYn
         l3h7zVvvla9tuAwkU/01hQWLm4LL4C1qpNG7dHm2W+T3IYI67EyHQIbHjtefLa1tESqf
         DGKguhjVVl6gB6ur8rfSTtFqQw8lk7ygq8bDr0LZAC5bIDOVfA/TLAkhaLkyKfkgcP0l
         xKvvJyN654dnCLjbwzgG93JM9a1jTHX1w1d4Hwovbqe3R5QJfUjaBAalqjp5h+VIo6bw
         2v75uXtkYM1OKde2Y+YTLBlxoi6fLvJXrPyMAzLgsEZiYOtBtRGCsmKU61Hn8cGEwm3D
         o/0A==
X-Gm-Message-State: AJIora+e3aChAvkk2xXwdz1CXKDek+kFnd1uHMaGX7i1usDCn/3KuSpk
        I2A6+1uV2nt+BmG3lUM1uc2d6l9FfoGsYPLPUIfj4nvOxTi5qUV48WTFZpybuQUC4pQnI8a8dTQ
        tmA1dsPL7LMQxD6vjcsP06ad8gnEuhV6p7w==
X-Received: by 2002:a17:906:7386:b0:715:7024:3df7 with SMTP id f6-20020a170906738600b0071570243df7mr81250ejl.543.1656451500400;
        Tue, 28 Jun 2022 14:25:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTnum0GpPfJsvt8qSMvEwb2tgAmQ9Hwn/c5JV4Hh36sXQRXdGRQoAnRgz6pVG6ofW5EaK6Ww==
X-Received: by 2002:a17:906:7386:b0:715:7024:3df7 with SMTP id f6-20020a170906738600b0071570243df7mr81238ejl.543.1656451500206;
        Tue, 28 Jun 2022 14:25:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id s10-20020a1709060c0a00b0070beb9401d9sm6966520ejf.171.2022.06.28.14.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 14:24:59 -0700 (PDT)
Message-ID: <b11094eb-fd3c-06d9-adca-7d56f40e7f4f@redhat.com>
Date:   Tue, 28 Jun 2022 23:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: hp-wmi: Ignore Sanitization Mode event
Content-Language: en-US
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, markgross@kernel.org
Cc:     Jorge Lopez <jorge.lopez2@hp.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220628123726.250062-1-kai.heng.feng@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220628123726.250062-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/28/22 14:37, Kai-Heng Feng wrote:
> After system resume the hp-wmi driver may complain:
> [ 702.620180] hp_wmi: Unknown event_id - 23 - 0x0
> 
> According to HP it means 'Sanitization Mode' and it's harmless to just
> ignore the event.
> 
> Cc: Jorge Lopez <jorge.lopez2@hp.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

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
>  drivers/platform/x86/hp-wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0d8cb22e30df9..bc7020e9df9e8 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -89,6 +89,7 @@ enum hp_wmi_event_ids {
>  	HPWMI_BACKLIT_KB_BRIGHTNESS	= 0x0D,
>  	HPWMI_PEAKSHIFT_PERIOD		= 0x0F,
>  	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
> +	HPWMI_SANITIZATION_MODE		= 0x17,
>  };
>  
>  /*
> @@ -853,6 +854,8 @@ static void hp_wmi_notify(u32 value, void *context)
>  		break;
>  	case HPWMI_BATTERY_CHARGE_PERIOD:
>  		break;
> +	case HPWMI_SANITIZATION_MODE:
> +		break;
>  	default:
>  		pr_info("Unknown event_id - %d - 0x%x\n", event_id, event_data);
>  		break;

