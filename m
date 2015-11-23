From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Mon, 23 Nov 2015 15:50:28 +0100
Message-ID: <20151123145026.GF24147@pali>
References: <5650BE8E.2080506@gmail.com>
 <201511212008.46761@pali>
 <5650D693.6050808@gmail.com>
 <56515F57.8060801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35486 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754014AbbKWOua (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 09:50:30 -0500
Received: by wmuu63 with SMTP id u63so57329320wmu.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2015 06:50:29 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <56515F57.8060801@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, dvhart@infradead.org, Andrei Borzenkov <arvidjaar@gmail.com>

On Sunday 22 November 2015 09:23:19 Andrei Borzenkov wrote:
> 21.11.2015 23:39, Andrei Borzenkov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >21.11.2015 22:08, Pali Roh=C3=A1r =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>On Saturday 21 November 2015 19:57:18 Andrei Borzenkov wrote:
> >>>After installing 4.2 on Dell Latitude E5450 I found that wireless =
was
> >>>disabled every second resume from suspend to RAM. Blacklisting
> >>>dell-rbtn "fixed" it.
> >>>
> >>>This is probably the same as discussed in this Arch forum and rela=
ted
> >>>bug report: https://bbs.archlinux.org/viewtopic.php?id=3D203404. I
> >>>myself hit it on Ubuntu.
> >>>
> >>>I am not familiar with other models, but E5450 does have DELLABCE =
and
> >>>so is using dell-rbtn driver.
> >>>
> >>>I am happy to test patches if need. Please let me know if formal b=
ug
> >>>report is required.
> >>>
> >>>-andrei
> >>
> >>Hi Andrei!
> >>
> >>About five hours ago Gabriele sent patch which fixing this problem =
to
> >>LKML. You can find it on: https://lkml.org/lkml/2015/11/21/57
> >>
> >>Can you test that patch and confirm it fix also for you?
> >>
> >
> >Yes, it does.
>=20
> Unfortunately it was too early. Today after resume I again got disabl=
e
> radio, and also several later attempts to suspend/resume. Then last t=
ime I
> suddenly got radio working again after resume.
>=20
> Patch looks racy; there is no guarantee we get notification before re=
setting
> in suspend flag.
>=20

Gabriele, any idea how to fix this?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
