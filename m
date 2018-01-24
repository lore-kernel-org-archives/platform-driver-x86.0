From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v10 4/6] platform/mellanox: mlxreg-hotplug: Modify to use
 a regmap interface
Date: Wed, 24 Jan 2018 17:05:00 +0000
Message-ID: <VI1PR05MB334161B901EC22F7B26F3A36A2E20@VI1PR05MB3341.eurprd05.prod.outlook.com>
References: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
 <1516739665-132304-4-git-send-email-vadimp@mellanox.com>
 <20180123225817.GB16464@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123225817.GB16464@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, January 24, 2018 12:58 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [patch v10 4/6] platform/mellanox: mlxreg-hotplug: Modify to=
 use a
> regmap interface
>=20
> On Tue, Jan 23, 2018 at 08:34:23PM +0000, Vadim Pasternak wrote:
> > Restructure mlxreg header for unification of hotplug item definitions.
> >
> > Unify hotplug items to allow any kind of item (power controller, fan
> > eeprom, psu eeprom, asic health) in common way.
> >
> > Use a hardware independent regmap interface, enabling the support of
> > hotplug events over programmable devices attached to different bus
> > types, such as I2C, LPC, or SPI. Add a device node to the
> > mlxreg_core_data structure.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > ---
> > v10->v9:
> >  Fixes provided by Vadim:
> >  - add missed description of pdev_hotplug for struct mlxplat_priv;
>=20
> I didn't see this in the diff from my version to this one.
>=20
> >  - remove struct mlxplat_mlxcpld_regmap_context, which contains only
> >    the field with base address. Instead obtain locally defined base
> >    address by devm_ioport_map in mlxplat_init and pass it to
> >    devm_regmap_init;
> >  - modify mlxplat_mlxcpld_reg_read/write to use directly pointer to
> >    context;
>=20
> Also adds incorrect conversion of tabs to spaces in at least 3 locations =
...
>=20
> I had also corrected various typos and the copyright statement, as well a=
s
> reworked the commit messages. So at this point, I'd rather see these as c=
hanges
> on top of what I have cleaned up.
>=20
> Please compare what you have here with:
> https://github.com/dvhart/linux-pdx86/tree/review-dvhart-mellanox-v10
>=20
> And send me any changes strictly on top of that.

Hi Darren,

I'll send you four patches on top review-dvhart-mellanox-v10.
There are
- Patch to simplify IO access to regmap context.
- Register map configuration extension with IO access verification
  callbacks.
- Adding check for negative adapter number value in hotplug;
- Adding validation of return code of mlxreg_hotplug_device_create.
  This is instead of what have been removed in "FIXME:"

But there were two Kbuild issues with these two patches:
[4/9] FIXME platform/mellanox: Remove redundant dev_err messages on device_=
create
[6/8] platform/mellanox: mlxreg-hotplug: Modify to use a regmap interface

This is because of incorrect order of patches: FIXME platform/mellanox
uses filed nr which replaces field
bus in Rename-i2c-bus-to-nr.
0003-FIXME-platform-mellanox-Remove-redundant-dev_err-mes.patch=20
0004-platform-mellanox-Group-create-destroy-with-attribut.patch
0005-platform-mellanox-Rename-i2c-bus-to-nr.patch

So, I'll resend the above three patches marked v11 "re-ordered".
If it's not good I'll redo it according to your input.

>=20
> Are you anticipating any additional changes beyond those in this version?
>=20

Additionally, after we are done with this series, I'd like to add:
- several new systems to mlx-platform;
- new module to mellanox folder with sysfs access to some special registers=
,
  like resets and reset causes registers (mlxreg-io);
- make configuration and activation of mlxreg-io in mlx-patfrom;

And later, after I am done with upstream work with leds-mlxreg driver, I'd
like to add configuration and activation of this driver in mlx-patform as w=
ell.

Thanks,
Vadim.

> --
> Darren Hart
> VMware Open Source Technology Center
