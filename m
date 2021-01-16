Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40435C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B043B2078B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAPUBG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:01:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbhAPUBD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:01:03 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C310C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:00:23 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id t29so2597161pfg.11
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wlZ94jEBUEvQRUrgcgMED2SvOBvejCjGjVrIYYVejp8=;
        b=Lac25UdzB+SCNKHRN8GsVpdluDC++r7EhDfrIzm8bC6uHmW5m9GxIxh4If4kk0IHK6
         ujwvAmF5V93D81v97OAZjxrtRH2WzZimuov7O6zia8uzOm7ioH66oPbib/UVwjWhu0cO
         Vw8jpit7wz/xZvyzSgtICNuPAq2ptzYAuupr+ZR2wZn+eY3vR3w5shkzPLe+SRrTRwqw
         idXKzx1aXsQTapzk02actsb00i5ep7dwVof0mWtHK3iW1fhef1FGEFL6DqO0yK7yAJsi
         mG06FEFiMKKNisemb0Vw7/i4q9NXot3pbo0xLH1YZbHreGWC7cGS7FFhj/7xsvHtJwfF
         nIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wlZ94jEBUEvQRUrgcgMED2SvOBvejCjGjVrIYYVejp8=;
        b=DvLyoCClIRRAPw9fLUVPMJi35MTyPTpGnZtradBhj0jca7UT7sftJrCUEZT3ACePYG
         6sSWVGQhDgeWhl+EOX/63P41JDKYAKXXcHar/1VG2hmoiZOu9SKAiPImOWtkViWOumMS
         e9LMah918Odsj5Wkt5O8iCaanL+Dz6zzcddwPgBKLsBlSJJvkW3W6xS364sReQoJ80iT
         MKG5+6kdKCQ3J1P1s2tRHYGJ4f7bMde+j907rqOaiqkd7SYZkJyNVl38yz2PgZuNDfSz
         ux/lgTl6TeiZ4Upjz7DsyYdt6+7d5Mc7LTZFAVkPckagBY74cDag6Trb6+2FHZX134zx
         dh1A==
X-Gm-Message-State: AOAM532O2+ncrodWVQdMkbUP+lM6ixcD6Q+u9RvudIa6N4N+vTE4B6Qy
        4a6H77IQ28uvlPmBvI+cEC5Ut4wFex6aMueC7v4=
X-Google-Smtp-Source: ABdhPJyuvG3hNkBUnQna2VhugIaKeJMfbZLaUQvizg38L8+2Q6uho9iMUu3bMsnvg1hnpXRcCwKOVYAbeBzyxwj62Pg=
X-Received: by 2002:a63:4b16:: with SMTP id y22mr19025245pga.203.1610827223249;
 Sat, 16 Jan 2021 12:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-15-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-15-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:00:06 +0200
Message-ID: <CAHp75VcfD0t74exJhXqRWnmzGJDsKf18jXBfgif1ieZGSP=Csw@mail.gmail.com>
Subject: Re: [PATCH v2 14/24] platform/x86: ideapad-laptop: check for Fn-lock
 support in HALS
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

On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Bit 9 in the return value of the HALS ACPI method is set if
> Fn-lock is supported. Change ideapad_check_features() to check it.

...

> +               if (!eval_hals(handle, &val))
> +                       if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
> +                               priv->features.fn_lock =3D true;

if (a) { if (b) { ... } } =3D=3D if (a && b) { ... }

--=20
With Best Regards,
Andy Shevchenko
