Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16656C54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 18:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238392AbjALSuP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 13:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234245AbjALStb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 13:49:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062532655
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673547695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xvPUTgSTTtddM5dDfnOu8lQSC/kechSSbCUe5L06LTk=;
        b=PGp+RkilpwWWJIAnk22kG8tfgk3fh+iHEpnarn1N2KHiix7CvxCGY2f0SVuK6PvNDO+pmK
        I0noyh/cuLAFh+vFjPr0Uv2uDWjlRYLIZ1GYc1AGn2wMGoMWyXry3F9Zt7ZK4C4U0OMy6G
        vgfLVOhuXvqTwYEqcpckHahWYrl9vYY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-kxjlSUXZNYGEj6Pv6I6G0A-1; Thu, 12 Jan 2023 13:21:32 -0500
X-MC-Unique: kxjlSUXZNYGEj6Pv6I6G0A-1
Received: by mail-ej1-f70.google.com with SMTP id qk40-20020a1709077fa800b007eeb94ecdb5so13258495ejc.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xvPUTgSTTtddM5dDfnOu8lQSC/kechSSbCUe5L06LTk=;
        b=r5ZVy4F0kycJSeEOh5p5NwtpKTMRY/Ora1Gp/ykw3AB8FD+zpo736zYO+zJy4Ch80Y
         cxeZXKLpPniy5fGL9xJ8GNRUKHfMXS7dfJMd3DS6cgXj4PbFlp4odjTwIJmmc9eql6KM
         Q6QDKODQ4NDRFo+ftMIfcOimb0zwiZu4gsmniQurxK701W1ZRC8bzQsBmr42D7/0axvr
         lZGyLqPusM7Cfa1Sp2Tl4TjVAf9lQX/iviAGXmSnwVBebwkonCihXhRHAWnwzgWFr2sB
         BsSurPSHiwF4EhdRRypYXNsYXJXzX33xaHptxrq354bskycjt7vi8+n1RbePaE6SbLDQ
         zkPg==
X-Gm-Message-State: AFqh2koyPaSdCgnK+JBfQ43ydB416lY0pA88GGPrOoU89wPQXffKGUZZ
        FGRot7gvQVjwDN7jzBhNJ/2cimS3oOy6M02gzsHnqIN+T2EYh3n/BXwmxIEgE1yZjWXTmfpt8Lb
        qw8mVuVLH0fwrajVdi/PvCFr5346hck/tCg==
X-Received: by 2002:a05:6402:2a08:b0:470:4d71:6d43 with SMTP id ey8-20020a0564022a0800b004704d716d43mr70339415edb.25.1673547690999;
        Thu, 12 Jan 2023 10:21:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXth8VNWGy6klRzrsNc5MVA2aExa7fD1TfSHtAya8rJf/uU68HWO0o52vVBJZZ+5hPwrc3M5kQ==
X-Received: by 2002:a05:6402:2a08:b0:470:4d71:6d43 with SMTP id ey8-20020a0564022a0800b004704d716d43mr70339407edb.25.1673547690866;
        Thu, 12 Jan 2023 10:21:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w2-20020aa7cb42000000b0046a0096bfdfsm7487578edt.52.2023.01.12.10.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:21:30 -0800 (PST)
Message-ID: <32af40f9-8b67-ae75-8b10-88475e90eb9c@redhat.com>
Date:   Thu, 12 Jan 2023 19:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add alternate mapping for
 KEY_CAMERA
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221216-asus-key-v1-1-45da124119a3@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221216-asus-key-v1-1-45da124119a3@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/21/22 04:49, Thomas Weißschuh wrote:
> This keycode is emitted on a Asus VivoBook E410MAB with firmware
> E410MAB.304.
> 
> The physical key has a strikken-through camera printed on it.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

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
>  drivers/platform/x86/asus-nb-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index c685a705b73d..8ee5d108e9e0 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -544,6 +544,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
>  	{ KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
>  	{ KE_KEY, 0x82, { KEY_CAMERA } },
> +	{ KE_KEY, 0x85, { KEY_CAMERA } },
>  	{ KE_KEY, 0x86, { KEY_PROG1 } }, /* MyASUS Key */
>  	{ KE_KEY, 0x88, { KEY_RFKILL  } }, /* Radio Toggle Key */
>  	{ KE_KEY, 0x8A, { KEY_PROG1 } }, /* Color enhancement mode */
> 
> ---
> base-commit: b6bb9676f2165d518b35ba3bea5f1fcfc0d969bf
> change-id: 20221216-asus-key-b3bfb3bc2e77
> 
> Best regards,

