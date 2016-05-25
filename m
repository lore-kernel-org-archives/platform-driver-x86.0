From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6] platform:x86: Add PMC Driver for Intel Core SoC
Date: Wed, 25 May 2016 23:37:21 +0300
Message-ID: <CAHp75Vcqxreujm9+D2JpAGkbyYZJ+uvKXjcSb_Dqcs96Y0n2_Q@mail.gmail.com>
References: <1464198292-32356-1-git-send-email-rajneesh.bhardwaj@intel.com>
	<20160525201353.GA109010@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33941 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750867AbcEYUyM convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 16:54:12 -0400
In-Reply-To: <20160525201353.GA109010@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, dbasehore@google.com, vishwanath.somayaji@intel.com

On Wed, May 25, 2016 at 11:13 PM, Darren Hart <dvhart@infradead.org> wr=
ote:
> On Wed, May 25, 2016 at 11:14:52PM +0530, Rajneesh Bhardwaj wrote:

> Hi Rajneesh,
>
> Unfortunately during my build test, this introduced a new warning to =
the build:
>
> drivers/platform/x86/intel_pmc_core.c:201:19: warning: =E2=80=98intel=
_pmc_core_init=E2=80=99
> defined but not used [-Wunused-function]
>  static int __init intel_pmc_core_init(void)
>
> After the removal of the module stuff, the driver needed a device_ini=
tcall, or
> the macro equivalent, consider:
>
> $ git diff
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform=
/x86/intel_pmc_core.c
> index c834281..f6a29b9 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -198,7 +198,4 @@ static struct pci_driver intel_pmc_core_driver =3D=
 {

>         .remove =3D NULL, /* not a hot-plug capable driver */

Since it requires an update I would suggest to remove above line comple=
tely.

>  };
>
> -static int __init intel_pmc_core_init(void)
> -{
> -       return pci_register_driver(&intel_pmc_core_driver);
> -}
> +builtin_pci_driver(intel_pmc_core_driver);

--=20
With Best Regards,
Andy Shevchenko
