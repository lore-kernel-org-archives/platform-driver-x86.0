Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC69C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 15:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiGJPeg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 11:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGJPef (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 11:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 51B7011C3D
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657467273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VZawTf4eMb8PVuu6N9JL1GwiuSlDFL+yjmCN6JfOfpI=;
        b=DuOMWqBDgjrt5/aowz+x6OzX1YaH8Iv5tgImG+Zv31Sm30mx8Tqvm8o06o6SrzDalXfvJo
        ZRWg5Uz+tjoXOSSFxC/55/lZLFYXWdiRCQ0ig1hDHZHT+rSz61uev4P80CLPMKyFbthVlR
        YTJz+xx+xRcAbqoi9ls4YlQTP5qIlfM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-KWmwEpMuOcSVfeERqWm38A-1; Sun, 10 Jul 2022 11:34:32 -0400
X-MC-Unique: KWmwEpMuOcSVfeERqWm38A-1
Received: by mail-ed1-f69.google.com with SMTP id l11-20020a056402254b00b0043abf4d7575so2535430edb.9
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VZawTf4eMb8PVuu6N9JL1GwiuSlDFL+yjmCN6JfOfpI=;
        b=1RLwFbDi63chFyQmAwvt1HJQWlah1Ix9X0NkBCzJA1ekcwUwDWfru7ar+Z/HOxjqVy
         VrBd6uIKOCC3HQ5dr30w7r8d/Th5npx1i53qtbWZDZwxiS9by5dNFMXZRgmbc7l2f6jq
         ssZk3RfZIjlS7KtpzvVDexxB2yabn6/naNbEaiXe+8ASWPqEPhUE8aBAbPSF4T4TVMOE
         rs97bt9WLlhG3zwFSb5q8js8wtVHH0NCSmsa97MjyzR+9kKmedMYBOYUjGg4nqRIuQE9
         Y9gZ0CwQ/Ih3KXWIcRcVmbFleMfa14XLLVuQBFqPNyMCxq6pRTveiuI99T2LF8A4xni7
         cf5w==
X-Gm-Message-State: AJIora9EMwukR8+dzRsj7kD7Z7w6mPFLRNvaUeIeZJmFqfgIWkL29yAv
        d2O/AR75XE+sabv2V0OMAXV77uvxXOi4mDP2hSxweF7ct3I12aL4hnfXo0lxorUs+sJKN6udJN8
        yJPrfFFBtlxp0V0DXek4uLTiiRO+zFYSosQ==
X-Received: by 2002:a05:6402:355:b0:43a:4f13:56d2 with SMTP id r21-20020a056402035500b0043a4f1356d2mr18754905edw.312.1657467271163;
        Sun, 10 Jul 2022 08:34:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s7dnVyU5qtum6SbCcYQj1NH29lqks7WdWlaabKWyDKJQXJj3jo9FO5/UrvUE8avvs0vnVN/g==
X-Received: by 2002:a05:6402:355:b0:43a:4f13:56d2 with SMTP id r21-20020a056402035500b0043a4f1356d2mr18754887edw.312.1657467270979;
        Sun, 10 Jul 2022 08:34:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id fi20-20020a056402551400b0043a0da110e3sm2872722edb.43.2022.07.10.08.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 08:34:30 -0700 (PDT)
Message-ID: <1e8d2cb2-8417-d9aa-72dc-6e698771979e@redhat.com>
Date:   Sun, 10 Jul 2022 17:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wmi: Add key mappings
Content-Language: en-US
To:     Misaka19465 <misaka19465@olddoctor.net>, corentin.chary@gmail.com,
        markgross@kernel.org
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220710113727.281634-1-misaka19465@olddoctor.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220710113727.281634-1-misaka19465@olddoctor.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/10/22 13:37, Misaka19465 wrote:
> On laptops like ASUS TUF Gaming A15, which have hotkeys to start Armoury
> Crate or AURA Sync, these hotkeys are unavailable. This patch add
> mappings for them.
> 
> Signed-off-by: Misaka19465 <misaka19465@olddoctor.net>

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
>  drivers/platform/x86/asus-nb-wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 57a07db65..478dd300b 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -522,6 +522,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
>  	{ KE_KEY, 0x32, { KEY_MUTE } },
>  	{ KE_KEY, 0x35, { KEY_SCREENLOCK } },
> +	{ KE_KEY, 0x38, { KEY_PROG3 } }, /* Armoury Crate */
>  	{ KE_KEY, 0x40, { KEY_PREVIOUSSONG } },
>  	{ KE_KEY, 0x41, { KEY_NEXTSONG } },
>  	{ KE_KEY, 0x43, { KEY_STOPCD } }, /* Stop/Eject */
> @@ -574,6 +575,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0xA5, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV + HDMI */
>  	{ KE_KEY, 0xA6, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV + HDMI */
>  	{ KE_KEY, 0xA7, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + HDMI */
> +	{ KE_KEY, 0xB3, { KEY_PROG4 } }, /* AURA */
>  	{ KE_KEY, 0xB5, { KEY_CALC } },
>  	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
>  	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },

