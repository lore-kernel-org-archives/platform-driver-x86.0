Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B4AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Nov 2021 10:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238914AbhKVKRz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Nov 2021 05:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbhKVKRy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Nov 2021 05:17:54 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BB0C061574
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Nov 2021 02:14:48 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id o20so30017052eds.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Nov 2021 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DxmQMU85sAFLpVQXePXhstLMaftx93t6/o0fbz7KIy4=;
        b=hAetKWg8yjFOsC3i/g0udYlHUOAe6+vZNy3uBSE5IgP/lQ8W1SekrX4mgILnssZnlJ
         jCKrSFLUMTn6htWl7WJtaZEVRV7v7HfpPWhq0dAXq9zuiYzGOnAKJE0I3IWvfG7u+kEl
         nyQgNsdOPoPHNMmWf/hmw5Pqt/L6mqZhvHXXBORiXeMxRLjs7iIPsyH+VhSstHpkUvnc
         4KhwPKTg6gDd+ldlZaPOAqvjLz5BtkDeW3Av2HsXlWehElBGkDcheAeBW6T6okwC/MFu
         fDqBFlCPZ45UzQhM9W2I44fzFTvAhlGhqL9Ic/lgp8mwcnBZo5G15gKeWKyPOZjbk6cK
         3zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxmQMU85sAFLpVQXePXhstLMaftx93t6/o0fbz7KIy4=;
        b=iP37WzybbX3l/8Iff3km5HR+EzKx3gdkBPt3IO9ZYBu4oejWJEUR5Pdigu78Kd0s9H
         ILRPwDMJHkfJI5LOGUriHD4NH0ee1XPAb1svSYUwmsI8VASv3aK2rFtJhfZee0TV1t3H
         z7sCswU/MH0NgPg55LUXAaf+0W4MLcgD801OoLkLO53no3AiFeoVL+PUo6advjB/iC42
         mCxCXTZpXX4P5y3mUcnQh9F2OIWUwyTrUsZJixkFXJkGhv8zrXLOPXrLiNNysIhHCqdd
         azNwIFwZ1DTkfvMnMNp0vd2nFynI4gStdx+UfN2us5yFGs6KZIECAl0IT435UvRw1x/Y
         CXxA==
X-Gm-Message-State: AOAM532dNUsUyJcXoe7Rh+9IcDw1ioWcNESOWNvIQBY43S+Stdl9dYnT
        kw5AZ147YnG4t7MQO8zYpX9uoWooTyE8UXtL+JI=
X-Google-Smtp-Source: ABdhPJz2vWIVtbxq7mFQjzWf5CTftTuqbMpE9KGW7jVXPNC3yFpsqyhlQs/HYYuAffWxRDBtblaY6VoCbruKnut3FZ4=
X-Received: by 2002:a50:fd16:: with SMTP id i22mr62716977eds.224.1637576087106;
 Mon, 22 Nov 2021 02:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20211121191129.256713-1-hdegoede@redhat.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Nov 2021 12:14:11 +0200
Message-ID: <CAHp75VdetJYu3noEis1f3Ad6bpSjVmBWqpNwQdW5LTRH4pu0KQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] thinkpad_acpi: 1 bugfix + a bunch of cleanups
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Nov 21, 2021 at 9:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> Here is a patch-series for the thinkpad_acpi driver starting with one
> important bugfix which fixes a bug introduced by commit 79f960e29cfc
> ("platform/x86: thinkpad_acpi: Convert platform driver to use dev_groups")
> in platform-drivers-x86/for-next which is causing the driver to not load
> at all on many devices.
>
> Followed by a bunch of cleanup patches.

It's right thing to do
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Please test and review.
>
> Regards,
>
> Hans
>
>
> Hans de Goede (7):
>   platform/x86: thinkpad_acpi: Accept ibm_init_struct.init() returning
>     -ENODEV
>   platform/x86: thinkpad_acpi: Make *_init() functions return -ENODEV
>     instead of 1
>   platform/x86: thinkpad_acpi: Simplify dytc_version handling
>   platform/x86: thinkpad_acpi: Cleanup dytc_profile_available
>   platform/x86: thinkpad_acpi: Properly indent code in
>     tpacpi_dytc_profile_init()
>   platform/x86: thinkpad_acpi: Remove "goto err_exit" from hotkey_init()
>   platform/x86: thinkpad_acpi: Fix thermal_temp_input_attr sorting
>
>  drivers/platform/x86/thinkpad_acpi.c | 221 ++++++++++-----------------
>  1 file changed, 78 insertions(+), 143 deletions(-)
>
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
