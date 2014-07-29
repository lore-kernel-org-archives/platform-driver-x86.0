From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 04/15] acer-wmi: Hide acer_{suspend,resume} for
 !CONFIG_PM_SLEEP
Date: Tue, 29 Jul 2014 11:21:59 +0800
Message-ID: <20140729032159.GN24967@linux-rxt1.site>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
 <1405532597-28262-5-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:37271 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751730AbaG2D12 (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Mon, 28 Jul 2014 23:27:28 -0400
Content-Disposition: inline
In-Reply-To: <1405532597-28262-5-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mathias Krause <minipli@googlemail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

On Wed, Jul 16, 2014 at 07:43:06PM +0200, Mathias Krause wrote:
> Encapsulate acer_suspend() and acer_resume with #ifdef CONFIG_PM_SLEE=
P
> to get rid of the following warnings:
>=20
>   ../acer-wmi.c:2046:12: warning: =E2=80=98acer_suspend=E2=80=99 defi=
ned but not used [-Wunused-function]
>   ../acer-wmi.c:2068:12: warning: =E2=80=98acer_resume=E2=80=99 defin=
ed but not used [-Wunused-function]
>=20
> Signed-off-by: Mathias Krause <minipli@googlemail.com>
> Cc: "Lee, Chun-Yi" <jlee@suse.com>

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>


Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index fde69ee63f..0d18c23d66 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -2044,6 +2044,7 @@ static int acer_platform_remove(struct platform=
_device *device)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_PM_SLEEP
>  static int acer_suspend(struct device *dev)
>  {
>  	u32 value;
> @@ -2084,6 +2085,10 @@ static int acer_resume(struct device *dev)
> =20
>  	return 0;
>  }
> +#else
> +#define acer_suspend	NULL
> +#define acer_resume	NULL
> +#endif
> =20
>  static SIMPLE_DEV_PM_OPS(acer_pm, acer_suspend, acer_resume);
> =20
> --=20
> 1.7.10.4
>=20
