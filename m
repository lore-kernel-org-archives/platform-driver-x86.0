From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: blacklist Thinkpad edge E520
Date: Sun, 06 Nov 2011 17:29:15 +0800
Message-ID: <1320571755.14890.10.camel@linux-s257.site>
References: <1318488718-4744-1-git-send-email-ike.pan@canonical.com>
	 <1319494967.17773.156.camel@linux-s257.site>
	 <20111024231329.GA25993@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:56360 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942Ab1KFJal (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Sun, 6 Nov 2011 04:30:41 -0500
In-Reply-To: <20111024231329.GA25993@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Joey Lee <jlee@novell.com>

Hi Dave,=20

Sorry for I am late to reply you!

=E6=96=BC =E4=B8=80=EF=BC=8C2011-10-24 =E6=96=BC 19:13 -0400=EF=BC=8CDa=
ve Jones =E6=8F=90=E5=88=B0=EF=BC=9A
> On Tue, Oct 25, 2011 at 06:22:47AM +0800, joeyli wrote:
>  > =E6=96=BC =E5=9B=9B=EF=BC=8C2011-10-13 =E6=96=BC 14:51 +0800=EF=BC=
=8CIke Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>  > > BugLink: http://launchpad.net/bugs/836865
>  > > BugLink: http://launchpad.net/bugs/826784
>  > >=20
>  > > There are reports say that acer-wmi is loaded on Thinkpad E520 w=
hich
>  > > cause wireless connection hard blocked and we can not unblock it=
=2E It
>  > > will be better not to load acer-wmi on this machine.
>  > >=20
>  > > Signed-off-by: Ike Panhc <ike.pan@canonical.com>
>  > > ---
>  > >  drivers/platform/x86/acer-wmi.c |    7 +++++++
>  > >  1 files changed, 7 insertions(+), 0 deletions(-)
>  > >=20
>  > > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/=
x86/acer-wmi.c
>  > > index af2bb20..dc9a116 100644
>  > > --- a/drivers/platform/x86/acer-wmi.c
>  > > +++ b/drivers/platform/x86/acer-wmi.c
>  > > @@ -325,6 +325,13 @@ static struct dmi_system_id __devinitdata a=
cer_blacklist[] =3D {
>  > >  			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
>  > >  		},
>  > >  	},
>  > > +	{
>  > > +		.ident =3D "Lenovo Thinkpad Edge E520",
>  > > +		.matches =3D {
>  > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>  > > +			DMI_MATCH(DMI_PRODUCT_NAME, "114320U"),
>  > > +		},
>  > > +	},
>  > >  	{}
>  > >  };
>  > > =20
>  >=20
>  > Unfortunately didn't see any useful EC register for unblock wifi r=
fkill in acer-wmi, let's=20
>  > add this device to blacklist.
>  >=20
>  > Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
>=20
> We've seen similar reports from other Lenovo machines & acer-wmi in F=
edora bugzilla.
> https://bugzilla.redhat.com/show_bug.cgi?id=3D674353 for example has =
people reporting
> the b450 and V460 also suffer the same issue.
>=20
> (There are also a bunch of bug reports from the other *-wmi modules o=
n various hardware.
> It seems these modules really upset rfkill).
>=20
> 	Dave
>=20

I just go to brc#674353 to check the DSDT from B450, I thought we can
try the wireless quirk type 2 (offset 0x71 in EC OperationRegion), I
will attach a patch to redhat bugzilla, let's talk on bugzilla.

And,=20
I didn't see the DSDT from Lenovo V640, maybe we also can find out a
useful EC register reflect to wireless status.


Thank's a lot!
Joey Lee
