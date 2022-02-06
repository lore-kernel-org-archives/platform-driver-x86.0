Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77D9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Feb 2022 19:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242298AbiBFTvb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Feb 2022 14:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233917AbiBFTva (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Feb 2022 14:51:30 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787A7C06173B
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Feb 2022 11:51:29 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id f17so8449328edd.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Feb 2022 11:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ecUVPN5qLgtiuSwjKIxac6K7uHFSb/ljAWHWGar+Saw=;
        b=fOIf/Ioy6NcSegdKA0RHIH37TtEIJm6RHNUzVEkTyqXJgZUTKSo3EL2LmKbT8L6KwW
         kB2MuAdXFPEZ08JzAJhGyLOGErO3+RDThD5AgPSq07JPpkTX2dwViPxQm67jdSHYtp/S
         isHCncyuGvvZ5pUH2gMgm+XcbK63NDj2IGwVY1AuzNKyUk/fA5xQ+IISHZ3Pr9PI8v4l
         /eFzlPlROhsMSVdKoRbQLz2pL9+Z/RbCp/5ngs32obxHmY/faPLdMnpd3TRfxcfxfdvq
         EI/fOWNXrpGA9zH9147bUxCDvGwroZxRc78s8NGBQluGOazpoPvifHPZg8a84x7h7yBv
         0hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ecUVPN5qLgtiuSwjKIxac6K7uHFSb/ljAWHWGar+Saw=;
        b=y4yI6CA0kYQNAoTPRMN+sBrQ6c5R+qc+R393nGBS9bFQBj0C0IqVIftXKrPyvF5v4x
         gVDx+wBfmYsn3ja4Nd0iQgmOoES21sxH8eBNhCmuWRqPp+Io4oLEOOMDCdnm5mEpOfdg
         qRjNjUd28gACJKzCu5mWU8E7dncg+eg+sYD3pBd1Oz8KM4/ptWyEuXHdZQuov4LoC7Vl
         QwO/t9tzu95/fDCYC/aCJsnC6Wu3q+ocajVXzVEcKQy0MXQsUpFt7DjDxiGhFOcPhaaJ
         833P+wcMSXslftqxUHn/8GrjsCI4yYYU30peI52ztxTrZ85rUsGXWbVeG/TvHTXWCw7b
         hY9g==
X-Gm-Message-State: AOAM532ORdP9OESA0q8YrqjgT3dnqxL9W7LRcd1V7IE48m+biGI0uYmy
        54oDex6jBdWAxw2U6BkNi39buepOUewFnVHWuNSbK9EI/5c=
X-Google-Smtp-Source: ABdhPJwC26cZeemtfxm8MVxs70E9OLO2tXOIWCONBdPv93JxF/riZRS9FZZyqamsGsrb2QZnLvATMpX8kdb3yKezhVs=
X-Received: by 2002:a05:6402:1705:: with SMTP id y5mr10365867edu.200.1644177087981;
 Sun, 06 Feb 2022 11:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20220205191356.225505-1-hdegoede@redhat.com> <20220205191356.225505-4-hdegoede@redhat.com>
 <CAHp75VcBNentfYMymyCnCav-NGK+DrDzTG3Mf973ERXpyvT2uQ@mail.gmail.com> <64953b75-3dfe-bc0a-6f3b-58b2329c5a1a@redhat.com>
In-Reply-To: <64953b75-3dfe-bc0a-6f3b-58b2329c5a1a@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 6 Feb 2022 21:50:52 +0200
Message-ID: <CAHp75VfZ1JEawAiaRv0ZfLrA_bg0=miW=wXJmZ2v30fFj6xKJg@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/x86: x86-android-tablets: Add lid-switch
 gpio-keys pdev to Asus ME176C + TF103C
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Feb 6, 2022 at 9:22 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 2/5/22 21:40, Andy Shevchenko wrote:
> > On Sat, Feb 5, 2022 at 9:14 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > USB ID change is not described here.
>
> There is no USB-ID change,

...

> Since adding lid_switch support involves adding a second pdev,
> the contents of the generic int3496_pdevs now gets duplicated into
> the new pdevs array which adds the lid gpio_keys pdev:

I see now.  Perhaps a comment about it in the commit message?

...

> >> +       /* .gpio gets filled in by asus_me176c_tf103c_init() */
> >
> > I'm wondering if we can switch gpio_keys*.c drivers to accept GPIO
> > descriptor directly.

> The current gpio_keys_platform_data struct which expects an
> old style gpio integer number is used in a ton of places:

Yes.

> So changing this is going to be a lot of work,

gpio_keys does already operate with descriptors inside. It would be
easy to add a new member and extend a check, but...

>  it certainly is
> out of scope for this patch-set.

...yes, it's not directly related to this series.

-- 
With Best Regards,
Andy Shevchenko
