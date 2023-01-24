Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06594C54EAA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Jan 2023 12:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbjAXMwj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Jan 2023 07:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233882AbjAXMwW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Jan 2023 07:52:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE44276BB
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 04:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674564515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mKlGGN/Cv/e/LCDkUt1uykWKamvG2Ui1ifnCT6XaOdM=;
        b=jO1FbBraUjza6PFxu53p6dZgo6PdL4ggeAeYVH7RuPEuXV0cHB8Hmz8EnkV31aeBJqSxiI
        TvAfsZouLo7KDwxtpX4kMcjRBjg86Kb5k1OhoQ3B/CBti+2YENmr3DdqM4cWHIJOlaRvHT
        3nWOlwFLjmilenJ0cBTvDmX2hy4Vw2c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-nljYRfkEPmC3kOQuOLC0Mg-1; Tue, 24 Jan 2023 07:48:34 -0500
X-MC-Unique: nljYRfkEPmC3kOQuOLC0Mg-1
Received: by mail-ej1-f69.google.com with SMTP id hp2-20020a1709073e0200b0084d47e3fe82so9711278ejc.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 04:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKlGGN/Cv/e/LCDkUt1uykWKamvG2Ui1ifnCT6XaOdM=;
        b=07PrS9GPkgKOWY6GjahxhX0g8/dcJTvr0BiYTVTgI5wZs5LSqBdC7r+g2cI4hSAaxn
         ymq3+btJkfPe+5QjcCUPzFQHPQ/RvA2upaVJaEbRXLnb6nT7Fb7GWTam+M+nF/J8/R4j
         084JynbEyV5rk6vLfQSuLlLZ2osC6XcxlgZt7eLxosULVuu9tLZCkKEb/R2evCRh2R+B
         GDK5XbBMOMuUGtWAK/zoFce9MGWDogT/QqkT7WRvH7GvFaR4OlNl7n3j1ccQsHeFnf7x
         4B231iqC8g3m+7nYPmwCQdOQpFqhNiOkq3WYk7F+BuJST79uL3hkr+orayNgW/3fJtTs
         7sJw==
X-Gm-Message-State: AFqh2kp3E7I0ulp12N3epCn8Rbow3X4BMu1K39BP+hgylfGZd995/Qhm
        a3qPfsux3rQsVzyFHm+UNmGl4nE4nKAiEeXX5Xppcj9NFjTILG7/6Ba2lTcdIBMOQtj2gmjTgGM
        csuuBW5ykn7yl+gZza2DDBfb3DJmpkIzqBg==
X-Received: by 2002:a17:906:4557:b0:84d:3a95:cdf5 with SMTP id s23-20020a170906455700b0084d3a95cdf5mr27820477ejq.10.1674564513149;
        Tue, 24 Jan 2023 04:48:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwf/QaQ7ssTfZKYy6xP8WjtnjSROX4nzzKhPAhI8xZEqFVaTmzVbtai61Rp493mGogj1b/Iw==
X-Received: by 2002:a17:906:4557:b0:84d:3a95:cdf5 with SMTP id s23-20020a170906455700b0084d3a95cdf5mr27820466ejq.10.1674564512969;
        Tue, 24 Jan 2023 04:48:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m23-20020a1709060d9700b007aef930360asm861276eji.59.2023.01.24.04.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 04:48:32 -0800 (PST)
Message-ID: <73853dc1-e925-de93-aefa-aebc1a23ccc2@redhat.com>
Date:   Tue, 24 Jan 2023 13:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: hp-wmi: Ignore Win-Lock key events
Content-Language: en-US, nl
To:     Rishit Bansal <rishitbansal0@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230123214150.62597-1-rishitbansal0@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230123214150.62597-1-rishitbansal0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/23/23 22:41, Rishit Bansal wrote:
> Follow up from https://lore.kernel.org/all/20230120221214.24426-1-rishitbansal0@gmail.com/
> 
> There is a "Win-Lock" key on HP Omen Laptops which supports
> enabling and disabling the Windows key, which trigger commands 0x21a4
> and 0x121a4 respectively. Currently the hp-wmi driver throws warnings
> for this event. These can be ignored using KE_IGNORE as the
> functionality is handled by the keyboard firmware itself.
> 
> Signed-off-by: Rishit Bansal <rishitbansal0@gmail.com>

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
>  drivers/platform/x86/hp/hp-wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 0a99058be813..009cf0bda756 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -216,6 +216,8 @@ static const struct key_entry hp_wmi_keymap[] = {
>  	{ KE_KEY, 0x213b,  { KEY_INFO } },
>  	{ KE_KEY, 0x2169,  { KEY_ROTATE_DISPLAY } },
>  	{ KE_KEY, 0x216a,  { KEY_SETUP } },
> +	{ KE_IGNORE, 0x21a4, }, /* Win Lock On */
> +	{ KE_IGNORE, 0x121a4, }, /* Win Lock Off */
>  	{ KE_KEY, 0x21a9,  { KEY_TOUCHPAD_OFF } },
>  	{ KE_KEY, 0x121a9, { KEY_TOUCHPAD_ON } },
>  	{ KE_KEY, 0x231b,  { KEY_HELP } },

