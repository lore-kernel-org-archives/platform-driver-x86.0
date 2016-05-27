From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Fri, 27 May 2016 11:51:43 -0700
Message-ID: <20160527185143.GB98596@f23x64.localdomain>
References: <1459544569-29865-1-git-send-email-list@eworm.de>
 <20160505234247.GG2113@f23x64.localdomain>
 <CA+A7VXVcq3JjJC54kXZkmvrLF1hktX_w+vXcU-vk5WA4nFeNLA@mail.gmail.com>
 <CAKErNvrs4300M+ap+O1R-44z_EE97O=hk74nOGT+MSsVmfL6Ew@mail.gmail.com>
 <CA+A7VXW8qCu-j4QGoDBZUym+sEsXgkzPTVTv7A4UoSDe+D1mig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40412 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752585AbcE0Svr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 May 2016 14:51:47 -0400
Content-Disposition: inline
In-Reply-To: <CA+A7VXW8qCu-j4QGoDBZUym+sEsXgkzPTVTv7A4UoSDe+D1mig@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>, Christian Hesse <list@eworm.de>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com

On Tue, May 24, 2016 at 04:32:48PM -0400, Jo=E3o Paulo Rechi Vita wrote=
:
> On 19 May 2016 at 05:17, Maxim Mikityanskiy <maxtram95@gmail.com> wro=
te:
> > 2016-05-16 19:04 GMT+03:00 Jo=E3o Paulo Rechi Vita <jprvita@gmail.c=
om>:
> >>
> >> Adding Maxim Mikityanskiy and Hans de Goede to CC.
> >>
> >> On 5 May 2016 at 19:42, Darren Hart <dvhart@infradead.org> wrote:
> >> > On Fri, Apr 01, 2016 at 11:02:49PM +0200, Christian Hesse wrote:
> >> >> From: Christian Hesse <mail@eworm.de>
> >> >>

=2E..

> It seems to me that at least we should have some quirks in place so
> this only gets executed on hardware where it will actually work, to
> avoid notifying userspace of touchpad events when there were actually
> none. Darren, what do you think is the best way to move forward here?
> If we can reach an agreement I can provide some patches for this.
>=20

Based on this discussion, I have dropped the patch from the 4.7 queue.

I do not have a good plan-of-attach, or preferred-approach to offer
unfortunately. You and Maxim have already started the additional inform=
ation
gathering process, which would be my only guidance at this point.

We need to characterize the hardware and the interfaces as exposed thro=
ugh ACPI.
Quirks would be OK if we can't just match on different HIDs (it appears=
 the same
HID is being used for radically different hardware unfortunately).

--=20
Darren Hart
Intel Open Source Technology Center
