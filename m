Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8F4C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB2B122CAE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbhAPUNC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbhAPUM4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:12:56 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608C6C061574
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:12:16 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id r4so6440631pls.11
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mc5HAdfDMI88Fmai043WkokS6PLowOlJmD/jaCWxYYk=;
        b=szs7RLz/Ykh+7hUqRumEluipmsAqy4+FuU6F8y1QQIlSQicn8zWnQCUEarCUZCBj/f
         Ia4Jj62TLAC6F1aOxtpgk3JCI4sRnYrCv6lUBjqfiZHeFjhTLfU8+rewMCGJWbYpFmkR
         oKMiiU4sUNicHJ86L+NsxvEBl0jI2aBe8N6Jszpb5UOXEwSwJzsihMyKteRgmQGFJ1s4
         vJb66OfpL5uysqKnbA17RsyaYNU/m1GtbZpzPm8OLXjRfbFOAUK4SDmeyHwC/Tk29qec
         an7/O0RS3MRPxpFn4em9ZSPzgkecW60McBCuoogMoLha3INUvd+GbLa8EZMUemdPPHpy
         WzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mc5HAdfDMI88Fmai043WkokS6PLowOlJmD/jaCWxYYk=;
        b=ESnWizO0s8GTI8IY+6P6pkhcx8KIOHSuzSTOTDVR9tICyWyjzGqy/nqXrz3YlauYn7
         MmTJSIr230s566zIp3Lt4vbDQ0Cm2PPEzWKtHj+sAbELH9H3+BsfnTSGrwxYlPVH777o
         DNpcFatLCPWn3W6Bpo32DsjpMbYJxa9+7JOo1RdKosVZq9JGDRJL0AgGpXUiXI9faFlk
         GcjF2LD7sdWxVp9QRm4BQ7a95ei9kJIth2tsrYtbfFUTjKjLhxZeCf/4PtqPVZifgNu7
         ysnNj2syWrvZzVNvOD8h93nmA3UCOme6kFqGVRhT/I0WpzfkNpOVkznJ7XHPM8sFneQ1
         jxqQ==
X-Gm-Message-State: AOAM531nxrk0e6MjkLVMhTlJRgF3tF7e4brkLL462MHmSwXeW4zC5WL+
        kOGT8iqGTw9wRRPQ2uzNBl/1jtsuI++PIPYbfUc=
X-Google-Smtp-Source: ABdhPJyV2E42sIGphQZ06ZcTDZF5Nb2NHrBCW0jawpV8Ir2l9OSwrZjt+1WKhcweVdYGqeaV4L9CLOWE5D3v++ziFK0=
X-Received: by 2002:a17:90a:4d83:: with SMTP id m3mr17503270pjh.228.1610827936016;
 Sat, 16 Jan 2021 12:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-25-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-25-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:11:59 +0200
Message-ID: <CAHp75VfBES_AfOv+C_q40t2hjtV0F0atV7QTbDfRTF5UY0m5pA@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] Documentation/ABI: sysfs-platform-ideapad-laptop:
 conservation_mode and usb_charging
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:25 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Document the conservation_mode and usb_charging attributes provided
> by the ideapad-laptop module.

Looking at dates it seems it should be split to two, where the first
one has a Fixes tag in it.

> +Date:          Aug 2017
> +KernelVersion: 4.14

> +Date:          Dec 2020
> +KernelVersion: 5.12

--=20
With Best Regards,
Andy Shevchenko
