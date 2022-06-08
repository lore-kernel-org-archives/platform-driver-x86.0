Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47E9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 21:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbiFHVEF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 17:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234478AbiFHVEE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 17:04:04 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB82922657B
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 14:04:03 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id x187so11010492ybe.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hhMzr65l7Ya+WiGAcpikeIa4IcNTSiOTcYZlO7k098A=;
        b=Pqq8q8vKmTwrYG1D+yheYhlWT9/I9MWfUc7HO5Mo0p0vKUswspxJ7Rnjf7pyQjxdvd
         NqJSMLbmT7ChIcFQOWhvQO1EwPur4Ts4FiD79VfPeH/Usof6+HWKmv9bC0AwCKxJAP6m
         D5mwiDr9GdQBqM/w9Fviasf0vX3KuQbrPAQ3y+XFXEwzxUXqBsmg3jMp7CY+3e2ZgyjM
         xeDNBR8U4V67jU5AXruYLKb8i6EtZR2hDqhmAQ2XGxVy0xvTxVzUAIQGeF4hsGZsx/MY
         vkWoLXQKinvtqOBdf/QZIPR1EASzdDxasfy/aW32N65Pg8QiC7bTtC684nzVRG/5Y685
         +TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhMzr65l7Ya+WiGAcpikeIa4IcNTSiOTcYZlO7k098A=;
        b=QZdjRESkp8woJ0zP0ZHFZUiJYvktj47kcvktsQGZoRCa81FGnj1dpnLl/ppvoEihGa
         fmJ7PEDSpLwT22TfZyFXLCAQRe9S5sgOipoJNGLP5NROh/QQFHbnJK7twJA5Il8VtHmD
         RBGDi4cmq9K4GTKtN2zJAsn1paLWbXJgB76KvA2tR5F6iNkDCzXnpXTNbAA/hdmMFEkz
         1PX2EI6G8UvA00Nmu42dZR+YO2nS0dNPZvzSh0yCqUgrwMZfvtqo06iZrWkIzBG9NqVe
         R70XWqxOvu3bXOAvyIM9D0U/qKBva9ml4GfVnNFpT3nDUAdzzxJg8qh8L9yHfLArdssv
         d/xQ==
X-Gm-Message-State: AOAM531RRsIhi8iEu1PIV2+GienJb8h5KTejbMWNf9jEk9XDS2QIXBTO
        qQX3Lx8HOJ9rJxmgE8Br14/aAm0P4XMgk6wlU71iVfzFRCY=
X-Google-Smtp-Source: ABdhPJyKtfAwj9cPf+I6Keun8mLV7yk5Kw/UjntGqiil2yvGiD9gH9iUoqmryPX4cd9MmnKrcIL5i7inp1FtxuWJ3G4=
X-Received: by 2002:a25:ac56:0:b0:663:dbe6:b784 with SMTP id
 r22-20020a25ac56000000b00663dbe6b784mr11099826ybd.546.1654722242984; Wed, 08
 Jun 2022 14:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com> <20220608170220.5751-2-jorge.lopez2@hp.com>
 <CAHp75VdPOSHyHiwFWYR6_BuoUXca9wvYFkgy7wXBW305FGHigA@mail.gmail.com>
In-Reply-To: <CAHp75VdPOSHyHiwFWYR6_BuoUXca9wvYFkgy7wXBW305FGHigA@mail.gmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 8 Jun 2022 16:03:52 -0500
Message-ID: <CAOOmCE-NSei2+Y=NFjjF9jmY0L8HtOO4jHSnfm=kC7dTOZjwpg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Resolve WMI query failures on some devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

Failure to run your tool and include all the appropriate parties in
the review was an oversight on my part.  I will make sure it is done
in the following patches.

Regarding the statement  ...

      Please, be careful and read all comments you have been given and react
      to them either by explaining why it's not worth to address or with an
      addressed changes.

All other comments have been addressed in the commit notes and via
email.   The comments addressed were

- As a quick fix it's good, but have you had a chance to understand why
this failure happened in the first place?

- Can you check my theory that is expressed in the code below?
- Leverage ge2maintainer tool to include all appropriate parties.
(See earlier comment)

Did I address all the comments?  If not, please accept my apologies
and kindly point to the question(s) I need to address.

Regards,

Jorge






On Wed, Jun 8, 2022 at 1:45 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jun 8, 2022 at 7:20 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
> >
> > WMI queries fail on some devices where the ACPI method HWMC
> > unconditionally attempts to create Fields beyond the buffer
> > if the buffer is too small, this breaks essential features
> > such as power profiles:
> >
> >          CreateByteField (Arg1, 0x10, D008)
> >          CreateByteField (Arg1, 0x11, D009)
> >          CreateByteField (Arg1, 0x12, D010)
> >          CreateDWordField (Arg1, 0x10, D032)
> >          CreateField (Arg1, 0x80, 0x0400, D128)
> >
> > In cases where args->data had zero length, ACPI BIOS Error
> > (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit
> > offset/length 128/8 exceeds size of target Buffer (128 bits)
> > (20211217/dsopcode-198) was obtained.
> >
> > ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D009] at bit
> > offset/length 136/8 exceeds size of target Buffer (136bits)
> > (20211217/dsopcode-198)
> >
> > The original code created a buffer size of 128 bytes regardless if
> > the WMI call required a smaller buffer or not.  This particular
> > behavior occurs in older BIOS and reproduced in OMEN laptops.  Newer
> > BIOS handles buffer sizes properly and meets the latest specification
> > requirements.  This is the reason why testing with a dynamically
> > allocated buffer did not uncover any failures with the test systems at
> > hand.
> >
> > This patch was tested on several OMEN, Elite, and Zbooks.  It was
> > confirmed the patch resolves HPWMI_FAN GET/SET calls in an OMEN
> > Laptop 15-ek0xxx.  No problems were reported when testing on several Elite
> > and Zbooks notebooks.
>
> ...
>
> >         struct bios_args *args = NULL;
> >         int mid, actual_outsize, ret;
> >         size_t bios_args_size;
> > +       int actual_insize;
>
> Same comment as per v1.
>
> Please, be careful and read all comments you have been given and react
> to them either by explaining why it's not worth to address or with an
> addressed changes.
>
> --
> With Best Regards,
> Andy Shevchenko
