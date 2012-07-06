From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 2/2] ACER: Fix Smatch double-free issue
Date: Fri, 06 Jul 2012 18:22:51 +0800
Message-ID: <1341570171.4823.373.camel@linux-s257.site>
References: <1341444610-15067-1-git-send-email-marex@denx.de>
	 <1341444610-15067-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:58109 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755829Ab2GFKXj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Jul 2012 06:23:39 -0400
In-Reply-To: <1341444610-15067-2-git-send-email-marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Fengguang Wu <wfg@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-07-05 =E6=96=BC 01:30 +0200=EF=BC=8CMa=
rek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> The patch 6ae3a0876185: "ACER: Add support for accelerometer sensor"
> from Jun 1, 2012, leads to the following Smatch warning:
> drivers/platform/x86/acer-wmi.c:1886 acer_wmi_accel_destroy()
>          error: don't call input_free_device() after input_unregister=
_device()
>=20
> drivers/platform/x86/acer-wmi.c
>   1883  static void acer_wmi_accel_destroy(void)
>   1884  {
>   1885          input_unregister_device(acer_wmi_accel_dev);
>   1886          input_free_device(acer_wmi_accel_dev);
>   1887  }
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: Fengguang Wu <wfg@linux.intel.com>
> Cc: joeyli <jlee@suse.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>


Acked-by: joeyli <jlee@suse.com>


Thanks
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c |    1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index ae969fd..f4ed2af 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1883,7 +1883,6 @@ err_free_dev:
>  static void acer_wmi_accel_destroy(void)
>  {
>  	input_unregister_device(acer_wmi_accel_dev);
> -	input_free_device(acer_wmi_accel_dev);
>  }
> =20
>  static int __init acer_wmi_input_setup(void)
