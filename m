Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6E6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 17:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiGJRti (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 13:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGJRth (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 13:49:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9C95DF06
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 10:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657475374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FzdVLMqWIQtzetBiXQUSF9ahreGIHUfW2yqEG+CRxYY=;
        b=evI6wQ6KtBnv6TnIrdOk9g1cwEfA9Bc//vICl90GrsAGO0twL0JrTBtJS5/nRPaks1Q6di
        y2wiebQSf58kIRQUUIhGIPJH04aiBExeKxCJjWMclodBsRwCtxrO6DRLhqLiItL8Svt8Gs
        m5vb3CWhdnt2KxwKFZDHyVIYLekfVPs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-x6_QfTlgM5qYgu2T80J6tQ-1; Sun, 10 Jul 2022 13:49:33 -0400
X-MC-Unique: x6_QfTlgM5qYgu2T80J6tQ-1
Received: by mail-ed1-f71.google.com with SMTP id b15-20020a056402278f00b0043acaf76f8dso1386438ede.21
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 10:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FzdVLMqWIQtzetBiXQUSF9ahreGIHUfW2yqEG+CRxYY=;
        b=24/fHW0WzRRDrPZOZX+xTT2N6yMvXMuE6PEpvBY/NFYU0j0ozOALJWAEPuq1ajf7Vw
         3IiFEIas5IcKRaPNIW/yjsQ/sktXR3vbClo2Q06KwjOjRG1qeUBy+SCgZuM2SZEtSb14
         uIL+c3Isfb5zFO7GV7X+n5LR33Y4AaxcYESBMItRrG8vihThSalEf8h1sK6fmyrJIXpi
         sNrGXX5WVDTSWuKxE0WTCnfu44cjhiJrp2ZSTsa1CX/g9/PcPrejTaL1YOmvPCxctUYE
         PMh8MG2LhZY1cTWsO/ubrBIjPHaxiRIPfk+kmKG/i5x2G5+uKpvFrfz7WqSvCen+BYXj
         jHQA==
X-Gm-Message-State: AJIora8A+F9Zw8tBbo55BTSduEmR76vJetKarQcIxkgqnkE12hDcYrAn
        GNCwopXjVnJVwVZ9z2hLRRoH344JcwZ1L/rbBKHjjrp4NRpmq342a757RSlp7WR3pUahRg8RML9
        SLAr0Rn04vOiWyZUseOAo9sWIMHtoTN5wZg==
X-Received: by 2002:a17:907:75f5:b0:72b:40da:a7cd with SMTP id jz21-20020a17090775f500b0072b40daa7cdmr5996589ejc.662.1657475372310;
        Sun, 10 Jul 2022 10:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1aqrogWKFMkkppuzExHlaZmrvjLLkgNTwB66+XPcd83dcFK8Y/gzABghzsm+giEga23odCw==
X-Received: by 2002:a17:907:75f5:b0:72b:40da:a7cd with SMTP id jz21-20020a17090775f500b0072b40daa7cdmr5996577ejc.662.1657475372144;
        Sun, 10 Jul 2022 10:49:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id mf8-20020a1709071a4800b0072afb6d4d6fsm1789837ejc.171.2022.07.10.10.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 10:49:31 -0700 (PDT)
Message-ID: <6827fe17-f1d5-8a1f-8b69-dc7a493645d5@redhat.com>
Date:   Sun, 10 Jul 2022 19:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: intel_atomisp2_led: Also turn off the
 always-on camera LED on the Asus T100TAF
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220710173658.221528-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220710173658.221528-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/10/22 19:36, Hans de Goede wrote:
> Like the Asus T100TA the Asus T100TAF has a camera LED which is always
> on by default and both also use the same GPIO for the LED.
> 
> Relax the DMI match for the Asus T100TA so that it also matches
> the T100TAF.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/atomisp2/led.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/atomisp2/led.c b/drivers/platform/x86/intel/atomisp2/led.c
> index 5935dfca166f..10077a61d8c5 100644
> --- a/drivers/platform/x86/intel/atomisp2/led.c
> +++ b/drivers/platform/x86/intel/atomisp2/led.c
> @@ -50,7 +50,8 @@ static const struct dmi_system_id atomisp2_led_systems[] __initconst = {
>  	{
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
> +			/* Non exact match to also match T100TAF */
> +			DMI_MATCH(DMI_PRODUCT_NAME, "T100TA"),
>  		},
>  		.driver_data = &asus_t100ta_lookup,
>  	},

