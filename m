From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v9 1/4] platform/x86: Move Mellanox hardware platform
 hotplug driver to platform/mellanox
Date: Mon, 22 Jan 2018 19:51:46 -0800
Message-ID: <20180123035146.GC24956@fury>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
 <1516213316-32278-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516213316-32278-2-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 17, 2018 at 06:21:53PM +0000, Vadim Pasternak wrote:
> It moves drivers/platform/x86/mlxcpld-hotplug.c to
> drivers/platform/mellanox/mlxreg-hotplug.c and
> include/linux/platform_data/mlxcpld-hotplug.h to
> include/linux/platform_data/mlxreg.h for making hotplug driver usable for
> the different machine architectures.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> v9->v8:
>  Comments pointed out by Darren:
>  - make removing of X86_64 dependency of mlx-platform to a separate patch
>    since it is not related to the moving hotplug driver to
>    platform/mellanox;
> v7->v8:
> v6->v7:
>  Fixes added by Vadim:
>  - remove dependency on X86_64 to allow also X86 architecture;
> v5->v6:
>  Fixes added by Vadim:
>  - add SPD license record to Kconfig and Makefile;
> v4->v5:
>  Comments pointed out by Andy:
>  - arrange MAINTAINERS in correct alphabetic order;
> v3->v4:
>  Comments pointed out by Darren:
>  - Refactor the patches to provide the changes in patchset in incremental
>    order;
>  - Modify MAINTAINERS records;
>  - Use git-mv for the replaced files;
>   Commnets pointed out by Colin:
>  - Make structures mlxplat_dev and mlxplat_hotplug static;
> ---
>  MAINTAINERS                                        |   7 +-
>  drivers/platform/Kconfig                           |   2 +
>  drivers/platform/Makefile                          |   1 +
>  drivers/platform/mellanox/Kconfig                  |  25 +++
>  drivers/platform/mellanox/Makefile                 |   6 +
>  .../mlxreg-hotplug.c}                              | 223 ++++++++++-----------
>  drivers/platform/x86/Kconfig                       |   8 -
>  drivers/platform/x86/Makefile                      |   1 -
>  drivers/platform/x86/mlx-platform.c                |  18 +-
>  .../platform_data/{mlxcpld-hotplug.h => mlxreg.h}  |  25 ++-
>  10 files changed, 170 insertions(+), 146 deletions(-)
>  create mode 100644 drivers/platform/mellanox/Kconfig
>  create mode 100644 drivers/platform/mellanox/Makefile
>  rename drivers/platform/{x86/mlxcpld-hotplug.c => mellanox/mlxreg-hotplug.c} (65%)
>  rename include/linux/platform_data/{mlxcpld-hotplug.h => mlxreg.h} (84%)
> 

...

> diff --git a/drivers/platform/x86/mlxcpld-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> similarity index 65%
> rename from drivers/platform/x86/mlxcpld-hotplug.c
> rename to drivers/platform/mellanox/mlxreg-hotplug.c
> index aff3686..2866c76 100644
> --- a/drivers/platform/x86/mlxcpld-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -1,7 +1,6 @@
>  /*
> - * drivers/platform/x86/mlxcpld-hotplug.c
> - * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
> - * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
> + * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
> + * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>

Copyright should persist across git rename. I've updated this to 2016-2018 on
both lines.

>  /* Offset of event and mask registers from status register */
> -#define MLXCPLD_HOTPLUG_EVENT_OFF	1
> -#define MLXCPLD_HOTPLUG_MASK_OFF	2
> -#define MLXCPLD_HOTPLUG_AGGR_MASK_OFF	1
> +#define MLXREG_HOTPLUG_EVENT_OFF	1
> +#define MLXREG_HOTPLUG_MASK_OFF	2
> +#define MLXREG_HOTPLUG_AGGR_MASK_OFF	1

This, and much of what follows, is an additional change from the move, but it is
not called out in the changelog. I've added a note to the changelog about
renaming from MLXCPLD to MLXREG.

No need to resend.

-- 
Darren Hart
VMware Open Source Technology Center
