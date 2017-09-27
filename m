From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 02/14] platform/x86: dell-smbios: drop needless
 includes
Date: Wed, 27 Sep 2017 10:40:19 -0700
Message-ID: <20170927174019.GJ23572@fury>
References: <cover.1506451187.git.mario.limonciello@dell.com>
 <cc9ebe36b3c0adee5789253b6d77a2a5e3a7e765.1506451187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:58108 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750752AbdI0RkV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 13:40:21 -0400
Content-Disposition: inline
In-Reply-To: <cc9ebe36b3c0adee5789253b6d77a2a5e3a7e765.1506451187.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com

On Tue, Sep 26, 2017 at 01:50:00PM -0500, Mario Limonciello wrote:
> These aren't needed to compile the module.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Hrm...

CONFIG_DELL_SMBIOS=m

$ make drivers/platform/x86/dell-smbios.ko

  CC [M]  drivers/platform/x86/dell-smbios.o
drivers/platform/x86/dell-smbios.c: In function ‘parse_da_table’:
drivers/platform/x86/dell-smbios.c:142:18: error: implicit declaration of function ‘krealloc’ [-Werror=implicit-function-declaration]
  new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
                  ^~~~~~~~
drivers/platform/x86/dell-smbios.c:142:16: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
  new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
                ^
drivers/platform/x86/dell-smbios.c: In function ‘dell_smbios_init’:
drivers/platform/x86/dell-smbios.c:193:2: error: implicit declaration of function ‘kfree’ [-Werror=implicit-function-declaration]
  kfree(da_tokens);
  ^~~~~

> ---
>  drivers/platform/x86/dell-smbios.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index 0a5723468bff..6654ad44a04c 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -17,10 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/dmi.h>
>  #include <linux/err.h>
> -#include <linux/gfp.h>
>  #include <linux/mutex.h>
> -#include <linux/slab.h>

Appears you do require slab.h...

> -#include <linux/io.h>
>  #include "../../firmware/dcdbas.h"
>  #include "dell-smbios.h"
>  
> -- 
> 2.14.1



> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
