From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH] platform: olpc: make ec explicitly non-modular
Date: Mon, 15 Aug 2016 18:01:20 -0700
Message-ID: <20160815180120.24e46394@e7450.queued.net>
References: <20160815222517.1348-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from spindle.queued.net ([45.33.49.30]:53173 "EHLO
	spindle.queued.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751244AbcHPBHn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Aug 2016 21:07:43 -0400
In-Reply-To: <20160815222517.1348-1-paul.gortmaker@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

Fine by me.

Acked-by: Andres Salomon <dilinger@queued.net>

On Mon, 15
Aug 2016 18:25:17 -0400 Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> The Kconfig entry controlling compilation of this code is:
> 
> arch/x86/Kconfig:config OLPC
> arch/x86/Kconfig:       bool "One Laptop Per Child support"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andres Salomon <dilinger@queued.net>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/platform/olpc/olpc-ec.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/olpc/olpc-ec.c
> b/drivers/platform/olpc/olpc-ec.c index f99b183d5296..374a8028fec7
> 100644 --- a/drivers/platform/olpc/olpc-ec.c
> +++ b/drivers/platform/olpc/olpc-ec.c
> @@ -1,6 +1,8 @@
>  /*
>   * Generic driver for the OLPC Embedded Controller.
>   *
> + * Author: Andres Salomon <dilinger@queued.net>
> + *
>   * Copyright (C) 2011-2012 One Laptop per Child Foundation.
>   *
>   * Licensed under the GPL v2 or later.
> @@ -12,7 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/list.h>
>  #include <linux/olpc-ec.h>
>  #include <asm/olpc.h>
> @@ -326,8 +328,4 @@ static int __init olpc_ec_init_module(void)
>  {
>  	return platform_driver_register(&olpc_ec_plat_driver);
>  }
> -
>  arch_initcall(olpc_ec_init_module);
> -
> -MODULE_AUTHOR("Andres Salomon <dilinger@queued.net>");
> -MODULE_LICENSE("GPL");
