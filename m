From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-wmi: add a WMI event code for display on/off
Date: Thu, 16 Jun 2016 09:37:27 +0200
Message-ID: <20160616073727.GU29844@pali>
References: <1466047508-18799-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32917 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246AbcFPHha (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Jun 2016 03:37:30 -0400
Received: by mail-wm0-f65.google.com with SMTP id r5so9253996wmr.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jun 2016 00:37:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1466047508-18799-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org

On Thursday 16 June 2016 11:25:08 Alex Hung wrote:
> Some new Dell AIO systems have a button that generates WMI evnet
> that is to be used to turn LCD on/off
>=20
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 15c6f11..298aba1 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -125,6 +125,9 @@ static const struct key_entry dell_wmi_legacy_key=
map[] __initconst =3D {
>  	/* Audio panel key */
>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> =20
> +	/* Monitor On/Off Control key */
> +	{ KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },
> +
>  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
>  	{ KE_IGNORE, 0xe030, { KEY_VOLUMEUP } },
>  	{ KE_IGNORE, 0xe033, { KEY_KBDILLUMUP } },

Hi! Can you rebase this path on top of my "[PATCH v3 0/4] dell-wmi:
Changes in WMI event code handling" series? As it changes order of keys
in that sparse table and your change should be easy to rebase.

After rebasing needs some whitespace changes, but looks good, add my
Acked-by.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
