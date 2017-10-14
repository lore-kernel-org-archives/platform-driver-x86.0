From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: intel_telemetry: Fix load failure info
Date: Sat, 14 Oct 2017 17:10:41 +0300
Message-ID: <CAHp75Vcx5DKu+mT1E9XFHOH+UBinhtM8F_KDdYRNbo95iK75LQ@mail.gmail.com>
References: <1507629919-31299-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:46470 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753178AbdJNOKn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 14 Oct 2017 10:10:43 -0400
In-Reply-To: <1507629919-31299-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

On Tue, Oct 10, 2017 at 1:05 PM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
> Intel Telemetry driver depends on IPC1 interface. If IPC1 interface is
> disabled on a given platform by the system firmware, the driver does not
> load but prints misleading information in the dmesg logs.

All pushed to my review queue, thanks!

>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> ---
>  drivers/platform/x86/intel_telemetry_pltdrv.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
> index e0424d5a795a..136507a0d391 100644
> --- a/drivers/platform/x86/intel_telemetry_pltdrv.c
> +++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
> @@ -1234,7 +1234,6 @@ static struct platform_driver telemetry_soc_driver = {
>
>  static int __init telemetry_module_init(void)
>  {
> -       pr_info(DRIVER_NAME ": version %s loaded\n", DRIVER_VERSION);
>         return platform_driver_register(&telemetry_soc_driver);
>  }
>
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
