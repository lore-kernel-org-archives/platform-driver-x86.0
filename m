From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Wed, 21 Oct 2015 13:00:59 +0200
Message-ID: <20151021110059.GF15219@pali>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
 <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
 <20151021085724.GA87951@vmdeb7>
 <20151021091954.GD15219@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:37145 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301AbbJULBK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Oct 2015 07:01:10 -0400
Received: by wicfv8 with SMTP id fv8so69155613wic.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2015 04:01:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20151021091954.GD15219@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Wednesday 21 October 2015 11:19:54 Pali Roh=C3=A1r wrote:
> On Wednesday 21 October 2015 10:57:24 Darren Hart wrote:
> > On Sun, Oct 18, 2015 at 09:34:56AM +0000, bugzilla-daemon@bugzilla.=
kernel.org wrote:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> > >=20
> > > --- Comment #2 from Britt Yazel <bwyazel@gmail.com> ---
> > > Confirmed. Blacklisting the dell_rbtn module solves this issue
> >=20
> > Pali,
> >=20
> > Can you take a look at this bug report regarding a 4.2 regression f=
or rfkill
> > after the introduction of the dell-rbtn driver please.
> >=20
>=20
> Hi! This looks strange. Driver dell_rbnt is just receiver of BIOS/ACP=
I
> events. It receive hotkey or slide switch event and translate it into
> either linux input keypress or rfkill block event. But dell_rbnt driv=
er
> itself cannot set or change wireless rfkill or airplane mode.
>=20
> So my opinion is that BIOS/ACPI could send such event, dell_rbnt then
> propagate it into userspace and some application process it and do
> something...
>=20

CCing Gabriele, owner of XPS machine too. Have you seen similar problem=
s
with dell_rbtn as described in above bug report?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
