From: "Mani, Rajmohan" <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager (IOM)
 driver
Date: Fri, 28 Aug 2020 15:20:22 +0000
Message-ID: <DM6PR11MB3963228D43B50604AE4D0F3AF6520@DM6PR11MB3963.namprd11.prod.outlook.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
 <20200828074359.GC942935@kroah.com>
 <20200828090832.GB174928@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200828090832.GB174928-FZxXFokcWpatqXYlAKuG4QC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ayman Bagabas <ayman.bagabas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Joseph, Jithu" <jithu.joseph-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?iso-8859-2?Q?Bla=BE_Hrastnik?= <blaz-piQ53kQ5nys@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pmalani-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <pmalani-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Greg,

> Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager
> (IOM) driver
>=20
> Hi Greg,
>=20
> On Fri, Aug 28, 2020 at 09:43:59AM +0200, Greg Kroah-Hartman wrote:
> > I still find this crazy that a whole separate driver is created just
> > to read a single 32bit value.
> >
> > Why not put this logic in the driver that wants to read that value?
> > That would be much simpler, smaller, and more obvious.
>=20
> That would mean that we start maintaining something like DMI quirk table =
in
> those drivers. Unfortunately the IOM device is not available on every pla=
tform.
> Also, even on platforms that do have it, there is no guarantee that the d=
evice is
> always going to be mapped to the same address.
>=20
> Nevertheless, I was originally hoping that we could hide the handling of =
IOM
> somehow in ACPI without the need for an actual device object, but it now
> turns out that the other features of the IOM chip have created interest. =
At
> least our i915 guys probable have some use for it (I don't know exactly w=
hat
> they are planning to use it for).
>=20
> So the fact that we may later need the device for something else, on top =
of the
> clumsiness and most importantly risks involved with using ACPI to take ca=
re of
> extra tasks (ASL tends to have bugs - bugs that may never ever get fixed)=
, I
> think the IOM device object, and the driver that binds to it, do have a v=
alid
> reason for existing.
>=20

Intel PMC USB mux device is part of the PCH, while IOM is part of the SoC.
This was another reason we had to have a separate ACPI device.

>=20
> thanks,
>=20
> --
> heikki
