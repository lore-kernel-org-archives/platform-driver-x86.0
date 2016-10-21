From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v3] drivers/platform/x86: introduce support for Mellanox
 hotplug driver
Date: Fri, 21 Oct 2016 11:42:08 -0700
Message-ID: <20161021184208.GB91380@f23x64.localdomain>
References: <1476980881-62938-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37440 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935154AbcJUSmM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Oct 2016 14:42:12 -0400
Content-Disposition: inline
In-Reply-To: <1476980881-62938-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vadimp@mellanox.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Thu, Oct 20, 2016 at 04:28:01PM +0000, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
> 
> Enable system support for the Mellanox Technologies hotplug platform
> driver, which provides support for the next Mellanox basic systems:
> "msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> "msb7800", "msn2740", "msn2100" and also various number of derivative
> systems from the above basic types.
> This driver handles hot-plug events for the power suppliers, power
> cables and fans for the above systems.
> 
> The Kconfig currently controlling compilation of this code is:
> driver/platform/x86:config MLX_CPLD_PLATFORM
>                        tristate "Mellanox platform hotplug driver support"
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
> v1->v2:
>  Comments pointed out by Darren:
>  - remove whitespaces in config;
>  - remove redundant includes for header files;
>  - fix comments styling;
>  - fix register value assignment in mlxcpld_hotplug_attr_show;
>  - mlxcpld_hotplug_attr_init - use local aliases to reduce line length;
>  - Add fields description in the struct mlxcpld_hotplug_device;
> v2->v3:
>  Comments pointed out by Darren:
>   - Fix structures and enum comments in mlxcpld-hotplug.c according to
>     Documentation/kernel-documentation.rst guideline;
>   - Assign and mask aggregation status in mlxcpld_hotplug_work_handler on
>     the same line.
>   - Refactor mlxcpld_hotplug_work_handler. Make common helper routine for
>     each attribute type.
>   - Produce error message in case signal is not expected.
>   - Fix header file according to Documentation/kernel-documentation.rst
>     guideline;

>  Fix added by Vadim:
> 	Fix re-scheduling flow for possibly missed signals. By mistake it
> 	was coupled with FAN.

Thanks Vadim. Merged to for-next for 4.10.

Also for 4.10, it would be good to move mlx-platform out of arch/x86/platform to
drivers/platform/x86 as it isn't an architectural driver. Would you be able to
prepare the patch?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
