From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/3] platform: x86: dell-rbtn: Export notifier for other
 kernel modules
Date: Wed, 29 Apr 2015 11:55:36 +0200
Message-ID: <20150429095536.GE24346@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1416755361-17357-3-git-send-email-pali.rohar@gmail.com>
 <20141125223936.GD116670@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:36158 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031647AbbD2Jzj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Apr 2015 05:55:39 -0400
Content-Disposition: inline
In-Reply-To: <20141125223936.GD116670@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>

On Tuesday 25 November 2014 14:39:37 Darren Hart wrote:
> On Sun, Nov 23, 2014 at 04:09:20PM +0100, Pali Roh=C3=A1r wrote:
> > This patch exports notifier functions so other modules can receive =
HW switch
> > events. By default when some module register notifier, dell-rbtn dr=
iver
>=20
> The commit message needs to describe the problem being addressed as w=
ell. Why is
> this necessary?
>=20

Needed for next patch (3/3). All 3 patches are one series, so I do no
think that everything is needed to describe...

> > automatically remove rfkill interfaces from system (it is expected =
that other
> > module will use events for other rfkill interface). This behaviour =
can be
> > changed with new module parameter "auto_remove_rfkill".
>=20
> We try to avoid using such parameters to define behavior when possibl=
e.
>=20
> Why is it justified to use auto_remove_rfkill here? When is it needed=
? As
> opposed to doing something that works based on the detected hardware?=
 (It could
> be this is the right thing, but we have to justify it).
>=20

Just for future if something goes wrong and new Dell BIOS stopped
working. So users would be able to "hotfix" unexpected problems.

As Alex wrote, some machine has already BIOS bug...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
