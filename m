From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: support for P key on TM8372
Date: Thu, 26 Jan 2012 10:28:41 +0800
Message-ID: <1327544921.15260.7.camel@linux-s257.site>
References: <1327350935-19145-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:46248 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751597Ab2AZCdP (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Wed, 25 Jan 2012 21:33:15 -0500
In-Reply-To: <1327350935-19145-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Merlin Schumacher <merlin.schumacher@gmail.com>, Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

Hi Ike,

=E6=96=BC =E4=BA=8C=EF=BC=8C2012-01-24 =E6=96=BC 04:35 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> From: Merlin Schumacher <merlin.schumacher@gmail.com>
>=20
> BugLink: http://launchpad.net/bugs/865807
>=20
> There is no entry for P key on TM8372, so when P key is pressed, only
> "acer_wmi: Unknown key number - 0x29" in dmesg.
>=20
> Signed-off-by: Merlin Schumacher <merlin.schumacher@gmail.com>
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>

Reviewed-by: Lee, Chun-Yi <jlee@suse.com>

> ---
>  drivers/platform/x86/acer-wmi.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index b848277..d48262c 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -105,6 +105,7 @@ static const struct key_entry acer_wmi_keymap[] =3D=
 {
>  	{KE_KEY, 0x22, {KEY_PROG2} },    /* Arcade */
>  	{KE_KEY, 0x23, {KEY_PROG3} },    /* P_Key */
>  	{KE_KEY, 0x24, {KEY_PROG4} },    /* Social networking_Key */
> +	{KE_KEY, 0x29, {KEY_PROG3} },    /* P_Key for TM8372 */
>  	{KE_IGNORE, 0x41, {KEY_MUTE} },
>  	{KE_IGNORE, 0x42, {KEY_PREVIOUSSONG} },
>  	{KE_IGNORE, 0x43, {KEY_NEXTSONG} },

This patch has no problem, but could you please provide the dmidecode
result to me for reference?


Thanks a lot!
Joey Lee
