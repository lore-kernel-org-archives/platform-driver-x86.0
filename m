From: "Mani, Rajmohan" <rajmohan.mani@intel.com>
Subject: RE: [PATCH 2/2] usb: typec: intel_pmc_mux: Check the port status
 before connect
Date: Fri, 17 Jul 2020 06:04:51 +0000
Message-ID: <DM6PR11MB39632A8236161E4A27FAB1BBF67C0@DM6PR11MB3963.namprd11.prod.outlook.com>
References: <20200716003310.26125-1-rajmohan.mani@intel.com>
 <20200716003310.26125-3-rajmohan.mani@intel.com>
 <20200716070508.GB962748@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200716070508.GB962748@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, "Joseph, Jithu" <jithu.joseph@intel.com>, =?iso-8859-2?Q?Bla=BE_Hrastnik?= <blaz@mxxn.io>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "pmalani@chromium.org" <pmalani@chromium.org>, "bleung@chromium.org" <bleung@chromiu>
List-Id: platform-driver-x86.vger.kernel.org

Hi Greg,

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, July 16, 2020 12:05 AM
> To: Mani, Rajmohan <rajmohan.mani@intel.com>
> Cc: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> <andy@infradead.org>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>; Lee Jones <lee.jones@linaro.org>; Ayman
> Bagabas <ayman.bagabas@gmail.com>; Masahiro Yamada
> <masahiroy@kernel.org>; Joseph, Jithu <jithu.joseph@intel.com>; Bla=BE
> Hrastnik <blaz@mxxn.io>; Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com>; linux-kernel@vger.kernel.org;
> platform-driver-x86@vger.kernel.org; Heikki Krogerus
> <heikki.krogerus@linux.intel.com>; linux-usb@vger.kernel.org;
> pmalani@chromium.org; bleung@chromium.org
> Subject: Re: [PATCH 2/2] usb: typec: intel_pmc_mux: Check the port status
> before connect
>=20
> On Wed, Jul 15, 2020 at 05:33:10PM -0700, Rajmohan Mani wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >
> > The PMC microcontroller that we use for configuration, does not supply
> > any status information back. For port status we need to talk to
> > another controller on the board called IOM (I/O manager).
> >
> > By checking the port status before configuring the muxes, we can make
> > sure that we do not reconfigure the port after bootup when the system
> > firmware (for example BIOS) has already configured it.
> >
> > Using the status information also to check if DisplayPort HPD is still
> > asserted when the cable plug is disconnected, and clearing it if it
> > is.
> >
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>=20
> You can't just forward on patches from others without also adding your
> signed-off-by to them, right?
>=20

Sorry I missed this.

> Please fix up this series and try again.
>=20

Ack. Will fix this with v2.

> thanks,
>=20
> greg k-h
