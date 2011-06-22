From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 1/2] acer-wmi: Add support for Aspire 1830 wlan
 hotkey
Date: Wed, 22 Jun 2011 04:14:17 -0600
Message-ID: <4E024D19020000230002E936@novprvlin0050.provo.novell.com>
References: <20110621165859.GB25609@thinkpad-t410>
 <1308675633-10384-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:40035 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752552Ab1FVKOZ (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:3:1>);
	Wed, 22 Jun 2011 06:14:25 -0400
In-Reply-To: <1308675633-10384-1-git-send-email-seth.forshee@canonical.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: seth.forshee@canonical.com
Cc: Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-06-21 =E6=96=BC 12:00 -0500=EF=BC=8CSe=
th Forshee =E6=8F=90=E5=88=B0=EF=BC=9A
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
>  drivers/platform/x86/acer-wmi.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 005417b..0dd6986 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -99,6 +99,7 @@ enum acer_wmi_event_ids {
>  static const struct key_entry acer_wmi_keymap[] =3D {
>  	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
>  	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
> +	{KE_KEY, 0x04, {KEY_WLAN} },     /* WiFi */
>  	{KE_KEY, 0x12, {KEY_BLUETOOTH} },	/* BT */
>  	{KE_KEY, 0x21, {KEY_PROG1} },    /* Backup */
>  	{KE_KEY, 0x22, {KEY_PROG2} },    /* Arcade */

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>

Thank's for your patch!
Joey Lee
