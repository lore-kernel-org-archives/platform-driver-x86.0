From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] asus-laptop: Add key found on Asus F3M
Date: Mon, 17 Aug 2015 22:48:10 -0700
Message-ID: <20150818054810.GA4060@vmdeb7>
References: <20150729044329.GA80946@vmdeb7>
 <1438198283-2180-1-git-send-email-stlman@poczta.fm>
 <20150805202907.GD12131@vmdeb7>
 <CAHR064g5YRt-ru=3wTzkrPFgNUPABmCuf9Lv086Pu=j7pfR7uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43695 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089AbbHRFsU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 Aug 2015 01:48:20 -0400
Content-Disposition: inline
In-Reply-To: <CAHR064g5YRt-ru=3wTzkrPFgNUPABmCuf9Lv086Pu=j7pfR7uQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: =?utf-8?Q?=C5=81ukasz?= Stelmach <stlman@poczta.fm>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Aug 12, 2015 at 09:06:08AM +0200, Corentin Chary wrote:
> On Wed, Aug 5, 2015 at 10:29 PM, Darren Hart <dvhart@infradead.org> w=
rote:
> > On Wed, Jul 29, 2015 at 09:31:23PM +0200, =C5=81ukasz Stelmach wrot=
e:
> >> Asus F3M has two keys labeled with an icon of a touchpad. The firs=
t,
> >> reported as 0x6B is next to the power key and the second, reported=
 as
> >> 0x6A, is F9 combined with Fn button. When I was pressing the latte=
r, I was
> >> getting "Unknown key 6a pressed" message before applying this patc=
h.
> >>
> >> Asus F3M does not support WMI so the commit does not update key ma=
ppings
> >> in the asus-nb-wmi.c file.
> >>
> >> I have not tested this mapping on any other Asus laptop.
> >>
> >> Signed-off-by: =C5=81ukasz Stelmach <stlman@poczta.fm>
> >
> > Thanks =C5=81ukasz.
> >
> > Corentin, any concerns?
>=20
> Acked-by: Corentin Chary <corentin.chary@gmail.com>
>=20
> Sorry for the delay, I won't really have a stable internet connection
> until October.


It's already in next, but thank you for following up.

--=20
Darren Hart
Intel Open Source Technology Center
