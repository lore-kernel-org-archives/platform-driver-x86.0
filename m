Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DF4C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 20:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1B70221ED
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 20:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbhAQU6K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 15:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729755AbhAQU6J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 15:58:09 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925D3C061573
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 12:57:29 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d4so7514269plh.5
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 12:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=siMbpuJzRkX8AWqvGkR1/86p+m3hxiDLqlryma5SrFk=;
        b=bGkhe4gy0PhoGCJpA8K7D/ZUTTtflkzLzpOT18bJWgwKi2VEhODYoaHaMOgaYVQrNK
         yQbWjWp+noUp6Vc8ygUMpVfTCqF+Re/7ZJiPdeFMP+hNVU4FyJHJEYkhHHgdeIJlwt5b
         9NEEDalmJMRlQYDovFxzTG8uzdzWns91GVfI8B2k09g0Ex5hszn1nEriiaBI3O7JO9X9
         kfHZ4hQ2oZKDvckG+yKG4r2jNcvVfvCZ0iHAB7G5g7Zpxfn0GCsQ6e6Vd5YhBaSTCqrY
         0gRRYPFU9Yn3EsIxmEIRq2VasJaTM+Zitm5nx0cUr9TD4O33B9l3fVu95bS6xzMUZsVg
         mCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=siMbpuJzRkX8AWqvGkR1/86p+m3hxiDLqlryma5SrFk=;
        b=URp0JS+Ufht0DOvE/EYHgnT6a62uaIPH2EB2MmQ7S9zR2EBZZVfU956OLioNDRQsMe
         S5OLZi7s1SZWMp4kxgZxUioEihknxt+gWO2qRLppCuNuNEGPLnjCyAl6R2jC6zgnXr2h
         7EMho6AOu164QdF48FAi+Gr8wcih96tYL3lf4HjkhHMmyUAZUUXGj640k3yt/pdXd2Bx
         i8IUFhZTI4b7LcK6dIUIe06joriypUzja/7WdRdLMDtfClY8HbeNigMgmkXIT8oU0i+j
         GsX6RwzVtKJ77yGdhxjdMXQV503UjDLn0zvzE8NYQnCAkpk/Q7Q/NR6mIZQhH9nO8hwd
         6YFw==
X-Gm-Message-State: AOAM532wcPxjN8rdWIhi/iG1udQE5x9xsJtpwCb7/roTc2LHZjldIu80
        NftS2MlIv/Abh+kKNfSbiqPorpTtBqSpps0SCq0=
X-Google-Smtp-Source: ABdhPJzzs/Fi5rpTxYagLwhnqa4cx/zVYQ5cZYuKPjoJAtvg7dJ0IkX9XdxZ/M0B3EoGDbkZVTEXHvm19iXH7t3aa7U=
X-Received: by 2002:a17:90a:6c90:: with SMTP id y16mr23130792pjj.129.1610917049063;
 Sun, 17 Jan 2021 12:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-24-pobrn@protonmail.com>
 <CAHp75Ve8DO+DufJ=ApDonLjqdrOaRa4L-Tpeg8YWGNKvCBY_Eg@mail.gmail.com> <uaRWzbXLCtfIvyAplzL4R6WPbWDp2vxeODkljsKlaRVLoduXUrRFlW6oFqbZltiZ6YJv6fm2goGUEpCJuglx8ytLGETou1ZPehILoepF2_I=@protonmail.com>
In-Reply-To: <uaRWzbXLCtfIvyAplzL4R6WPbWDp2vxeODkljsKlaRVLoduXUrRFlW6oFqbZltiZ6YJv6fm2goGUEpCJuglx8ytLGETou1ZPehILoepF2_I=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 17 Jan 2021 22:57:13 +0200
Message-ID: <CAHp75VfR4Y7TZzcOo13oFxavPxQUeV4kLDXYsnpY1wEDGz34=w@mail.gmail.com>
Subject: Re: [PATCH v2 23/24] Documentation/ABI: sysfs-platform-ideapad-laptop:
 update device attribute paths
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

On Sun, Jan 17, 2021 at 12:58 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
> 2021. janu=C3=A1r 16., szombat 21:10 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:
> > On Wed, Jan 13, 2021 at 8:25 PM Barnab=C3=A1s P=C5=91cze wrote:

> > > The documentation referred to non-existent device attributes under a =
non-existent
> > > platform device. Update it with the current location of the attribute=
s.
> >
> > Fixes tag, please?
> >
>
> I'm not sure which commit (if any) should be referenced. Do you think
> the patch that removed the platform device - hence making the documented =
paths
> incorrect - would be OK to reference here?

From your description it looks like the right one, the general rule is
to find a change after which this becomes broken / invalid.


--=20
With Best Regards,
Andy Shevchenko
