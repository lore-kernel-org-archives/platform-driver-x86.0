From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform: hp_accel: add a i8042 filter to remove
 HPQ6000 data from kb bus stream
Date: Mon, 3 Nov 2014 21:54:19 -0800
Message-ID: <20141104055418.GA56751@vmdeb7>
References: <1414688267-29676-1-git-send-email-giedriuswork@gmail.com>
 <5456ADF2.8080400@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5456ADF2.8080400@tremplin-utc.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?=C9ric?= Piel <eric.piel@tremplin-utc.net>
Cc: Giedrius Statkevicius <giedriuswork@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Nov 02, 2014 at 11:19:30PM +0100, =C3=89ric Piel wrote:
> On 30-10-14 17:57, Giedrius Statkevicius wrote:
> >Add a i8042 filter to hp_accel to remove accelerometer's data with a=
cpi
> >id HPQ6000 from keyboard bus stream. The codes sent by accelerometer=
 are
> >e0 25, e0 26, e0 27 and e0 28. The relevant information is already
> >passed through /dev/freefall so no need to send these undocumented w=
eird
> >signals through the keyboard bus. Also, unclogs `dmesg` because atkb=
d
> >complained about weird scan codes, saves processing power and disk
> >space.
> >
> >Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
> >Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Hi,
> Looks fine with respect to the hp accel driver. If Dmitry thinks the
> behaviour is fine then I've got nothing more to say :-)
>=20
> Reviewed-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>
>=20
> Darren, could you pick up this patch in your tree?

Yes, applied. It will make my 3.18-3 series to Linus by the end of the =
week, I
want it to spend a few days in next first.

>=20
> Cheers,
> =C3=89ric
>=20
>=20
> >---
> >Changes in v2:
> >* Remove a unnecessary deletion of a blank line
> >* Move #includes of i8042.h and serio.h before the relative path
> >   includes.
> >
> >First of all, any Tested-Bys are very welcome by people who also hav=
e a
> >accelerometer with acpi id HPQ6000. If it happens with HPQ6007 too w=
e
> >can easily modify this to install the filter when HPQ6007 is detecte=
d.
> >For the time being the filter is only installed when HPQ6000 is
> >detected.
> >
> >Now moving to what was changed since the RFC. I reworked the filter
> >function to hopefully make it more clear what it is doing. Since the
> >codes sent by the accelerometer are extended then we need to filter =
all
> >of 0xe0's and then send one 0xe0 back when the actual key isn't in t=
he
> >range of 0x25-0x28. Also, I've removed the check for errors for
> >i8042_install_filter() because it's unnecessary to check if it faile=
d.
> >If multiple HPQ6000's are in the system then no issue occurs even if
> >multiple i8042_install_filter() are issued because this is handled b=
y
> >i8042 and it's smart enough not to install the same filter two or mo=
re
> >times.
> >
> >This fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D84941.
> :
>=20

--=20
Darren Hart
Intel Open Source Technology Center
