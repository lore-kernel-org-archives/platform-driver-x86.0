From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] platform/mellanox: fix the mlx-bootctl sysfs
Date: Wed, 18 Dec 2019 19:59:43 +0200
Message-ID: <CAHp75VfYwxviATZnmYcgzkKKGw47ki=BZQYw4xRmUrfNqsiBww@mail.gmail.com>
References: <94727fab054309cd98c876748fd27b130ce5031f.1575918870.git.lsun@mellanox.com>
 <1576682676-31957-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576682676-31957-1-git-send-email-lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 18, 2019 at 5:25 PM Liming Sun <lsun@mellanox.com> wrote:
>
> This is a follow-up commit for the sysfs attributes to change
> from DRIVER_ATTR to DEVICE_ATTR according to some initial comments.
> In such case, it's better to point the sysfs path to the device
> itself instead of the driver. The ABI document is also updated.
>
> Fixes: 79e29cb8fbc5 ("platform/mellanox: Add bootctl driver for Mellanox BlueField Soc")
> Signed-off-by: Liming Sun <lsun@mellanox.com>

...

> -ATTRIBUTE_GROUPS(mlxbf_bootctl);

What's wrong with above macro?

> +static const struct attribute_group mlxbf_bootctl_group = {
> +       .attrs  = mlxbf_bootctl_attrs,
> +};

...

> +static const struct attribute_group *mlxbf_bootctl_dev_groups[] = {
> +       &mlxbf_bootctl_group,
> +       NULL
> +};

-- 
With Best Regards,
Andy Shevchenko
