Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC15C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 07:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiJRHsg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 03:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbiJRHse (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 03:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE5169F68
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666079302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DsW6AFUCvdQWxKPmdrQSUF2jRKznY19HdIKCRi3R3wI=;
        b=Voe48Jo9SD+8opDoYuXZhS7Nl9Si/N953bElah0I1l2Yo8/d93JqXwN8u9E5IVlY265QEW
        l2lFs4SEIgXJyxiv1wbjryb2MWNw2DIeTN2uT8ko9L3mm9weoURBpGE7K/ag5uAUAaxrQY
        26zDkkpzV1p/Ar4iPv+uEcZs+U64/74=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-m0RtT7emPYuDi3fDylnY9Q-1; Tue, 18 Oct 2022 03:48:20 -0400
X-MC-Unique: m0RtT7emPYuDi3fDylnY9Q-1
Received: by mail-ed1-f70.google.com with SMTP id dz9-20020a0564021d4900b0045d9a3aded4so3644688edb.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 00:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsW6AFUCvdQWxKPmdrQSUF2jRKznY19HdIKCRi3R3wI=;
        b=YGxxAzN06e0sX2dK3LiPpyGJA/kzUivo2XjXynX1WLgN7c42j/BLwZ0HKwPjeOKC8V
         0VyHKdS/mHVbCDB/7f5gGPzduQDWRKQB/cKk1sU1a9TAocGcOMbm0g0a95Oz1988QVST
         L3wba2dJ6op+/bgOpCqsDIgarusM9OemNM1uvo/At3Ci6miqOEmEOMxH+vsA4WTCfX/Q
         fk0AkZCfFevoFp6F7jkuZEdFk2ei+u33SENA4R6iXh6BxwHH6NB79YILQPffVuDEyLIN
         Oe+H1YaGmJtOD6P2CUCT6KXiIn8oDfILaYyCpfRmw62amBn141ZbI1yn7+XFo4ny+Dou
         QRDw==
X-Gm-Message-State: ACrzQf0YUD/xmfXoR2MvkT7K47PHZmyEodztAdfyOc9+LcFACm5B13JQ
        hCZmgqJtRq36S0CnEdgdbFO4U/5G5gfo1mhtYZwxhV8+L6oaYAd1aILwamdPmKC0UzCXLdqKlBR
        f80SF30Bro249Jt8aCFXUlsQuUlcgdCmYhQ==
X-Received: by 2002:a17:907:e88:b0:78d:fb98:6f5d with SMTP id ho8-20020a1709070e8800b0078dfb986f5dmr1343143ejc.5.1666079299296;
        Tue, 18 Oct 2022 00:48:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TZTpxCEixsinQYF9o1yYhc2T6vMAUXsWMlVpZfKMDdIquBSv6+mfNFb5bnILyY/x3KH+DOQ==
X-Received: by 2002:a17:907:e88:b0:78d:fb98:6f5d with SMTP id ho8-20020a1709070e8800b0078dfb986f5dmr1343128ejc.5.1666079299084;
        Tue, 18 Oct 2022 00:48:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a13-20020aa7cf0d000000b00454546561cfsm8477482edy.82.2022.10.18.00.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 00:48:18 -0700 (PDT)
Message-ID: <bade32f9-594c-3efd-d6da-ea6a4a433948@redhat.com>
Date:   Tue, 18 Oct 2022 09:48:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Disable touchpad_switch
To:     Manyi Li <limanyi@uniontech.com>, ike.pan@canonical.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221018061457.26937-1-limanyi@uniontech.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221018061457.26937-1-limanyi@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/18/22 08:14, Manyi Li wrote:
> Ideapads for "Lenovo Yoga 3 Pro 1370" and "ZhaoYang K4e-IML" do not
> use EC to switch touchpad.
> 
> Reading VPCCMD_R_TOUCHPAD will return zero thus touchpad may be blocked
> unexpectedly.
> 
> Signed-off-by: Manyi Li <limanyi@uniontech.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index abd0c81d62c4..20b8a94934b4 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1533,6 +1533,24 @@ static const struct dmi_system_id hw_rfkill_list[] = {
>  	{}
>  };
>  
> +static const struct dmi_system_id no_touchpad_switch_list[] = {
> +	{
> +	.ident = "Lenovo Yoga 3 Pro 1370",
> +	.matches = {
> +		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +		DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3"),
> +		},
> +	},
> +	{
> +	.ident = "ZhaoYang K4e-IML",
> +	.matches = {
> +		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +		DMI_MATCH(DMI_PRODUCT_VERSION, "ZhaoYang K4e-IML"),
> +		},
> +	},
> +	{}
> +};
> +
>  static void ideapad_check_features(struct ideapad_private *priv)
>  {
>  	acpi_handle handle = priv->adev->handle;
> @@ -1542,6 +1560,7 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  
>  	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
>  	priv->features.touchpad_ctrl_via_ec = !acpi_dev_present("ELAN0634", NULL, -1);
> +	priv->features.touchpad_ctrl_via_ec = !dmi_check_system(no_touchpad_switch_list);

This needs to be:

	priv->features.touchpad_ctrl_via_ec =
		!acpi_dev_present("ELAN0634", NULL, -1) &&
		!dmi_check_system(no_touchpad_switch_list);

Otherwise you over overriding the results of the ELAN0634 check. Also I wonder if there
is not a better way to check for this (for both cases) ?

Is the touchpad on these devices perhaps connected over I2C ? Maybe we need to figure
out a way to check for that.

Regards,

Hans



>  
>  	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
>  		priv->features.fan_mode = true;

