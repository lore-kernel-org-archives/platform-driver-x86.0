From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: add video_vendor quirk for Acer Aspire E1-572
Date: Thu, 09 Jan 2014 15:06:37 +0800
Message-ID: <1389251197.24105.20.camel@linux-s257.site>
References: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>
	 <1388116274.3539.6046.camel@linux-s257.site>
	 <1388118336.3539.6055.camel@linux-s257.site>
	 <52C42821.3020801@rempel-privat.de>
	 <1388666346.3539.6065.camel@linux-s257.site>
	 <52CAD7B3.6060508@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:42853 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751183AbaAIHJN (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Thu, 9 Jan 2014 02:09:13 -0500
In-Reply-To: <52CAD7B3.6060508@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, Aaron Lu <aaron.lu@intel.com>

=E6=96=BC =E4=B8=80=EF=BC=8C2014-01-06 =E6=96=BC 17:20 +0100=EF=BC=8COl=
eksij Rempel =E6=8F=90=E5=88=B0=EF=BC=9A
> > I think Aaron's patches can fix it on E1-572. Let's wait until v3.1=
3
> > version released then look at maybe someone report issue again.
> >=20
> > Very appreciate for your patch.
> >=20
> > Joey Lee
> >=20
>=20
> Hi Joey,
>=20
> i have access to this hardware for next two weeks. Theoretically this
> kernel should have patches you was talking about:
> http://kernel.ubuntu.com/~kernel-ppa/mainline/daily/2014-01-06-trusty=
/
>=20
> it works with video.use_native_backlight=3D1.
>=20
> If you need more testing, you have two weeks ;)
>=20
> --=20
> Regards,
> Oleksij
>=20

Thanks for your testing, then I think just use
video.use_native_backlight to fix issue on Aspire E1-572. Don't need ad=
d
quirk to acer-wmi driver.


Thanks a lot!
Joey Lee
