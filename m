From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 16/37] watchdog: intel-mid_wdt: Convert to use new SCU IPC
 API
Date: Mon, 23 Dec 2019 07:46:50 -0800
Message-ID: <0a488bbc-e101-0479-2968-1fb9acef69fc@roeck-us.net>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
 <20191223141716.13727-17-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191223141716.13727-17-mika.westerberg@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc: Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 12/23/19 6:16 AM, Mika Westerberg wrote:
> This converts the Intel MID watchdog driver over the new SCU IPC API
> where the SCU IPC instance is passed to the functions.
> 
> While there drop useless print at the end of probe.

If you say that you drop the statement you should actually do so.

Guenter

> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>   drivers/watchdog/intel-mid_wdt.c | 53 ++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
> index 470213abfd3d..1ae03b64ef8b 100644
> --- a/drivers/watchdog/intel-mid_wdt.c
> +++ b/drivers/watchdog/intel-mid_wdt.c
> @@ -33,14 +33,24 @@ enum {
>   	SCU_WATCHDOG_KEEPALIVE,
>   };
>   
> -static inline int wdt_command(int sub, u32 *in, int inlen)
> +struct mid_wdt {
> +	struct watchdog_device wd;
> +	struct device *dev;
> +	struct intel_scu_ipc_dev *scu;
> +};
> +
> +static inline int
> +wdt_command(struct mid_wdt *mid, int sub, const void *in, size_t inlen, size_t size)
>   {
> -	return intel_scu_ipc_command(IPC_WATCHDOG, sub, in, inlen, NULL, 0);
> +	struct intel_scu_ipc_dev *scu = mid->scu;
> +
> +	return intel_scu_ipc_dev_command_with_size(scu, IPC_WATCHDOG, sub, in,
> +						   inlen, size, NULL, 0);
>   }
>   
>   static int wdt_start(struct watchdog_device *wd)
>   {
> -	struct device *dev = watchdog_get_drvdata(wd);
> +	struct mid_wdt *mid = watchdog_get_drvdata(wd);
>   	int ret, in_size;
>   	int timeout = wd->timeout;
>   	struct ipc_wd_start {
> @@ -49,38 +59,41 @@ static int wdt_start(struct watchdog_device *wd)
>   	} ipc_wd_start = { timeout - MID_WDT_PRETIMEOUT, timeout };
>   
>   	/*
> -	 * SCU expects the input size for watchdog IPC to
> -	 * be based on 4 bytes
> +	 * SCU expects the input size for watchdog IPC to be 2 which is the
> +	 * size of the structure in dwords. SCU IPC normally takes bytes
> +	 * but this is a special case where we specify size to be different
> +	 * than inlen.
>   	 */
>   	in_size = DIV_ROUND_UP(sizeof(ipc_wd_start), 4);
>   
> -	ret = wdt_command(SCU_WATCHDOG_START, (u32 *)&ipc_wd_start, in_size);
> +	ret = wdt_command(mid, SCU_WATCHDOG_START, &ipc_wd_start,
> +			  sizeof(ipc_wd_start), in_size);
>   	if (ret)
> -		dev_crit(dev, "error starting watchdog: %d\n", ret);
> +		dev_crit(mid->dev, "error starting watchdog: %d\n", ret);
>   
>   	return ret;
>   }
>   
>   static int wdt_ping(struct watchdog_device *wd)
>   {
> -	struct device *dev = watchdog_get_drvdata(wd);
> +	struct mid_wdt *mid = watchdog_get_drvdata(wd);
>   	int ret;
>   
> -	ret = wdt_command(SCU_WATCHDOG_KEEPALIVE, NULL, 0);
> +	ret = wdt_command(mid, SCU_WATCHDOG_KEEPALIVE, NULL, 0, 0);
>   	if (ret)
> -		dev_crit(dev, "Error executing keepalive: %d\n", ret);
> +		dev_crit(mid->dev, "Error executing keepalive: %d\n", ret);
>   
>   	return ret;
>   }
>   
>   static int wdt_stop(struct watchdog_device *wd)
>   {
> -	struct device *dev = watchdog_get_drvdata(wd);
> +	struct mid_wdt *mid = watchdog_get_drvdata(wd);
>   	int ret;
>   
> -	ret = wdt_command(SCU_WATCHDOG_STOP, NULL, 0);
> +	ret = wdt_command(mid, SCU_WATCHDOG_STOP, NULL, 0, 0);
>   	if (ret)
> -		dev_crit(dev, "Error stopping watchdog: %d\n", ret);
> +		dev_crit(mid->dev, "Error stopping watchdog: %d\n", ret);
>   
>   	return ret;
>   }
> @@ -110,6 +123,7 @@ static int mid_wdt_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct watchdog_device *wdt_dev;
>   	struct intel_mid_wdt_pdata *pdata = dev->platform_data;
> +	struct mid_wdt *mid;
>   	int ret;
>   
>   	if (!pdata) {
> @@ -123,10 +137,13 @@ static int mid_wdt_probe(struct platform_device *pdev)
>   			return ret;
>   	}
>   
> -	wdt_dev = devm_kzalloc(dev, sizeof(*wdt_dev), GFP_KERNEL);
> -	if (!wdt_dev)
> +	mid = devm_kzalloc(dev, sizeof(*mid), GFP_KERNEL);
> +	if (!mid)
>   		return -ENOMEM;
>   
> +	mid->dev = dev;
> +	wdt_dev = &mid->wd;
> +
>   	wdt_dev->info = &mid_wdt_info;
>   	wdt_dev->ops = &mid_wdt_ops;
>   	wdt_dev->min_timeout = MID_WDT_TIMEOUT_MIN;
> @@ -135,7 +152,7 @@ static int mid_wdt_probe(struct platform_device *pdev)
>   	wdt_dev->parent = dev;
>   
>   	watchdog_set_nowayout(wdt_dev, WATCHDOG_NOWAYOUT);
> -	watchdog_set_drvdata(wdt_dev, dev);
> +	watchdog_set_drvdata(wdt_dev, mid);
>   
>   	ret = devm_request_irq(dev, pdata->irq, mid_wdt_irq,
>   			       IRQF_SHARED | IRQF_NO_SUSPEND, "watchdog",
> @@ -145,6 +162,10 @@ static int mid_wdt_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	mid->scu = devm_intel_scu_ipc_dev_get(dev);
> +	if (!mid->scu)
> +		return -EPROBE_DEFER;
> +
>   	/*
>   	 * The firmware followed by U-Boot leaves the watchdog running
>   	 * with the default threshold which may vary. When we get here
> 
