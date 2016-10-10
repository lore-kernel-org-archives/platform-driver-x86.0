From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] intel_pmc_core: avoid boot time warning for
 !CONFIG_DEBUGFS_FS
Date: Mon, 10 Oct 2016 14:29:17 +0200
Message-ID: <20161010122917.GA2377@kroah.com>
References: <20161010111313.119658-1-arnd@arndb.de>
 <20161010111313.119658-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:48162 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751500AbcJJM3K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Oct 2016 08:29:10 -0400
Content-Disposition: inline
In-Reply-To: <20161010111313.119658-2-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Darren Hart <dvhart@linux.intel.com>, Nicolai Stange <nicstange@gmail.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 10, 2016 at 01:12:58PM +0200, Arnd Bergmann wrote:
> While looking at a patch that introduced a compile-time warning
> "‘pmc_core_dev_state_get’ defined but not used" (I sent a patch
> for debugfs to fix it), I noticed that the same patch caused
> it in intel_pmc_core also introduced a bogus run-time warning:
> "PMC Core: debugfs register failed".
> 
> The problem is the IS_ERR_OR_NULL() check that as usual gets
> things wrong: when CONFIG_DEBUGFS_FS is disabled,
> debugfs_create_dir() fails with an error code, and we don't
> need to warn about it, unlike the case in which it returns
> NULL.
> 
> This reverts the driver to the previous state of not warning
> about CONFIG_DEBUGFS_FS being disabled. I chose not to
> restore the driver to making a runtime error in debugfs
> fatal in pmc_core_probe().
> 
> Fixes: df2294fb6428 ("intel_pmc_core: Convert to DEFINE_DEBUGFS_ATTRIBUTE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 520b58a04daa..e8b1b836ca2d 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -100,7 +100,7 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
>  	struct dentry *dir, *file;
>  
>  	dir = debugfs_create_dir("pmc_core", NULL);
> -	if (IS_ERR_OR_NULL(dir))
> +	if (!dir)
>  		return -ENOMEM;

Hah, no, you shouldn't ever care about any return value being "wrong"
from debugfs, the code should just continue on as normal.

And yes, you are correct, the IS_ERR_OR_NULL() is totally wrong.

thanks,

greg k-h
