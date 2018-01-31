From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 2/2] platform/x86: intel-vbtn: Replace License by SDPX
 identifier
Date: Wed, 31 Jan 2018 10:51:30 -0800
Message-ID: <20180131185130.GD8676@fury>
References: <20180131175407.18301-1-andriy.shevchenko@linux.intel.com>
 <20180131175407.18301-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180131175407.18301-2-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, AceLan Kao <acelan.kao@canonical.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 31, 2018 at 07:54:07PM +0200, Andy Shevchenko wrote:
> Replace License short header by SPDX identifier.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>


> ---
>  drivers/platform/x86/intel-vbtn.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 69bc39f8d61d..b703d6f5b099 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -1,19 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   *  Intel Virtual Button driver for Windows 8.1+
>   *
>   *  Copyright (C) 2016 AceLan Kao <acelan.kao@canonical.com>
>   *  Copyright (C) 2016 Alex Hung <alex.hung@canonical.com>
> - *
> - *  This program is free software; you can redistribute it and/or modify
> - *  it under the terms of the GNU General Public License as published by
> - *  the Free Software Foundation; either version 2 of the License, or
> - *  (at your option) any later version.
> - *
> - *  This program is distributed in the hope that it will be useful,
> - *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *  GNU General Public License for more details.
> - *
>   */
>  
>  #include <linux/acpi.h>
> -- 
> 2.15.1
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
