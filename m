From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: Heads up: dell-wmi bug
Date: Thu, 31 Dec 2015 13:21:58 -0800
Message-ID: <CALCETrUyzSvvw24RSqCdrjaUp+QtE=7EuQ=SL5HHy+tskp1_+Q@mail.gmail.com>
References: <CALCETrUh6VPfwdCHAZyqcou4VQN4_xZuZ+St=gjhCB1aqPvuag@mail.gmail.com>
 <201512311334.20816@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34501 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751808AbbLaVWS convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Dec 2015 16:22:18 -0500
Received: by mail-oi0-f54.google.com with SMTP id o124so220392369oia.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Dec 2015 13:22:18 -0800 (PST)
In-Reply-To: <201512311334.20816@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Dec 31, 2015 8:34 PM, "Pali Roh=C3=A1r" <pali.rohar@gmail.com> wrote=
:
>
> On Thursday 31 December 2015 13:31:03 Andy Lutomirski wrote:
> > Hi-
> >
> > I'm getting intermittent OOPSes when playing with dell-wmi.  I thin=
k
> > that find_hk_type function is buggy: it's saving a pointer to DMI
> > data, but you can't do that, because dmi_walk unmaps the data at th=
e
> > end.  It probably works reliably on current kernels due to luck
> > (either a memory layout such that the unmap has no effect or deferr=
ed
> > vmap zapping).
> >
> > If no one beats me to it, I'll fix this as part of the rebase work =
on
> > my big wmi series.
> >
> > --Andy
>
> Hi! If this is truth, then I think separate patch for fixing this
> problem should be created and backported also to stable kernels.
>
> In my opinion WMI rework patches should not change functionality, jus=
t
> API... Other function changes should be in separate commits.

Agreed.  I just meant that I'd do it at the same time, not that it
would be the same patch.

>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
