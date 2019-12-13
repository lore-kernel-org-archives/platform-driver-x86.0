From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v8 1/6] software node: rename is_array to is_inline
Date: Fri, 13 Dec 2019 07:44:41 +0100
Message-ID: <b8dca439-ffa3-f562-e319-3413986caaaa@samsung.com>
References: <20191108042225.45391-1-dmitry.torokhov@gmail.com>
        <20191108042225.45391-2-dmitry.torokhov@gmail.com>
        <CGME20191212111237eucas1p1a278d2d5d2437e3219896367e82604cc@eucas1p1.samsung.com>
        <b3f6ca8b-dbdf-0cec-aa8f-47ffcc5c5307@samsung.com>
        <20191213012408.GH101194@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191213012408.GH101194@dtor-ws>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Felipe Balbi <balbi@kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Dmitry,

On 13.12.2019 02:24, Dmitry Torokhov wrote:
> On Thu, Dec 12, 2019 at 12:12:36PM +0100, Marek Szyprowski wrote:
>> On 08.11.2019 05:22, Dmitry Torokhov wrote:
>>> We do not need a special flag to know if we are dealing with an array,
>>> as we can get that data from ratio between element length and the data
>>> size, however we do need a flag to know whether the data is stored
>>> directly inside property_entry or separately.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Today I've noticed that this patch got merged to linux-next as commit
>> e6bff4665c595b5a4aff173848851ed49ac3bfad. Sadly it breaks DWC3/xHCI
>> driver operation on Samsung Exynos5 SoCs (and probably on other SoCs
>> which use DWC3 in host mode too). I get the following errors during boot:
>>
>> dwc3 12000000.dwc3: failed to add properties to xHCI
>> dwc3 12000000.dwc3: failed to initialize host
>> dwc3: probe of 12000000.dwc3 failed with error -61
>>
>> Here is a full kernel log from Exynos5250-based Snow Chromebook on KernelCI:
>>
>> https://protect2.fireeye.com/url?k=df93ba76-820d14ec-df923139-0cc47a336fae-f751d8b108bc5bdf&u=https://storage.kernelci.org/next/master/next-20191212/arm/exynos_defconfig/gcc-8/lab-collabora/boot-exynos5250-snow.txt
>>
>> (lack of 'ref' clk is not related nor fatal to the driver operation).
>>
>> The code which fails after this patch is located in
>> drivers/usb/dwc3/host.c. Let me know if I can help more in locating the bug.
> Does the following help? If, as I expect, it does, I'll submit it
> formally.

Yes, it fixes the issue. If possible, please add the following tags:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

to the final patch.

> ---
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index 5567ed2cddbec..fa252870c926f 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -88,10 +88,10 @@ int dwc3_host_init(struct dwc3 *dwc)
>   	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
>   
>   	if (dwc->usb3_lpm_capable)
> -		props[prop_idx++].name = "usb3-lpm-capable";
> +		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb3-lpm-capable");
>   
>   	if (dwc->usb2_lpm_disable)
> -		props[prop_idx++].name = "usb2-lpm-disable";
> +		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
>   
>   	/**
>   	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
> @@ -103,7 +103,7 @@ int dwc3_host_init(struct dwc3 *dwc)
>   	 * This following flag tells XHCI to do just that.
>   	 */
>   	if (dwc->revision <= DWC3_REVISION_300A)
> -		props[prop_idx++].name = "quirk-broken-port-ped";
> +		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
>   
>   	if (prop_idx) {
>   		ret = platform_device_add_properties(xhci, props);
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
