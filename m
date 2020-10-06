Return-Path: <SRS0=8/nu=DN=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26593C4727E
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 14:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D603320760
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 14:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCfQn8E3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgJFOFu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgJFOFr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Oct 2020 10:05:47 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EF5C061755
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2020 07:05:45 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id w21so9084428pfc.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2020 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ShlnRKiI6sGR/pasI+6hck+9GvzMfOTxiM3NpAoCEkI=;
        b=HCfQn8E30qDWgx1nnJVwAyplJqCKGgsHS2c3vSlMvUf7BRxKay+sLdYhlFBV5BynIs
         M9tsU6u1rHZwyNqjStsD5l7U2CCTgDlFWXjecAPyu6uPm05yyGUK+eo1PCNXNCErkQck
         K2ogQUz7OlYQkPrbv8gGhjbGJoxnMIMv0ScqlPRGoJDBJx/1Wi4zepZ4tgJIYbIZMbtq
         Ni7lWpcGjxZvz4YrhdAsa6iE1xT4Wpw9L+R/Pqhes6NYw6mf4dmcxJpyMoOioFmIWNjA
         tz7kqhp54e0VtdE6kD7PkY1/ZDNFWqKPSa+MhOAZb63LWB6sD/qX8bc61SIGajtq66Bv
         FaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ShlnRKiI6sGR/pasI+6hck+9GvzMfOTxiM3NpAoCEkI=;
        b=SB83N0y5MNBwrkmbN/ME8DNIx1UjZZ8NS0J6XNuDSzUlupaRyXen6QuBPtVdzEC7z2
         sJxpmPcQruvewQ/J8H50ElCOw3s/T3+nJyvFRX3XvdQ4/UQ35xr7NxA3Vcz/oijz35RV
         gKoNYQCs2RprXRDQb8L410yVTNMWQyIvEcrkwhMMxFQPl8pO1HacGaoGNuEfhTRPnlSP
         httPB4WdaNuod5PAZrg+hY6CwsQUZ6dmvpqcHEV81O3Jue00OOvvMd806cpI2LtUCVor
         lzGwHq1DrqC7eYnBZl11nn+3Y+ZEU7IkZcwlmgL699TE7Y2bDjEEwB4HanB0IHZNVYEB
         X/rA==
X-Gm-Message-State: AOAM532HfY46kR8bTbRTdf1mJTVuGcdLYFhQeW0vFX3XaAEFH4picLfT
        WwYTqBWkN0PjqEy2oDF8Twcw30aiKI1KKdRCnLQ=
X-Google-Smtp-Source: ABdhPJxsl0MamibSViNmMll93tiLs59oN9oZ/GuzuheNTh/rY7+LJk5YvFYtw6GfOmD+cp263+0OilRCEcQTtwWuWv8=
X-Received: by 2002:a65:47c2:: with SMTP id f2mr4229967pgs.4.1601993144725;
 Tue, 06 Oct 2020 07:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <02c960a0ab75672007527e167b89b986ec5f9441.camel@intel.com>
In-Reply-To: <02c960a0ab75672007527e167b89b986ec5f9441.camel@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 6 Oct 2020 17:06:34 +0300
Message-ID: <CAHp75Vc_GszASbRSiEGiLxLFmhsoLE9mNbpQkxYdsLDT8_rCmA@mail.gmail.com>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select second pull
 request for 5.10-rc1
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "andy@infradead.org" <andy@infradead.org>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Oct 6, 2020 at 5:04 PM Pandruvada, Srinivas
<srinivas.pandruvada@intel.com> wrote:
>
> The following changes since commit
> 720ef73d1a239e33c3ad8fac356b9b1348e68aaf:
>
>   platform/x86: thinkpad_acpi: re-initialize ACPI buffer size when
> reuse (2020-10-05 12:20:42 +0300)
>
> are available in the Git repository at:
>
>   https://github.com/spandruvada/linux-kernel.git for-next
>
> for you to fetch changes up to
> 1fe458617af45f7926ce338b7accec5c0fea1f5c:
>
>   tools/power/x86/intel-speed-select: Update version for v5.10 (2020-
> 10-06 06:50:49 -0700)

Hans, Mark, just to inform you that we agreed a few cycles ago that
Srinivas sends PRs against ISST tools.
Please, pull it into for-next!

> ----------------------------------------------------------------
> Jonathan Doman (1):
>       tools/power/x86/intel-speed-select: Fix missing base-freq core
> IDs
>
> Srinivas Pandruvada (1):
>       tools/power/x86/intel-speed-select: Update version for v5.10
>
>  tools/power/x86/intel-speed-select/isst-config.c | 23 +++++++++++++---
> -------
>  tools/power/x86/intel-speed-select/isst-core.c   |  8 ++++----
>  tools/power/x86/intel-speed-select/isst.h        |  2 +-
>  3 files changed, 18 insertions(+), 15 deletions(-)



-- 
With Best Regards,
Andy Shevchenko
