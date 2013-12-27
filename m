From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: add video_vendor quirk for Acer Aspire E1-572
Date: Fri, 27 Dec 2013 12:25:36 +0800
Message-ID: <1388118336.3539.6055.camel@linux-s257.site>
References: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>
	 <1388116274.3539.6046.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:33759 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751917Ab3L0E1C (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Thu, 26 Dec 2013 23:27:02 -0500
In-Reply-To: <1388116274.3539.6046.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, Aaron Lu <aaron.lu@intel.com>

Hi Oleksij,=20

=E6=96=BC =E4=BA=94=EF=BC=8C2013-12-27 =E6=96=BC 11:51 +0800=EF=BC=8Cjo=
eyli =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi Oleksij,=20
>=20
> =E6=96=BC =E5=9B=9B=EF=BC=8C2013-12-05 =E6=96=BC 14:00 +0100=EF=BC=8C=
Oleksij Rempel =E6=8F=90=E5=88=B0=EF=BC=9A
> > Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> > ---
> >  drivers/platform/x86/acer-wmi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > index c9076bd..d5ca1648 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -572,6 +572,14 @@ static const struct dmi_system_id video_vendor=
_dmi_table[] =3D {
> >  			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
> >  		},
> >  	},
> > +	{
> > +		.callback =3D video_set_backlight_video_vendor,
> > +		.ident =3D "Acer Aspire E1-572",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire E1-572"),
> > +		},
> > +	},
> >  	{}
> >  };
> > =20
>=20
> I have applied this patch, build and load acer-wmi driver, didn't see
> problem.
>=20
> Acked-by: Lee, Chun-Yi <jlee@suse.com>
>=20
>=20
> Thanks for your patch!
> Joey Lee

I just aware Aspire E1-572 shipped with Windows 8. Before merge this
patch. Could you please try v3.13-rc5 kernel with
video.use_native_backlight=3D1 kernel parameter?

Aaron Lu's "[PATCH v5 0/4] Fix Win8 backlight issue" merged to mainline
in v3.13-rc1, his patches works to me on a Gateway Windows 8 notebook.

Please try it, if Aaron's patches works on E1-572, then we don't need
this patch.


Thanks a lot!
Joey Lee
