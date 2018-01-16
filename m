From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 1/3] platform/x86: move Mellanox hardware platform
 hotplug driver to platform/mellanox
Date: Mon, 15 Jan 2018 19:42:43 -0800
Message-ID: <20180116034243.GB4590@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <1515661123-76604-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42058 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751211AbeAPDms (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 22:42:48 -0500
Content-Disposition: inline
In-Reply-To: <1515661123-76604-2-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Thu, Jan 11, 2018 at 08:58:41AM +0000, Vadim Pasternak wrote:
> It moves drivers/platform/x86/mlxcpld-hotplug.c to
> drivers/platform/mellanox/mlxreg-hotplug.c and
> include/linux/platform_data/mlxcpld-hotplug.h to
> include/linux/platform_data/mlxreg.h for making hotplug driver usable for
> the different machine architectures.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
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

...

>  config MLX_PLATFORM
>  	tristate "Mellanox Technologies platform support"
> -	depends on X86_64

This seems like it would be more appropriately applied to 2/3 as this patch is
supposed to be just about the renaming of the files, methods, and defines from
CPLD to reg, and the creation of the mellanox platform.

Any reason this needs to be in this patch?

-- 
Darren Hart
VMware Open Source Technology Center
