Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8C2C43334
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Jun 2022 13:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244446AbiFINpw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245180AbiFINpu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jun 2022 09:45:50 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2C14C7B9
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 06:45:48 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id g201so14008248ybf.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2022 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0T0kTj8KZB4xbTP8j0InTPzQ4RRmlWgtBmSZ4oNTz0=;
        b=E0wb9dY/Ac7haAzgIoQ3ZTkMus6YNBOK7DGQyT2MSbfNWNOhuyHfEiiLE678FCKoYh
         CPsnEZHQSc4DnqhpjWgwG2WMVgr4h4HGnlZqu7AbEy+AgxwNa+dmZH2mjwz22ReKp+H9
         09BTsr1tbVGtwZSrLlcFX2ZVH1QnG5jWuMv6rxHp1SNhvsGlFXMvcw4plnyj8Vmolue9
         vKUI1FjvsQo4OEHuse8CHTacCBa+f9dFnuAvwnjZzTAedG/b4MhfPsXBzTLmKiGbQvng
         0ORzAfpBgd7wqJsKcCAIiXKsYg1p3I1ucZf6fIS66Bdaf+z72YPFbnaQObUl8W4oZOey
         BZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0T0kTj8KZB4xbTP8j0InTPzQ4RRmlWgtBmSZ4oNTz0=;
        b=eFihZlFQMkENTHxIMqexLs1q0+EHP1IiT1eoyIybsa2pV+8FEkrA6I/4ICP2tOUATr
         JrJYD4cMiSSPO6GRIHiahw8DYE8aQ3vdXEvVBbj2uC32FytFnuwWdmwrSabH9P9jUDqI
         4XsNI6BKZSBsCujoIHxeLqNoGJeqDNEefdcLZ6JczLwZRkp59jFd/P1Frh9dm5sDs0Zd
         kYC8sgn4UppX5GaXIqAgvMkq/7hYTN/FhO5toWCziVc5psi+Z2OGTEFf/YsUo7iCU10Y
         Q1lpzerENkCTZBpY9uai/pu6gdD/i3PwgIwVAq8PWYJ/puKeOjRqYhdP7Hlsw46L8FyC
         2iFg==
X-Gm-Message-State: AOAM532gvU9G08jC3Mq1k8L686BlJBeT+F94Gxq9aTQpa5PgdlDTRv9R
        AnJW76mRMJm9oWCgdciGEBKjLsdCSNTCxAh5r3k=
X-Google-Smtp-Source: ABdhPJy10Bz282b3aqonxHIxVRtdOLqB/Z7YXtSepnm2oLYE6TnDx2OupH2QF3/33d/fbnEbbq4/lHtt6h4YgjCl9TM=
X-Received: by 2002:a5b:30d:0:b0:64b:4193:7911 with SMTP id
 j13-20020a5b030d000000b0064b41937911mr38713919ybp.509.1654782348119; Thu, 09
 Jun 2022 06:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com> <20220608170220.5751-2-jorge.lopez2@hp.com>
 <CAHp75VdPOSHyHiwFWYR6_BuoUXca9wvYFkgy7wXBW305FGHigA@mail.gmail.com>
 <CAOOmCE-NSei2+Y=NFjjF9jmY0L8HtOO4jHSnfm=kC7dTOZjwpg@mail.gmail.com> <CAHp75VeC89LEE0AnOfAKXXmrATOaNGu6RmXztaYGkXDbabokxw@mail.gmail.com>
In-Reply-To: <CAHp75VeC89LEE0AnOfAKXXmrATOaNGu6RmXztaYGkXDbabokxw@mail.gmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Thu, 9 Jun 2022 08:45:37 -0500
Message-ID: <CAOOmCE_sMSe3eGudUBagDztfBa6HYDKgg8KFcp9cHEpPL4N7jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Resolve WMI query failures on some devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,


On Thu, Jun 9, 2022 at 5:50 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jun 8, 2022 at 11:04 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
> >
> > Hi Andy,
> >
> > Failure to run your tool and include all the appropriate parties in
> > the review was an oversight on my part.  I will make sure it is done
> > in the following patches.
>
> Hmm... It uses get_maintainer.pl which I believe uses the MAINTAINERS
> database more or less correctly. I use the script on a daily basis.
>
> > Regarding the statement  ...
> >
> >       Please, be careful and read all comments you have been given and react
> >       to them either by explaining why it's not worth to address or with an
> >       addressed changes.
> >
> > All other comments have been addressed in the commit notes and via
> > email.
>
> I have noticed that by reading the next patch. As I mentioned there,
> it should be squashed to the first one, I never expected to see two
> patches on this topic.

This is my first year working with kernel upstream teams and reviewers
hence I am a newcomer.  For this reason, I was being cautious and
separated the changes instead of squashing them.  Please excuse my
inexperience in the matter.

>
> >   The comments addressed were
> >
> > - As a quick fix it's good, but have you had a chance to understand why
> > this failure happened in the first place?
> >
> > - Can you check my theory that is expressed in the code below?
> > - Leverage ge2maintainer tool to include all appropriate parties.
> > (See earlier comment)
> >
> > Did I address all the comments?  If not, please accept my apologies
> > and kindly point to the question(s) I need to address.
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
