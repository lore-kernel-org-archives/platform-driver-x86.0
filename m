Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FAEC433C1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 17:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87E4A6192C
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 17:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhCURQE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 13:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhCURPo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 13:15:44 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674B0C061574
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 10:15:44 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u9so17508462ejj.7
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 10:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=GQRzMtZLBNyd/aHtH7XrxPwiba4bbR+9qXIc0WlYsuY=;
        b=iufnMpYbPDxfDX3EP6WcmkRb35IwUC+wOeDYd6npPzmRt8IomSeQbSlV8Y+VgRro0s
         axtwupBsRZEOW1jZKsJpn8dw4K9DbGSLCthJ3iGsx0Cjmg4Wg2Ml2csBCbF2wKznHWmM
         K8elxX7i0a/cCSY8uN7MThusgbnBxi7WdHWkuj7BG2I4CJHKk+x+WIMQ5OMAADw/FGMj
         j/gqqDZKggfzL2WosE0C5VCliwK/BlqQ/8MHvJJPtBO15XG6JhNkEtfNJCmqczWapG0E
         933jvK08ah8PcQ39tNLO8D3JD5aP2G5ijQu1H0MYj43JkkUvzrd0LwFGvFWqIQDjdcn2
         Kn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=GQRzMtZLBNyd/aHtH7XrxPwiba4bbR+9qXIc0WlYsuY=;
        b=WOU99VDWVQHmesCURGRRs8UYJh0NsofQDr+wo8kffkeRgtLDxSNAHF9oUla0IvuqKS
         daIdtNGa6LkfKxuQJvdAyyKXkVVmHKik7OsPQOyI2DIK/zjM6YRiL1Y7RHwgOypZszVd
         PLV3HYO+Wn1d7y63EgrX9ekY62NhWhvlvi+blo8FDGd7snoTVNPaCRGFr+WvaLRp7yj7
         sxhoftglOjkkWNdKEL+5Q9TWl5E0kaZad7gRWW7hoOFlZEwN4+VRk0NOJFjP1DN25Lwh
         OG//mTYAmlMrb1JjouPwYEP/Vbp27Jd97B+rocsyAuC/cAAXz8dkpT62btTLsH/YoFwd
         mfHQ==
X-Gm-Message-State: AOAM53003vcfQVpzgZvcLEnn3W+EmRekfoHiN7zXHm0oh4jKbjlTSJMf
        Yfmze184EKv8NhrBxmHKNDMPk+U6hAQ5a2SVizs=
X-Google-Smtp-Source: ABdhPJz+DxHdcH/QvDX/jXE+TCSOXvtvDw6yN2n0O+AaZ5YJAfs2n+N11veZnhzXKUnTMsREnQGCIjqXLsa9pws6eOk=
X-Received: by 2002:a17:906:fa0e:: with SMTP id lo14mr15254999ejb.263.1616346943168;
 Sun, 21 Mar 2021 10:15:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:2f94:0:0:0:0 with HTTP; Sun, 21 Mar 2021 10:15:42
 -0700 (PDT)
In-Reply-To: <0cbd3718-278f-ccc7-c389-b8ebb8338491@redhat.com>
References: <20210315195823.23212-1-esteve.varela@gmail.com> <0cbd3718-278f-ccc7-c389-b8ebb8338491@redhat.com>
From:   Esteve Varela <esteve.varela@gmail.com>
Date:   Sun, 21 Mar 2021 17:15:42 +0000
Message-ID: <CAFW5P13wE44FFXY=dUvJykzN_Qrg1mW_USjP4sp_8oXkjFVQTw@mail.gmail.com>
Subject: Re: [PATCH] Allow the FnLock LED to change state
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2021-03-21 16:38 GMT, Hans de Goede <hdegoede@redhat.com>:
> Hi,
>
> Thank you for your patch, I've applied this patch to my review-hans
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> And I'll also add it to the fixes branch so that it gets included in
> one of the future 5.12-rc releases.
>
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
>
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.
>
> Regards,
>
> Hans

Thanks a ton! Especially for making sure there's no hardware
compatibility issues, since I was afraid that might've been an issue.
I just noticed that there's a typo in a comment, "foce" that should be
"force". Maybe that can be amended before the branch is merged
elsewhere.
