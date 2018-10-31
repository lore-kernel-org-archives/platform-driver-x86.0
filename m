From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V4 2/5] misc/pvpanic : convert to SPDX license tags
Date: Wed, 31 Oct 2018 14:46:10 +0200
Message-ID: <CAHp75VemSb=MG3z3eAks1Jv8GPx4fif7wYEDKgMUGbzssTmrAQ@mail.gmail.com>
References: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn> <1540993041-25611-2-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540993041-25611-2-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 31, 2018 at 7:27 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index fd86dab..9450376 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -1,21 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
> - *  pvpanic.c - pvpanic Device Support
> + *  Pvpanic Device Support
>   *
>   *  Copyright (C) 2013 Fujitsu.
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
> - *  You should have received a copy of the GNU General Public License
> - *  along with this program; if not, write to the Free Software
> - *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
>   */
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
