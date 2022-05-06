Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CECAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 10:10:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390817AbiEFKOa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 06:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384953AbiEFKO3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 06:14:29 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E33C418B3D
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651831846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yNzXFFqULcro2Xm8jKzvPPNgAioEvCfNrUO5846hy+E=;
        b=Hs+T8F9LeQE8zR0GXVFMq0+Uvarn1EQ7HBMs0kcS/R2yCH70/1sBLijAVOOIVsN97gRu2t
        P+16wSZVMFUvWz5ABGnxo9pxc0amern/dkE/9PtI0w8MR81rLded/+Onv9dDXtSLG/rekz
        WulEe9cnDMgckCHfe8pLwzTphgp86uM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-5Xl0M7vVNFuhnWqDeMaWow-1; Fri, 06 May 2022 06:10:42 -0400
X-MC-Unique: 5Xl0M7vVNFuhnWqDeMaWow-1
Received: by mail-ed1-f72.google.com with SMTP id h7-20020a056402094700b00425a52983dfso3780182edz.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 03:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yNzXFFqULcro2Xm8jKzvPPNgAioEvCfNrUO5846hy+E=;
        b=CxOhgCJ9XijzRQPQcLUZI0aTnOErj+DgdInGr+BLMV/y/as7iTEt/BwKWEm73umila
         jBBEKuatqSJqCF5fwKIQEHhD5t0qUwL96NkKdzvoHpAIfWScmjMezUCzTxNP2FidtnN7
         N2JwJ59i2Ue+xzNTI1jFeBpq7jHgwVia/arTy62bGFMZD9uDYOoYioCoPBXL3SPeHPlU
         aU24u2AN53ZQFTZsZ9OIztZpvdT4UCrKQLJTAyCtIpDiLHKAsLOldBy6xeGIjOcDf8Og
         sEgLfHHigN1bnuGqNr4m4gNoel7ftPSzwp8kgm0VCdouP61gj1XboOMF4Go8+J+pQ1iu
         wyEA==
X-Gm-Message-State: AOAM53394n7SEfELS9cXiAc/vwo3ujoF+3PrmHfGe8sZB/EXoZo4z75E
        kVEUyT4kKjP9e3JPopWBqfRs8gLXmbby4hfJbEeiD/L+QBphsElYryrsgysrvAmcakc+AVYfkJH
        tOiddoAdsaCS47yxPlXmYmH9GAR/xvwgNDQ==
X-Received: by 2002:aa7:cb4d:0:b0:425:e24f:96ba with SMTP id w13-20020aa7cb4d000000b00425e24f96bamr2640516edt.214.1651831841742;
        Fri, 06 May 2022 03:10:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyls/i/youBNjCIOSYH3hCA02MQVRuzS9ke3DkaRFVfIB53dB51/nYO/tu9/7fJlAhIOAdqhA==
X-Received: by 2002:aa7:cb4d:0:b0:425:e24f:96ba with SMTP id w13-20020aa7cb4d000000b00425e24f96bamr2640500edt.214.1651831841539;
        Fri, 06 May 2022 03:10:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id er22-20020a170907739600b006f4fc3850a5sm1494716ejc.32.2022.05.06.03.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 03:10:41 -0700 (PDT)
Message-ID: <b1ec2822-64dd-fef6-45b7-62f2518b1944@redhat.com>
Date:   Fri, 6 May 2022 12:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add a few more models to
 s2idle quirk list
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:THINKPAD ACPI EXTRAS DRIVER" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "open list:THINKPAD ACPI EXTRAS DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220503183420.348-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220503183420.348-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/3/22 20:34, Mario Limonciello wrote:
> Users have reported that there are a few other DMI strings that T14 can
> go by, and so these models should also pick up the quirk to avoid the s2idle
> firmware bug.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, since the original patch was still in my review-hans
branch (and not yet in for-next) I've squashed this fix into
the original patch.

This squashing will hopefully make backporting these fixes
easier.

Regards,

Hans





> ---
>  drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 2833609fade7..f3554068dd1e 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4463,6 +4463,22 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "20UD"),
>  		}
>  	},
> +	{
> +		.ident = "T14 Gen1 AMD",
> +		.driver_data = &quirk_s2idle_bug,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "20UE"),
> +		}
> +	},
> +	{
> +		.ident = "T14s Gen1 AMD",
> +		.driver_data = &quirk_s2idle_bug,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "20UH"),
> +		}
> +	},
>  	{
>  		.ident = "P14s Gen1 AMD",
>  		.driver_data = &quirk_s2idle_bug,

