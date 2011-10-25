From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] acer-wmi: blacklist Thinkpad edge E520
Date: Tue, 25 Oct 2011 10:57:36 +0800
Message-ID: <4EA625A0.6090909@canonical.com>
References: <1318488718-4744-1-git-send-email-ike.pan@canonical.com> <1319494967.17773.156.camel@linux-s257.site> <20111024231329.GA25993@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:48183 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754068Ab1JYC5p (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 24 Oct 2011 22:57:45 -0400
In-Reply-To: <20111024231329.GA25993@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dave Jones <davej@redhat.com>, joeyli <jlee@suse.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Joey Lee <jlee@novell.com>

On 10/25/2011 07:13 AM, Dave Jones wrote:
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

I've tried to find a way to prevent acer-wmi loaded if VPC2004 found in=
 DSDT. Thinking twice, seems to do this in kernel is not a good idea be=
cause if acer-wmi is necessary in one model of ideapads then we need to=
 re-compile kernel for testing. I think it will be better to do this in=
 udev if possible.
