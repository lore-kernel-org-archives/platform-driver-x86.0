From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RESEND RFC PATCH 1/5] platform: x86: add driver for UP Board
 I/O CPLD
Date: Fri, 22 Jul 2016 13:52:51 -0700
Message-ID: <20160722204525.GD3703@f23x64.localdomain>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
 <1467648434-29080-1-git-send-email-dan@emutex.com>
 <1467648434-29080-2-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39575 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751195AbcGVUwy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jul 2016 16:52:54 -0400
Content-Disposition: inline
In-Reply-To: <1467648434-29080-2-git-send-email-dan@emutex.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan O'Donovan <dan@emutex.com>
Cc: platform-driver-x86@vger.kernel.org, lee.jones@linaro.org, andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org

On Mon, Jul 04, 2016 at 05:07:10PM +0100, Dan O'Donovan wrote:
> The UP board utilises a CPLD between its Intel X5-Z8350 SoC and an
> external 40-pin header, to provide buffered voltage level-shifting
> of the I/O signals, mux switching and LED control, and programmable
> pin mapping between the SoC and the external pin header.
> 
> gpio, pinctrl and led drivers are provided in separate commits
> to manage the functions provided by that CPLD.
> 
> This commit registers a platform driver to manage the configuration
> of the CPLD itself.
> 
> Signed-off-by: Dan O'Donovan <dan@emutex.com>
> ---
>  drivers/platform/x86/up_board_cpld.c | 560 +++++++++++++++++++++++++++++++++++
>  drivers/platform/x86/up_board_cpld.h |  38 +++
>  2 files changed, 598 insertions(+)
>  create mode 100644 drivers/platform/x86/up_board_cpld.c
>  create mode 100644 drivers/platform/x86/up_board_cpld.h
> 
> diff --git a/drivers/platform/x86/up_board_cpld.c b/drivers/platform/x86/up_board_cpld.c
> new file mode 100644
> index 0000000..dc36d6a
> --- /dev/null
> +++ b/drivers/platform/x86/up_board_cpld.c
> @@ -0,0 +1,560 @@
> +/*
> + * UP Board I/O Header CPLD driver.
> + *
> + * Copyright (c) 2016, Emutex Ltd.  All rights reserved.
> + *
> + * Author: Dan O'Donovan <dan@emutex.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/gpio.h>
> +
> +#include "up_board_cpld.h"
> +#include "up_board_pinctrl.h"

Here you include up_board_pinctrl.h, but this file has not been introduced. The
build fails with 1/5 applied, breaking bisection.

Something to keep in mind as you relocate and refactor these drivers as we hear
back from the other maintainers. Each patch should build as you know, I'm sure
this was an error following a refactoring or something similar.

-- 
Darren Hart
Intel Open Source Technology Center
