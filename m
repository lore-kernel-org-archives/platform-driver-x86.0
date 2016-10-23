From: Darren Hart <dvhart@infradead.org>
Subject: Re: [platform-drivers-x86:for-next 1/1] ERROR:
 "devm_hwmon_device_register_with_groups"
 [drivers/platform/x86/mlxcpld-hotplug.ko] undefined!
Date: Sun, 23 Oct 2016 07:50:25 -0700
Message-ID: <20161023145025.GB120221@f23x64.localdomain>
References: <201610230328.IieEHVjC%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57462 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753020AbcJWOuO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Oct 2016 10:50:14 -0400
Content-Disposition: inline
In-Reply-To: <201610230328.IieEHVjC%fengguang.wu@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, kbuild-all@01.org, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Sun, Oct 23, 2016 at 03:07:36AM +0800, kbuild test robot wrote:
> tree:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next
> head:   3c294d95beca17846eee58084ec92553ec2af009
> commit: 3c294d95beca17846eee58084ec92553ec2af009 [1/1] platform/x86: Introduce support for Mellanox hotplug driver
> config: x86_64-randconfig-x005-201643 (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         git checkout 3c294d95beca17846eee58084ec92553ec2af009
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All errors (new ones prefixed by >>):
> 
> >> ERROR: "devm_hwmon_device_register_with_groups" [drivers/platform/x86/mlxcpld-hotplug.ko] undefined!

Vadim, please prioritize a fix for this issue and submit it as a stand-alone
fix. I will likely roll it in to the existing patch to avoid breaking builds,
but I'd like to review the patch independently.


-- 
Darren Hart
Intel Open Source Technology Center
