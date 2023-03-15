Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EC0C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Mar 2023 14:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbjCOO3o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Mar 2023 10:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbjCOO3n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2023 10:29:43 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7BA1D93E
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 07:29:41 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id v48so12855641uad.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678890581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qwxjRqlme9diiWI0olBsyj7ernpvWc8j729I09nBrOI=;
        b=VJOxgRwaBr/4mY4ov3vt2eqBnXmS7tAQbDCJ1GgmslNCtkJFr1qz9xDrL2Uu1ZDkZB
         S18qOYbExXeQNkJ0OsQFWHdjt8T5juCNTEd5knH+hzIVJ6eXmwScVyw9b6VhLi4A1dvd
         eCRSdNF69dRjINEAICiaglZTyzFNpnFDcNIJQZ3PF1axyGs4DU6UbiaX+Q5ISpZnSMk8
         ey2xUzxz2KljdkWcol18Iyfh9V1gE7COu22/TKzgbipEPcBFc+2Ymu+hfaXzKdFrMKa8
         JFIzUmtvars2dn3twQlS8IRQODAv/hPV5XYsgKebPy/sAbNeAtB1PuE2beZnA9dmZerk
         aMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678890581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwxjRqlme9diiWI0olBsyj7ernpvWc8j729I09nBrOI=;
        b=ynwEWAEBemho8g83myqEimodfoSbfqWncqQGbs7RceeySwAYMlaSek721TP1PV/r+b
         7S7YcGih+2yR8NgkZF2TQMcMknECaAUSDJvYf9e5vxBdqoygp4q+nIbaaDKAgBOH6NCV
         LaVS23auTIfm8jMyXo15CKWiypIL1P9QaqHACUtflwnWs2po8maKwlT60cjVQc5gX9XK
         HMtiBDAtGhEY4xmZXwOM3XQ2CqSS2N6hIij+I9QwZPTcdoitNtkmjhhbJa1Fqt56LReq
         pZMl18T9Q6rHuIZDmA3hdH6cI1OW7O2xKZqFrEuyj7pr/G+6MpYqI9CE9PeGCG0dcVg1
         QwhA==
X-Gm-Message-State: AO0yUKVEHilyRKqwqS69v+YTK5EuSBjcJd1KKwaRquX3QH7YTOdagGQ4
        XH58ugXBjKFnzD2jSZhwpNHVC6CNQBjDOLJI+mHU81PG6ME=
X-Google-Smtp-Source: AK7set/Vorb80gvQOWVHF48ajmt0tMv/XEtKv+C5bFN3IhBILuqjTc6F6R4d/tbbZyi11c02j6PmI+I5+SXWTuihkxY=
X-Received: by 2002:a1f:5081:0:b0:418:4529:a308 with SMTP id
 e123-20020a1f5081000000b004184529a308mr25509028vkb.3.1678890580606; Wed, 15
 Mar 2023 07:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230311144054.8754-1-teackot@gmail.com> <iPt1Reo37oGFvlRdQOY-3kZypWeV0pRah5oZ17K4xUOkeMqE7E43XQVyUX0A4a6oeEc1hPPzbjKcU3NznXUA3fnmp-foM3vuFSnA4YcFTDQ=@protonmail.com>
 <CAPXvF05AurS89f6bNg_5-VCS=vX=qMXbKgSdv5-wwBb8J3Xdcw@mail.gmail.com> <badebe08-7c9b-6f34-b938-b14c06a57985@redhat.com>
In-Reply-To: <badebe08-7c9b-6f34-b938-b14c06a57985@redhat.com>
From:   Nikita Kravets <teackot@gmail.com>
Date:   Wed, 15 Mar 2023 17:29:29 +0300
Message-ID: <CAPXvF05Sp6jVGaMMPaSfFtaz=Ogt46E2fibu2Q_zBh=HnQzhGA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: Add new msi-ec driver
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Jose Angel Pastrana <japp0005@red.ujaen.es>,
        Aakash Singh <mail@singhaakash.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

> Note most drivers/platform/x86 drivers do indeed use /* ... */, so I would not mind if you convert the comments

Okay, I'll do it then

> But I guess it might be better to put that on the TODO list somewhere and do it once the module has had some more testing.
>
> E.g. I should really test this on my desktop's MSI B550M PRO-VDH board and see what it does there (hopefully nothing).

By design it should fail to load on your motherboard since ec_read()
will return with
ENODEV if EC isn't present, or read an incompatible version if it is.
Some testing would be good, so we can add a DMI table in the next set
of patches.

I have a question about naming. We have the fn_super_swap
configuration parameter,
but I noticed that in the kernel code the Super key is often called Meta.
Should I also rename it to fn_meta_swap or stick with 'Super'?

Regards,
Nikita
