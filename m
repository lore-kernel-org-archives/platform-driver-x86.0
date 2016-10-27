From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [patch v1 1/2] drivers/platform/x86: move module mlx-platform
 from arch/x86 to drivers/platform/x86
Date: Thu, 27 Oct 2016 16:59:10 +0300
Message-ID: <1477576750.5295.28.camel@linux.intel.com>
References: <1477576758-102003-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:52832 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933628AbcJ0N7Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2016 09:59:16 -0400
In-Reply-To: <1477576758-102003-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vadimp@mellanox.com, dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Thu, 2016-10-27 at 13:59 +0000, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
> 
> Move module mlx-platform.c from arch/x86/platform/mellanox/ to
> drivers/platform/x86/.
> Remove folder arch/x86/platform/mellanox/ and update relevant Makefile
> and Kconfig.

No way, please use -M -C.

> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  MAINTAINERS                               |   2 +-
>  arch/x86/Kconfig                          |  12 --
>  arch/x86/platform/Makefile                |   1 -
>  arch/x86/platform/mellanox/Makefile       |   1 -
>  arch/x86/platform/mellanox/mlx-platform.c | 266 -------------------
> -----------
>  drivers/platform/x86/Kconfig              |  14 +-
>  drivers/platform/x86/Makefile             |   1 +
>  drivers/platform/x86/mlx-platform.c       | 266
> ++++++++++++++++++++++++++++++
>  8 files changed, 281 insertions(+), 282 deletions(-)
>  delete mode 100644 arch/x86/platform/mellanox/Makefile
>  delete mode 100644 arch/x86/platform/mellanox/mlx-platform.c
>  create mode 100644 drivers/platform/x86/mlx-platform.c


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
