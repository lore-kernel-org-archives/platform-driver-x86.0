From: "Joey Lee" <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: support for P key on TM8372
Date: Mon, 06 Feb 2012 03:08:32 -0700
Message-ID: <4F3041500200002300007E56@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:48201 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754449Ab2BFKIj (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:5:2>);
	Mon, 6 Feb 2012 05:08:39 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: merlin.schumacher@gmail.com
Cc: ike.pan@canonical.com, mjg@redhat.com, Joey Lee <JLee@suse.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Merlin,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-01-26 =E6=96=BC 12:53 +0100=EF=BC=8CMe=
rlin Schumacher =E6=8F=90=E5=88=B0=EF=BC=9A
> Am 26.01.2012 03:28, schrieb joeyli:
> > Hi Ike,
> >
> > =E6=96=BC =E4=BA=8C=EF=BC=8C2012-01-24 =E6=96=BC 04:35 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> >> From: Merlin Schumacher<merlin.schumacher@gmail.com>
> >>
> >> BugLink: http://launchpad.net/bugs/865807
> >>
> >> There is no entry for P key on TM8372, so when P key is pressed, o=
nly
> >> "acer_wmi: Unknown key number - 0x29" in dmesg.
> >>
> >> Signed-off-by: Merlin Schumacher<merlin.schumacher@gmail.com>
> >> Signed-off-by: Ike Panhc<ike.pan@canonical.com>
> >
> > Reviewed-by: Lee, Chun-Yi<jlee@suse.com>
> >
> >> ---
> >>   drivers/platform/x86/acer-wmi.c |    1 +
> >>   1 files changed, 1 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x8=
6/acer-wmi.c
> >> index b848277..d48262c 100644
> >> --- a/drivers/platform/x86/acer-wmi.c
> >> +++ b/drivers/platform/x86/acer-wmi.c
> >> @@ -105,6 +105,7 @@ static const struct key_entry acer_wmi_keymap[=
] =3D {
> >>   	{KE_KEY, 0x22, {KEY_PROG2} },    /* Arcade */
> >>   	{KE_KEY, 0x23, {KEY_PROG3} },    /* P_Key */
> >>   	{KE_KEY, 0x24, {KEY_PROG4} },    /* Social networking_Key */
> >> +	{KE_KEY, 0x29, {KEY_PROG3} },    /* P_Key for TM8372 */
> >>   	{KE_IGNORE, 0x41, {KEY_MUTE} },
> >>   	{KE_IGNORE, 0x42, {KEY_PREVIOUSSONG} },
> >>   	{KE_IGNORE, 0x43, {KEY_NEXTSONG} },
> >
> > This patch has no problem, but could you please provide the dmideco=
de
> > result to me for reference?
> >
> >
> > Thanks a lot!
> > Joey Lee
> >
>=20
> Hi,
>=20
> attached you'll find the output of dmidecode on the TM8372. If you ne=
ed=20
> anything else, let me know.
>=20
> You're welcome
>=20
> Merlin Schumacher
>=20
>=20

Thanks for your dmidecode log of TM8372, I can keep it for regression
test after add new functions.


Thanks a lot!
Joey Lee
