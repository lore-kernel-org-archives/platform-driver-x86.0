From: Darren Hart <dvhart@infradead.org>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Mon, 23 Nov 2015 11:29:43 -0800
Message-ID: <20151123192943.GY7413@malice.jf.intel.com>
References: <5650BE8E.2080506@gmail.com>
 <201511212008.46761@pali>
 <5650D693.6050808@gmail.com>
 <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali>
 <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37775 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753013AbbKWT3o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 14:29:44 -0500
Content-Disposition: inline
In-Reply-To: <56533D81.7070406@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrei Borzenkov <arvidjaar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

On Mon, Nov 23, 2015 at 07:23:29PM +0300, Andrei Borzenkov wrote:
> 23.11.2015 18:14, Gabriele Mazzotta =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >On 23/11/2015 15:50, Pali Roh=C3=A1r wrote:
> >>On Sunday 22 November 2015 09:23:19 Andrei Borzenkov wrote:
> >>>21.11.2015 23:39, Andrei Borzenkov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>21.11.2015 22:08, Pali Roh=C3=A1r =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>On Saturday 21 November 2015 19:57:18 Andrei Borzenkov wrote:
> >>>>>>After installing 4.2 on Dell Latitude E5450 I found that wirele=
ss was
> >>>>>>disabled every second resume from suspend to RAM. Blacklisting
> >>>>>>dell-rbtn "fixed" it.
> >>>>>>
> >>>>>>This is probably the same as discussed in this Arch forum and r=
elated
> >>>>>>bug report: https://bbs.archlinux.org/viewtopic.php?id=3D203404=
=2E I
> >>>>>>myself hit it on Ubuntu.
> >>>>>>
> >>>>>>I am not familiar with other models, but E5450 does have DELLAB=
CE and
> >>>>>>so is using dell-rbtn driver.
> >>>>>>
> >>>>>>I am happy to test patches if need. Please let me know if forma=
l bug
> >>>>>>report is required.
> >>>>>>
> >>>>>>-andrei
> >>>>>
> >>>>>Hi Andrei!
> >>>>>
> >>>>>About five hours ago Gabriele sent patch which fixing this probl=
em to
> >>>>>LKML. You can find it on: https://lkml.org/lkml/2015/11/21/57
> >>>>>
> >>>>>Can you test that patch and confirm it fix also for you?
> >>>>>
> >>>>
> >>>>Yes, it does.
> >>>
> >>>Unfortunately it was too early. Today after resume I again got dis=
able
> >>>radio, and also several later attempts to suspend/resume. Then las=
t
> >>>time I
> >>>suddenly got radio working again after resume.
> >>>
> >>>Patch looks racy; there is no guarantee we get notification before
> >>>resetting
> >>>in suspend flag.
> >>>
> >>
> >>Gabriele, any idea how to fix this?
> >>
> >
> >I can't think of anything other than ignoring notifications that arr=
ives
> >within X seconds after the execution of the resume callback.
> >Unfortunately, we have no idea on how to detect systems that misbeha=
ve
> >and creating a blacklist is not a feasible solution.
> >
> >Something such as the following should work, but maybe it's not a ni=
ce
> >solution.
> >
>=20
> I looked at what dell-rbtn does. My system (Latitude E5450) has RBTN =
of type
> TOGGLE. In this case both del-laptop hooks itself into i8042 and dell=
-rbtn
> delivers KEY_RFKILL event to input susbsystem. IOW dell-rbtn looks
> completely redundant in this configuration.
>=20
> Can we detect that rfkill toggle is already avaiable via normal keybo=
ard and
> not activate dell-rbtn in this case?

Also dropping this one until we can arrive at a complete solution.

Pali, Gabriele, this one is in your hands. I will review and provide fe=
edback
where I can - I confess I'm finding it difficult to keep all the pieces=
 straight
in my head, and without any hardware, I have to rely entirely on what I=
 can
piece together (a situation we are all in as this differs across many s=
ystems,
nobody has all the necessary bits).

It may be helpful for someone to put together a current status, known i=
ssues,
plan of attack to get this moving forward again.

--=20
Darren Hart
Intel Open Source Technology Center
