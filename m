From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] thinkpad_acpi: support HKEY interface version 0x200
Date: Tue, 19 Apr 2016 14:42:58 +0200
Message-ID: <87k2jt7orx.fsf@nemi.mork.no>
References: <1461064294-2879-1-git-send-email-hadess@hadess.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:44040 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753798AbcDSMnw convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Apr 2016 08:43:52 -0400
In-Reply-To: <1461064294-2879-1-git-send-email-hadess@hadess.net> (Bastien
	Nocera's message of "Tue, 19 Apr 2016 13:11:34 +0200")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bastien Nocera <hadess@hadess.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Shuduo Sang <shuduo.sang@canonical.com>, Bruce Ma <bruce.ma@canonical.com>

Bastien Nocera <hadess@hadess.net> writes:

> From: Shuduo Sang <shuduo.sang@canonical.com>
>
> The Thinkpad X1 Carbon 2nd generation (2014) ships with BIOS that wil=
l
> return HKEY interface version 0x200. It needs thinkpad-acpi support
> otherwise it will be routed to wrong branch and the hotkey mask will
> be wrong.
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D114731
>
> Signed-off-by: Bruce Ma <bruce.ma@canonical.com>
> Signed-off-by: Shuduo Sang <shuduo.sang@canonical.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 35 ++++++++++++++++++++++++++=
++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/=
x86/thinkpad_acpi.c
> index dad2984..c177936 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3357,11 +3357,8 @@ static int __init hotkey_init(struct ibm_init_=
struct *iibm)
>  	   A30, R30, R31, T20-22, X20-21, X22-24.  Detected by checking
>  	   for HKEY interface version 0x100 */
>  	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
> -		if ((hkeyv >> 8) !=3D 1) {
> -			pr_err("unknown version of the HKEY interface: 0x%x\n",
> -			       hkeyv);
> -			pr_err("please report this to %s\n", TPACPI_MAIL);
> -		} else {
> +		switch (hkeyv >> 8) {
> +		case 1:
>  			/*
>  			 * MHKV 0x100 in A31, R40, R40e,
>  			 * T4x, X31, and later
> @@ -3381,6 +3378,34 @@ static int __init hotkey_init(struct ibm_init_=
struct *iibm)
>  			} else {
>  				tp_features.hotkey_mask =3D 1;
>  			}
> +			break;
> +
> +		case 2:
> +			/*
> +			 * MHKV 0x200 in X1
> +			 */
> +			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
> +				"firmware HKEY interface version: 0x%x\n",
> +				hkeyv);
> +
> +			/* Paranoia check AND init hotkey_all_mask */
> +			if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
> +					"MHKA", "dd", 1)) {
> +				pr_err("missing MHKA handler, "
> +					"please report this to %s\n",
> +					TPACPI_MAIL);
> +				/* Fallback: pre-init for FN+F3,F4,F12 */
> +				hotkey_all_mask =3D 0x080cU;
> +			} else {
> +				tp_features.hotkey_mask =3D 1;
> +			}
> +			break;


Why do you duplicate this code block with that single byte changed? If
that was intended, then it certainly should be explained.


Bj=C3=B8rn
