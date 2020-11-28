Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CF1C3E8C5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 02:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B88FF21D46
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 02:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSp5q7iq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgK1CVW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Nov 2020 21:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731057AbgK1CTt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Nov 2020 21:19:49 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7FEC0613D1
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2020 18:19:49 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id e60so4490370qtd.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2020 18:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=R5d1FPsmql3l6lmNNyPE0bGcXzY9ry0F30WO3bbD5cE=;
        b=mSp5q7iqswFOxywQqI0fWYWJV1zVC1jeyLplSTibO3Zz8LgH4xnwqcWOQ78t7n6g6s
         HRc7K/lrVbSbmMORhD3rseUja4undxE1W/kdnaNZa/PDdGhl+2UIbxKXd01TZPFmUaiw
         iDajH3fcWqmT+b+1A4VvFxYr6tDV+SrKHeEw2JNH8tC5AZB6BrnMDzAqcNLpr0GOHckl
         ut7JJSKGVrHIsDz9JyfeiMIlkebQLt8eAkWefJbJRZklt25XKjdcbvtSIpiPt4S8Jr1X
         Iu1QC8hFjj5jqQaFB5/pr/Izl8kq84nK65fpeSAJQij5EwjMrJ/hrPzDH+XwhI+hPwKm
         Chgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R5d1FPsmql3l6lmNNyPE0bGcXzY9ry0F30WO3bbD5cE=;
        b=e2molEZNqiGJ7zYLq2G1031uz7RAdoGDsu+jToBEpFQdz/d4Gf1cPDNhOguCaVSD1V
         5E6k/PBif2nCTiiSLm1xXKEY6mDYNxzNUY2An9xOkZSQERseCCqpPdmGS8hhTkdpZ+sk
         eJdaCKsNACHgstPBQDeIq4szgH/LWu4wFkutzdwD0pr0WDrfxSdZguXChbdYnzyUYQ98
         SXD+7O9f/7tVABPUofBms0t06VH9GkqSfcmtW4nML+F8Y3KHr3q9QHmSfha7fLIy+RCK
         +WjsPx/G/E5LLafCLED1a/CblfKHgrIxzcf5lTj4hM2hYllJuBxulJSvErfcZzIwlhcD
         22GQ==
X-Gm-Message-State: AOAM531CVC4fwiUpPISD1TSPtXHB784mu7ALVc8keZRMGJmkf2qHSSy9
        S7BFGLK4yg9nIpptZZku/SwwiESeU2YRQw==
X-Google-Smtp-Source: ABdhPJwFUJzT1dFNBSN6L14kt1PNAWqMZ26k3eq+S6iCQmBvLbNXPqQJZ8NHlXiIjoPuIFpII7kveg==
X-Received: by 2002:ac8:5794:: with SMTP id v20mr11431002qta.175.1606529988080;
        Fri, 27 Nov 2020 18:19:48 -0800 (PST)
Received: from ?IPv6:2600:6c52:7b00:d590:a3ac:9fea:75d0:42e5? ([2600:6c52:7b00:d590:a3ac:9fea:75d0:42e5])
        by smtp.gmail.com with ESMTPSA id u15sm7232949qkj.122.2020.11.27.18.19.47
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 18:19:47 -0800 (PST)
From:   Dana Goyette <danagoyette@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for home in HP OMEN
 laptops
To:     platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <174c79fb794.120dada4b39603.5369737602791060462@sidsun.com>
 <cad5f2ab-e319-b6fd-360d-5beb62d6899f@redhat.com>
X-Mozilla-News-Host: news://lore.kernel.org
Message-ID: <b8c32747-2704-8a2d-dc32-b6154128d295@gmail.com>
Date:   Fri, 27 Nov 2020 18:19:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cad5f2ab-e319-b6fd-360d-5beb62d6899f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/26/20 3:47 AM, Hans de Goede wrote:>
> So after looking at:
>
 > 
http://s3.amazonaws.com/digitaltrends-uploads-prod/2017/09/HP-Omen-15-review-keyboard-2.jpg 

>
>
> I understand what you mean with "where home key should be". So I've been
> thinking
> a bit about what is the best thing to do here. Arguably mapping it to
> KEY_CONTROLPANEL would be more accurate. But I can completely understand
> how
> you just want to have a working "home" key; and it indeed is in the place
> where on HP laptop keyboards with a num-pad, you would expect the > home key.
>
> So lets just map it to KEY_HOME as you suggest:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
>
>

FYI, the HP Omen 15 2020 has a different keyboard, where Home is a 
proper separate key.  The India model has yet another layout, with a 
full numeric keypad that also includes Home.  So unless we want to get 
into DMI matching, it's safest to map the key to something distinct.

Layout on the US model:

[Omen]   [Calc] [PrtScr]
[Insert] [Home] [PgUp]
[Pause]  [End]  [PgDn]

Layout on the India model:
[Omen]    [Calc] [Insert] [PrtScr]
[NumLock] [/]    [*]      [-]
[7/Home]  [8]    [9/PgUp] [+]

(Where's Delete?  Above Backspace.)
