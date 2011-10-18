From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: blacklist Thinkpad edge E520
Date: Tue, 18 Oct 2011 09:48:11 +0800
Message-ID: <1318902491.1913.348.camel@linux-s257.site>
References: <1318488718-4744-1-git-send-email-ike.pan@canonical.com>
	 <1318523759.1913.68.camel@linux-s257.site>  <4E97A307.20208@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:60572 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757165Ab1JRBs4 (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Mon, 17 Oct 2011 21:48:56 -0400
In-Reply-To: <4E97A307.20208@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Joey Lee <jlee@novell.com>

Hi Ike,=20

Could you please attached on the "rfkill list" output when press Fn key=
?
Then we can check the rfkill status change.

And,=20
Thinkpad E520 have AMW0 method and I thought acer-wmi query wrong EC
register address so your acer-wireless was always soft-blocked.

Does it possible kindly help me to find out which register on E520 is
mapping to wireless status? Please reference to Carlos's acer_ec.pl
tool:

http://code.google.com/p/aceracpi/wiki/EmbeddedController

Simple use:
        watch -n 1 perl acer_ec.pl regs

Then press your wireless Fn key to monitor which register changed when
you press Fn key:

e.g. the register at row B0 and column 0A is register 0xBA (0x is used
to indicate this is a hexadecimal number).

There maybe have other EC register changing when you press key, please
do a couple of times and make sure you find out the right one.

If we are lucky, we can find out one EC register mapping to your
wireless state.


Thank's
Joey Lee

=E6=96=BC =E4=BA=94=EF=BC=8C2011-10-14 =E6=96=BC 10:48 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi Joey,
>=20
> Here you are.
>=20
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/+attachme=
nt/2330828/+files/AcpiTables.txt
>=20
>=20
> On 10/14/2011 12:35 AM, joeyli wrote:
> > Hi Ike,=20
> >=20
> > =E6=96=BC =E5=9B=9B=EF=BC=8C2011-10-13 =E6=96=BC 14:51 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> >> BugLink: http://launchpad.net/bugs/836865
> >> BugLink: http://launchpad.net/bugs/826784
> >>
> >> There are reports say that acer-wmi is loaded on Thinkpad E520 whi=
ch
> >> cause wireless connection hard blocked and we can not unblock it. =
It
> >> will be better not to load acer-wmi on this machine.
> >>
> >> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> >> ---
> >>  drivers/platform/x86/acer-wmi.c |    7 +++++++
> >>  1 files changed, 7 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x8=
6/acer-wmi.c
> >> index af2bb20..dc9a116 100644
> >> --- a/drivers/platform/x86/acer-wmi.c
> >> +++ b/drivers/platform/x86/acer-wmi.c
> >> @@ -325,6 +325,13 @@ static struct dmi_system_id __devinitdata ace=
r_blacklist[] =3D {
> >>  			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
> >>  		},
> >>  	},
> >> +	{
> >> +		.ident =3D "Lenovo Thinkpad Edge E520",
> >> +		.matches =3D {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "114320U"),
> >> +		},
> >> +	},
> >>  	{}
> >>  };
> >> =20
> >=20
> > Could you please share Thinkpad edge E520's acpidump and dmidecode =
log
> > to me?=20
> > Maybe we can capture how does it works with EC register like we sup=
port
> > Ideapad S205 in acer-wmi driver.
> >=20
> > Add a machine to blacklist is a last resort, I don't want to accept=
 it
> > before we try.
> >=20
> >=20
> > Thank's a lot!
> > Joey Lee
> >=20
> >=20
> > --
> > To unsubscribe from this list: send the line "unsubscribe platform-=
driver-x86" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
