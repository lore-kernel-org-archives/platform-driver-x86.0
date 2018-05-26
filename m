From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v2 6/7] platform/mellanox: Introduce support for Mellanox
 register access driver
Date: Sat, 26 May 2018 11:15:35 +0000
Message-ID: <HE1PR0502MB37530FE2CB64E415507244B1A2680@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <1525675735-125547-1-git-send-email-vadimp@mellanox.com>
 <1525675735-125547-4-git-send-email-vadimp@mellanox.com>
 <20180525003112.GC10172@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525003112.GC10172@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>, "ivecera@redhat.com" <ivecera@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, May 25, 2018 3:31 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us;
> Michael Shych <michaelsh@mellanox.com>; ivecera@redhat.com
> Subject: Re: [PATCH v2 6/7] platform/mellanox: Introduce support for Mell=
anox
> register access driver
>=20
> On Mon, May 07, 2018 at 06:48:54AM +0000, Vadim Pasternak wrote:
> > Introduce new Mellanox platform driver to allow access to Mellanox
> > programmable device register space trough sysfs interface.
> > The driver purpose is to provide sysfs interface for user space for
> > the registers essential for system control and monitoring.
> > The sets of registers for sysfs access are supposed to be defined per
> > system type bases and include the registers related to system resets
> > operation, system reset causes monitoring and some kinds of mux selecti=
on.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
>=20
> One question on the attr init which I'm not familiar with... Andy, Greg -=
 can you
> offer your opinion below...
>=20
> > +static int mlxreg_io_attr_init(struct mlxreg_io_priv_data *priv) {
> > +	int i;
> > +
> > +	priv->group.attrs =3D devm_kzalloc(&priv->pdev->dev,
> > +					 priv->pdata->counter *
> > +					 sizeof(struct attribute *),
> > +					 GFP_KERNEL);
> > +	if (!priv->group.attrs)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < priv->pdata->counter; i++) {
> > +		priv->mlxreg_io_attr[i] =3D
> > +				&priv->mlxreg_io_dev_attr[i].dev_attr.attr;
> > +
> > +		/* Set attribute name as a label. */
> > +		priv->mlxreg_io_attr[i]->name =3D
> > +				devm_kasprintf(&priv->pdev->dev,
> GFP_KERNEL,
> > +					       priv->pdata->data[i].label);
> > +
> > +		if (!priv->mlxreg_io_attr[i]->name) {
> > +			dev_err(&priv->pdev->dev, "Memory allocation failed
> for sysfs attribute %d.\n",
> > +				i + 1);
> > +			return -ENOMEM;
> > +		}
> > +
> > +		priv->mlxreg_io_dev_attr[i].dev_attr.attr.mode =3D
> > +						priv->pdata->data[i].mode;
> > +		switch (priv->pdata->data[i].mode) {
>=20
> This seemed a bit odd to me. Do we need to do this conditional assignment
> within the kernel, or can these just be assigned, and the mode will guard=
 against
> the user being able to call store on a read only attr?
>=20
> > +		case 0200:
> > +			priv->mlxreg_io_dev_attr[i].dev_attr.store =3D
> > +							mlxreg_io_attr_store;
> > +			break;
> > +
> > +		case 0444:
> > +			priv->mlxreg_io_dev_attr[i].dev_attr.show =3D
> > +							mlxreg_io_attr_show;
> > +			break;
> > +
> > +		case 0644:
> > +			priv->mlxreg_io_dev_attr[i].dev_attr.show =3D
> > +							mlxreg_io_attr_show;
> > +			priv->mlxreg_io_dev_attr[i].dev_attr.store =3D
> > +							mlxreg_io_attr_store;
> > +			break;
>=20
> If this is necessary, we can simplify this by checking for the read mask =
and the
> write mask and setting each once - rather than duplicating this for r, w,=
 and rw.
> As it is a 0400 would not assign the show function, even though it is rea=
dable by
> somebody.

Maybe I really can add something like
static struct device_attribute mlxreg_io_devattr_rw =3D {
	.show	=3D mlxreg_io_attr_show,
	.store	=3D mlxreg_io_attr_store,
};

And replace this whole switch statement just with:
		memcpy(&priv->mlxreg_io_dev_attr[i].dev_attr,
		       &mlxreg_io_devattr_rw, sizeof(struct device_attribute));
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
