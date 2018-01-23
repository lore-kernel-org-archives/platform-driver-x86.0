From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v9 3/4] platform/mellanox: mlxreg-hotplug: Code cleanup
Date: Mon, 22 Jan 2018 20:03:10 -0800
Message-ID: <20180123040310.GE24956@fury>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
 <1516213316-32278-4-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59855 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751195AbeAWEDO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 23:03:14 -0500
Content-Disposition: inline
In-Reply-To: <1516213316-32278-4-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Wed, Jan 17, 2018 at 06:21:55PM +0000, Vadim Pasternak wrote:
> Removing unnecessary includes.
...
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index 2866c76..556e612 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -41,8 +41,6 @@
>  #include <linux/module.h>
>  #include <linux/platform_data/mlxreg.h>
>  #include <linux/platform_device.h>
> -#include <linux/spinlock.h>

But spinlock IS required. Just because some other include eventually also
includes it doesn't meet we can drop it here. We use functions defined in
spinlock.h, so it needs to be included.

I've updated this in my branch...

-- 
Darren Hart
VMware Open Source Technology Center
