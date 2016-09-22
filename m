From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [patch v1] drivers/platform/x86: introduce support for Mellanox
 hotplug driver
Date: Thu, 22 Sep 2016 14:30:38 +0200
Message-ID: <20160922123038.GA2630@kroah.com>
References: <1474550067-142107-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42358 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751580AbcIVMad (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2016 08:30:33 -0400
Content-Disposition: inline
In-Reply-To: <1474550067-142107-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vadimp@mellanox.com
Cc: dvhart@infradead.org, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Thu, Sep 22, 2016 at 01:14:27PM +0000, vadimp@mellanox.com wrote:
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
>  MAINTAINERS                                   |   7 +
>  drivers/platform/x86/Kconfig                  |  10 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/mlxcpld-hotplug.c        | 543 ++++++++++++++++++++++++++
>  include/linux/platform_data/mlxcpld-hotplug.h |  90 +++++

Why do you need a platform_data .h file for a stand-alone driver?

thanks,

greg k-h
