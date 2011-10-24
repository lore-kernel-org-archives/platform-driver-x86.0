From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: blacklist Thinkpad edge E520
Date: Tue, 25 Oct 2011 06:20:31 +0800
Message-ID: <1319494831.17773.153.camel@linux-s257.site>
References: <1318488718-4744-1-git-send-email-ike.pan@canonical.com>
	 <1318523759.1913.68.camel@linux-s257.site>  <4E97A307.20208@canonical.com>
	 <1318902491.1913.348.camel@linux-s257.site>  <4E9CE262.60601@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:60553 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752094Ab1JXWVh (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Mon, 24 Oct 2011 18:21:37 -0400
In-Reply-To: <4E9CE262.60601@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Joey Lee <jlee@novell.com>

Hi Ike,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-10-18 =E6=96=BC 10:20 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi Joey,
>=20
> On 10/18/2011 09:48 AM, joeyli wrote:
> > Hi Ike,=20
> >=20
> > Could you please attached on the "rfkill list" output when press Fn=
 key?
> > Then we can check the rfkill status change.
>=20
> The output of rfkill list is at
>   https://launchpadlibrarian.net/78485925/RfKill.txt
>=20
> .. and bug reporter tells me that he can not unblock wireless.
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/comment=
s/0
>=20
> >=20
> > And,=20
> > Thinkpad E520 have AMW0 method and I thought acer-wmi query wrong E=
C
> > register address so your acer-wireless was always soft-blocked.
> >=20
> > Does it possible kindly help me to find out which register on E520 =
is
> > mapping to wireless status? Please reference to Carlos's acer_ec.pl
> > tool:
> >=20
> > http://code.google.com/p/aceracpi/wiki/EmbeddedController
> >=20
> > Simple use:
> >         watch -n 1 perl acer_ec.pl regs
> >=20
> > Then press your wireless Fn key to monitor which register changed w=
hen
> > you press Fn key:
> >=20
> > e.g. the register at row B0 and column 0A is register 0xBA (0x is u=
sed
> > to indicate this is a hexadecimal number).
> >=20
> > There maybe have other EC register changing when you press key, ple=
ase
> > do a couple of times and make sure you find out the right one.
> >=20
> > If we are lucky, we can find out one EC register mapping to your
> > wireless state.
>=20
> I've asked bug reporter to do so. Unfortunately nothing useful found.
>=20
> Please refer to the link below:
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/comment=
s/13
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/comment=
s/14
>=20
> The full discussion is at
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865
>=20

Bad!=20

I also didn't see useful things from DSDT, looks like the control
doesn't through EC.

Let's add this device to blacklist!


Thank's
Joey Lee
