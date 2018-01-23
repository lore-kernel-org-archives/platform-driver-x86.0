From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v10 4/6] platform/mellanox: mlxreg-hotplug: Modify to use
 a regmap interface
Date: Tue, 23 Jan 2018 14:58:17 -0800
Message-ID: <20180123225817.GB16464@fury>
References: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
 <1516739665-132304-4-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:38171 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932334AbeAWW6V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Jan 2018 17:58:21 -0500
Content-Disposition: inline
In-Reply-To: <1516739665-132304-4-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Tue, Jan 23, 2018 at 08:34:23PM +0000, Vadim Pasternak wrote:
> Restructure mlxreg header for unification of hotplug item definitions.
> 
> Unify hotplug items to allow any kind of item (power controller, fan
> eeprom, psu eeprom, asic health) in common way.
> 
> Use a hardware independent regmap interface, enabling the support of
> hotplug events over programmable devices attached to different bus
> types, such as I2C, LPC, or SPI. Add a device node to the
> mlxreg_core_data structure.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> v10->v9:
>  Fixes provided by Vadim:
>  - add missed description of pdev_hotplug for struct mlxplat_priv;

I didn't see this in the diff from my version to this one.

>  - remove struct mlxplat_mlxcpld_regmap_context, which contains only
>    the field with base address. Instead obtain locally defined base
>    address by devm_ioport_map in mlxplat_init and pass it to
>    devm_regmap_init;
>  - modify mlxplat_mlxcpld_reg_read/write to use directly pointer to
>    context;

Also adds incorrect conversion of tabs to spaces in at least 3 locations ...

I had also corrected various typos and the copyright statement, as well as
reworked the commit messages. So at this point, I'd rather see these as changes
on top of what I have cleaned up.

Please compare what you have here with:
https://github.com/dvhart/linux-pdx86/tree/review-dvhart-mellanox-v10

And send me any changes strictly on top of that.

Are you anticipating any additional changes beyond those in this version?

-- 
Darren Hart
VMware Open Source Technology Center
