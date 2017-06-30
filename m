From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_telemetry_debugfs: fix some error
 codes in init
Date: Fri, 30 Jun 2017 19:17:57 +0300
Message-ID: <CAHp75Vd9EVkThvxE8RDdr3D3M8dbPvYXRgtLri9c-z4qxFXLtQ@mail.gmail.com>
References: <20170630075218.m4eal2iqu5i2skx5@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:33474 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751874AbdF3QR7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Jun 2017 12:17:59 -0400
In-Reply-To: <20170630075218.m4eal2iqu5i2skx5@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jun 30, 2017 at 10:52 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> There are bunch of "goto out;" paths where we don't set the error code.
>

Applied for testing, thanks!

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
> index 4cc2f4ea0a25..b8be058a8754 100644
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@ -938,7 +938,7 @@ static struct notifier_block pm_notifier = {
>  static int __init telemetry_debugfs_init(void)
>  {
>         const struct x86_cpu_id *id;
> -       int err = -ENOMEM;
> +       int err;
>         struct dentry *f;
>
>         /* Only APL supported for now */
> @@ -958,11 +958,10 @@ static int __init telemetry_debugfs_init(void)
>
>         register_pm_notifier(&pm_notifier);
>
> +       err = -ENOMEM;
>         debugfs_conf->telemetry_dbg_dir = debugfs_create_dir("telemetry", NULL);
> -       if (!debugfs_conf->telemetry_dbg_dir) {
> -               err = -ENOMEM;
> +       if (!debugfs_conf->telemetry_dbg_dir)
>                 goto out_pm;
> -       }
>
>         f = debugfs_create_file("pss_info", S_IFREG | S_IRUGO,
>                                 debugfs_conf->telemetry_dbg_dir, NULL,



-- 
With Best Regards,
Andy Shevchenko
