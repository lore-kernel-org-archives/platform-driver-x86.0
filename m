From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: add video_vendor quirk for Acer Aspire E1-572
Date: Thu, 02 Jan 2014 20:39:06 +0800
Message-ID: <1388666346.3539.6065.camel@linux-s257.site>
References: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>
	 <1388116274.3539.6046.camel@linux-s257.site>
	 <1388118336.3539.6055.camel@linux-s257.site>
	 <52C42821.3020801@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:49939 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbaABMkk (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Thu, 2 Jan 2014 07:40:40 -0500
In-Reply-To: <52C42821.3020801@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, Aaron Lu <aaron.lu@intel.com>

=E6=96=BC =E4=B8=89=EF=BC=8C2014-01-01 =E6=96=BC 15:37 +0100=EF=BC=8COl=
eksij Rempel =E6=8F=90=E5=88=B0=EF=BC=9A
> Am 27.12.2013 05:25, schrieb joeyli:
[...]
> >>>  		},
> >>>  	},
> >>> +	{
> >>> +		.callback =3D video_set_backlight_video_vendor,
> >>> +		.ident =3D "Acer Aspire E1-572",
> >>> +		.matches =3D {
> >>> +			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> >>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire E1-572"),
> >>> +		},
> >>> +	},
> >>>  	{}
> >>>  };
> >>> =20
> >>
> >> I have applied this patch, build and load acer-wmi driver, didn't =
see
> >> problem.
> >>
> >> Acked-by: Lee, Chun-Yi <jlee@suse.com>
> >>
> >>
> >> Thanks for your patch!
> >> Joey Lee
> >=20
> > I just aware Aspire E1-572 shipped with Windows 8. Before merge thi=
s
> > patch. Could you please try v3.13-rc5 kernel with
> > video.use_native_backlight=3D1 kernel parameter?
> >=20
> > Aaron Lu's "[PATCH v5 0/4] Fix Win8 backlight issue" merged to main=
line
> > in v3.13-rc1, his patches works to me on a Gateway Windows 8 notebo=
ok.
> >=20
> > Please try it, if Aaron's patches works on E1-572, then we don't ne=
ed
> > this patch.
>=20
> Hi,
>=20
> suddenly i do not have access to this Laptops any more. It was a
> purchase for a friend. I tested it, provided some patch and gave it a=
way :(
>=20

I think Aaron's patches can fix it on E1-572. Let's wait until v3.13
version released then look at maybe someone report issue again.

Very appreciate for your patch.

Joey Lee
