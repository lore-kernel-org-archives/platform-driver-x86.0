From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: check wireless capability on AMW0_GUID2
 machines
Date: Mon, 09 Jan 2012 18:00:24 +0800
Message-ID: <1326103224.24116.282.camel@linux-s257.site>
References: <1326090677-25942-1-git-send-email-jlee@suse.com>
	 <3474148.WRXZ4siLlh@valkyrie>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:49327 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427Ab2AIKEM (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Mon, 9 Jan 2012 05:04:12 -0500
In-Reply-To: <3474148.WRXZ4siLlh@valkyrie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Hi Carios,=20

=E6=96=BC =E4=B8=80=EF=BC=8C2012-01-09 =E6=96=BC 08:01 +0000=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Monday 09 Jan 2012 14:31:17 Lee, Chun-Yi wrote:
> > From: "Lee, Chun-Yi" <jlee@suse.com>
> >=20
> > Have many non-acer machines have AMW0_GUID2 method in DSDT, in
> > original acer-wmi design, driver direct set ACER_CAP_WIRELESS flag
> > for those machines but didn't check the functionality for set/get
> > wireless state.
> > It causes acer-wmi driver create a broken wireless rfkill and it
> > already set to soft blocked.
> >=20
> > So, this patch add a wireless capability check before we set
> > ACER_CAP_WIRELESS flag to the machines that were included AMW0_GUID=
2.
> > It avoid acer-wmi create a broken wireless rfkill.
> >=20
> > Thank's for Matthew Garrett give the idea.
> >=20
> > Reference: brc#674353
> >         https://bugzilla.redhat.com/show_bug.cgi?id=3D674353
> >=20
> > Tested on Lenovo E520.
> > Tested on Acer TravelMate 4750.
>=20
> Is there really no other way to detect the availability of wireless o=
n=20
> hardware with that GUID without resorting to poking stuff to see if i=
t sticks?
>=20
> My assumption has always been that there must be of finding out, but =
I've never=20
> had the hardware to check that with.
>=20
> -Carlos
>=20
>=20

I just checked and found I also have no AMW0_GUID2 machines on my hand,
now.
I have some questions about AMW0_GUID2:

  + Why we enabled wireless capability in acer-wim if a non-acer machin=
e has AMW0_GUID2 ?

  + I saw there have some magic number when you access AMW0_GUID1 (e.g.=
 0x9610, eax, ebx, ecx)
    Could you please kindly teach me how can grab those value for AMW0_=
GUID2?
    Does there have any useful dump or report log can provide by hardwa=
re owner?


Thanks a lot!
Joey Lee
