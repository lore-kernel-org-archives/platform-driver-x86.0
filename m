Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBF2C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 15:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95A54207BC
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 15:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbhADPRE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 10:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbhADPRE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 10:17:04 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDDEC061574
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jan 2021 07:16:24 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id e2so19239339pgi.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 07:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4SOpZvDMhfvyLdgH+ZlV2tASLuyciMU83DIqXOzPoFo=;
        b=g/oIXB6ORCo86T5u/Fb/lMf4jvsfOulC+VRxAXOyoX3b8hdrdFedf6tNXIsp515Kxd
         jt4K6PfIwdDnl1ZK19Qbc5XT2wqR1t+BNQh8k3FXp985/MG4WmO75dWGF/wDKxkXJSxB
         +BFq3Gp32H1b/ciIROhstfBYdQlBGC3gA+QsBiKcXjHc+mNEO0emrYVJq+UvgFjjfEx5
         WKtAf0PQI1/3GX9hXTynCvi/JBd/Ymfq5KLbas97KFldhkXCJUlIsDKt9AGHuOIw9hF6
         p4MTOYvpdLP5X2PSos4yAJfXVdjTgcun9hw2lb6Xca+ei/BIZPdCYFAoS3DFAoDAbNV5
         R/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SOpZvDMhfvyLdgH+ZlV2tASLuyciMU83DIqXOzPoFo=;
        b=ugqJKl2yU7IZhKD9VffBlOxHDaU5/P9aBjAuyHfcJKLzVTxkvaKpRmTcFcAUnGlf7q
         gbXMwwxBaB4UijUTdQ6Zv9s0+c2QP//YDfqk8K/hmAzFKDLjinETuT87yGf+1f7AYx5Y
         TQyUam9i4cM8TwrIWuizv/bTTDe+gQp4C4brLWTKN9vXub2EMSlAuwBMxxX5wdQSqdb+
         +gEkGDWqNdiAvsdAe9Gou1YFn1OfbTIH9tXFnwO068sQBOZ2e6+SIbTN4bYmeaAzhMDZ
         MsTWn+7LjSJn9v/YjUIG0HyLtMWNo8BprKsLm2mgswQYJsWDmNXCPfkBr0netWuZvSCz
         Z2nQ==
X-Gm-Message-State: AOAM531F/wJRf+1Mawd9tuoAbAQrOxd0t4iaD60cbZahQxLwyRiHKu4R
        efGS8MSw9bjRYvMSTbkeaKCoZ7uqayYiUQd2Vf3V2idzfUI=
X-Google-Smtp-Source: ABdhPJyLVm3KzXZ2yBx6Ve18SA+XFbu5PfXIlmvG3sGwnorJvvBZDY9ZUMgyA3Y6Btk7IqedZ8h87j6kJnLUKpc+YDU=
X-Received: by 2002:a63:74b:: with SMTP id 72mr71658656pgh.4.1609773383581;
 Mon, 04 Jan 2021 07:16:23 -0800 (PST)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20201230024726.7861-1-markpearson@lenovo.com>
In-Reply-To: <20201230024726.7861-1-markpearson@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 4 Jan 2021 17:17:12 +0200
Message-ID: <CAHp75VfS3hAJ+vP54V+80zzWVW-+vYK-gGocRMrQhHkWnPXzXg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: correct palmsensor error checking
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Dec 30, 2020 at 4:54 AM Mark Pearson <markpearson@lenovo.com> wrote:
>
> The previous commit adding functionality for the palm sensor had a
> mistake which meant the error conditions on initialisation was not checked
> correctly. On some older platforms this meant that if the sensor wasn't
> available an error would be returned and the driver would fail to load.

> This commit corrects the error condition. Many thanks to Mario Oenning
> for reporting and determining the issue

Hint to the future (maybe Hans will fix this while it's in his review queue):
we have a Reported-by tag. Of course if a person would like to avoid
it, then it's fine.

-- 
With Best Regards,
Andy Shevchenko
