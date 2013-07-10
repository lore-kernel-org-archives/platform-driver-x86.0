From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Subject: Re: [tpmdd-devel] [PATCH 3/4] tpm: Convert tpm_tis driver to use dev_pm_ops from legacy pm_ops
Date: Thu, 11 Jul 2013 00:51:04 +0200
Message-ID: <201307110051.04726.PeterHuewe@gmx.de>
References: <1373429409-3944-1-git-send-email-shuah.kh@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:52573 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754474Ab3GJWnI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 10 Jul 2013 18:43:08 -0400
In-Reply-To: <1373429409-3944-1-git-send-email-shuah.kh@samsung.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: tpmdd-devel@lists.sourceforge.net
Cc: Shuah Khan <shuah.kh@samsung.com>, rafael.j.wysocki@intel.com, bhelgaas@google.com, a.zummo@towertech.it, key@linux.vnet.ibm.com, mail@srajiv.net, tpmdd@selhorst.net, tpmdd@sirrix.com, matthew.garrett@nebula.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, shuahkhan@gmail.com

Hi,

thanks for your patch
>  static struct pnp_device_id tpm_pnp_tbl[] = {
>  	{"PNP0C31", 0},		/* TPM */
>  	{"ATM1200", 0},		/* Atmel */
> @@ -835,9 +834,12 @@ static struct pnp_driver tis_pnp_driver = {
>  	.name = "tpm_tis",
>  	.id_table = tpm_pnp_tbl,
>  	.probe = tpm_tis_pnp_init,
> -	.suspend = tpm_tis_pnp_suspend,
> -	.resume = tpm_tis_pnp_resume,
>  	.remove = tpm_tis_pnp_remove,
> +#ifdef CONFIG_PM_SLEEP
> +	.driver	= {
> +		.pm = &tpm_tis_pm,
> +	},
> +#endif
>  };


I don't think the #if CONFIG_PM_SLEEP is required here.

Thanks,
Peter
