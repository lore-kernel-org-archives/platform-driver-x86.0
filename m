Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BC9C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Dec 2022 13:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbiLMNDv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Dec 2022 08:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234940AbiLMNDt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2022 08:03:49 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA841D333
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 05:03:48 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id j16so11700578qtv.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iHk0fS0J80amRGt6pbsFj2iSlSbXcAuPdu7OpS7HHl8=;
        b=g3thyJOWMEhH5lwinBEwkr8LAa809FFdQdAkUgbOpcIae4ZtNooOAjZqh/rosalq8K
         M1QvYET2qG/jnDwQsD6gI+5OsmpvBsLftZx5w6OHSfIp6W/Y8FAIHJFTWUITM9ejCcpv
         ZKmPbnSKn55EXUEtiNPWibVAeBgeSWX99pjEHM61u9Zd0oV9i1y7jGp5ip/di4UVdwGH
         SPqI8+5vbS/5rXa+NlQhEHKjNrkKFWHRQ8v1PvaLmhrHcX6GPxb2+3hc4efPdZNLlyNJ
         dEnPuZoTiaoyPzQtV3qA3YBotuRcSFkrcGaEGYtck3n+Oa89JIJ+BqqqOPvW1NyQUiI1
         y08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHk0fS0J80amRGt6pbsFj2iSlSbXcAuPdu7OpS7HHl8=;
        b=Y9ypyyaUijPnGZr4DTWWj1vxF8PNyM5hUoHq/f/9IVg5/pFtUya0N2Ahpp4Cn2JgPW
         IvSoFwb2AM7WRDWYZhaB4u/JK7g3C7tBhmRvW1wOAeaxDH53s1W6vTzL+wrUPWqB1xsU
         iqEFrPnM0XWI/vZbYzGHGt+v5tyo7CcdGrREB4MbEdrcgJG1bI8Sqmki/6cTAnhfcZnU
         0OfzrTzJ8NdxJGiQo5BueiRrf9Mj1Qm1rzN7hXl04DmmwGcKg9NmCMfWdI1THFZ3B+3x
         FukSqw9RhVHnaOfGloO00p6KXyfOJ3oFWa6EdYqqI9S+gfqqxbjAsdVc26a6fMmnEuqk
         SVlg==
X-Gm-Message-State: ANoB5pl5z4VQnPIwhRvSd8qnNquD7WU56PZ6tHA77xOhFD3mVHGIhjXH
        DCzongZ/wLelJTbHVjx2QROM0GcSfPqaDZu1ge0=
X-Google-Smtp-Source: AA0mqf4rR2ede0D+48t5UT08plJDhssB0cWwtHHsEcFacAU5taKEMeym8NWYNETLfctZBVpGoysEgbFnwzVsicffc/g=
X-Received: by 2002:ac8:44a9:0:b0:3a7:ed31:1b2e with SMTP id
 a9-20020ac844a9000000b003a7ed311b2emr8992398qto.429.1670936627968; Tue, 13
 Dec 2022 05:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20221213122943.11123-1-hdegoede@redhat.com>
In-Reply-To: <20221213122943.11123-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Dec 2022 15:03:12 +0200
Message-ID: <CAHp75VeDOrB6zd4Xz+kiAnb74hv7LNYrgNdT_XsN+qAPBYEJRw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: sony-laptop: Don't turn off 0x153 keyboard
 backlight during probe
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mattia Dongili <malattia@linux.it>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Dec 13, 2022 at 2:29 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The 0x153 version of the kbd backlight control SNC handle has no separate
> address to probe if the backlight is there.
>
> This turns the probe call into a set keyboard backlight call with a value
> of 0 turning off the keyboard backlight.
>
> Skip probing when there is no separate probe address to avoid this.

...

> +       /*
> +        * Only probe if there is a separate probe_base, otherwise the probe call
> +        * is equivalent to __sony_nc_kbd_backlight_mode_set(0), resulting in
> +        * the keyboard backlight being turned off.
> +        */
> +       if (probe_base) {

I'm wondering if it wouldn't be better to split this into the helper
and hence just call it here.

>         }

-- 
With Best Regards,
Andy Shevchenko
