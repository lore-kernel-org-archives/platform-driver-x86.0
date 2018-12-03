From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH -next] platform/x86: intel-ips: remove unnecessary checks
 in ips_debugfs_init
Date: Mon, 3 Dec 2018 21:08:27 +0200
Message-ID: <20181203190827.GX10650@smile.fi.intel.com>
References: <20181127030938.18160-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181127030938.18160-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: dvhart@infradead.org, andy@infradead.org, jkosina@suse.cz, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 27, 2018 at 11:09:38AM +0800, YueHaibing wrote:
> As Greg KH explained in:
> https://lkml.org/lkml/2015/8/15/114
> 
> There no need to check the return value of debugfs_create_file/
> debugfs_create_dir.
> 
> This also fix static code checker warnings:
> 
> drivers/platform/x86/intel_ips.c:1314
>  ips_debugfs_init() warn: passing zero to 'PTR_ERR'
> drivers/platform/x86/intel_ips.c:1328
>  ips_debugfs_init() warn: passing zero to 'PTR_ERR'
> 

Pushed to my review and testing queue, thanks!

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/platform/x86/intel_ips.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index 225638a..5c5dc82 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -1310,32 +1310,17 @@ static void ips_debugfs_init(struct ips_driver *ips)
>  	int i;
>  
>  	ips->debug_root = debugfs_create_dir("ips", NULL);
> -	if (!ips->debug_root) {
> -		dev_err(ips->dev, "failed to create debugfs entries: %ld\n",
> -			PTR_ERR(ips->debug_root));
> -		return;
> -	}
>  
>  	for (i = 0; i < ARRAY_SIZE(ips_debug_files); i++) {
> -		struct dentry *ent;
>  		struct ips_debugfs_node *node = &ips_debug_files[i];
>  
>  		node->ips = ips;
> -		ent = debugfs_create_file(node->name, S_IFREG | S_IRUGO,
> -					  ips->debug_root, node,
> -					  &ips_debugfs_ops);
> -		if (!ent) {
> -			dev_err(ips->dev, "failed to create debug file: %ld\n",
> -				PTR_ERR(ent));
> -			goto err_cleanup;
> -		}
> +		debugfs_create_file(node->name, S_IFREG | S_IRUGO,
> +				    ips->debug_root, node,
> +				    &ips_debugfs_ops);
>  	}
>  
>  	return;
> -
> -err_cleanup:
> -	ips_debugfs_cleanup(ips);
> -	return;
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> -- 
> 2.7.0
> 
> 

-- 
With Best Regards,
Andy Shevchenko
