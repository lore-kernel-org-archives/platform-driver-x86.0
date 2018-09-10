From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] platform/x86: dell-smbios-wmi: Correct a memory leak
Date: Mon, 10 Sep 2018 13:51:39 -0700
Message-ID: <20180910205139.GC5659@wrath>
References: <1536602513-13861-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536602513-13861-1-git-send-email-mario.limonciello@dell.com>
Sender: stable-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 10, 2018 at 01:01:52PM -0500, Mario Limonciello wrote:
> ACPI buffers were being allocated but never freed.
> 
> Reported-by: Pinzhen Xu <pinzhen.xu@intel.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Cc: stable@vger.kernel.org

Thanks Mario and Pinzhen, both queued. That's an easy one to miss, the usage not
being particularly obvious.

> ---
>  drivers/platform/x86/dell-smbios-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
> index 88afe56..cf2229e 100644
> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c
> @@ -78,6 +78,7 @@ static int run_smbios_call(struct wmi_device *wdev)
>  	dev_dbg(&wdev->dev, "result: [%08x,%08x,%08x,%08x]\n",
>  		priv->buf->std.output[0], priv->buf->std.output[1],
>  		priv->buf->std.output[2], priv->buf->std.output[3]);
> +	kfree(output.pointer);
>  
>  	return 0;
>  }
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
