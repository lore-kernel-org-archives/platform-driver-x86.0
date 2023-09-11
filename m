Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FB0CA0ECB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355782AbjIKWCC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242656AbjIKQDp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 12:03:45 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E43A1B6
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 09:03:40 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a9f87adfe1so3665537b6e.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694448219; x=1695053019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjGgx/qsfESzch376+5oi8LKtc3yIfVpyjdNPeJr0YM=;
        b=IqgKLwGHB2c+YOvo309pWtvFau9RpYk+a8TJKUlD7mRl2RA4g7IZlH+Owv6dP1BcJe
         5ifNfwqe9rhbB6utXjARlKAMZwuaLO2FzoSXkEuL530YIbMr9WB2oZfCqknJ+k+4gnc9
         33CjhoN5Md0sD1cpFVFAS8QbD7IcLE/2qFXZzC8pPLpfO0a6cAw/QXJdchF7S+jPvXWa
         Bz/nGTX0Ki2RFGSnr/2DlvaTZaIhClNi24FThlEEP2Ky9pJ72MvXMYzJg9XBQpSGz6XM
         x6qV9tuiWtYpuuHVcEKDOkiN0YzpCN7Eyzv1Cw63e2jX+u2lGjO4b2mLt0B4Kelg33tr
         4jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694448219; x=1695053019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjGgx/qsfESzch376+5oi8LKtc3yIfVpyjdNPeJr0YM=;
        b=ET0g0XM8lAOnnu07KlUpaj1c2vKADjCekKetgFATAu38dnOrWPh5PWCCNFELtikivo
         RCJT2pjtFd8yfJWWYnE5O29dl7dfUJMqCwSni97mQs6VUb9FHZaiGQn/zgUHwaN3jC/x
         irVLuP6CxGaX9qx/j2hU87aQNQXRmFf1rWFjyY/n6QUDaf1U8yvv7UstAbQGBywDG82t
         Idj2bFAPxsR/hLGRUNXS6nTxZ8i4qLfI2ui2NMrIEFQxMwNkcpDU5JzspyIVtED5zEaX
         hhNHCRV0mu/mMnxHuG6IFvcBqKhCrW1P0XjVsk4V8PDfnuMYTZTPTSeIw4w9lRKV0XP9
         rWLg==
X-Gm-Message-State: AOJu0YwnTebkPDsa2AD2VdaEtk9wYBYbx1PjYxd0M+a8jvtA1DWhtOWN
        m2q5qOm6K6JwA3WCNS4pFPGjvwHZAfOFbQff6lOAig==
X-Google-Smtp-Source: AGHT+IF1yXG5te+VZENGbmsEJ8NJo/z1jgMv5tj0n2Ra074S3+aBtzRPFr249Z8LfT2JGb3cLSR9ZERaLrPdqnXjwtU=
X-Received: by 2002:a05:6808:a1a:b0:3a7:53a8:aed2 with SMTP id
 n26-20020a0568080a1a00b003a753a8aed2mr10695492oij.7.1694448219432; Mon, 11
 Sep 2023 09:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230909141816.58358-1-hdegoede@redhat.com> <20230909141816.58358-7-hdegoede@redhat.com>
 <CAMRc=MfeKirks7N7scu+dh+M1Nf0bNxzC7PE2Q7J4bxgpRnECw@mail.gmail.com>
 <0b1e0312-9144-85ed-666e-a84110b26418@redhat.com> <CAMRc=MfVZCqc-v+5oMkTkhfLvq1pE66E7GykqT2ymxzS_kw83w@mail.gmail.com>
 <01a85a3d-c888-11d8-f47e-be2a26d0cb9d@redhat.com> <CAMRc=MeGRreVVz=tCnEWtvixV+ZNEXXvG5SVRRmmnWG_sawMcg@mail.gmail.com>
 <bf866db7-1231-2fd6-eedf-b287ca4fa1b8@redhat.com> <CAMRc=MdXLBnjFPE8Ac9tFQj6BXEyV6kRyDFNytsdQa++Yk6suw@mail.gmail.com>
 <22698b72-b293-9ad8-908f-f6aee85430d7@redhat.com> <ZP80AKHkUyFP7B06@smile.fi.intel.com>
In-Reply-To: <ZP80AKHkUyFP7B06@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 18:03:28 +0200
Message-ID: <CAMRc=MdyZs7bPSnrKJDi388kjKZnA3vHLEa9unqboiSHwNa=Fw@mail.gmail.com>
Subject: Re: [PATCH 6/8] platform/x86: x86-android-tablets: Stop using gpiolib
 private APIs
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 11, 2023 at 5:36=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Mon, Sep 11, 2023 at 04:12:00PM +0200, Hans de Goede wrote:
> > On 9/11/23 16:04, Bartosz Golaszewski wrote:
>
> ...
>
> > >>>>>>>> +       lookup->dev_id =3D KBUILD_MODNAME;
> > >>>>>>>> +       lookup->table[0].key =3D chip;
> > >>>>>>>> +       lookup->table[0].chip_hwnum =3D pin;
> > >>>>>>>> +       lookup->table[0].con_id =3D con_id;
> > >>>>>>>> +       lookup->table[0].flags =3D active_low ? GPIO_ACTIVE_LO=
W : GPIO_ACTIVE_HIGH;
>
> Actually you can use GPIO_LOOKUP() macro here as it provides a compound
> literal.
>
>         lookup->table[0] =3D GPIO_LOOKUP(...);
>
> > Therefor I don't want to / cannot change the hashes of the commits,
> > so a follow-up patch it is.
>

Which makes me think, I should have used it in my SPI patch...

Bart
