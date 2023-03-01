Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3E2C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjCAKqW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjCAKqU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:46:20 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2143302B7
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:46:19 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id c18so13663857qte.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mOzezMX+nuqaVXt9vkXI+R+AAWumUACh54Op0tOcFY=;
        b=J7ARFMOaAMCJ+ieXA3Kbcc5egRxE8cgf6ZqqbM4f4g5ZX6zOVKz7oubidCesr3YbIz
         2lW573KEQBIO7+qLY3ECnq5lxP3C8IUzP4orSMJ4l/09Kn2OtoikavVD9bXWhgq6/8sf
         zuy3hnIHJYn2ancc+DpF5U9i/LYY1G2TKhEn3BpP9M8knb5gTLeH3RA5cO3VwMf657YM
         15wSiscExyQesF4JNguBUBngvAVI14BAf259J9Oq3CLmQLqXUJJz+ikxNHOh/Ke8WzYA
         VS4pakpyMtf2CHon1/1zC7FJJvEeEojnDIifRfOen9fdvqMbnaE7r8Wo2/IS9wEN0BVb
         3CUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mOzezMX+nuqaVXt9vkXI+R+AAWumUACh54Op0tOcFY=;
        b=haXOOBi3gvZO2Nq2128q5S56K2elBOhkQxXsMsv4WuBJQq/CXlU8PnqZeTFI73XcCb
         NIfJ5EmAwdOGD779nIvaDMqBME3j2IBrhSUM+AOJrgR6TzJtWzhGK8qwHbw+mYY9A2Xr
         cYNai+7W1P2WrMKGrGXzKp5aQNPKMTSzC/0PJENE1b5DCkR2/WOOMaV/1y2w7WMyKmnD
         8U9GJ0oiTLL4i8/ggmLe7rdPNCtI+grUgDcC21jEKFmdqHtVv3bQU9nCfSaN4T385N83
         Tg0F7GXvgrrBQM2CBuHxNxLMqEOfWbFgJMkMUsnTS26vjeWsbOQJQMXHzZQ5DHroWnp2
         Rqhw==
X-Gm-Message-State: AO0yUKWwtixO1YH8//A/vm7VRayXzSuboDHGAL8ozOUI8GPzLcv48hH4
        OfNbSOq9FOXzETxqU2niVBJP2u+ISLM07VAMzrKTMlocgXFsOg==
X-Google-Smtp-Source: AK7set/fuSjs01MsACzf6T4YpHwcOF3+SVWaA4JzKn+ZrMr5xtOSiSIOtmFSu8FvJsBxb1vHawd1z/KCvR0VH5oG/wQ=
X-Received: by 2002:aed:2791:0:b0:3bd:1a0b:8ac4 with SMTP id
 a17-20020aed2791000000b003bd1a0b8ac4mr1619672qtd.1.1677667578930; Wed, 01 Mar
 2023 02:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20230301092331.7038-1-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Mar 2023 12:45:42 +0200
Message-ID: <CAHp75VfRs=ybLpm7TWwamHV0U=W93ev4=-MTOLWCrcjYcH+2Uw@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] platform/x86: x86-android-tablets: Split in
 multiple files + misc additions
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 1, 2023 at 11:23=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Here is version 2 of my series to move the x86-android-tablets
> driver into its own subdir and to split it into multiple-files.

There are a few remarks, but overall it's in a good shape, so
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for the next version of the series where I believe you will make a few
amendments.

> Changes in v2:
> -Gather all outstanding x86-android-tablets changes in 1 series.
> -Address all Andy's review remarks, see individual commit messages
>  for details. Thank you for all the reviews Andy!
> -New patches:
>  -Add LID switch support to Yoga Tablet 2 1050/830 series
>  -Lenovo Yoga Book match is for YB1-X91 models only

--=20
With Best Regards,
Andy Shevchenko
