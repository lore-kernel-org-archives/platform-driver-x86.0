Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50FDC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 10:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 688DA22B37
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 10:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbhAYK6C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 05:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbhAYK5S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 05:57:18 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BD5C061794
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 02:56:31 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d4so7371844plh.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 02:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UddjRYt+dLHrrZWal/qBf118L0gtN9jxr8foXEruMuk=;
        b=WSdpYBtWWK8PIFRMd3ehW3JmodG2xhDEIYfQyUvoM3UvtOX0MBoZVdPPnzTMCwxtQk
         QeWrzJhMP+tJKxXursUoXCxe3aoqmyIc66SUpBbIrfgGW3XbJXqV0ePORSlnqD0aj4u7
         USDRGM4j1sDQFJcsyz1W845bA8lxiOlMxi5B7GhZMyIg8rHLPasIaINCwhnk7LobfPLx
         VUlPcwR2trZXtyPJuAaR3GcIe/Iib3MMrsVXNbSfCziGpsHtG/STtWK3lH7vcli8B9bJ
         9ciHv90Qmj4y6WeRmQ+h43DwqzsJi99syf2BkSGYZvrPgORXb+khkcdv3adwdZKiNMmJ
         cFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UddjRYt+dLHrrZWal/qBf118L0gtN9jxr8foXEruMuk=;
        b=gFER9YLPupm1k2QIhYed81oiFqCdAHG3ASkANql6KM7KOn3QAEShBXtkFO0jtjpJqv
         HqwcoeXgs//07ykXcAWenHsR0nSjO79Qw/1viBu9eMY9TXTWtoOyetbX2MaYWm40RFtl
         vajt/iZ2oPy7LHFz7pif1CSntyNZQid9pSA9I+N0IOccmOMWY2jf2uC7mwysEn4IeJQP
         DVc+7bORLR7n/4L/CsMRza35gGrsMrWBBSE4AKI5zslQ5T88JKLDiNGjnxUvtwoyLakG
         N/LNGg4IUUH15FZ3zDVsCG0GgTEpxlZCG7RD09l3XXaCMNbTd5Qwd9cBOrn8ivzHzLr6
         zKEg==
X-Gm-Message-State: AOAM533vZ17ySDGB3hUu0ZPVrRb8Gyz/jKMsG7s0NBEI6HFWR3pwwstt
        OaANSgA7zjVKLNCQOdAZlfmt5/xkH741edaCV34=
X-Google-Smtp-Source: ABdhPJyCyOZdzN+FId0lOz1H0eXlzDxBSOIho1AO+8Z1cWN2mHJMh9BAvGkfMwj0G3ppOBMKz5NHISuHRqFSAtBSyXE=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr762476pja.228.1611572190680;
 Mon, 25 Jan 2021 02:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-10-pobrn@protonmail.com>
 <CAHp75VfJBvG6ma0UxOjb4Wudeqpf9qrE3AtQ+nwwtsGhZ6fRpQ@mail.gmail.com> <b99c4482-faea-ff72-4367-8aeca7250040@canonical.com>
In-Reply-To: <b99c4482-faea-ff72-4367-8aeca7250040@canonical.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jan 2021 12:57:20 +0200
Message-ID: <CAHp75Ve0hpfX6GPEH+ehCb-FsKomMwKRzkkD7Oup4utXSAidAA@mail.gmail.com>
Subject: Re: [PATCH v2 09/24] platform/x86: ideapad-laptop: always propagate
 error codes from device attributes' show() callback
To:     Ike Panhc <ike.pan@canonical.com>
Cc:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jan 25, 2021 at 9:37 AM Ike Panhc <ike.pan@canonical.com> wrote:
>
> On 1/17/21 3:49 AM, Andy Shevchenko wrote:
> > On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonm=
ail.com> wrote:
> >>
> >> Consumers can differentiate an error from a successful read much more
> >> easily if the read() call fails with the appropriate errno instead of
> >> returning a magic string like "-1".
> >
> > Is user space ready for this (for the record, it seems an ABI breakage)=
?
> >
>
> read() and getting errno looks sysfs/driver broken to me. I think
> if button/method is not available, it's better to be something like
> sysfs_emit(buf, "%d\n", -ENODEV)

Either way it will be an ABI breakage.


--=20
With Best Regards,
Andy Shevchenko
