Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C4DC43334
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Jun 2022 15:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344039AbiFIPHj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Jun 2022 11:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343645AbiFIPHi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jun 2022 11:07:38 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B483162103
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 08:07:37 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o10so31585119edi.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2022 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+zru6k2VwShYcqMJQukKsdTXsmlnHP8/sozxc+dES0=;
        b=MoZO6IwoopSfvFQMdKHlq+zVx+Qf/7Xwk0WUQs8Dt5dDvYpPgrIbQoYmnKHrwEYlYI
         ROyLd7RUKQ2TtyJ6uqE2SuD1sWCj41yDAAmv0FtXGkZF3zRQuMZ8v5mcR8V8lvi7NzGU
         SWaD/yOwzMixms6103jiDnnn4CA4syzCs1yG6a/oA0uys7VP8nMi5/k17V2Ii1NDxFPU
         nZeWmyB0k37iyWfKpkULBsvfX6KHazC3DTdJCeaX3c3A0X7NNnapwIKkprN1Eb69Zal5
         ly5dQ8P45Pu0M6RghVvUVxqyKJn0EeOS9981uyftctSooXN/EqW7vG1OFbgBYEgGNPLV
         Ncmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+zru6k2VwShYcqMJQukKsdTXsmlnHP8/sozxc+dES0=;
        b=NyBp15kx+G8TO7zPVO3xTqlihLS3oKSRAn4ITS7BnmunFL6Zdk6JyB+VZ13Ta99uct
         a4X0upxZ1UnM8JVWJT6jgEbX1eXR/mHc/PR/wwJmQYvAqA5Ag2+J4zqHGkDR/vukukMr
         ZjaZ33zNyy8wbgiiMLs9g+7fli+GMb36UMfXg627fKrVlKGHaQ7ryqWgW5oaTdcVRZdT
         j+rBbK7gGrlYgIh+W8lDhEprblXDf1idaY0Rd2T14KqBTDuXFY51trqPDw3i/Ew/rRnf
         wQkymHcPNGmixWjPSdmtwRjOvze7d4P8TeaaXGohIaEVbN5t8iM2/cV/gR6+++2hNtrs
         OBUg==
X-Gm-Message-State: AOAM530WbVGumiPsm6QiCOQWQlFAClKfcRU+SAIaCSRwYazIyn4+90Lw
        VfnFrqibCIf5STzSA+p//mCDSXG/IBWld6vK0mkY6oVZCWGqHg==
X-Google-Smtp-Source: ABdhPJxHjoc7SzWQDS8ZgzhYeH49XQeJY2ixhdJSfIeDmLmjV01hpclpjm619jhflPOuwh7mm5vMzK9bti7wt3M3W4Y=
X-Received: by 2002:a05:6402:249e:b0:42d:bb88:865b with SMTP id
 q30-20020a056402249e00b0042dbb88865bmr36560752eda.141.1654787256161; Thu, 09
 Jun 2022 08:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com> <20220608170220.5751-2-jorge.lopez2@hp.com>
 <CAHp75VdPOSHyHiwFWYR6_BuoUXca9wvYFkgy7wXBW305FGHigA@mail.gmail.com>
 <CAOOmCE-NSei2+Y=NFjjF9jmY0L8HtOO4jHSnfm=kC7dTOZjwpg@mail.gmail.com>
 <CAHp75VeC89LEE0AnOfAKXXmrATOaNGu6RmXztaYGkXDbabokxw@mail.gmail.com> <CAOOmCE_sMSe3eGudUBagDztfBa6HYDKgg8KFcp9cHEpPL4N7jg@mail.gmail.com>
In-Reply-To: <CAOOmCE_sMSe3eGudUBagDztfBa6HYDKgg8KFcp9cHEpPL4N7jg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jun 2022 17:06:59 +0200
Message-ID: <CAHp75VcQAcBYRBTXontjn8dd27Bw=meM1fYxkJp4P+7H1_CV7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Resolve WMI query failures on some devices
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jun 9, 2022 at 3:45 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
> On Thu, Jun 9, 2022 at 5:50 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jun 8, 2022 at 11:04 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:

...

> > > Regarding the statement  ...
> > >
> > >       Please, be careful and read all comments you have been given and react
> > >       to them either by explaining why it's not worth to address or with an
> > >       addressed changes.
> > >
> > > All other comments have been addressed in the commit notes and via
> > > email.
> >
> > I have noticed that by reading the next patch. As I mentioned there,
> > it should be squashed to the first one, I never expected to see two
> > patches on this topic.
>
> This is my first year working with kernel upstream teams and reviewers
> hence I am a newcomer.  For this reason, I was being cautious and
> separated the changes instead of squashing them.  Please excuse my
> inexperience in the matter.

No problem, everything is good enough, just a couple of technical
improvements on the process. You are doing right in the general case
and it's rare, in contrast to awful github, that kernel maintainers
ask for a squash.

-- 
With Best Regards,
Andy Shevchenko
