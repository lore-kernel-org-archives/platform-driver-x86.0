Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE77C433E9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 14:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8504522D58
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 14:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405602AbhAZOV6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392709AbhAZOVw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 09:21:52 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59ADEC061A31
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jan 2021 06:21:11 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id b17so3312594plz.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jan 2021 06:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=enNcConCCODk2yvZG4m5Bl4n1RfvQ7/HYs+NrsxhQn4=;
        b=je3WpgMDitAUYDzscNt0nCR7TjFT1Btwz9ht1LjChTYpu+ZdIckXCFjqoetkzoZ4nZ
         /TfbYorYZdhuapGXE1L96pTvV7T7MdI2P213Zx7Rjk7FmYeUH+JifVQGmGsETSiBh0RB
         uL5O4NEdGGTzFHgI4XHNWjmes26xhnA6xQ2qV9tNMxNvBPSraFgdAjCzjXTZzf8RNiDD
         nzayVA0H2oORweElldv5fQDzwGUQoXYx+AqXxgek/o1ym0RFLEKeYLD/f97zauxU2vA/
         QMA9DuQ/mCMJEShebHjM2hAfiPyXbdUu0y3FnRIwkfOIlqzOwH7wmf5Vrw/CKVSbLNxg
         YMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=enNcConCCODk2yvZG4m5Bl4n1RfvQ7/HYs+NrsxhQn4=;
        b=WUkxTQyzmZt5oLVZBrtQA/RTVlnZqjq9FvPBYNPxrPtoMV+Af6gGw1UFNrJmbTqEY8
         tnd+c7EYUfbf0v/8Yu2m1qIpK7PYOAznOoaZoMpceCOlu9n2cca6o5tmwHs//FoZxW7C
         /XzQ2dE0YWwOrtbGKcLi2pXJWl+/L5wqbAdZXcHgsrjTvdBPQK551Og/pDpwB4LjSJKo
         oYtvUfDAQehCaaiOoX+mh582C/WBuPRpdtQ7b3vZuMRGIWqJy4Sp7GcbttRD7NjH9ECn
         olZEFaDpYuiW4SHfGh+CHblnv+FJuiae1HBSNw3O8pjZ2HDMQUOV5UfbxvH3OkLkmrHI
         XDrg==
X-Gm-Message-State: AOAM531rCbG7x1fuTYjqMTJ0muC7P0QYDP5QgxIPxVxXG8kjGgKEEBil
        D9B+Ln0763/E/sE1w+9bwp3FFUihFB0FH+YTd5o=
X-Google-Smtp-Source: ABdhPJxWJBS9X8AVywzlbaUwbK57OiIriTnjwlqWucnP14Quodb6VG55oMIr/lTUSYnKH0WPER2zq8AuF49IjiykFj0=
X-Received: by 2002:a17:90a:ca98:: with SMTP id y24mr6659195pjt.181.1611670870826;
 Tue, 26 Jan 2021 06:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20210125025916.180831-1-nitjoshi@gmail.com> <CAHp75VddS69zFvfWem9ZkzAkTFG2yxPKzT7OpH1GAcNiqAZJkA@mail.gmail.com>
In-Reply-To: <CAHp75VddS69zFvfWem9ZkzAkTFG2yxPKzT7OpH1GAcNiqAZJkA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 26 Jan 2021 16:22:00 +0200
Message-ID: <CAHp75VdHFRU=0=1SH1FDuatfdHzKJhB-qv7Y9EzsBTeRvjooyQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] platform/x86: thinkpad_acpi: set keyboard language
To:     Nitin Joshi <nitjoshi@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Berg <bberg@redhat.com>, peter.hutterer@redhat.com,
        maruichit@lenovo.com, Mark Pearson <mpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jan 25, 2021 at 11:30 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jan 25, 2021 at 5:03 AM Nitin Joshi <nitjoshi@gmail.com> wrote:
> >
> > From: Nitin Joshi <njoshi1@lenovo.com>

> Maybe it's a bit late, but... nevertheless my comments below.

Nitin, if you are not going to submit a series of fix ups as per my
comments I would probably do it myself later on. Just tell what you
want on this matter,

-- 
With Best Regards,
Andy Shevchenko
