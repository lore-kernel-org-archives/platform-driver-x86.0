From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v7 3/3] platform/mellanox: mlxreg-hotplug: modify to use
 regmap intreface
Date: Mon, 15 Jan 2018 12:15:28 -0800
Message-ID: <20180115201528.GA10860@fury>
References: <1515420999-4133-4-git-send-email-vadimp@mellanox.com>
 <201801101447.LGVbZ8Xz%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:51065 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbeAOUPg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 15:15:36 -0500
Content-Disposition: inline
In-Reply-To: <201801101447.LGVbZ8Xz%fengguang.wu@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, kbuild-all@01.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Wed, Jan 10, 2018 at 03:12:48PM +0800, kbuild test robot wrote:
> Hi Vadim,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on platform-drivers-x86/for-next]
> [cannot apply to linus/master]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Vadim-Pasternak/rivers-platform-replace-module-x86-mlxcpld-hotplug-with-mellanox-mlxreg-hotplug/20180110-115215
> base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=ia64 
> 
> All errors (new ones prefixed by >>):

...

>    ERROR: "ia64_delay_loop" [drivers/spi/spi-thunderx.ko] undefined!
> >> ERROR: "of_update_property" [drivers/platform/mellanox/mlxreg-hotplug.ko] undefined!
>    ERROR: "ia64_delay_loop" [drivers/net/phy/mdio-cavium.ko] undefined!

Vadim, three undefined errors. Assuming you successfully built the drivers prior
to submission, this is likely due to a Kconfig dependency missing. Please
correct and resubmit.

> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Darren Hart
VMware Open Source Technology Center
