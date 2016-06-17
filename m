From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][v2] dell-wmi: add a WMI event code for display on/off
Date: Fri, 17 Jun 2016 11:19:31 -0700
Message-ID: <20160617181931.GA3685@f23x64.localdomain>
References: <1466135067-28566-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33693 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753222AbcFQSTf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Jun 2016 14:19:35 -0400
Content-Disposition: inline
In-Reply-To: <1466135067-28566-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: mjg59@srcf.ucam.org, pali.rohar@gmail.com, platform-driver-x86@vger.kernel.org

On Fri, Jun 17, 2016 at 11:44:27AM +0800, Alex Hung wrote:
> Some new Dell AIO systems have a button that generates WMI evnet
> that is to be used to turn LCD on/off.
>=20
> Acked-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index b8ad055..8e6c357 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -133,6 +133,9 @@ static const struct key_entry dell_wmi_keymap_typ=
e_0000[] __initconst =3D {
>  	/* Audio panel key */
>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> =20
> +	/* Monitor On/Off Control key */

I've changed this to:

	/* LCD Display On/Off Control Key */

As "Monitor" read like external display to me. I can change this back i=
f you
strongly disagree.

Queued for 4.8.

--=20
Darren Hart
Intel Open Source Technology Center
