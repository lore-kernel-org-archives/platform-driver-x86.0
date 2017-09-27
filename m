From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 02/14] platform/x86: dell-smbios: drop needless
 includes
Date: Wed, 27 Sep 2017 10:58:08 -0700
Message-ID: <20170927175808.GL23572@fury>
References: <cover.1506451187.git.mario.limonciello@dell.com>
 <cc9ebe36b3c0adee5789253b6d77a2a5e3a7e765.1506451187.git.mario.limonciello@dell.com>
 <20170927174019.GJ23572@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59439 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752201AbdI0R6K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 13:58:10 -0400
Content-Disposition: inline
In-Reply-To: <20170927174019.GJ23572@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com

On Wed, Sep 27, 2017 at 10:40:19AM -0700, Darren Hart wrote:
> On Tue, Sep 26, 2017 at 01:50:00PM -0500, Mario Limonciello wrote:
> > These aren't needed to compile the module.
> > 
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> 
> Hrm...
> 
> CONFIG_DELL_SMBIOS=m
> 
> $ make drivers/platform/x86/dell-smbios.ko
> 
>   CC [M]  drivers/platform/x86/dell-smbios.o
> drivers/platform/x86/dell-smbios.c: In function ‘parse_da_table’:
> drivers/platform/x86/dell-smbios.c:142:18: error: implicit declaration of function ‘krealloc’ [-Werror=implicit-function-declaration]
>   new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
>                   ^~~~~~~~
> drivers/platform/x86/dell-smbios.c:142:16: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>   new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
>                 ^
> drivers/platform/x86/dell-smbios.c: In function ‘dell_smbios_init’:
> drivers/platform/x86/dell-smbios.c:193:2: error: implicit declaration of function ‘kfree’ [-Werror=implicit-function-declaration]
>   kfree(da_tokens);
>   ^~~~~
> 
> > ---
> >  drivers/platform/x86/dell-smbios.c | 3 ---
...
> > -#include <linux/slab.h>
> 
> Appears you do require slab.h...
> 

I've dropped this one line from this patch, and build is working again. Patches
1-7 look ready to go to me. I'm pushing these to my review branch from some
additional automated testing.

Let me know if there are any objections for 1-7. If we can get these queued now,
we can simplify the review effort for the major functional changes in 8-14.

-- 
Darren Hart
VMware Open Source Technology Center
