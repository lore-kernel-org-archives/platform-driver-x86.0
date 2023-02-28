Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79C5C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Feb 2023 09:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjB1JnN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Feb 2023 04:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbjB1JnA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2023 04:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7C22CC7E
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 01:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677577334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=azHC9e8Uj2lbtRK3C0T8Z0hdNqnL1LBNikwLsS6IVhY=;
        b=iPZVJpeP8f3w8O3qcyztdEQu9eeH7AK60QRuasTPQsurS9hJD3m9nwA27UM1xXU3rA/53I
        lkbJRyXptDd8sNM40IT3D73O32GF6QKXrcxcp53VWz/f0zMPQOYwPFqYNzyzVtA4MQEjLO
        LEyDI4lVkgYQN5N83hWAlkiZiNm6VMY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86--I78Ik2ZOtqLI_PDNr9VPg-1; Tue, 28 Feb 2023 04:42:13 -0500
X-MC-Unique: -I78Ik2ZOtqLI_PDNr9VPg-1
Received: by mail-ed1-f71.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso13194739edh.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 01:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azHC9e8Uj2lbtRK3C0T8Z0hdNqnL1LBNikwLsS6IVhY=;
        b=brvtqGchrfmMJJUox0nVPT7xRGbug3mg2lRuzh60WYvTCA1aR3+wAw5NDAMlYvAy9R
         XwwlpxuFIuBpi7kXRJgIFgneR2CUHTTemkZ5J++jE4NfrUMA/E+E8ELi7w7TeV0Tqufl
         G7pyhq71HW6fq9R2WbBJ5dRs0sjxaO+yRHy5zitzyAbF3dPttCC7ZAxAPS0rq5W7Pb4M
         Qba6RFVCotEvIOCbuHSewq7trihLarFWo1IfU3JCh01eoy2PkLzpJRs1/Ytq0R60ERZe
         2CKhQqkYdF9B9uKyLBvzxD/HE0AEO71vXYYOPst0D7IAg7Qf0+LMsQjOYu8hcc3aj8Ds
         /b6g==
X-Gm-Message-State: AO0yUKWgvHfS7r9o+eUC1oFo45E1qFZtDtZGbBZnYPxDyQg8pmJEmzfO
        sTDYCQYnbUshPvfvNg9P90BlQ3XYYqtmFxVFol5Ryr65C05uHyAqHsLgoGChbPBcYzF96e6M8H8
        TityYKHzJ16jQtnwdZ2fRdqY2r1ExjkaisAxPnTM=
X-Received: by 2002:a17:907:8b87:b0:8b1:2614:fbf2 with SMTP id tb7-20020a1709078b8700b008b12614fbf2mr2389858ejc.70.1677577331828;
        Tue, 28 Feb 2023 01:42:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+MKaCkCTPD2qwEcbkheyntJVkDYg8HOPDWViMvsqbCI7HjM7ZFzQBFylTzL/J0du62XE8NPw==
X-Received: by 2002:a17:907:8b87:b0:8b1:2614:fbf2 with SMTP id tb7-20020a1709078b8700b008b12614fbf2mr2389846ejc.70.1677577331565;
        Tue, 28 Feb 2023 01:42:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k12-20020a508acc000000b004af71e8cc3dsm4122471edk.60.2023.02.28.01.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 01:42:11 -0800 (PST)
Message-ID: <7e3af026-f72e-e824-7c37-94f43280c2e8@redhat.com>
Date:   Tue, 28 Feb 2023 10:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [bug report] platform/x86: asus-wmi: Unable to set rgb mode on
 TUF FX505 laptop
Content-Language: en-US, nl
To:     Kristian Angelov <kristiana2000@abv.bg>,
        platform-driver-x86@vger.kernel.org, Luke Jones <luke@ljones.dev>
References: <443078148.491022.1677576298133@nm83.abv.bg>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <443078148.491022.1677576298133@nm83.abv.bg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/28/23 10:24, Kristian Angelov wrote:
> I am unable to set the color/mode on my TUF FX505 laptop. Upon investigation of the asus-wmi driver, I can see a correct implementation of the color setting functionality (based on my own reverse engineering) however writing to the appropriate /sys/class/leds device does not work. Upon further investigation it seems to have to do with asus-wmi.c:747 where cmd = !!cmd is done. On my specific laptop the WMI interface expects the magic value 0xB3 however it is impossible to write this value as any positive value will be replaced by 1.

Thank you for reporting this.

Luke (added to the Cc) usually takes care of the asus-wmi driver,
Luke can you take a look at this please?

Regards,

Hans

