From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Mon, 23 Nov 2015 11:24:43 -0800
Message-ID: <20151123192443.GX7413@malice.jf.intel.com>
References: <1448115375-7315-1-git-send-email-gabriele.mzt@gmail.com>
 <20151123144858.GE24147@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37662 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065AbbKWTYo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 14:24:44 -0500
Content-Disposition: inline
In-Reply-To: <20151123144858.GE24147@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Rafael Wysocki <rjw@rjwysocki.net>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Borzenkov <arvidjaar@gmail.com>

On Mon, Nov 23, 2015 at 03:48:58PM +0100, Pali Roh=E1r wrote:
> On Saturday 21 November 2015 15:16:15 Gabriele Mazzotta wrote:
> > Some BIOSes unconditionally send an ACPI notification to RBTN when =
the
> > system is resuming from suspend. This makes dell-rbtn send an input
> > event to userspace as if a function key was pressed. Prevent this b=
y
> > ignoring all the notifications received while the device is suspend=
ed.
> >=20
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> > Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
>=20
> Andrei Borzenkov (CCed) tested this patch and patch does not fix bug.
> Probably there is race condition and ACPI event is sent *after* funct=
ion
> rbtn_resume is called.

I'm dropping this one until we can sort out a proper fix.

Is direction still needed from the ACPI side?
+Rafael
--=20
Darren Hart
Intel Open Source Technology Center
