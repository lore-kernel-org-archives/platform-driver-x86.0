Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891AAC678D5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Mar 2023 05:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjCHFVQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 00:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjCHFVP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 00:21:15 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4319A0B27
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 21:21:14 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id t22so11341550oiw.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 21:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678252874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSuWfecD9guITn1JBFQMYsO5eL0+Z81ld9m2+9K38Y4=;
        b=AMQWPvPhjWRzvImCWbAskKxtIKm7VO3q5TkLV4G9woTAMh+qWJ/ME3Kxh59j9tJ2ja
         F9EZeeLDZNt9NB3sOBxm/UgpbDMNrT5YuopaP8dteITsiMF/PR3z1gye7kunvjg8Glq9
         JVJPMxT6qwrUvXlJGwEVNGx/aIh0OVP7unq7MLBWf0u9uL2rDSXd7NRx7tm0QlegWAsr
         hn6sY31inGvkMTxg27idtRlfvlbzR/wcOYGtQhKKx/H//wxTeq/QqeV8EtBCEbpbAzfJ
         5owJoxeYVBcAZ1RkTHpzF6S2zUdpxChZsEu6e/T8rdBqbTGazB+WFx1919EUaYK8GCbJ
         EjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678252874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSuWfecD9guITn1JBFQMYsO5eL0+Z81ld9m2+9K38Y4=;
        b=g37UUNBFmdjDPAX2oX9m5DvoXcrG4bpwnecRK+XPbcJ3Zxo5At17YYMjzIv7w0aLVu
         dH76CyMYTigTM5vBp+0bVbKjgRvhokRFeerKp0VlEJHRUkwUANFrTs710bwFndKCgyKZ
         uMaxnbTt4+Ayk/gC3DbhU7IOjxThQnzjwa/0fyDcN9eXbm2of8F0BGcbD/OqEwmowk/M
         wNPbKUZYDoA6dfJYXJtvyptqVCRzivfXRMqSnBLCDgmQ3G0aoTWQPCE7jIhUqroQ6mXy
         dpvkor67m/VmeB5s+Rk9EZJ5WL4EKkklIeK50sZzHei4OPVk/DUl+8ZbPujVWllectQc
         e6lg==
X-Gm-Message-State: AO0yUKUYzPphcZKgl4CLsNFecahQnozyAEGY/w9mnzuMO0jgZgamVKi6
        QApePRcPdAOvJpQc7xDLudpd0gtQDb/745S2UXg=
X-Google-Smtp-Source: AK7set+/NAOzDG165a+XZJ4CD3Opm/zrn/IFtq7zpKzl+8QwJiYIu0Au+ePjyI18TEGjZt5poyn416VqMHTM2NeOrHY=
X-Received: by 2002:a05:6808:99b:b0:384:9f5:ffcf with SMTP id
 a27-20020a056808099b00b0038409f5ffcfmr5019107oic.7.1678252873960; Tue, 07 Mar
 2023 21:21:13 -0800 (PST)
MIME-Version: 1.0
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com> <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
 <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com>
 <e95a38c0-15e0-92e2-97c0-4d09219158f5@gmx.de> <CAG4kvq9QzoXcwTxTFzoQeQDnMEHfWCG4JmLgQ-sMn_WjX-mVJw@mail.gmail.com>
 <2181c5de-44d6-aebd-52ba-63d9fabd620c@gmx.de> <e00df016-5ff1-3e5a-cffc-ab79672a2d7f@gmx.de>
 <24b85f3f-d973-09ef-218b-ad47d093f749@redhat.com> <CAG4kvq-8-J_0ugJe0ut2A2WB83Yeq-9KCCXQCM+MDn4C5CzgCg@mail.gmail.com>
In-Reply-To: <CAG4kvq-8-J_0ugJe0ut2A2WB83Yeq-9KCCXQCM+MDn4C5CzgCg@mail.gmail.com>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Tue, 7 Mar 2023 21:21:03 -0800
Message-ID: <CAG4kvq8fsCj6ZQHvMwMdK2XBw0OjVE9bPv9rybdGbHVrB-b5Ug@mail.gmail.com>
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Armin Wolf <W_Armin@gmx.de>, Gergo Koteles <soyer@irl.hu>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Mar 7, 2023 at 9:14=E2=80=AFPM Andrew Kallmeyer <kallmeyeras@gmail.=
com> wrote:
>
> I will follow the review comments on the patch, getting it integrated
> with the existing module etc.

I see now that I misunderstood and you were only suggesting sharing
the functions not integrating this into the existing module. I will do
it like you said, you even mentioned in the review that you prefer it
to be a separate module.

- Andrew
