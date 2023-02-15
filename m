Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA2FC636CC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Feb 2023 21:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjBOV2I (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Feb 2023 16:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjBOV2I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Feb 2023 16:28:08 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF932129F
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Feb 2023 13:28:06 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id j5so12382016vsc.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Feb 2023 13:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8b2sRGbLC3cLDtEMqPC00i6WrfkA0RHHI3VEJ49HYU=;
        b=lTN5xwddT+zZlQEgQ7gPWj/ldB2cN3nbrDIligdVhSIk0aiXKWGnb0FvkcvQjlvZtx
         6RgayMs4FLeg5NUcCscZf6Y0LA7bJlJCUZTVxbG9ti+pWK4/O6HiA4wIps+AvbO9JvUo
         FTreunuYrP0z/dvBpkW3wNWoVcs2xa+QPRmrMSnxMU9aUQwQFvyRZ9GCqSulfOHMR30B
         ChFrE0jcNecyjLAD4DyJQQM0rPZAl1DtU5X5fSH21/ufP9ycFdU7xRTfA+pQuMWYqLyq
         yLSlycjC+rHrTbows3D7AsGwaaU4QtmfDMB5pRIsX9lRqMl86DFSzM8lfVg7zd9ktw2B
         U+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8b2sRGbLC3cLDtEMqPC00i6WrfkA0RHHI3VEJ49HYU=;
        b=sXORHVcpDpXO8gixpiYxJnovMTDzIvAw43Upv8cU713+2lgRBoTSnaQtQ6KpUkUQ9O
         HiTGZ9vuHGnk6PUDDwXGIbvIUxAFDEfUioy1tDRszcIK22NoAubepsIV/RFQIECOyL7A
         KVWcquReY2t2LhJmfNQQ8nTUdMB91l2fDNiZdAcIHKdjWolUuFCOv5mV+0L+wdHfo4gh
         FuINiHXffJSaR0V04y6fcL861hgPXBT85xmnXwwwcV/Es3MmAlv23wLl9S1bTAzo48iC
         b949pozEDjrCo7bVq+iv8sMc7F7n7ZCLT0zsPxcX4obN+DLlgg23A0mjVypdsY3OtlCT
         44iw==
X-Gm-Message-State: AO0yUKXGVt5iwPcvV86sJvlL6PO8UYRwob+Al7AsIvtniovNN80VaGLh
        ODS/feT6L0/m+7gjnuxK+25aBwt/fO1i7DC7gFw=
X-Google-Smtp-Source: AK7set9yrpDpZTMV8esCfzGLRVRGDgYZ6oBZOcAdcBCSH2RvA7AkQXuf6ysJQK5mLQXgARP0IVXqxUVRMzcXSIhN95I=
X-Received: by 2002:a05:6102:4187:b0:3f6:4d32:127b with SMTP id
 cd7-20020a056102418700b003f64d32127bmr703489vsb.63.1676496485561; Wed, 15 Feb
 2023 13:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20230214132522.32631-1-teackot@gmail.com> <83AkxqZKq3bgBwaStV4wlfKJ_gH589YsVpodZGlDzxEydljNFJWfJG8cesFfH_cr5n7YaxxqIRQUxSuiGSgQiHZJkb_q1GoJgtrIGFNChzg=@protonmail.com>
In-Reply-To: <83AkxqZKq3bgBwaStV4wlfKJ_gH589YsVpodZGlDzxEydljNFJWfJG8cesFfH_cr5n7YaxxqIRQUxSuiGSgQiHZJkb_q1GoJgtrIGFNChzg=@protonmail.com>
From:   Nikita Kravets <teackot@gmail.com>
Date:   Thu, 16 Feb 2023 00:27:54 +0300
Message-ID: <CAPXvF06Gr_Dh9NukoTmnpd+s4uNJaVOvXjmkhQ7NVOnOie1xjg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add new msi-ec driver
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

First of all, sorry if any of you got the message more than once.
Gmail (and I) messed some stuff up.

> Usually commas are omitted after sentinel entries.

I see, makes sense.

> Alternatively:
>
>         .allowed_fw = (const char * const []) {
>                 "...",
>                 "...",
>                 NULL
>         },
>
> (although this won't inherit the __initdata attribute as far as I can see)

This looks nicer so the question is: how important is it to put those
strings into initdata, as they don't take much memory.

> It's a small thing, but I would make `i` and `len` be the same type.

Okay. I should also put the `i` declaration into the for loop header.
(I'm not the original creator of this function so I didn't touch it
yet)

> Why not
>
>   return device_add_groups(...);
>
> ?

Agreed. Didn't look into this one too.

> Furthermore, is it possible that there are two or more batteries?

So far all laptops we've tested only have one, controlled by a single
EC parameter.

> Have you checked if `match_string()` from string.h works here?

Just checked, it does.

> This will start poking the embedded controller when the module is loaded, regardless of the platform. I am not sure that is desirable.

It only reads though, can it cause any harm?

> static int __init load_configuration(void)
> {
>         int result;
>
>         // get firmware version
>         u8 ver[MSI_EC_FW_VERSION_LENGTH + 1];
>         result = ec_get_firmware_version(ver);
>         if (result < 0) {
>                 return result;
>         }

Also a note from myself: I think this should return -EOPNOTSUPP if
ec_get_firmware() returns -ENODEV

-- 
Regards,
Nikita
