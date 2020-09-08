From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 03/12] x86/platform/uv: Adjust references in UV kernel
 modules
Date: Tue, 8 Sep 2020 17:22:07 +0200
Message-ID: <20200908152207.GC4114051@kroah.com>
References: <20200907185430.363197758@hpe.com>
 <20200907185430.685975987@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200907185430.685975987@hpe.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Travis <mike.travis@hpe.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 07, 2020 at 01:54:33PM -0500, Mike Travis wrote:
> There is a symbol clash from the auto-generated uv_mmrs.h file that
> clashes with code in the UV kernel modules (is_uv() is the symbol).
> Change those prior to the symbol clash so as to not cause a compile error.
> 
> Signed-off-by: Mike Travis <mike.travis@hpe.com>
> Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
> Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
> ---
>  drivers/misc/sgi-xp/xp.h            |   11 ++++++-----
>  drivers/misc/sgi-xp/xp_main.c       |    7 ++++---
>  drivers/misc/sgi-xp/xp_uv.c         |    9 ++++++---
>  drivers/misc/sgi-xp/xpc_main.c      |    9 +++++----
>  drivers/misc/sgi-xp/xpc_partition.c |    5 +++--
>  drivers/misc/sgi-xp/xpnet.c         |    5 +++--
>  6 files changed, 27 insertions(+), 19 deletions(-)
> 
> --- linux.orig/drivers/misc/sgi-xp/xp.h
> +++ linux/drivers/misc/sgi-xp/xp.h
> @@ -3,7 +3,8 @@
>   * License.  See the file "COPYING" in the main directory of this archive
>   * for more details.
>   *
> - * Copyright (C) 2004-2008 Silicon Graphics, Inc. All rights reserved.
> + * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
> + * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.

This change does not make sense.  If you want to make it, please make it
in a separate patch that justifies the dates being added here please.

thanks,

greg k-h
