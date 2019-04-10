From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 4/4] platform/x86: intel_punit_ipc: Revert "Fix
 resource ioremap warning"
Date: Wed, 10 Apr 2019 11:06:08 -0700
Message-ID: <7a117f9f-9838-0f98-2807-df89f24b6a6f@linux.intel.com>
References: <20190409112515.84725-1-andriy.shevchenko@linux.intel.com>
 <20190409112515.84725-4-andriy.shevchenko@linux.intel.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409112515.84725-4-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Zha Qipeng <qipeng.zha@intel.com>, junxiao.chang@intel.com, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 4/9/19 4:25 AM, Andy Shevchenko wrote:
> Since we have a proper fix for intel_pmc_ipc driver for resource management,
> get rid of unneeded commit in the intel_punit_ipc driver.
>
> This reverts commit 6cc8cbbc8868033f279b63e98b26b75eaa0006ab.
Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/platform/x86/intel_punit_ipc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
> index 79671927f4ef..ab7ae1950867 100644
> --- a/drivers/platform/x86/intel_punit_ipc.c
> +++ b/drivers/platform/x86/intel_punit_ipc.c
> @@ -252,28 +252,28 @@ static int intel_punit_get_bars(struct platform_device *pdev)
>   	 * - GTDRIVER_IPC BASE_IFACE
>   	 */
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> -	if (res && resource_size(res) > 1) {
> +	if (res) {
>   		addr = devm_ioremap_resource(&pdev->dev, res);
>   		if (!IS_ERR(addr))
>   			punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
>   	}
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
> -	if (res && resource_size(res) > 1) {
> +	if (res) {
>   		addr = devm_ioremap_resource(&pdev->dev, res);
>   		if (!IS_ERR(addr))
>   			punit_ipcdev->base[ISPDRIVER_IPC][BASE_IFACE] = addr;
>   	}
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 4);
> -	if (res && resource_size(res) > 1) {
> +	if (res) {
>   		addr = devm_ioremap_resource(&pdev->dev, res);
>   		if (!IS_ERR(addr))
>   			punit_ipcdev->base[GTDRIVER_IPC][BASE_DATA] = addr;
>   	}
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 5);
> -	if (res && resource_size(res) > 1) {
> +	if (res) {
>   		addr = devm_ioremap_resource(&pdev->dev, res);
>   		if (!IS_ERR(addr))
>   			punit_ipcdev->base[GTDRIVER_IPC][BASE_IFACE] = addr;

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer
