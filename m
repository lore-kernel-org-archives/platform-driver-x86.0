From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/mellanox: fix the mlx-bootctl sysfs
Date: Wed, 18 Dec 2019 15:00:59 +0200
Message-ID: <CAHp75VfVL8fs_VXQgL85QPnW2N+zsLq4dWYkhs3xdMAjcfRgTg@mail.gmail.com>
References: <94727fab054309cd98c876748fd27b130ce5031f.1575918870.git.lsun@mellanox.com>
 <1576250484-27291-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576250484-27291-1-git-send-email-lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Dec 13, 2019 at 5:21 PM Liming Sun <lsun@mellanox.com> wrote:

> +       ret = sysfs_create_group(&dev->kobj, &mlxbf_bootctl_group);
> +       if (ret) {
> +               dev_err(dev, "failed to create attributes, err=%d\n", ret);
> +               return ret;
> +       }
> +
>         /* Ensure we have the UUID we expect for this service. */
>         arm_smccc_smc(MLXBF_BOOTCTL_SIP_SVC_UID, 0, 0, 0, 0, 0, 0, 0, &res);
>         guid_parse(mlxbf_bootctl_svc_uuid_str, &guid);
> @@ -305,8 +312,16 @@ static int mlxbf_bootctl_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int mlxbf_bootctl_remove(struct platform_device *pdev)
> +{
> +       sysfs_remove_group(&pdev->dev.kobj, &mlxbf_bootctl_group);
> +
> +       return 0;
> +}
> +
>  static struct platform_driver mlxbf_bootctl_driver = {
>         .probe = mlxbf_bootctl_probe,
> +       .remove = mlxbf_bootctl_remove,
>         .driver = {
>                 .name = "mlxbf-bootctl",
>                 .groups = mlxbf_bootctl_groups,

Please, use dev_groups member of the struct driver instead of above approach.

-- 
With Best Regards,
Andy Shevchenko
