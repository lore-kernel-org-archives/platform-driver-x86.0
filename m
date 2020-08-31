From: "Mani, Rajmohan" <rajmohan.mani@intel.com>
Subject: RE: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager (IOM)
 driver
Date: Mon, 31 Aug 2020 21:40:52 +0000
Message-ID: <DM6PR11MB396318BBCF00D2327711AC0AF6510@DM6PR11MB3963.namprd11.prod.outlook.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
 <20200828074359.GC942935@kroah.com>
 <20200828090832.GB174928@kuha.fi.intel.com>
 <DM6PR11MB3963228D43B50604AE4D0F3AF6520@DM6PR11MB3963.namprd11.prod.outlook.com>
 <20200829062719.GA80106@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200829062719.GA80106@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, "Joseph, Jithu" <jithu.joseph@intel.com>, =?iso-8859-2?Q?Bla=BE_Hrastnik?= <blaz@mxxn.io>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "pmalani@chromium.org" <pmalani@chromium.org>, "bleung@chromium.org" <bleung@chromiu>
List-Id: platform-driver-x86.vger.kernel.org

Hi Greg,

> Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager
> (IOM) driver
>=20
> On Fri, Aug 28, 2020 at 03:20:22PM +0000, Mani, Rajmohan wrote:
> > Hi Greg,
> >
> > > Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output
> > > Manager
> > > (IOM) driver
> > >
> > > Hi Greg,
> > >
> > > On Fri, Aug 28, 2020 at 09:43:59AM +0200, Greg Kroah-Hartman wrote:
> > > > I still find this crazy that a whole separate driver is created
> > > > just to read a single 32bit value.
> > > >
> > > > Why not put this logic in the driver that wants to read that value?
> > > > That would be much simpler, smaller, and more obvious.
> > >
> > > That would mean that we start maintaining something like DMI quirk
> > > table in those drivers. Unfortunately the IOM device is not available=
 on
> every platform.
> > > Also, even on platforms that do have it, there is no guarantee that
> > > the device is always going to be mapped to the same address.
> > >
> > > Nevertheless, I was originally hoping that we could hide the
> > > handling of IOM somehow in ACPI without the need for an actual
> > > device object, but it now turns out that the other features of the
> > > IOM chip have created interest. At least our i915 guys probable have
> > > some use for it (I don't know exactly what they are planning to use i=
t for).
> > >
> > > So the fact that we may later need the device for something else, on
> > > top of the clumsiness and most importantly risks involved with using
> > > ACPI to take care of extra tasks (ASL tends to have bugs - bugs that
> > > may never ever get fixed), I think the IOM device object, and the
> > > driver that binds to it, do have a valid reason for existing.
> > >
> >
> > Intel PMC USB mux device is part of the PCH, while IOM is part of the S=
oC.
>=20
> I have no idea what a "PCH" is, what "IOM" is, and how any of this relate=
s to a
> "SoC" :)
>=20

I was just meaning to say IOM (Intel Output Manager) is a separate device, =
that
is not part of PCH (Platform Controller Hub) like PMC (Power Management Con=
troller).

For the sake of completeness

PCH - Platform Controller Hub (usually that handles I/Os in Intel core plat=
forms)
IOM - Input Output Manager (IOM) is part of the Tiger Lake SoC that handles=
 Type-C
topology, configuration and PM functions of various Type-C devices connecte=
d
on the platform

> Don't impose arbritrary hardware "splits" to kernel code when the kernel =
has
> no such "partitioning" please.
>=20

Ack.

> > This was another reason we had to have a separate ACPI device.
>=20
> That sounds like a firmware issue you can solve in UEFI.
>=20

Ack

> I think this is the most TLA-laden email I have ever written, and I used =
to work
> at IBM :)

I thought it was only Intel where TLAs are abundantly used.

Thanks for the reviews and the direction on this topic.

>=20
> greg k-h
