From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v5 10/14] software node: rename is_array to is_inline
Date: Thu, 17 Oct 2019 09:02:39 -0700
Message-ID: <20191017160239.GG35946@dtor-ws>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-11-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191011230721.206646-11-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Oct 11, 2019 at 04:07:17PM -0700, Dmitry Torokhov wrote:
> We do not need a special flag to know if we are dealing with an array,
> as we can get that data from ratio between element length and the data
> size, however we do need a flag to know whether the data is stored
> directly inside property_entry or separately.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/base/swnode.c    |  9 +++++----
>  include/linux/property.h | 12 +++++++-----
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 8826c9040c80..ae4b24ee2a54 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -108,7 +108,7 @@ static const void *property_get_pointer(const struct property_entry *prop)
>  	if (!prop->length)
>  		return NULL;
>  
> -	if (prop->is_array)
> +	if (!prop->is_inline)
>  		return prop->pointer;
>  
>  	return &prop->value;
> @@ -205,7 +205,7 @@ static void property_entry_free_data(const struct property_entry *p)
>  	const char * const *src_str;
>  	size_t i, nval;
>  
> -	if (p->is_array) {
> +	if (!p->is_inline) {
>  		if (p->type == DEV_PROP_STRING && p->pointer) {
>  			src_str = p->pointer;
>  			nval = p->length / sizeof(const char *);
> @@ -250,7 +250,7 @@ static int property_entry_copy_data(struct property_entry *dst,
>  	const void *pointer = property_get_pointer(src);
>  	const void *new;
>  
> -	if (src->is_array) {
> +	if (!src->is_inline) {
>  		if (!src->length)
>  			return -ENODATA;
>  
> @@ -264,15 +264,16 @@ static int property_entry_copy_data(struct property_entry *dst,
>  				return -ENOMEM;
>  		}
>  
> -		dst->is_array = true;
>  		dst->pointer = new;
>  	} else if (src->type == DEV_PROP_STRING) {
>  		new = kstrdup(src->value.str, GFP_KERNEL);
>  		if (!new && src->value.str)
>  			return -ENOMEM;
>  
> +		dst->is_inline = true;
>  		dst->value.str = new;
>  	} else {
> +		dst->is_inline = true;
>  		dst->value = src->value;
>  	}
>  
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 238e1507925f..ac7823d58cfe 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -222,15 +222,17 @@ static inline int fwnode_property_count_u64(const struct fwnode_handle *fwnode,
>   * struct property_entry - "Built-in" device property representation.
>   * @name: Name of the property.
>   * @length: Length of data making up the value.
> - * @is_array: True when the property is an array.
> + * @is_inline: True when the property value is stored directly in
> + *     &struct property_entry instance.
>   * @type: Type of the data in unions.
> - * @pointer: Pointer to the property (an array of items of the given type).
> - * @value: Value of the property (when it is a single item of the given type).
> + * @pointer: Pointer to the property when it is stored separately from
> + *     the &struct property_entry instance.
> + * @value: Value of the property when it is stored inline.
>   */
>  struct property_entry {
>  	const char *name;
>  	size_t length;
> -	bool is_array;
> +	bool is_inline;
>  	enum dev_prop_type type;
>  	union {
>  		const void *pointer;
> @@ -257,7 +259,6 @@ struct property_entry {
>  (struct property_entry) {						\
>  	.name = _name_,							\
>  	.length = (_len_) * __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_),	\
> -	.is_array = true,						\
>  	.type = DEV_PROP_##_Type_,					\
>  	{ .pointer = _val_ },						\
>  }
> @@ -288,6 +289,7 @@ struct property_entry {
>  (struct property_entry) {						\
>  	.name = _name_,							\
>  	.length = __PROPERTY_ENTRY_ELEMENT_SIZE(_elem_),		\
> +	.is_inline = true,						\
>  	.type = DEV_PROP_##_Type_,					\
>  	{ .value = { ._elem_ = _val_ } },				\
>  }

The patch also needs to set is_inline in PROPERTY_ENTRY_BOOL(), I'll
send updated version after I get more feedback.

Thanks.

-- 
Dmitry
