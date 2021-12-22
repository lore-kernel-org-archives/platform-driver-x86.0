Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5E9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Dec 2021 02:48:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238793AbhLVCs3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238744AbhLVCs2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 21:48:28 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F17FC06173F
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 18:48:28 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id v6so1705669oib.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 18:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/FZUFL2wLkEGZGFTbPONkk6mLWd8J6cDzMFXomn323A=;
        b=Niimf1jllbIyv3wnG8/DrqRRpShYICD8EWAfwYqJY8qcVGHPp/f2EqajPpp/OQ55iX
         7avYtd0TmboDXiqV4tshfdp7cv/Y4/zbfmr6GhPhXYMEd3RJyNmCADsOeW/Vpwl+ZvIT
         LCNinerXlMPpFLuJvTQh3YrZ3jK8M543vM7IfidOglerQpDjrYzdYHBP6gSN8eYW9nG8
         ezvZHL4Eh4mkMiiOTgSwT3gL+IUApU4GILXtkZatXC0KV1jRk+jCLVJ86BMVK9p+m7zu
         F5KqUESKLmMKEKql51KlJO9x+//yei5FefBnN6rCNbYCyK6dNQmRq+6xk8cp/8TH+Z84
         sG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/FZUFL2wLkEGZGFTbPONkk6mLWd8J6cDzMFXomn323A=;
        b=AUttWIsENzi4nsqHaLoZNWBqC+ieII1u9HqeO7g31Vw6k5xPyRZgLiEG764mNO3qSj
         JND3clSXP+dHy5LW5hzXNZ8ZXP4/BMdBNwmC9RAEfL0CSj7uTuFK/POi2CSv4HVH0UBe
         fN5HY6TvjNkRzFGkf3MXi47xCtPO3berj8XKfiejJQmGhZXhE0Dv43wOEs7gALL+Alpk
         ybi9QmIwphZDbkuIpy4TFJZ/Wb0mIvy/m1DyENte1u22n68hBdCr02FJv4LNY8sRuwDY
         BPo2Y6+ZEBd+YGbCxn8WPZOSegixcHbyBfdzD5RsllI/aQS7HeW02Z2wgAMnhO0DAlkN
         5ZTQ==
X-Gm-Message-State: AOAM532OVoGjR/O6IslRlvqYvWjI7JCtmdkGOdzxbww+EkhET+dkqmBp
        yYRI+oiGjqVMyEFE6k7fKl/cmgZ39BeRR7U3G65+KA==
X-Google-Smtp-Source: ABdhPJzgjgZvCZer+0qK1pclgej1TT1RDlfQKfCQvqjVS3qOHMzJGGAXe5nK0e/t6ph4iTgc1ECudtqKVJBwg9u1Q/o=
X-Received: by 2002:aca:120f:: with SMTP id 15mr742282ois.132.1640141307641;
 Tue, 21 Dec 2021 18:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Dec 2021 03:48:15 +0100
Message-ID: <CACRpkdbLk1aHEaiumq3d4qmg007QtZcitmCwdyFyLxyY=H7MXQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] platform/x86: introduce p2sb_bar() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Dec 21, 2021 at 7:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Please, comment on the approach and individual patches.

This approach looks reasonable to me so FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for the series.

Yours,
Linus Walleij
