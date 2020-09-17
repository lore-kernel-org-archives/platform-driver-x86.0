From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 13/13] x86/platform/uv: Update Copyrights to conform
 to HPE standards
Date: Thu, 17 Sep 2020 09:54:29 +0200
Message-ID: <20200917075429.GB3333802@kroah.com>
References: <20200916192039.162934-1-mike.travis@hpe.com>
 <20200916192039.162934-14-mike.travis@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200916192039.162934-14-mike.travis@hpe.com>
To: Mike Travis <mike.travis@hpe.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 16, 2020 at 02:20:39PM -0500, Mike Travis wrote:
> Add Copyrights to those files that have been updated for UV5 changes.
> 
> Signed-off-by: Mike Travis <mike.travis@hpe.com>
> ---
>  arch/x86/include/asm/uv/bios.h      | 1 +
>  arch/x86/include/asm/uv/uv_hub.h    | 1 +
>  arch/x86/include/asm/uv/uv_mmrs.h   | 1 +
>  arch/x86/kernel/apic/x2apic_uv_x.c  | 1 +
>  arch/x86/platform/uv/bios_uv.c      | 1 +
>  arch/x86/platform/uv/uv_nmi.c       | 1 +
>  arch/x86/platform/uv/uv_time.c      | 1 +
>  drivers/misc/sgi-gru/grufile.c      | 1 +
>  drivers/misc/sgi-xp/xp.h            | 1 +
>  drivers/misc/sgi-xp/xp_main.c       | 1 +
>  drivers/misc/sgi-xp/xp_uv.c         | 1 +
>  drivers/misc/sgi-xp/xpc_main.c      | 1 +
>  drivers/misc/sgi-xp/xpc_partition.c | 1 +
>  drivers/misc/sgi-xp/xpnet.c         | 1 +
>  14 files changed, 14 insertions(+)
> 
> diff --git a/arch/x86/include/asm/uv/bios.h b/arch/x86/include/asm/uv/bios.h
> index 97ac595ebc6a..08b3d810dfba 100644
> --- a/arch/x86/include/asm/uv/bios.h
> +++ b/arch/x86/include/asm/uv/bios.h
> @@ -5,6 +5,7 @@
>  /*
>   * UV BIOS layer definitions.
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (C) 2007-2017 Silicon Graphics, Inc. All rights reserved.
>   * Copyright (c) Russ Anderson <rja@sgi.com>

Gotta love the different ways of text here :(

Anyway, much better than before, thanks.

greg k-h
