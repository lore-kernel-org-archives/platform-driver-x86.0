From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 0/3] Dell Airplane Mode Switch driver
Date: Wed, 13 May 2015 13:48:41 +0200
Message-ID: <20150513114841.GF2920@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
 <201505031238.14772@pali>
 <CAJ=jquY=QG9j1ppYBbbp5WQTVHVfsUHr8NjX5fuH+4mMWeEkdQ@mail.gmail.com>
 <20150506113119.GH30910@pali>
 <20150506215744.GA22096@fury.dvhart.com>
 <CAJ=jquaA5iZmGTjTCNdaUjYkPpE_XgOHELghcjyHMLPcO+Wc0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:34646 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459AbbEMLso (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 May 2015 07:48:44 -0400
Content-Disposition: inline
In-Reply-To: <CAJ=jquaA5iZmGTjTCNdaUjYkPpE_XgOHELghcjyHMLPcO+Wc0w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

Darren, can you review/comment this v2 series? It is OK for 4.2 now?

On Thursday 07 May 2015 10:24:37 Alex Hung wrote:
> Darren,
>=20
> I guess you were looking at "Sheet1" that was comparison between
> dell-rbtn and dell-wireless quite a while ago. The updated results fo=
r
> dell-rbtn v2 are in the tab of "Dell-rbtnv2"
>=20
> On Thu, May 7, 2015 at 5:57 AM, Darren Hart <dvhart@infradead.org> wr=
ote:
> > On Wed, May 06, 2015 at 01:31:19PM +0200, Pali Roh=C3=A1r wrote:
> >> Looks like everything is OK. Test3 is expected to not work correct=
ly as
> >> driver is not loaded...
> >>
> >> On Wednesday 06 May 2015 17:11:08 Alex Hung wrote:
> >> > The test was updated @
> >> > https://docs.google.com/spreadsheets/d/1voffS6dNglwAExSGh3UmG__U=
AO2qfZ829CkJLPo06aI/edit?usp=3Dsharing.
> >> > Please check the tab "Dell-rbtnv2"
> >> >
> >> > Notes:
> >> > 1. The systems come and go and I can find some of original ones =
but I
> >> > tests some others
> >> > 2. Test 3 was done by Test 2 + "rmmod dell-laptop". All were run=
 with
> >> > all wireless devices are ON
> >> >
> >> > Summary:
> >> > From external behaves such as Desktop's viewpoint (Unity was use=
d and
> >> > hope that's not surprising), the wireless devices are ON/OFF
> >> > correctly. Other details are listed in the report.
> >
> > What am I to make of Sheet1:Row25 vs. Row27?
> > This appears to me that for the Inspiron 3542, Dell Wireless for 3.=
16 has a
> > functional soft block, while there is no change for Dell RBNT.
> >
> > Rows36 and 37... these are tellin gme that the ARBT method is broke=
n on this
> > machine?
> >
> >> --
> >> Pali Roh=C3=A1r
> >> pali.rohar@gmail.com
> >>
>=20
>=20
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
