From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Platform: hp-wmi: add rfkill support for integrated GPS
Date: Thu, 11 Oct 2012 13:34:15 +0100
Message-ID: <20121011123415.GA6056@srcf.ucam.org>
References: <1349952660.1577.43.camel@pluto.netcomga.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54978 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754758Ab2JKMeV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 11 Oct 2012 08:34:21 -0400
Content-Disposition: inline
In-Reply-To: <1349952660.1577.43.camel@pluto.netcomga.sk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Trep=E1k?= Vilmos <trepo@netcomga.sk>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 11, 2012 at 12:51:00PM +0200, Trep=E1k Vilmos wrote:
> @@ -663,6 +669,24 @@ static int __devinit hp_wmi_rfkill_setup
>  			goto register_bluetooth_error;
>  	}
> =20
> +	if (wireless & 0x3) {
> +		gps_rfkill =3D rfkill_alloc("hp-gps", &device->dev,
> +						RFKILL_TYPE_GPS,
> +						&hp_wmi_rfkill_ops,
> +						(void *) HPWMI_GPS);

I don't think this bit is right - in this codepath, wireless is a mask,=
=20
so 0x3 would mean wifi and bluetooth, not gps. I'd expect gps to be 0x8=
=2E=20
The rest looks good, though.


--=20
Matthew Garrett | mjg59@srcf.ucam.org
