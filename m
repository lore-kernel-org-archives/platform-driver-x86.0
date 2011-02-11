From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Fri, 11 Feb 2011 07:22:31 -0800
Message-ID: <20110211152231.GB13487@kroah.com>
References: <20110209224006.GA11202@kroah.com>
 <4D551F76.1070303@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:52778 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756813Ab1BKPVo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Feb 2011 10:21:44 -0500
Content-Disposition: inline
In-Reply-To: <4D551F76.1070303@t-online.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Richard =?iso-8859-1?Q?Sch=FCtz?= <r.schtz@t-online.de>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Fri, Feb 11, 2011 at 12:37:26PM +0100, Richard Sch=FCtz wrote:
> > +static struct dmi_system_id __initdata samsung_dmi_table[] =3D {
> > +	{
> > +		.ident =3D "N128",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR,
> > +					"SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "N128"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "N128"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +	{
> > +		.ident =3D "N130",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR,
> > +					"SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "N130"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "N130"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +	{
> > +		.ident =3D "X125",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR,
> > +					"SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "X125"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "X125"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +	{
> > +		.ident =3D "NC10",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR,
> > +					"SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "NC10"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "NC10"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +		{
> > +		.ident =3D "NP-Q45",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR,
> > +					"SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "SQ45S70S"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "SQ45S70S"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +		},
> > +	{
> > +		.ident =3D "X360",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR,
> > +					"SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "X360"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "X360"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +	{
> > +		.ident =3D "R518",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR,
> > +					"SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "R518"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "R518"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +	{
> > +		.ident =3D "N150/N210/N220",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR,
> > +					"SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "N150/N210/N220"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "N150/N210/N220"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +	{
> > +		.ident =3D "R530/R730",
> > +		.matches =3D {
> > +		      DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD.")=
,
> > +		      DMI_MATCH(DMI_PRODUCT_NAME, "R530/R730"),
> > +		      DMI_MATCH(DMI_BOARD_NAME, "R530/R730"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +	{
> > +		.ident =3D "NF110/NF210/NF310",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "NF110/NF210/NF310"),
> > +			DMI_MATCH(DMI_BOARD_NAME, "NF110/NF210/NF310"),
> > +		},
> > +		.callback =3D dmi_check_cb,
> > +	},
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
>=20
> Could you add
>=20
> .ident =3D "N145P/N250P/N260P",
> .matches =3D {
> 	DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> 	DMI_MATCH(DMI_PRODUCT_NAME, "N145P/N250P/N260P"),
> 	DMI_MATCH(DMI_BOARD_NAME, "N145P/N250P/N260P"),
> },
> .callback =3D dmi_check_cb,
>=20
> there, please? I've tested the driver successfully on my N145P.

Yes I can, but do you want to send it to me in a format that I can appl=
y
so you can get the proper authorship credit?  Take a look at
Documentation/SubmittingPatches for the details.

If not, I'll be glad to do it myself, but wanted to give you the chance
first.

thanks,

greg k-h
