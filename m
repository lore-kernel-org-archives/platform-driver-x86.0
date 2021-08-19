Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C60C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 12:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61ADE6112E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 12:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238286AbhHSMEj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Aug 2021 08:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbhHSMEj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 08:04:39 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBCFC061575;
        Thu, 19 Aug 2021 05:04:02 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n5so4759190pjt.4;
        Thu, 19 Aug 2021 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nopyRMG9x/uAKgGw2PXGqgfpfnyNE6mCbjiWh7WxwZQ=;
        b=JKmw6CKJ6Vz261TsvWj4z0EpObkKjAIy+Jr272TJj0zeaIUJxD8xXGCbEuTbRW+mko
         OfCanxjobPlzIFpiUyxGu6FZgaUmaQzJUxb4SER3/bYPUyQTW60JLPOseDPS8bgffLvF
         t+Ix6s6dA6+y6o4Rp4cJPlP/cFjP1flWfLeuIxamQeOy0I7kKgxo3Vte+ky0ZwSxDOcc
         kFzE9WPazPp2thVOOyleRTv1t+PzMWzRtXE6XoOcL5xg0XoN20cyCaPJCIINFj8MHujA
         ehIKIzfL3kUStaKpghmw4k3eazNoar/yreIH+EPV6x82mdUoi3v7fR5JOXnsgEyoEFex
         JdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nopyRMG9x/uAKgGw2PXGqgfpfnyNE6mCbjiWh7WxwZQ=;
        b=tVXteu7MujWvTefagupxliWkIjt3Q6RfT+Lohcq3CV9UG6z1yP9Y3wQ6rRFdwSKvVW
         XRfKXz6hgOXuVXNSfHZTKSE/q1gt+lqc8ioGht8mFkRwbu4Uxe/frkdMw5Pfexug7nHf
         NyhaUdUH1FuoxhxPicM3eqEOVRciYlLKdq2vGLjfKGG/z41rJ3jWVuY8ZtMTzZhU8siI
         EtUnaeIvKQ2I696sGiYtsRFzRrDkTixzrLz9T7/XJ0+uBxGmiG+ZbyaERiRJFUpzS2t6
         Lp/tjPnWvyO45bUQdM4foz7PBQr+m4RdHP3Ua86DADRAkB9OP1qS0kp0evgY8zVeRcZv
         LfEg==
X-Gm-Message-State: AOAM530PozgCUPeyZg2kFKmJWxR2G/uAQ288n5EujN2r/QegzFDM7iII
        NROQUVElBwL5ubJ1XHYjhdecRNH0plA5FqBaAjw=
X-Google-Smtp-Source: ABdhPJwr5+1S00WAA0W+0Ukn7eMmfP0FrbWy3fmTfHdovgKwXrkAUlWEk6a83yIJEevqAeN1g1TCIzieYjIbPYFcqc0=
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr11618597pls.17.1629374641752; Thu, 19
 Aug 2021 05:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210819033001.20136-1-hpa@redhat.com> <1360c64f-b695-a4b8-8b61-a4dfb0e896f0@redhat.com>
In-Reply-To: <1360c64f-b695-a4b8-8b61-a4dfb0e896f0@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Aug 2021 15:03:22 +0300
Message-ID: <CAHp75VcdOc+G1Yov9HcGhMbEqzGwemmD7=SHd3qOOsEdAqjg2Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] Intel platform driver code movement
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Kate Hsuan <hpa@redhat.com>, Alex Hung <alex.hung@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 19, 2021 at 1:48 PM Hans de Goede <hdegoede@redhat.com> wrote:


> Thank you for your patch-series, I've applied the series to my
> review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> With the changes mentioned in replies to individual patches.

Can we postpone this a bit, please?

I have a few comments here and there. I'll send asap.

-- 
With Best Regards,
Andy Shevchenko
