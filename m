Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38CDC83020
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 13:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D2AF206F9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 13:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDlm1X3o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388125AbgKXN2i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 08:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388014AbgKXN2i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 08:28:38 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763EDC0613D6
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 05:28:36 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id y26so2920197uan.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 05:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s97CehM6t58x+FIlA/9XzWv/MyJk7cJIVfL91dOa3nY=;
        b=sDlm1X3o82hqWm4S6DW8+9xQ9bUnbkZlNszFngeyjwq8Hasq/Z81IWu92LtfK34xJE
         J6yj1yVcsQQSGoDivHD5ls3xcIe9S+D0qI4+V5l733FympIiNq8cnkT4TuDlKgev1m8q
         DqiGOXzDrDVNxtv9H3I8VQNK5CPxvjfBzU4jqTl9qaCCNf4cNqn2xfL+q4HyVCZH9vI+
         APd6Jk+XKvoc0XJOwOHthN0paUvWox6u4RGNdbiJLEEJTTQV8gc1T8uwEk1iQNaPDRgB
         eL5GQo/3kU7w1Um3f45E0Cv3ymOT+kwZ8nX0reFwjp33GOFU2TNfXGhQzrQtRhWkdmgh
         oKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s97CehM6t58x+FIlA/9XzWv/MyJk7cJIVfL91dOa3nY=;
        b=dHuqgS93UZt6zkfdK33Z2LUXfZDFM3av0bMIJJ4HrtwhQPToSqvYom2uBgS9zU0buw
         AeJpJpe/1q8kyE8TLI6MriZSudC3MXncLKkUW6xbljLeex3CVcvbnd/mcDR/OQ95ccoX
         DUhq//gRzd+No0Xm5qmluzHG+IDRONmoUym9wScVSvLML2FUs/qd+UlKt8FQbGAFLTv+
         4jWlWY2pwgzMDbhfrhwVjdmP4eSSIe87rvHd5aItdi1VxPc/aOheSdpGb0cmJWVQdLls
         1rSOxD+fx2l14yA7nIwXWnMImGzdPlQMOIWd0nUn8xVk941LC7eKl9L9MauxpKE5gPDL
         FqKg==
X-Gm-Message-State: AOAM530KKP4N0N9dihJirhcH/YyGT/RVrkMDxNoynJUuCMjG/f3X3BDS
        V0U9ric6bkFqRqeG4Mu3jhLs+dBtoLyo600Tdj7U6YKipgE=
X-Google-Smtp-Source: ABdhPJw6fnSgzxdv+wzTP8p7HKnceR7uYX5lH3a6XTaPo97TqzzhT7kB+csfM0qmtiPl27ZkHuZIiMz63REaic1g+3Q=
X-Received: by 2002:ab0:224f:: with SMTP id z15mr1248816uan.70.1606224515597;
 Tue, 24 Nov 2020 05:28:35 -0800 (PST)
MIME-Version: 1.0
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com> <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
 <HTSPI6-Ba3MfCgVG7q_YbRF6mUqskmyRdtSb_7eE2G7oCi_rSo5UP1ZKRK-qVfzSZ1zm_5sNp5hUorvgRz3VF8RM8b8361CLzbq4X5z59hw=@protonmail.com>
 <CAGTBY+vQ+UMPqFCwKMS0L5=F3eqQ21UtGETgmE+Le=SXcaWS2w@mail.gmail.com>
 <bjucdDbwHvavLvYVkhboo_jhvKC6ccqAslFPuuYO0ZZcgTZZaICda3WMFZhw_zS1o1m7VanyCmaJ4HZMqgyXwsCfqJFDGxb_1A4pdNCe8Bw=@protonmail.com>
 <CAGTBY+tso9BKJwe5F5bBU_RAo0yrwtYf=kGm1UvMpTJurS00MQ@mail.gmail.com>
 <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
 <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com> <f7786f2f-b770-4875-26be-9e48b4cb914c@redhat.com>
In-Reply-To: <f7786f2f-b770-4875-26be-9e48b4cb914c@redhat.com>
From:   Rhys Perry <rhysperry111@gmail.com>
Date:   Tue, 24 Nov 2020 13:28:09 +0000
Message-ID: <CAGTBY+t+QpPTeW9NnEnRP1eF==AEdKAcCAmtWfCmnjK1ZOgL3A@mail.gmail.com>
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

>
> Hi Rhys,
>
> I just heard from another HP user that updating his BIOS fixed this for him,
> are you at the latest BIOS for your machine?
>

Thanks for notifing me, I just checked the HP website and there *is* a
bios update available for my laptop (released on Jul 7th). However, as
HP does not provide BIOS updates for my model through the LVFS
(desptite being a member), I am going to have to reinstall Windows -
which, as I am sure you can appreciate, is not an enjoyable task.
Especially trying to stop it messing with my pure Linux install.

>
> Regards,
>
> Hans
>

Regards,
Rhys Perry
