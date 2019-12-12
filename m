From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v8 1/6] software node: rename is_array to is_inline
Date: Thu, 12 Dec 2019 12:12:36 +0100
Message-ID: <b3f6ca8b-dbdf-0cec-aa8f-47ffcc5c5307@samsung.com>
References: <20191108042225.45391-1-dmitry.torokhov@gmail.com>
        <20191108042225.45391-2-dmitry.torokhov@gmail.com>
        <CGME20191212111237eucas1p1a278d2d5d2437e3219896367e82604cc@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191108042225.45391-2-dmitry.torokhov@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Felipe Balbi <balbi@kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Dear All,

On 08.11.2019 05:22, Dmitry Torokhov wrote:
> We do not need a special flag to know if we are dealing with an array,
> as we can get that data from ratio between element length and the data
> size, however we do need a flag to know whether the data is stored
> directly inside property_entry or separately.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Today I've noticed that this patch got merged to linux-next as commit 
e6bff4665c595b5a4aff173848851ed49ac3bfad. Sadly it breaks DWC3/xHCI 
driver operation on Samsung Exynos5 SoCs (and probably on other SoCs 
which use DWC3 in host mode too). I get the following errors during boot:

dwc3 12000000.dwc3: failed to add properties to xHCI
dwc3 12000000.dwc3: failed to initialize host
dwc3: probe of 12000000.dwc3 failed with error -61

Here is a full kernel log from Exynos5250-based Snow Chromebook on KernelCI:

https://storage.kernelci.org/next/master/next-20191212/arm/exynos_defconfig/gcc-8/lab-collabora/boot-exynos5250-snow.txt

(lack of 'ref' clk is not related nor fatal to the driver operation).

The code which fails after this patch is located in 
drivers/usb/dwc3/host.c. Let me know if I can help more in locating the bug.

> ---
>   drivers/base/swnode.c    | 12 +++++-------
>   include/linux/property.h | 13 ++++++++-----
>   2 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index d8d0dc0ca5acf..18a30fb3cc588 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -108,10 +108,7 @@ static const void *property_get_pointer(const struct property_entry *prop)
>   	if (!prop->length)
>   		return NULL;
>   
> -	if (prop->is_array)
> -		return prop->pointer;
> -
> -	return &prop->value;
> +	return prop->is_inline ? &prop->value : prop->pointer;
>   }
>   
>   static const void *property_entry_find(const struct property_entry *props,
> @@ -205,7 +202,7 @@ static void property_entry_free_data(const struct property_entry *p)
>   	const char * const *src_str;
>   	size_t i, nval;
>   
> -	if (p->is_array) {
> +	if (!p->is_inline) {
>   		if (p->type == DEV_PROP_STRING && p->pointer) {
>   			src_str = p->pointer;
>   			nval = p->length / sizeof(const char *);
> @@ -250,7 +247,7 @@ static int property_entry_copy_data(struct property_entry *dst,
>   	const void *pointer = property_get_pointer(src);
>   	const void *new;
>   
> -	if (src->is_array) {
> +	if (!src->is_inline) {
>   		if (!src->length)
>   			return -ENODATA;
>   
> @@ -264,15 +261,16 @@ static int property_entry_copy_data(struct property_entry *dst,
>   				return -ENOMEM;
>   		}
>   
> -		dst->is_array = true;
>   		dst->pointer = new;
>   	} else if (src->type == DEV_PROP_STRING) {
>   		new = kstrdup(src->value.str, GFP_KERNEL);
>   		if (!new && src->value.str)
>   			return -ENOMEM;
>   
> +		dst->is_inline = true;
>   		dst->value.str = new;
>   	} else {
> +		dst->is_inline = true;
>   		dst->value = src->value;
>   	}
>   
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 48335288c2a96..dad0ad11b55e2 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -227,15 +227,17 @@ static inline int fwnode_property_count_u64(const struct fwnode_handle *fwnode,
>    * struct property_entry - "Built-in" device property representation.
>    * @name: Name of the property.
>    * @length: Length of data making up the value.
> - * @is_array: True when the property is an array.
> + * @is_inline: True when the property value is embedded in
> + *	&struct property_entry instance.
>    * @type: Type of the data in unions.
> - * @pointer: Pointer to the property (an array of items of the given type).
> - * @value: Value of the property (when it is a single item of the given type).
> + * @pointer: Pointer to the property when it is stored separately from
> + *	the &struct property_entry instance.
> + * @value: Value of the property when it is stored inline.
>    */
>   struct property_entry {
>   	const char *name;
>   	size_t length;
> -	bool is_array;
> +	bool is_inline;
>   	enum dev_prop_type type;
>   	union {
>   		const void *pointer;
> @@ -262,7 +264,6 @@ struct property_entry {
>   (struct property_entry) {						\
>   	.name = _name_,							\
>   	.length = (_len_) * __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_),	\
> -	.is_array = true,						\
>   	.type = DEV_PROP_##_Type_,					\
>   	{ .pointer = _val_ },						\
>   }
> @@ -293,6 +294,7 @@ struct property_entry {
>   (struct property_entry) {						\
>   	.name = _name_,							\
>   	.length = __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_),		\
> +	.is_inline = true,						\
>   	.type = DEV_PROP_##_Type_,					\
>   	{ .value = { ._elem_ = _val_ } },				\
>   }
> @@ -311,6 +313,7 @@ struct property_entry {
>   #define PROPERTY_ENTRY_BOOL(_name_)		\
>   (struct property_entry) {			\
>   	.name = _name_,				\
> +	.is_inline = true,			\
>   }
>   
>   struct property_entry *

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
