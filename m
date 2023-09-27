Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BA6E80A97
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 07:02:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjI0HCT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 03:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjI0HCR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 03:02:17 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B84EB
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 00:02:16 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4526b9404b0so7642855137.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695798135; x=1696402935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIhw6V2vNvwuHPJdanJymYad1CWCeReXt9hAkVYiSu8=;
        b=UUgp2qkBRuw7atZO+bq6YhZnv2XP7IXd16nAdUZoFPR6yYKrrje3qoKCG8PWe+lXZA
         wvB6L/b2+jWifMiFq2LqfScOb5McaPyr2PYzZvk/ALoL6VW2SHkFRXRTaOUvDD1IGoHf
         ITmQj2ihroFVxBp29v3yyrtt+7r4ErTriCU25/tuGZFctbEV2L4PwyKDhg1o6oBDNOGT
         HP1HGeGNkUro89LmwjFXv9IxiUI4w2v3dQP6TpVZoFaNzNKjsYz9lDXyuSXIwU0eiwqt
         Dud/Vjhj74jiZ3HK5VGJR00Uvdcm+B5JEEbgSrmp3KrKxH+4A1JhuTZCA4KDgkZniqJM
         tmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695798135; x=1696402935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIhw6V2vNvwuHPJdanJymYad1CWCeReXt9hAkVYiSu8=;
        b=Z3DurWLrE4rfmx5xeM8u1+XMaijPxyFSgZBaI/oKpZIty+FoU+J1UdGwvJcV3ayVy3
         Mi3F5xArKxBsPsGeQngUdb+81qY0vql3xy50HIuHCPdy+oiC8ndyFLfnCzi5jGwacMJn
         eRL4vtF+349qQlG6+SMyqpPuG86V3qpQNjY3XnvpdhevVljVQJ+UDSTLweAgZNRKSa3R
         Hiws6eQefxhkSr4pKvwGcpmkdtREpenw7o1acWYYoutekG9vDfshapWwMcxf6xkb8TYs
         nCpemRsfH/Sv6yNiNKy7aX1s5ZNrMfWhrgrLTy+yqUB5R8PGwn7zUAvUUTe4iCBjVZ8p
         OCSQ==
X-Gm-Message-State: AOJu0YzVD1wpQ2ZHZuVV1qFPFEHJ5VuXuTTBi7dDSrnDoUmrZZA3s2Jv
        Z560wiMHU7WoEOLT/stqGOJQPOUySGCEocKdhK83hw==
X-Google-Smtp-Source: AGHT+IFeBg+cETieioky1nVVQRLBCT9NkB2t+sJgbjsopgLmTzgcBajxJFtqUg5cY06CWtryBPEjDMHEXp1rIT8Co8E=
X-Received: by 2002:a05:6102:3e0f:b0:450:985f:ef28 with SMTP id
 j15-20020a0561023e0f00b00450985fef28mr2450526vsv.5.1695798135672; Wed, 27 Sep
 2023 00:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230926145943.42814-1-brgl@bgdev.pl> <20230926145943.42814-3-brgl@bgdev.pl>
 <ZRL4PYeX21bwCPR0@smile.fi.intel.com>
In-Reply-To: <ZRL4PYeX21bwCPR0@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 09:02:04 +0200
Message-ID: <CAMRc=Mf7P4sWdhgTV+jVD8HEVpxbSuGK8JjJb5Q9djCkKUeUcg@mail.gmail.com>
Subject: Re: [RFT PATCH 2/4] platform/x86: int3472: led: don't use gpiod_toggle_active_low()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Sep 26, 2023 at 5:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 26, 2023 at 04:59:41PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), us=
e
> > temporary lookup tables with appropriate lookup flags.
>
> ...
>
> > +     int3472->pled.gpio =3D skl_int3472_gpiod_get_from_temp_lookup(
> > +                             int3472->dev, path, agpio->pin_table[0],
> > +                             "int3472,privacy-led", polarity,
> > +                             GPIOD_OUT_LOW);
>
> Personally I found this style weird. I prefer to have longer line over
> the split on the parentheses.
>

I in turn prefer this one. Checkpatch doesn't complain either way so
I'll leave it to the maintainers of this driver to decide.

Bart
