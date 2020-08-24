From: "Mani, Rajmohan" <rajmohan.mani@intel.com>
Subject: RE: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager (IOM)
 driver
Date: Mon, 24 Aug 2020 22:19:27 +0000
Message-ID: <DM6PR11MB3963121C820F570F845BBAEEF6560@DM6PR11MB3963.namprd11.prod.outlook.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
 <20200822095631.GB2553024@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200822095631.GB2553024@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Prashant Malani <pmalani@chromium.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, "Joseph, Jithu" <jithu.joseph@intel.com>, =?iso-8859-2?Q?Bla=BE_Hrastnik?= <blaz@mxxn.io>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "bleung@chromium.org" <bleung@chrom>
List-Id: platform-driver-x86.vger.kernel.org

Hi Prashant,

Thanks for the quick review.

> Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager
> (IOM) driver
>=20
> Hi Rajmohan,
>=20
> On Fri, Aug 21, 2020 at 09:05:06PM -0700, Rajmohan Mani wrote:
> > Input Output Manager (IOM) is part of the Tiger Lake SoC that
> > configures the Type-C Sub System (TCSS). IOM is a micro controller
> > that handles Type-C topology, configuration and PM functions of
> > various Type-C devices connected on the platform.
> >
> > This driver helps read relevant information such as Type-C port status
> > (whether a device is connected to a Type-C port or not) and the
> > activity type on the Type-C ports (such as USB, Display Port,
> > Thunderbolt), for consumption by other drivers.
> >
> > Currently intel_iom_port_status() API is exported by this driver, that
> > has information about the Type-C port status and port activity type.
> >
> > Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
> > ---
>=20
> Perhaps include a version log of changes since v1?

Yes. It's there in the cover letter (patch v2 0/3).

> > diff --git a/drivers/platform/x86/intel_iom.c
> > b/drivers/platform/x86/intel_iom.c
> > new file mode 100644
> > index 000000000000..cda7716410c6
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_iom.c
> > +int intel_iom_port_status(u8 port, u32 *status) {
> > +	void __iomem *reg;
> > +
> > +	if (!iom || !iom->dev || !iom->regbar)
>=20
> Do we need to check for !iom->dev and !iom->regbar?

It's a good practice to have sanity checks on pointer members dereferenced.

So I can lose the check on iom->dev, but prefer to keep the check on regbar=
.
Let me know if you feel strongly about losing the check for regbar as well.

> Is there a valid situation
> where iom !=3D NULL but iom->dev and/or iom->regbar =3D=3D NULL?
> Sounds like it shouldn't, but I may be missing something.
>=20

I think I am being conservative here.

> > +		return -ENODEV;
> > +
> > +	if (!status || (port > IOM_MAX_PORTS - 1))
>=20
> I think parentheses around "port > IOM_MAX_PORT - 1" aren't required.

Ack

> > +		return -EINVAL;
> > +
> > +	reg =3D iom->regbar + IOM_PORT_STATUS_OFFSET + IOM_REG_LEN *
> port;
> > +
> > +	*status =3D ioread32(reg);
>=20
> Perhaps just inline reg within the parentheses?

Kept this way to increase readability. Let me know if you feel strongly tow=
ards
inline reg.

> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(intel_iom_port_status);
> > +
> > +static int intel_iom_probe(struct platform_device *pdev) {
> > +	void __iomem *addr;
> > +
> > +	/* only one IOM device is supported */
>=20
> Minor nit: s/only/Only

And then I may need to end the comment with a period.
Let me know if you feel strongly.

> > +	if (iom)
> > +		return -EBUSY;
> > +
> > +	iom =3D devm_kzalloc(&pdev->dev, sizeof(*iom), GFP_KERNEL);
> > +	if (!iom)
> > +		return -ENOMEM;
> > +
> > +	addr =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(addr))
> > +		return PTR_ERR(addr);
> > +
> > +	iom->regbar =3D addr;
> > +	iom->dev =3D &pdev->dev;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct acpi_device_id intel_iom_acpi_ids[] =3D {
> > +	{ "INTC1072" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, intel_iom_acpi_ids);
> > +
> > +static struct platform_driver intel_iom_driver =3D {
> > +	.probe =3D intel_iom_probe,
>=20
> nit: I generally see ".probe" listed below ".driver".

Ack

> > +	.driver =3D {
> > +		.name =3D "intel_iom",
> > +		.acpi_match_table =3D intel_iom_acpi_ids,
> > +	},
> > +};
> > +
> > +module_platform_driver_probe(intel_iom_driver, intel_iom_probe);
> > +
> > +MODULE_AUTHOR("Rajmohan Mani <rajmohan.mani@intel.com>");
> > +MODULE_DESCRIPTION("Intel IOM driver"); MODULE_LICENSE("GPL v2");
> > diff --git a/include/linux/platform_data/x86/intel_iom.h
> > b/include/linux/platform_data/x86/intel_iom.h
> > new file mode 100644
> > index 000000000000..e4c9a305e7a9
> > --- /dev/null
> > +++ b/include/linux/platform_data/x86/intel_iom.h
> > @@ -0,0 +1,49 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _PLATFORM_DATA_X86_INTEL_IOM_H_ #define
> > +_PLATFORM_DATA_X86_INTEL_IOM_H_
> > +
> > +
> > +#define IOM_MAX_PORTS					4
> > +/* Register length in bytes */
> > +#define IOM_REG_LEN					4
>=20
> Do these two #define's need to be in the header, instead of directly in
> intel_iom.c ?
>=20

Ack. These 2 can be moved to .c file.

> > +
> > +#ifdef CONFIG_ACPI
> > +
> > +int intel_iom_port_status(u8 port, u32 *status);
> > +
> > +#else
> > +
> > +int intel_iom_port_status(struct intel_iom *iom, u8 port, u32
> > +*status)
>=20
> Should the function signature be the same as the #ifdef case?
>=20

Thanks for catching this. I missed it.
