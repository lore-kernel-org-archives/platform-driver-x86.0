Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD64C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Mar 2023 22:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbjCCWoM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Mar 2023 17:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbjCCWoL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Mar 2023 17:44:11 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF329770
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Mar 2023 14:43:36 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id g25so1351433qki.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Mar 2023 14:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677883343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hspkVaWlLqbKPRbP17lDKbr28kkrXoKb1t1VlDVEoFk=;
        b=ODmlSUNFvCqROUDeCgSClIRD6wQ/4Qg5u57kUS3ccFFQJXhlGs/tE8cW+1m9LWh3xT
         N01yrmfgEMc4uAKtEGpaaXFb/oAnlw0glnTgQmRjQVShYbBiHyZghLryTXB+FKN4sXIA
         3eREpfJj9fjgupeCNXowKQEeb+nW1O/3TrhEllVOSfDnlkbm0wroRGdgV2k3cN4uttWo
         ha6oXwTVD+jqZirOjp1o54TzgHHm9lEpblGaUfHVuaekZ6dwXo/sHJ3h0w/aDwESVgWm
         7C+wsIiw2J/4UXfYUuPtufHkGop0VGAgsBC1DYd3ZSLZ1TLUl1kHzyXWvQhrz6cMJzj5
         e+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677883343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hspkVaWlLqbKPRbP17lDKbr28kkrXoKb1t1VlDVEoFk=;
        b=kfT9rgpswXGe+DKaHxi4y2mvWgr1Nt0se5OTtf7J1DSmRFOJK3xHa9pJnUnjorW7Hg
         kDPEjIGIwjHA5QtxUyLeXREuRjcGqoS3vc0bCFmeIHNesIY3cP7EEyvuGYWWOyRLAkcK
         OU+9aR9T8hLN0D3neu4HA1hNgKXpyh07nuT3iks81gCrWftKd40za54GCkU3CJS/x6Rv
         vNnEWzjFZDjPJpOMiBLye4bK7Mu9l/28nYubKusykV02i1tFjTo3d1qTIB8H3prNdkGv
         lE26D3HEmZXzX3T8Syu6hI8xbvsVdUMEgVqzEffV1VTGYB4U0jfb/seJuGs0xlsJlkuG
         CSXw==
X-Gm-Message-State: AO0yUKUiuYH/Kk6ocNanw3mZT1Ogu3PKKG8kzh6DgkTn9lMGeYUzeDsz
        OxD2AVOv5AzmVXG80HRsQfkivaqC54PCenePldM=
X-Google-Smtp-Source: AK7set+SJBR5U6rebJZMy9jb0yLmXCCLBlq3g22kJ2BMVC3u3C2s/FssSycjbWXnvYjc8mTrEKoHHekJUtMJW7yfDC4=
X-Received: by 2002:a05:620a:713:b0:742:7e5a:4cee with SMTP id
 19-20020a05620a071300b007427e5a4ceemr874742qkc.10.1677883343568; Fri, 03 Mar
 2023 14:42:23 -0800 (PST)
MIME-Version: 1.0
References: <20230303221928.285477-1-hdegoede@redhat.com>
In-Reply-To: <20230303221928.285477-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 4 Mar 2023 00:41:47 +0200
Message-ID: <CAHp75VfOUnVVr=_VcTch4-=KTv6v5yG3g+adgn2CtnjKCV0YYw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add intel_bytcrc_pwrsrc driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 4, 2023 at 12:19=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Add a new driver for the power-, wake- and reset-source functionality
> of the Bay Trail (BYT) version of the Crystal Cove PMIC.
>
> The main functionality here is detecting which power-sources (USB /
> DC in / battery) are active. This is normally exposed to userspace as
> a power_supply class charger device with an online sysfs attribute.
>
> But if a charger is online or not is already exposed on BYT-CRC devices
> through either an ACPI AC power_supply device, or through a native driver
> for the battery charger chip (e.g. a BQ24292i).
>
> So instead of adding duplicate info under the power_supply class this
> driver exports the info through debugfs and likewise adds debugfs files
> for the reset- and wake-source info / registers.
>
> Despite this driver only exporting debugfs bits it is still useful to
> have this driver because it clears the wake- and reset-source registers
> after reading them. Not clearing these can have undesirable side-effects.

Hmm... Why is the existing regmap debugfs not enough? OK, maybe adding
something (clearing bits) to the actual CRC PMIC driver.
(You also can add a write callback so regmap will provide the write
access to the registers).

> Specifically if the WAKESRC register contains 0x01 (wake by powerbutton)
> on reboot then the firmware on some tablets turns the reboot into
> a poweroff. I guess this may be necessary to make long power-presses turn
> into a poweroff somehow?

Have not a doc at hand. Next week I will try to dig into it to see if
there is anything regarding it.

--=20
With Best Regards,
Andy Shevchenko
