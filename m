From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/4] dell-wmi: Rework code for generating sparse
 keymap and processing WMI events
Date: Wed, 8 Jun 2016 15:50:32 -0700
Message-ID: <20160608225032.GL28348@f23x64.localdomain>
References: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
 <1465342347-20635-5-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40565 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932290AbcFHWuh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 18:50:37 -0400
Content-Disposition: inline
In-Reply-To: <1465342347-20635-5-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 08, 2016 at 01:32:27AM +0200, Pali Roh=C3=A1r wrote:
> This patch unify procedure for generating sparse keymap and unify als=
o big
> switch code for processing WMI events of different types. After this =
patch
> dell-wmi driver does not differ between "old" and "new" hotkey type.
>=20
> It construct sparse keymap table with all WMI codes. It is because on=
 some
> laptops (e.g. Dell Latitude E6440) ACPI/firmware send both event type=
s (old
> and new).
>=20
> Each WMI code in sparse keymap table is prefixed by 16bit event type,=
 so it
> does not change functionality on laptops with "old" hotkey support (t=
hose
> without scancodes in DMI).
>=20
> This allow us to distinguish between same WMI codes with different ty=
pes in
> sparse keymap. Thanks to this WMI events of type 0x0011 were moved fr=
om big
> switch into sparse keymap table too.
>=20
> This patch also fixes possible bug in parsing WMI event buffer introd=
uced
> in commit 5ea2559726b7 ("dell-wmi: Add support for new Dell systems")=
=2E That
> commit changed buffer type from int* to u16* without fixing code. Mor=
e at:
> http://lkml.iu.edu/hypermail/linux/kernel/1507.0/01950.html
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Tested-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/dell-wmi.c |  215 +++++++++++++++++++----------=
----------
>  1 file changed, 107 insertions(+), 108 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index a406f01..fe831f3 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c

=2E..

> @@ -379,59 +385,21 @@ static void dell_wmi_notify(u32 value, void *co=
ntext)
>  		pr_debug("Process buffer (%*ph)\n", len*2, buffer_entry);
> =20
>  		switch (buffer_entry[1]) {

=2E..

> -		case 0x10:
> -			/* Keys pressed */
> +		case 0x0010:
> +			/* Sequence of keys pressed */
>  			for (i =3D 2; i < len; ++i)
> -				dell_wmi_process_key(buffer_entry[i]);
> +				dell_wmi_process_key(0x0010, buffer_entry[i]);
>  			break;
> -		case 0x11:
> -			for (i =3D 2; i < len; ++i) {
> -				switch (buffer_entry[i]) {
> -				case 0xfff0:
> -					/* Battery unplugged */
> -					pr_debug("Battery unplugged\n");
> -					break;
> -				case 0xfff1:
> -					/* Battery inserted */
> -					pr_debug("Battery inserted\n");
> -					break;
> -				case 0x01e1:
> -				case 0x02ea:
> -				case 0x02eb:
> -				case 0x02ec:
> -				case 0x02f6:
> -					/* Keyboard backlight level changed */
> -					pr_debug("Keyboard backlight level "
> -						 "changed\n");
> -					break;
> -				default:
> -					/* Unknown event */
> -					pr_info("Unknown WMI event type 0x11: "
> -						"0x%x\n", (int)buffer_entry[i]);
> -					break;
> -				}
> -			}
> +		case 0x0011:
> +			/* Sequence of events occurred */
> +			for (i =3D 2; i < len; ++i)
> +				dell_wmi_process_key(0x0011, buffer_entry[i]);

Since this is identical to case 0x010, let's avoid the duplication of c=
ode and
handle this with a fall-through, like:

		case 0x0010:
		case 0x0011:
			/* Sequence of events occurred */
			for (i =3D 2; i < len; ++i)
				dell_wmi_process_key(buffer_entry[1], buffer_entry[i]);

Checkpatch caught a couple comments over 80 characters as well, please =
correct
along with the above change request.

Otherwise, this looks like a good improvement to me. I'll likely reword=
 some of
the commentary for concision and clarity before I merge it.

Thanks!

--=20
Darren Hart
Intel Open Source Technology Center
