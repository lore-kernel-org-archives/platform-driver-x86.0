Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0E7C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 20:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiKOUi5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 15:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbiKOUhm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 15:37:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEF727A
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 12:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668544610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MnCwkJuBrbQi4jFAnLoKxJdQqDQ2wVkd4vbCMgrgnTI=;
        b=LUbwJdy5P+s92JDUBr8RHnwc7CcD94VP3G9225kep5X18MwCyL3/wld6wubXLw4dSexIB5
        fdoULbVuKlE0xTKUiq8nlgARYPwt1ApYIjAozbVySMTwSvy6oWjXk25PXYyyUZFY3Gcv7a
        CDXlXU+bo5Iydl1ce/Fv+6MBgTFTfP8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-CcrlWIhOPyiEIwOLlOiuJQ-1; Tue, 15 Nov 2022 15:36:48 -0500
X-MC-Unique: CcrlWIhOPyiEIwOLlOiuJQ-1
Received: by mail-ej1-f70.google.com with SMTP id sb4-20020a1709076d8400b007ae596eac08so8250650ejc.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 12:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnCwkJuBrbQi4jFAnLoKxJdQqDQ2wVkd4vbCMgrgnTI=;
        b=si1QaFeEn2UU5NdL9DRp2Bzu0IMmriyrsm9sqf+5NtxkZiTmx3lT5FDlbDrjVIR8wH
         9z7ktk6xQiN4TXEi/i9+MnalRDpbFHLpQkyU0LNZWsNQgM2GewOiJfKwRwOzp9lS7Vu6
         Q2NtxBQCkpos3Ppb7uRLzO/UFZNGi755R5AIY7ODQJeoYr2kSmaziIMSq/ELteg5/b3b
         YxrIa9GdpDFmW2H7MSC/fW8qLRpMQJGglVpBr7YqfKTJ+yDtLJAy6g3pMST+tP0D+MWE
         1FHEMvUoNE87AKZQmSTgR+dfB8jR/8iBf3V/vxyOiI7GfTh3gOHGTj6wuMvoJDHoswxe
         Rjig==
X-Gm-Message-State: ANoB5pm9ycckI+WwIuX7Xw2jfFpt5oB8TewYOTp1Wfdh8SszSKcE1yOt
        apLDTP7PupnVJyXTaZegkGn434nHBl6vcm7EOQsfP15IIu3n/S3RPCWSjRTGM7zicYgpaVge4+B
        qKFvgFkkBJoZh65uYf9noRyZovlmIYTfCKw==
X-Received: by 2002:a05:6402:378c:b0:463:ab06:f338 with SMTP id et12-20020a056402378c00b00463ab06f338mr16529262edb.371.1668544607119;
        Tue, 15 Nov 2022 12:36:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Pp8BVmKktgBH1+0vE/L+7q8G0Q9+JLckU7Dj4vlKkOtDNKwnZoysRUMitXJunf1kp928WJA==
X-Received: by 2002:a05:6402:378c:b0:463:ab06:f338 with SMTP id et12-20020a056402378c00b00463ab06f338mr16529249edb.371.1668544606872;
        Tue, 15 Nov 2022 12:36:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090618a200b007ad96726c42sm3434659ejf.91.2022.11.15.12.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 12:36:46 -0800 (PST)
Message-ID: <d1532665-25f4-9d32-b276-c23077b34cbd@redhat.com>
Date:   Tue, 15 Nov 2022 21:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 4/7] platform/x86: ideapad-laptop: Add new _CFG bit
 numbers for future use
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        ike.pan@canonical.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        mgross@linux.intel.com, pobrn@protonmail.com
References: <20221029120311.11152-1-erayorcunus@gmail.com>
 <20221029120311.11152-5-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221029120311.11152-5-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/22 14:03, Eray Orçunus wrote:
> Later IdeaPads report various things in last 8 bits of _CFG, at least
> 5 of them represent supported on-screen-displays. Add those bit numbers
> to the enum, and use CFG_OSD_ as prefix of their names. Also expose
> the values of these bits to debugfs, since they can be useful.
> 
> Signed-off-by: Eray Orçunus <erayorcunus@gmail.com>

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
>  drivers/platform/x86/ideapad-laptop.c | 33 +++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 0ef40b88b240..f3d4f2beda07 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -46,10 +46,22 @@ static const char *const ideapad_wmi_fnesc_events[] = {
>  #endif
>  
>  enum {
> -	CFG_CAP_BT_BIT   = 16,
> -	CFG_CAP_3G_BIT   = 17,
> -	CFG_CAP_WIFI_BIT = 18,
> -	CFG_CAP_CAM_BIT  = 19,
> +	CFG_CAP_BT_BIT       = 16,
> +	CFG_CAP_3G_BIT       = 17,
> +	CFG_CAP_WIFI_BIT     = 18,
> +	CFG_CAP_CAM_BIT      = 19,
> +
> +	/*
> +	 * These are OnScreenDisplay support bits that can be useful to determine
> +	 * whether a hotkey exists/should show OSD. But they aren't particularly
> +	 * meaningful since they were introduced later, i.e. 2010 IdeaPads
> +	 * don't have these, but they still have had OSD for hotkeys.
> +	 */
> +	CFG_OSD_NUMLK_BIT    = 27,
> +	CFG_OSD_CAPSLK_BIT   = 28,
> +	CFG_OSD_MICMUTE_BIT  = 29,
> +	CFG_OSD_TOUCHPAD_BIT = 30,
> +	CFG_OSD_CAM_BIT      = 31,
>  };
>  
>  enum {
> @@ -368,6 +380,19 @@ static int debugfs_cfg_show(struct seq_file *s, void *data)
>  		seq_puts(s, " camera");
>  	seq_puts(s, "\n");
>  
> +	seq_puts(s, "OSD support:");
> +	if (test_bit(CFG_OSD_NUMLK_BIT, &priv->cfg))
> +		seq_puts(s, " num-lock");
> +	if (test_bit(CFG_OSD_CAPSLK_BIT, &priv->cfg))
> +		seq_puts(s, " caps-lock");
> +	if (test_bit(CFG_OSD_MICMUTE_BIT, &priv->cfg))
> +		seq_puts(s, " mic-mute");
> +	if (test_bit(CFG_OSD_TOUCHPAD_BIT, &priv->cfg))
> +		seq_puts(s, " touchpad");
> +	if (test_bit(CFG_OSD_CAM_BIT, &priv->cfg))
> +		seq_puts(s, " camera");
> +	seq_puts(s, "\n");
> +
>  	seq_puts(s, "Graphics: ");
>  	switch (priv->cfg & 0x700) {
>  	case 0x100:

