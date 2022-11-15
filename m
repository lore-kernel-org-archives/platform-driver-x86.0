Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF72C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 21:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbiKOVCG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 16:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238611AbiKOVB6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 16:01:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CF6317C0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 13:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668546054;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qayv+b0uuecedAlRVGTipngS65XMONYqcoB5EKtgL3g=;
        b=EWR7e4Sc2xzwL0Zc+dhurpXhDO75zsjlvQ//kDPMdl/W4ciPiK9lQI2anYgP60bGuEne9r
        STMQ/br/zeuMJVybCUF6IwFLKhvgLSp3r7odovIS7MD7x1KT6ipuy4PTJ9UHCK2h+MINQw
        tWGNsIW+gnA4RyuFhXp5tut/4m0cVys=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-b9aAMVXVME6XIdtNZnJHtQ-1; Tue, 15 Nov 2022 16:00:51 -0500
X-MC-Unique: b9aAMVXVME6XIdtNZnJHtQ-1
Received: by mail-ed1-f69.google.com with SMTP id z15-20020a05640240cf00b00461b253c220so10728129edb.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 13:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qayv+b0uuecedAlRVGTipngS65XMONYqcoB5EKtgL3g=;
        b=a3ASzlbPKSrHutTt1xjy5p3hWP250qylgz17AQqNKdjDebsd1ubOPXweiq3+eiUL3Q
         eTr2305QFhKNRAoMGdA9Uc5Ks9DNxq9Df6b5tM2GgmDi0WeVeD7LvUVmJsEi5M0CGlux
         l6Yppq8G9RbWmU5HXzHfSyMQbzNN3gak6R3X1CazNgEtCHYlrJDj6U96ONZwNHgYXRDS
         0TsMef+cDFBMqfzfqbn1LAbTsbn94CBmkHR7ohZBxJNvjmH7ERBc1Ss6Km8MkK2oQszu
         Owg0210spCZNQxnYftOMQB0/BilhEgk8DocKcEiZFv0vmLz1k/o4wPWZPnzy1FU2XU2C
         4bqg==
X-Gm-Message-State: ANoB5pn9S4QaceXpUNKGDpCQC5Qi9NNxIoz4QTUv7qz557kNPBrVZyNu
        6TdZ1WCbJcCpuIT64042lroKOqO7rGHNk+lrs481QuURAQZZvKOQcv2OchC4tfgtXM3wBjPW8Kk
        +nVJA96Qe+eMMBRvlIGZ2oAi2JHihIPHhag==
X-Received: by 2002:aa7:d759:0:b0:463:fec2:dfb1 with SMTP id a25-20020aa7d759000000b00463fec2dfb1mr16939549eds.303.1668546049697;
        Tue, 15 Nov 2022 13:00:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7W8nUz5KKt4LOr3lxVyJlBMdv9+vKykTmiEnQsfFkRK8ms8y/lnAwUUPx3SXV5KTT3Bn+Oig==
X-Received: by 2002:aa7:d759:0:b0:463:fec2:dfb1 with SMTP id a25-20020aa7d759000000b00463fec2dfb1mr16939536eds.303.1668546049505;
        Tue, 15 Nov 2022 13:00:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h7-20020a17090619c700b0078d4c72e2cesm5956786ejd.44.2022.11.15.13.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 13:00:49 -0800 (PST)
Message-ID: <bb58d54a-446b-5f4e-4bca-aaddfad29927@redhat.com>
Date:   Tue, 15 Nov 2022 22:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 7/7] platform/x86: ideapad-laptop: Don't expose
 touchpad attr on IdeaPads with SYNA2B33
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        ike.pan@canonical.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        mgross@linux.intel.com, pobrn@protonmail.com
References: <20221029120311.11152-1-erayorcunus@gmail.com>
 <20221029120311.11152-8-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221029120311.11152-8-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/22 14:03, Eray Orçunus wrote:
> My 520-15IKB (2017) with SYNA2B33 doesn't have working VPCCMD_W_TOUCHPAD command -
> it's the touchpad program switches the touchpad instead on Windows. Considering
> all IdeaPads with SYNA2B33 touchpad produced in 2017/2018, it's very likely that
> none of the IdeaPads with SYNA2B33 support touchpad switching via EC. So let's
> add SYNA2B33 to the touchpads not switchable via EC.
> 
> Signed-off-by: Eray Orçunus <erayorcunus@gmail.com>

As already discussed in the other thread I'm not sure this is the best way to
go about this, lets continue discussing this in the other thread.

Regards,

Hans


> ---
>  drivers/platform/x86/ideapad-laptop.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index b34fbc4d741c..937126c62a14 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1621,8 +1621,12 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  				"Could not find PCI* node in the namespace\n");
>  	}
>  
> -	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
> -	priv->features.touchpad_ctrl_via_ec = !acpi_dev_present("ELAN0634", NULL, -1);
> +	/*
> +	 * Most ideapads with ELAN0634 and SYNA2B33 touchpads don't use
> +	 * EC touchpad switch
> +	 */
> +	priv->features.touchpad_ctrl_via_ec = !acpi_dev_present("ELAN0634", NULL, -1) &&
> +					      !acpi_dev_present("SYNA2B33", NULL, -1);
>  
>  	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
>  		priv->features.fan_mode = true;

