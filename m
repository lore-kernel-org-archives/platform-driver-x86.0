Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8389C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 15:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243338AbiFHPay (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 11:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245185AbiFHP2z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 11:28:55 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFFB16CF54
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 08:25:22 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3135519f95fso42676157b3.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZMHjMZAqNHwcCHR6ty8Zj0MTyDnd0jWkVUzq3Tzk6BU=;
        b=MOf2M0Hm8/0X3vv7YdjUts1WjmiHDWbGktnE69zn/gLrY5id1BLAqqzAibECscfv4H
         IR2IGt4qN4HS+Rmzqu/n0XGIywRv56JryFBYA0ibH49QF137ST5PTrQGuGDyk2OfGhS5
         bJP6PxVOj6q9fyS2Reu+iLgRJnrj38W5MberVp12Hmz5O2hxLANGSukfnr1VCQXZmdMz
         6Op7xkD9ShREuWA+KWQuUvt96r/oMyZAV7IeTPe4Bv31seKUf0ssVoj9ABqBRrblOklq
         4aQ6W0RSkF45SgNbtIcgIEbMHOBDZv7fSHdTXmZaTR3eA4dTNNchHK6v0INzE2fghOR6
         aXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZMHjMZAqNHwcCHR6ty8Zj0MTyDnd0jWkVUzq3Tzk6BU=;
        b=xqZmTrtCUVUZyN+DFY1E3AdYY6rCA6ErQmkee5+aFlRTAH3+xpTkcy5slby3S7s/MZ
         cBJfM/aDG43mDggQnHx4MgevtM5m/9gMts+K+aV4DGKGIxEMUPJodPWaYxmGfyDH0Gkx
         SnsnHdI0/KzwS7MruLYKyPI1uloF+cumGOaxhRTQNKDnBaj+GZIjp/U+pbmb/6TOEAw8
         7YEP2wP/0CQxvLXe6I3yBbded5eKBRwvPplrT3HmqW0MacnHBH1ghbLt8rbDh+12eBfb
         6YdxZEWPNUjdtG+XUdkEQyh1EMEBYzdW0+IKr01nrQv/fNPMMRGCJ0yTS5gyGPozdenF
         E4xA==
X-Gm-Message-State: AOAM531qtpenD9IXvC8KyLFAsSVmwAbMRghyY189PX+UD7Jkal1SAeRD
        AY36dSW/i6WJPT1ctgRQvGi6KGLVOe2HuZCHQ4TsUCQd
X-Google-Smtp-Source: ABdhPJyZr+Phb6h7s1csKfZ8IayuFy+CLbs853hoQDa1+3WBv6l8iRsGwVpj2Aakn3MW9MQ9veePTM7Z0lQY3nKjRZM=
X-Received: by 2002:a81:6385:0:b0:300:5631:686f with SMTP id
 x127-20020a816385000000b003005631686fmr38661733ywb.8.1654701921482; Wed, 08
 Jun 2022 08:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220607204313.5374-1-jorge.lopez2@hp.com> <CAHp75VeB4vg_rHw4S_xWiUn=yhT8DyTjKt1=jOM41ceQA1JzVw@mail.gmail.com>
 <CAHp75Vd7V6b7ujhfK0zQz=2Dmy2ff916uHH+KHeNwfu7Dcs=Jg@mail.gmail.com>
In-Reply-To: <CAHp75Vd7V6b7ujhfK0zQz=2Dmy2ff916uHH+KHeNwfu7Dcs=Jg@mail.gmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 8 Jun 2022 10:25:10 -0500
Message-ID: <CAOOmCE9q4yDhLcKpV3uePXunEfNb239WdT_WYU7KGYNHTUPrRQ@mail.gmail.com>
Subject: Re: [PATCH] Resolve WMI query failures on some devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks, I'll check it out.

On Wed, Jun 8, 2022 at 6:07 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jun 8, 2022 at 1:02 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jun 8, 2022 at 8:06 AM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
>
> ...
>
> > I am in general fine with the change, only a nit-pick below.
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> ...and do not forget to include maintainers and other parties who
> might be interested in this change. I can recommend to utilize my
> "smart" [1] script for that.
>
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh
>
> --
> With Best Regards,
> Andy Shevchenko
