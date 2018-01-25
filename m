From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v11 10/12] platform/x86: mlx-platform: Extend register
 map configuration with IO access verification callbacks
Date: Thu, 25 Jan 2018 14:16:01 -0800
Message-ID: <20180125221601.GD24122@fury>
References: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
 <1516826098-125036-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59591 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751174AbeAYWQF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jan 2018 17:16:05 -0500
Content-Disposition: inline
In-Reply-To: <1516826098-125036-2-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Wed, Jan 24, 2018 at 08:34:56PM +0000, Vadim Pasternak wrote:
> Add definitions for hotplug device masks and events offsets.
> 
> Extend register map configuration with the sets of writable, readable and
> volatile registers to allow verification prior to the access.
> 
> Extend register map configuration with cache type field: use flat type.

This says "what" you're doing, but not why. The point of the change log is to
help the reviewer or some future debugger to understand not WHAT you did (we
have that in the code below) but WHY you did it - keeping in mind that we likely
haven't spent the time you have to understand what the right thing is to do
here, so share with us the result of your research.

"Extend register map configuration with cache type field: use flat type, in
order to XXXXXXXXXX".

Please keep in mind for future patches.

...

> +
>  static int
>  mlxplat_mlxcpld_reg_read(void *context, unsigned int reg, unsigned int *val)
>  {
> @@ -317,6 +384,10 @@ static const struct regmap_config mlxplat_mlxcpld_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
>  	.max_register = 255,
> +	.cache_type = REGCACHE_FLAT,

-- 
Darren Hart
VMware Open Source Technology Center
