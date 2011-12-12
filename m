From: Peter Feuerer <peter@piie.net>
Subject: Re: [PATCH 2/2] acerhdf: Message logging neatening
Date: Mon, 12 Dec 2011 19:26:50 +0100
Message-ID: <cone.1323714410.432860.1894.1000@zopiie>
References: <9be2717594eec36bdcc072a90d81b044500270e4.1322593277.git.joe@perches.com> <96a258354ce375bf80259f783506bbd7191b520d.1322593277.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay02.ispgateway.de ([80.67.18.14]:33101 "EHLO
	smtprelay02.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753418Ab1LLScT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Dec 2011 13:32:19 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Joe,

thanks for sending this patch, I've got some comments on it.


Joe Perches writes:
> Use pr_warn not pr_warning.

Don't see any line, where you changed this=E2=80=A6


> Coalesce formats.
> Argument aligning.
> Remove superfluous parentheses.

Discussed inline.


> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/platform/x86/acerhdf.c |   19 ++++++++-----------
>  1 files changed, 8 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/ac=
erhdf.c
> index 833c0ec..639db4d 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -262,12 +262,11 @@ static void acerhdf_change_fanstate(int state)
>  	unsigned char cmd;
> =20
>  	if (verbose)
> -		pr_notice("fan %s\n", (state =3D=3D ACERHDF_FAN_OFF) ?
> -				"OFF" : "ON");
> +		pr_notice("fan %s\n", state =3D=3D ACERHDF_FAN_OFF ? "OFF" : "ON")=
;

In my opinion the one with brackets is easier to read.


>  	if ((state !=3D ACERHDF_FAN_OFF) && (state !=3D ACERHDF_FAN_AUTO)) =
{
>  		pr_err("invalid fan state %d requested, setting to auto!\n",
> -			state);
> +		       state);

Is it written somewhere to use spaces instead of a tab in such cases? I=
 like=20
tab more. (1)


>  		state =3D ACERHDF_FAN_AUTO;
>  	}
> =20
> @@ -282,19 +281,18 @@ static void acerhdf_check_param(struct thermal_=
zone_device *thermal)
>  {
>  	if (fanon > ACERHDF_MAX_FANON) {
>  		pr_err("fanon temperature too high, set to %d\n",
> -				ACERHDF_MAX_FANON);
> +		       ACERHDF_MAX_FANON);

see (1). - but maybe one tab shall be removed.


>  		fanon =3D ACERHDF_MAX_FANON;
>  	}
> =20
>  	if (kernelmode && prev_interval !=3D interval) {
>  		if (interval > ACERHDF_MAX_INTERVAL) {
>  			pr_err("interval too high, set to %d\n",
> -				ACERHDF_MAX_INTERVAL);
> +			       ACERHDF_MAX_INTERVAL);

see (1).


>  			interval =3D ACERHDF_MAX_INTERVAL;
>  		}
>  		if (verbose)
> -			pr_notice("interval changed to: %d\n",
> -					interval);
> +			pr_notice("interval changed to: %d\n", interval);

I agree on this.


>  		thermal->polling_delay =3D interval*1000;
>  		prev_interval =3D interval;
>  	}
> @@ -605,8 +603,8 @@ static int acerhdf_check_hardware(void)
>  	}
> =20
>  	if (!bios_cfg) {
> -		pr_err("unknown (unsupported) BIOS version %s/%s/%s, "
> -			"please report, aborting!\n", vendor, product, version);
> +		pr_err("unknown (unsupported) BIOS version %s/%s/%s, please report=
, aborting!\n",
> +		       vendor, product, version);

disagree, as it exceeds 80 chars.


>  		return -EINVAL;
>  	}
> =20
> @@ -616,8 +614,7 @@ static int acerhdf_check_hardware(void)
>  	 */
>  	if (!kernelmode) {
>  		pr_notice("Fan control off, to enable do:\n");
> -		pr_notice("echo -n \"enabled\" > "
> -			"/sys/class/thermal/thermal_zone0/mode\n");
> +		pr_notice("echo -n \"enabled\" > /sys/class/thermal/thermal_zone0/=
mode\n");

disagree, as it exceeds 80 chars when using tabstop=3D8.


>  	}
> =20
>  	return 0;
> --=20
> 1.7.6.405.gc1be0
>=20

--
kind regards,
--peter;
