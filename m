From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 03 Mar 2011 00:29:47 -0700
Message-ID: <4D6FDE1B020000230002952B@novprvlin0050.provo.novell.com>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
 <20110103204910.GA4223@srcf.ucam.org>
 <4D6EA053020000230002943D@novprvlin0050.provo.novell.com>
 <201103022109.51600.carlos@strangeworlds.co.uk>
 <4D6F0830.1090905@canonical.com>
 <4D6FD4C90200002300029504@novprvlin0050.provo.novell.com>
 <4D6F3F05.8000105@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4D6F3F05.8000105@canonical.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com
Cc: vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-03-03 =E6=96=BC 15:11 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> On 03/03/2011 02:50 PM, Joey Lee wrote:
> > Hi Ike,=20
> >=20
> >=20
> > Yes, I just simply check the Ideapad S12's DSDT that was dumped by
> > Ville-Pekka Vaino, it also declare VPC2004 devices in EC block.
> >=20
> > And,=20
> > per Vaino's mail, he said ideapad-laptop handle the killswitches be=
tter
> > on Ideapad S12.
> >=20
> > Did you have any plan to add the module alias for all known machine=
s
> > that were support VPC2004 devices?
>=20
> I believe its already done. The ideapad-laptop driver will bind on
> ACPI:VPC2004 device.
>=20
> In drivers/platform/x86/ideapad-laptop.c
>=20
> static const struct acpi_device_id ideapad_device_ids[] =3D {
>         { "VPC2004", 0},
>         { "", 0},
> };
> MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);
>=20

OH! yes, you are right. I lost it!


Thank's a lot!
Joey Lee
