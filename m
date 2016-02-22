From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-hid: allocate correct amount of memory for private
 struct
Date: Mon, 22 Feb 2016 14:27:20 -0800
Message-ID: <20160222222720.GE14101@dvhart-mobl5.amr.corp.intel.com>
References: <1456064574-11245-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456064574-11245-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: platform-driver-x86@vger.kernel.org, Alex Hung <alex.hung@canonical.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Feb 21, 2016 at 03:22:27PM +0100, Wolfram Sang wrote:
> We want the size of the struct, not of a pointer to it. To be future
> proof, just dereference the pointer to get the desired type.
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Queued to testing. Thank you Wolfram.

> ---
> 
> Compile tested only. Found by static code analysis.
> 
>  drivers/platform/x86/intel-hid.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index e20f23e04c24ce..f93abc8c1424ad 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -180,8 +180,7 @@ static int intel_hid_probe(struct platform_device *device)
>  		return -ENODEV;
>  	}
>  
> -	priv = devm_kzalloc(&device->dev,
> -			    sizeof(struct intel_hid_priv *), GFP_KERNEL);
> +	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  	dev_set_drvdata(&device->dev, priv);
> -- 
> 2.7.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
