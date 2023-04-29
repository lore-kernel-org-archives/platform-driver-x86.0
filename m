Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84BBC77B7C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Apr 2023 12:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjD2MA0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Apr 2023 08:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjD2MA0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 08:00:26 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C10C1723
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 05:00:24 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-3ef64d8b2b4so3960401cf.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 05:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682769623; x=1685361623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1j8vXLG2wUELSvDzlJSmrliuFEP/Y60+ygKeBqjs/Q=;
        b=sAFxKGgNGlWaOAUDGn/ZYirwHRocjDwb/5NbZmZYv86MBkV3Q1ZC3ZeTjBLzhQzwkX
         iqIGgszus1iLs1YziDiOs+9s1sG1+2gwAx70HWVokvcc0cFMCzniLAH0/+gGi5obzb3x
         oESpqhJbBJoDIj4+5D03SYx0+5fiALf/RM0FavZxsYqJoIvOmI55lucdO7zeLH9vUSF1
         46yDnMnqct4GtJ4ndTHemgsu2Z8fxouVRjklyFc+ZgZW2PN5MpagRi0agBqbsFL97fHm
         737GMDNiU8CB6Z2XJKxDFlhj7Kye51+QCcYBDtxTsWVUFHbsG+4rSp2ukVw+0948Azfi
         /FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682769623; x=1685361623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1j8vXLG2wUELSvDzlJSmrliuFEP/Y60+ygKeBqjs/Q=;
        b=dFo8jw+oF0Jj1NnUu/XrsyMsWM8iABO9jlwy+6wAl+yD0yvrOO6j72uZOhO4kcEglD
         vn+bHK1+417A/fx9yiGbVeLlyG8tPCqvvpPuunUTndYT5J/i9MOdbnPUARB3GMQnUt50
         AGq88+3VLYneLK2BeWCSyHt0wBvEn5kNzctjdMzste7iUI02Ly4+v+tj1aN3IXGjLrFm
         mSxq/knYUwnMvZtHmf2Fu0TH7jXSoETF/zDcr1J1mj/XuaToRXvbxVvXkFj7XBjuT8oG
         9A/tPkTT9fGzN01hbBtv/Xpd/loH8+KRhu3x3DotGQBcJT0xETzCmXikdLB4FO6tn7oX
         RQYQ==
X-Gm-Message-State: AC+VfDy0bH59xZdP2DvkNaMWDpfsrt79w1LvhyYRDmBRE2geMs5dLVOE
        h3t5pmazh7bXzroJjCTu8U5FWYBf0L5VeAoZ6kI=
X-Google-Smtp-Source: ACHHUZ42sJ0XF96SE6DE9KBCxlUOGwjGabZ+jBoebuWGFYMp0MBmDsA1MFeJ7mS4iw9v6pFC5YIkbfoHutyaFbrrjQk=
X-Received: by 2002:ac8:5fcb:0:b0:3f1:381d:1067 with SMTP id
 k11-20020ac85fcb000000b003f1381d1067mr13325278qta.42.1682769623642; Sat, 29
 Apr 2023 05:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230429105057.7697-1-hdegoede@redhat.com> <20230429105057.7697-3-hdegoede@redhat.com>
In-Reply-To: <20230429105057.7697-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 Apr 2023 14:59:47 +0300
Message-ID: <CAHp75VfaN4Az9OHVG2OfmgsqD8DmoY2VsmQ_5mvYF414_xDX1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: x86-android-tablets: Add Nextbook Ares
 8A data
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Apr 29, 2023 at 1:51=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The Nextbook Ares 8A is a x86 ACPI tablet which ships with Android x86
> as factory OS. Its DSDT contains a bunch of I2C devices which are not
> actually there, causing various resource conflicts. Enumeration of these
> is skipped through the acpi_quirk_skip_i2c_client_enumeration().
>
> Add support for manually instantiating the I2C devices which are
> actually present on this tablet by adding the necessary device info to
> the x86-android-tablets module.
>
> Note the Ares 8A is the Cherry Trail (CHT) model, the regular Ares 8
> is Bay Trail (BYT) based and was already supported. This also updates
> the comments for the BYT model to point out this is the BYT model.

...

> -               /* Nextbook Ares 8 */
> +               /* Nextbook Ares 8 (BYT version)*/

Missing space.

--=20
With Best Regards,
Andy Shevchenko
