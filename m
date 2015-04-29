From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
Date: Wed, 29 Apr 2015 15:57:58 +0200
Message-ID: <2564950.goQdGu3mlb@xps13>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <37641224.OJKZVtGCPV@xps13> <20150429130840.GI24346@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:38495 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422990AbbD2N6C convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Apr 2015 09:58:02 -0400
In-Reply-To: <20150429130840.GI24346@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Hung <alex.hung@canonical.com>

On Wednesday 29 April 2015 15:08:40 Pali Roh=E1r wrote:
> On Wednesday 29 April 2015 12:30:32 Gabriele Mazzotta wrote:
> > On Wednesday 29 April 2015 11:51:04 Pali Roh=E1r wrote:
> > > This is an ACPI driver for Dell laptops which receive HW switch e=
vents.
> > > It exports rfkill device dell-rbtn which provide correct hard rfk=
ill state.
> > >=20
> > > Alex Hung added code for supporting Dell laptops which have toggl=
e button
> > > instead HW slider switch. On these laptops toggle button event is=
 reported
> > > by new input device (instead rfkill) as they do not have hw radio=
 switch.
> > >=20
> > > It looks like those are two different functions (rfkill, input de=
vice), but
> > > Dell BIOS exports them via same ACPI device and uses same ACPI fu=
nctions.
> > > So code is in one kernel driver.
> >=20
> > I made a patch some time ago that I've just adapted. It allows to
> > prefer RBTN_SLIDER over RBTN_TOGGLE. The main reason why I'd like t=
o
> > have the hardware switch is that the BIOS doesn't alter the soft st=
ate
> > of the devices. This comes in handy when the function key controls
> > multiple radio devices.
> >=20
>=20
> Now I'm thinking... is't this bug in wifi kernel driver (which export=
s
> phy rfkill)? Or problem somewhere else (userspace or kernel)?

What is the presumed bug you are referring to? The fact that the soft s=
tate
doesn't change?
