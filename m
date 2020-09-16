From: Steve Wahl <steve.wahl@hpe.com>
Subject: Re: [PATCH v2 13/13] x86/platform/uv: Update Copyrights to conform
 to HPE standards
Date: Wed, 16 Sep 2020 16:19:15 -0500
Message-ID: <20200916211915.GP362364@swahl-home.5wahls.com>
References: <20200916192039.162934-1-mike.travis@hpe.com>
 <20200916192039.162934-14-mike.travis@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200916192039.162934-14-mike.travis@hpe.com>
To: Mike Travis <mike.travis@hpe.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Acked-by: Steve Wahl <steve.wahl@hpe.com>

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
>   */
> diff --git a/arch/x86/include/asm/uv/uv_hub.h b/arch/x86/include/asm/uv/uv_hub.h
> index 610bda21a8d9..5002f52be332 100644
> --- a/arch/x86/include/asm/uv/uv_hub.h
> +++ b/arch/x86/include/asm/uv/uv_hub.h
> @@ -5,6 +5,7 @@
>   *
>   * SGI UV architectural definitions
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (C) 2007-2014 Silicon Graphics, Inc. All rights reserved.
>   */
>  
> diff --git a/arch/x86/include/asm/uv/uv_mmrs.h b/arch/x86/include/asm/uv/uv_mmrs.h
> index 06ea2d1aaa3e..57fa67373262 100644
> --- a/arch/x86/include/asm/uv/uv_mmrs.h
> +++ b/arch/x86/include/asm/uv/uv_mmrs.h
> @@ -5,6 +5,7 @@
>   *
>   * HPE UV MMR definitions
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (C) 2007-2016 Silicon Graphics, Inc. All rights reserved.
>   */
>  
> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
> index 0c97315bf864..7c895991389c 100644
> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
> @@ -5,6 +5,7 @@
>   *
>   * SGI UV APIC functions (note: not an Intel compatible APIC)
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (C) 2007-2014 Silicon Graphics, Inc. All rights reserved.
>   */
>  #include <linux/crash_dump.h>
> diff --git a/arch/x86/platform/uv/bios_uv.c b/arch/x86/platform/uv/bios_uv.c
> index b148b4c8c2ec..54511eaccf4d 100644
> --- a/arch/x86/platform/uv/bios_uv.c
> +++ b/arch/x86/platform/uv/bios_uv.c
> @@ -2,6 +2,7 @@
>  /*
>   * BIOS run time interface routines.
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (C) 2007-2017 Silicon Graphics, Inc. All rights reserved.
>   * Copyright (c) Russ Anderson <rja@sgi.com>
>   */
> diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nmi.c
> index eac26feb0461..0f5cbcf0da63 100644
> --- a/arch/x86/platform/uv/uv_nmi.c
> +++ b/arch/x86/platform/uv/uv_nmi.c
> @@ -2,6 +2,7 @@
>  /*
>   * SGI NMI support routines
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (C) 2007-2017 Silicon Graphics, Inc. All rights reserved.
>   * Copyright (c) Mike Travis
>   */
> diff --git a/arch/x86/platform/uv/uv_time.c b/arch/x86/platform/uv/uv_time.c
> index e94436ba3022..a39e0f394c0e 100644
> --- a/arch/x86/platform/uv/uv_time.c
> +++ b/arch/x86/platform/uv/uv_time.c
> @@ -2,6 +2,7 @@
>  /*
>   * SGI RTC clock/timer routines.
>   *
> + *  (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   *  Copyright (c) 2009-2013 Silicon Graphics, Inc.  All Rights Reserved.
>   *  Copyright (c) Dimitri Sivanich
>   */
> diff --git a/drivers/misc/sgi-gru/grufile.c b/drivers/misc/sgi-gru/grufile.c
> index 18aa8c877bf8..7ffcfc0bb587 100644
> --- a/drivers/misc/sgi-gru/grufile.c
> +++ b/drivers/misc/sgi-gru/grufile.c
> @@ -7,6 +7,7 @@
>   * This file supports the user system call for file open, close, mmap, etc.
>   * This also incudes the driver initialization code.
>   *
> + *  (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   *  Copyright (c) 2008-2014 Silicon Graphics, Inc.  All Rights Reserved.
>   */
>  
> diff --git a/drivers/misc/sgi-xp/xp.h b/drivers/misc/sgi-xp/xp.h
> index 0af267baf031..7d839d844847 100644
> --- a/drivers/misc/sgi-xp/xp.h
> +++ b/drivers/misc/sgi-xp/xp.h
> @@ -3,6 +3,7 @@
>   * License.  See the file "COPYING" in the main directory of this archive
>   * for more details.
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (C) 2004-2008 Silicon Graphics, Inc. All rights reserved.
>   */
>  
> diff --git a/drivers/misc/sgi-xp/xp_main.c b/drivers/misc/sgi-xp/xp_main.c
> index 33558555820d..049c9aef0559 100644
> --- a/drivers/misc/sgi-xp/xp_main.c
> +++ b/drivers/misc/sgi-xp/xp_main.c
> @@ -3,6 +3,7 @@
>   * License.  See the file "COPYING" in the main directory of this archive
>   * for more details.
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (c) 2004-2008 Silicon Graphics, Inc.  All Rights Reserved.
>   */
>  
> diff --git a/drivers/misc/sgi-xp/xp_uv.c b/drivers/misc/sgi-xp/xp_uv.c
> index 118aef64518d..d28ffb1c7ade 100644
> --- a/drivers/misc/sgi-xp/xp_uv.c
> +++ b/drivers/misc/sgi-xp/xp_uv.c
> @@ -3,6 +3,7 @@
>   * License.  See the file "COPYING" in the main directory of this archive
>   * for more details.
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (c) 2008 Silicon Graphics, Inc.  All Rights Reserved.
>   */
>  
> diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
> index f533ded72941..5a8097e717ae 100644
> --- a/drivers/misc/sgi-xp/xpc_main.c
> +++ b/drivers/misc/sgi-xp/xpc_main.c
> @@ -3,6 +3,7 @@
>   * License.  See the file "COPYING" in the main directory of this archive
>   * for more details.
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (c) 2004-2009 Silicon Graphics, Inc.  All Rights Reserved.
>   */
>  
> diff --git a/drivers/misc/sgi-xp/xpc_partition.c b/drivers/misc/sgi-xp/xpc_partition.c
> index c21d48fd65cd..615aa731053b 100644
> --- a/drivers/misc/sgi-xp/xpc_partition.c
> +++ b/drivers/misc/sgi-xp/xpc_partition.c
> @@ -3,6 +3,7 @@
>   * License.  See the file "COPYING" in the main directory of this archive
>   * for more details.
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (c) 2004-2008 Silicon Graphics, Inc.  All Rights Reserved.
>   */
>  
> diff --git a/drivers/misc/sgi-xp/xpnet.c b/drivers/misc/sgi-xp/xpnet.c
> index fc5cd83f21f2..d19d2ab848cf 100644
> --- a/drivers/misc/sgi-xp/xpnet.c
> +++ b/drivers/misc/sgi-xp/xpnet.c
> @@ -3,6 +3,7 @@
>   * License.  See the file "COPYING" in the main directory of this archive
>   * for more details.
>   *
> + * (C) Copyright 2020 Hewlett Packard Enterprise Development LP
>   * Copyright (C) 1999-2009 Silicon Graphics, Inc. All rights reserved.
>   */
>  
> -- 
> 2.21.0
> 
