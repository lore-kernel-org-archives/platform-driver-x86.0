Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3026BC6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Mar 2023 05:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCEFmf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Mar 2023 00:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjCEFmd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Mar 2023 00:42:33 -0500
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F011E11E95
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Mar 2023 21:42:32 -0800 (PST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-176261d7f45so7885271fac.11
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Mar 2023 21:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677994951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cm8KzTi7hub8BN4Re6VAb2LZVqNJoWBOtCkv4jGTxHg=;
        b=kJVT28vEATwCF/paEyWBU3Jz6Sy4nA77Gv9k5YWdsUErL1DKD90HL+UYoeL4UZhSBK
         CQuIZlYs55bUpLQ8DDkpZKdlaf0X+evTJKibX24stKqQI7hrHbOdzrpsAys59/wycacq
         wUz+9A9kCvTmCaQIUcHUFPL2LTmcICv9g1yMZBqpWql4Onojw7r/Q7MFz20X6iXanENA
         4qaKEeKG4oJry291qstHDigzloa2HxMTGtYBSULRJGHhGJalJS9KMCxuoqVif76NNGsK
         GgaMHpCZxculkijrey0Y5cP5Ffe0hP+7x7+EvOYkPAzf8Z9nP9BU+ZEMTv2ZQ2QyF2ie
         vKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677994951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cm8KzTi7hub8BN4Re6VAb2LZVqNJoWBOtCkv4jGTxHg=;
        b=AgYirKrMpa7VnuP+IdsGnde2+Wl+aeOPn99A4w2MhQ4q/MlyvbU949kIPS975XDoP2
         55wUspbDG4ROBX241Jr1ftBh0X/LN9Vf8hMaNZ5J+QTsSfMJ1BGH2mEf//AKOh0nDA8/
         rIxf9lokCexcFwdKKgSuRAb1w0/XOCe26Xlbflq2YxK3glUqKzU6w+JNDNQs9lLbYMVG
         66zsLqZJX9ZmvHO91KT7RmmJ4BVFQXfQ6macVtByg0g5mV/Zrt6aHvgFG1UQAFJpPJoM
         90flrHm7J0muFuLSHkmSGOYGV2kXsEKHOvLtFAgh7P+0oizymjg8b0xrMdCHZZzcAOP7
         tQnA==
X-Gm-Message-State: AO0yUKWsuuwuTOsU6wnFcX43LLDdS1aCjbIKb6tcl01AVRkDHcN/HQW5
        ONkYsoKy7JcFVmv1BJ7cE/FrHzBTqnPrw9UVXDPTHh6DtLU2Fw==
X-Google-Smtp-Source: AK7set8aDXk+uIdAjZeBjxYYpPp7+UjdMMNpBg3hzIWG0ZyTRatmJww9kDFmUZ4J072cVSHmbM4rfeCs75C3dKY8JuI=
X-Received: by 2002:a05:6870:98af:b0:176:2b10:5f9f with SMTP id
 eg47-20020a05687098af00b001762b105f9fmr2205874oab.7.1677994951374; Sat, 04
 Mar 2023 21:42:31 -0800 (PST)
MIME-Version: 1.0
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com> <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
In-Reply-To: <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Sat, 4 Mar 2023 21:42:20 -0800
Message-ID: <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com>
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 4, 2023 at 1:37=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Hi,
>
> it seems that the VPC0 ACPI device is handled by the already mentioned id=
eapad-laptop driver,
> you probably just have to add the necessary event codes to ideapad_keymap=
[].
>
> Armin Wolf
>

I read into the ideapad-laptop code some more and found that the
ideapad_acpi_notify function ends up being the exact same handler that
I am installing in my test module. I copied over the read_ec_data code
to read the same variable and found that the screen flip event I'm
looking at is the bit 5 case which simply calls
ideapad_sync_touchpad_state (which shows up on screen in my GNOME
install). It seems this is not quite the P80B =3D 0x44 variable because
the only bit 5 is set (possibly it's just the first 4?) but it looks
to be enough to detect the screen flip.

So it seems like I would want to add something to send the
SW_TABLET_MODE input event there in that bit 5 case. Presumably this
would be something like the tpacpi_input_send_tabletsw and
hotkey_tablet_mode_notify_change function calls that are done in the
thinkpad-acpi driver. Would that be a reasonable thing to add to the
ideapad driver? I'm not sure how we would know about compatibility
across the other ideapad laptops. It seems I could at least get this
all working with my own module for myself for now at least (maybe a
patch of the ideapad driver because reading that variable in my module
prevents the original driver from reading it).

I did also notice that bit 10 has a comment about a tablet mode
switching signal being unreliable but on my machine bit 10 was not set
for the tablet mode switch event when I checked with my test module.

Thanks,
Andrew Kallmeyer
