From: =?ISO-8859-1?Q?Richard_Sch=FCtz?= <r.schtz@t-online.de>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Fri, 11 Feb 2011 12:37:26 +0100
Message-ID: <4D551F76.1070303@t-online.de>
References: <20110209224006.GA11202@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout10.t-online.de ([194.25.134.21]:55158 "EHLO
	mailout10.t-online.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755759Ab1BKLiA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Feb 2011 06:38:00 -0500
In-Reply-To: <20110209224006.GA11202@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

 > +static struct dmi_system_id __initdata samsung_dmi_table[] =3D {
 > +	{
 > +		.ident =3D "N128",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR,
 > +					"SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "N128"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "N128"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +	{
 > +		.ident =3D "N130",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR,
 > +					"SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "N130"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "N130"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +	{
 > +		.ident =3D "X125",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR,
 > +					"SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "X125"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "X125"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +	{
 > +		.ident =3D "NC10",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR,
 > +					"SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "NC10"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "NC10"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +		{
 > +		.ident =3D "NP-Q45",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR,
 > +					"SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "SQ45S70S"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "SQ45S70S"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +		},
 > +	{
 > +		.ident =3D "X360",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR,
 > +					"SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "X360"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "X360"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +	{
 > +		.ident =3D "R518",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR,
 > +					"SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "R518"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "R518"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +	{
 > +		.ident =3D "N150/N210/N220",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR,
 > +					"SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "N150/N210/N220"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "N150/N210/N220"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +	{
 > +		.ident =3D "R530/R730",
 > +		.matches =3D {
 > +		      DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
 > +		      DMI_MATCH(DMI_PRODUCT_NAME, "R530/R730"),
 > +		      DMI_MATCH(DMI_BOARD_NAME, "R530/R730"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +	{
 > +		.ident =3D "NF110/NF210/NF310",
 > +		.matches =3D {
 > +			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
 > +			DMI_MATCH(DMI_PRODUCT_NAME, "NF110/NF210/NF310"),
 > +			DMI_MATCH(DMI_BOARD_NAME, "NF110/NF210/NF310"),
 > +		},
 > +		.callback =3D dmi_check_cb,
 > +	},
 > +	{ },
 > +};
 > +MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);

Could you add

=2Eident =3D "N145P/N250P/N260P",
=2Ematches =3D {
	DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
	DMI_MATCH(DMI_PRODUCT_NAME, "N145P/N250P/N260P"),
	DMI_MATCH(DMI_BOARD_NAME, "N145P/N250P/N260P"),
},
=2Ecallback =3D dmi_check_cb,

there, please? I've tested the driver successfully on my N145P.

--=20
Regards,
Richard Sch=FCtz
