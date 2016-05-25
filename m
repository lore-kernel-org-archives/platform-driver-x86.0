From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Wed, 25 May 2016 14:20:45 -0700
Message-ID: <20160525212045.GE109010@f23x64.localdomain>
References: <20160524195726.GM2735@f23x64.localdomain>
 <1464123188-9589-1-git-send-email-gabriele.mzt@gmail.com>
 <20160525202847.GC109010@f23x64.localdomain>
 <201605252236.55715@pali>
 <57b87380-6ea8-cdaf-b95c-4685fc2a85d1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51370 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110AbcEYVUr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 17:20:47 -0400
Content-Disposition: inline
In-Reply-To: <57b87380-6ea8-cdaf-b95c-4685fc2a85d1@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, arvidjaar@gmail.com, rjw@rjwysocki.net, Jared_Dominguez@dell.com, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-kernel@vger.kernel.org

On Wed, May 25, 2016 at 10:47:03PM +0200, Gabriele Mazzotta wrote:
> On 25/05/2016 22:36, Pali Roh=E1r wrote:
> > On Wednesday 25 May 2016 22:28:47 Darren Hart wrote:
> >> On Tue, May 24, 2016 at 10:53:08PM +0200, Gabriele Mazzotta wrote:
> >>> Some BIOSes unconditionally send an ACPI notification to RBTN whe=
n
> >>> the system is resuming from suspend. This makes dell-rbtn send an
> >>> input event to userspace as if a function key was pressed. Preven=
t
> >>> this by ignoring all the notifications received while the device
> >>> is suspended.
> >>>
> >>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> >>> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> >>
> >> Gabriele, please include all the maintainers on Cc (Pali was
> >> missing).
> >=20
> > Hehe, currently I started git send-email with my changes for v4 :D
> > So doing CTRL+C in terminal...
> >=20
> >> Pali, can I have your Reviewed-by?
> >=20
> > Yes as my patch differs only in two words (in comments) :-)
> >=20
> > Anyway, there is missing Andrei's tested-by (from v2 version).
>=20
> Sorry, I think this was not the first time I excluded Pali's address.=
=2E.
>=20
> Anyway, there's also Alex's tested-by from v2, which is basically
> the same as v4.
>=20
> > Maybe also this should go to stable tree?
> >=20
>=20

Added Pali, Stable, and Alex. Queued for 4.7, thanks.


--=20
Darren Hart
Intel Open Source Technology Center
