From: "Mani, Rajmohan" <rajmohan.mani@intel.com>
Subject: RE: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager (IOM)
 driver
Date: Tue, 25 Aug 2020 01:03:25 +0000
Message-ID: <DM6PR11MB3963032D3549E865BE1F4CADF6570@DM6PR11MB3963.namprd11.prod.outlook.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
 <20200822095631.GB2553024@google.com>
 <DM6PR11MB3963121C820F570F845BBAEEF6560@DM6PR11MB3963.namprd11.prod.outlook.com>
 <20200824224726.GA48297@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200824224726.GA48297@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Prashant Malani <pmalani@chromium.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, "Joseph, Jithu" <jithu.joseph@intel.com>, =?iso-8859-2?Q?Bla=BE_Hrastnik?= <blaz@mxxn.io>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "bleung@chromium.org" <bleung@chrom>
List-Id: platform-driver-x86.vger.kernel.org

Hi Prashant,

...

> > > > +
> > > > +	reg =3D iom->regbar + IOM_PORT_STATUS_OFFSET + IOM_REG_LEN *
> > > port;
> > > > +
> > > > +	*status =3D ioread32(reg);
> > >
> > > Perhaps just inline reg within the parentheses?
> >
> > Kept this way to increase readability. Let me know if you feel
> > strongly towards inline reg.
>=20
> I'd rather this be inlined, you save a couple lines from the variable dec=
laration,
> and IMO we're not gaining much in terms of readability by declaring this
> separately.
>=20

Ack
(at least to me, it was more readable)

...

> >
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(intel_iom_port_status);
> > > > +
> > > > +static int intel_iom_probe(struct platform_device *pdev) {
> > > > +	void __iomem *addr;
> > > > +
> > > > +	/* only one IOM device is supported */
> > >
> > > Minor nit: s/only/Only
> >
> > And then I may need to end the comment with a period.
> > Let me know if you feel strongly.
> Yes, let's capitalize and add the period. Let's try to use the right punc=
tuation
> where possible.
>=20

Ack
Will take care of this as part of v3.
