From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/3] software node: remove separate handling of
 references
Date: Sat, 7 Sep 2019 19:13:43 +0300
Message-ID: <20190907161343.GJ2680@smile.fi.intel.com>
References: <20190906222611.223532-1-dmitry.torokhov@gmail.com>
 <20190906222611.223532-3-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906222611.223532-3-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 06, 2019 at 03:26:11PM -0700, Dmitry Torokhov wrote:
> Now that all users of references have moved to reference properties,
> we can remove separate handling of references.
> 

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v1->v2:
> 
> - dropped rename of struct software_node_ref_args ->
> 	struct software_node_reference
> 
>  drivers/base/swnode.c    | 44 +++++++++++++++-------------------------
>  include/linux/property.h | 14 -------------
>  2 files changed, 16 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index bd720d995123..5dc113de0cae 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -570,8 +570,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>  				 struct fwnode_reference_args *args)
>  {
>  	struct swnode *swnode = to_swnode(fwnode);
> -	const struct software_node_reference *ref;
> -	const struct software_node_ref_args *ref_args;
> +	const struct software_node_ref_args *ref;
>  	const struct property_entry *prop;
>  	struct fwnode_handle *refnode;
>  	int i;
> @@ -580,36 +579,25 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>  		return -ENOENT;
>  
>  	prop = property_entry_get(swnode->node->properties, propname);
> -	if (prop) {
> -		if (prop->type != DEV_PROP_REF)
> -			return -EINVAL;
> -
> -		/*
> -		 * We expect all references to be stored as arrays via
> -		 * a pointer, even single ones.
> -		 */
> -		if (!prop->is_array)
> -			return -EINVAL;
> -
> -		if (index * sizeof(*ref_args) >= prop->length)
> -			return -ENOENT;
> +	if (!prop)
> +		return -ENOENT;
>  
> -		ref_args = &prop->pointer.ref[index];
> -	} else {
> -		if (!swnode->node->references)
> -			return -ENOENT;
> +	if (prop->type != DEV_PROP_REF)
> +		return -EINVAL;
>  
> -		for (ref = swnode->node->references; ref->name; ref++)
> -			if (!strcmp(ref->name, propname))
> -				break;
> +	/*
> +	 * We expect all references to be stored as arrays via
> +	 * a pointer, even single ones.
> +	 */
> +	if (!prop->is_array)
> +		return -EINVAL;
>  
> -		if (!ref->name || index > (ref->nrefs - 1))
> -			return -ENOENT;
> +	if (index * sizeof(*ref) >= prop->length)
> +		return -ENOENT;
>  
> -		ref_args = &ref->refs[index];
> -	}
> +	ref = &prop->pointer.ref[index];
>  
> -	refnode = software_node_fwnode(ref_args->node);
> +	refnode = software_node_fwnode(ref->node);
>  	if (!refnode)
>  		return -ENOENT;
>  
> @@ -628,7 +616,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>  	args->nargs = nargs;
>  
>  	for (i = 0; i < nargs; i++)
> -		args->args[i] = ref_args->args[i];
> +		args->args[i] = ref->args[i];
>  
>  	return 0;
>  }
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 6658403f6fa9..5e4adccd6404 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -415,30 +415,16 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
>  /* -------------------------------------------------------------------------- */
>  /* Software fwnode support - when HW description is incomplete or missing */
>  
> -/**
> - * struct software_node_reference - Named software node reference property
> - * @name: Name of the property
> - * @nrefs: Number of elements in @refs array
> - * @refs: Array of references with optional arguments
> - */
> -struct software_node_reference {
> -	const char *name;
> -	unsigned int nrefs;
> -	const struct software_node_ref_args *refs;
> -};
> -
>  /**
>   * struct software_node - Software node description
>   * @name: Name of the software node
>   * @parent: Parent of the software node
>   * @properties: Array of device properties
> - * @references: Array of software node reference properties
>   */
>  struct software_node {
>  	const char *name;
>  	const struct software_node *parent;
>  	const struct property_entry *properties;
> -	const struct software_node_reference *references;
>  };
>  
>  bool is_software_node(const struct fwnode_handle *fwnode);
> -- 
> 2.23.0.187.g17f5b7556c-goog
> 

-- 
With Best Regards,
Andy Shevchenko
