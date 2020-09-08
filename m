From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/12] x86/platform/uv: Update UV MMRs for UV5
Date: Tue, 8 Sep 2020 17:23:14 +0200
Message-ID: <20200908152314.GD4114051@kroah.com>
References: <20200907185430.363197758@hpe.com>
 <20200907185430.782245884@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200907185430.782245884@hpe.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Travis <mike.travis@hpe.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 07, 2020 at 01:54:34PM -0500, Mike Travis wrote:
> --- linux.orig/drivers/misc/sgi-gru/grufile.c
> +++ linux/drivers/misc/sgi-gru/grufile.c
> @@ -7,7 +7,8 @@
>   * This file supports the user system call for file open, close, mmap, etc.
>   * This also incudes the driver initialization code.
>   *
> - *  Copyright (c) 2008-2014 Silicon Graphics, Inc.  All Rights Reserved.
> + * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
> + * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.

Please drop all copyright changes from this series, as these do not look
correct at all, sorry.

You can send an add-on patch for all of that if it's really necessary,
and you get legal approval for it :)

thanks,

greg k-h
