From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Fri, 3 Jul 2015 09:25:23 +0200
Message-ID: <20150703072523.GB1841@pali>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
 <20150626145621.GU2890@pali>
 <CAJ=jqub8adCQBWPsmg+Wov0G4WqZbhsjxttWq6CA8Uddqmj4Cw@mail.gmail.com>
 <20150629122953.GF16230@pali>
 <CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
 <20150630085814.GE27720@pali>
 <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
 <20150701114849.GE17577@pali>
 <CAJ=jquaDCaGv8PXuib7CFZAWUCTCZhkju0RZn-6v4MRCJhfgkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJ=jquaDCaGv8PXuib7CFZAWUCTCZhkju0RZn-6v4MRCJhfgkA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 02 July 2015 15:10:39 Alex Hung wrote:
> Thanks for the support.  I will create v3 based with LED triggers.
>=20
> Just for information.  ASUS's wording is as below:
>=20
> Fn+F2 can be used to turn on or off all radio capabilities in the
> device (as known as airplane mode switch).  I don't have any
> preferences on the name.  We may use the term airplane-mode do if
> asus-rbtn is not preferred.  Let me know if there are any suggestions=
=2E
>=20

This is OK, but I though that ACPI ATK4001 device is some
multifunctional device, which is doing more then LED control... (At
least I understand it from your comments). So in this case I would not
call driver led/radio related. Right?

>=20
> On Wed, Jul 1, 2015 at 7:48 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com=
> wrote:
> > On Wednesday 01 July 2015 00:09:41 Alex Hung wrote:
> >> ATK4001 is an independent ACPI device, and Method(HSWC) is its met=
hod
> >> to control LED (actually it has other functions but only LED is ne=
eded
> >> so far).
> >
> > If this driver is for supporting ACPI ATK4001 device (which has cou=
ple
> > of methods, not only LED) it is really good idea to name it asus-rb=
tn?
> >
> > Darren, you as maintainer of platform drivers, what do you think? I
> > believe in future this driver will be extended to support more func=
tions
> > and so name asus-rbtn will be confusing.
> >
> > --
> > Pali Roh=C3=A1r
> > pali.rohar@gmail.com
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
