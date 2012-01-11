From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH linux-3.1.y] ideapad: Check if acpi already handle
 backlight power to avoid a page fault
Date: Wed, 11 Jan 2012 09:05:32 -0800
Message-ID: <20120111170532.GA3222@kroah.com>
References: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com>
 <20120111004256.GS22184@burratino>
 <4F0D76D5.2080704@canonical.com>
 <20120111161110.GC25593@kroah.com>
 <20120111164028.GC1891@burratino>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53464 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757153Ab2AKRHP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jan 2012 12:07:15 -0500
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id A43B52062B
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2012 12:07:14 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120111164028.GC1891@burratino>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: Ike Panhc <ike.pan@canonical.com>, stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Artem X <artem.brz@gmail.com>, Rene Bolldorf <xsecute@googlemail.com>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentin.chary@gmail.com>

On Wed, Jan 11, 2012 at 10:40:28AM -0600, Jonathan Nieder wrote:
> Greg KH wrote:
> >> On 01/11/2012 08:42 AM, Jonathan Nieder wrote:
>=20
> >>> From: Ren=E9 Bollford <xsecute@googlemail.com>
> >>> Date: Sun, 23 Oct 2011 09:56:42 +0200
> >>>=20
> >>> commit d4afc7754a60b885b63ef23fd194984e2d53a4e6 upstream.
> >>>=20
> >>> This patch avoid a page fault in the ideapad-laptop extras when
> >>> turning the backlight power on or off.
> >>>=20
> >>> Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
> >>> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> >>> Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
> >>> Tested-by: Artem X <artem.brz@gmail.com>
> [...]
> > <formletter>
> >
> > This is not the correct way to submit patches for inclusion in the
> > stable kernel tree.  Please read Documentation/stable_kernel_rules.=
txt
> > for how to do this properly.
> >
> > </formletter>
>=20
> Well, what did I do wrong this time?
>=20
>  - The patch is obviously correct and tested.
>  - It is a two-liner, plus context.
>  - It fixes exactly one thing.
>  - The bug bothers people, and I gave links to reports.
>  - It is an oops (a null pointer dereference).
>  - No unrelated "trivial" fixes in there.
>  - Follows SubmittingPatches rules, as far as I know.
>  - Patch was produced by cherry-picking the commit named above from
>    Linus's tree.

Sorry, I missed the 3.1 in the subject line.  That's what I get for
processing email before my morning coffee...

This is all fine, I'll queue it up for the next release.

Oh wait, there isn't going to be another 3.1 kernel release, so this
might not have been needed.  I'll see if others really want another 3.1
release, and if so, I'll add this to it.

thanks,

greg k-h
