From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 2/3] platform/x86: intel_cht_int33fe: use inline
 reference properties
Date: Fri, 6 Sep 2019 14:22:43 +0300
Message-ID: <20190906112243.GB30048@kuha.fi.intel.com>
References: <20190906043809.18990-1-dmitry.torokhov@gmail.com>
 <20190906043809.18990-2-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906043809.18990-2-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On Thu, Sep 05, 2019 at 09:38:08PM -0700, Dmitry Torokhov wrote:
> Now that static device properties allow defining reference properties
> together with all other types of properties, instead of managing them
> separately, let's adjust the driver.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> Heikki, I do not have this hardware, so if you could try this out
> it would be really great.
> 
>  drivers/platform/x86/intel_cht_int33fe.c | 46 ++++++++++++------------
>  1 file changed, 22 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
> index 4fbdff48a4b5..91f3c8840fd8 100644
> --- a/drivers/platform/x86/intel_cht_int33fe.c
> +++ b/drivers/platform/x86/intel_cht_int33fe.c
> @@ -50,28 +50,8 @@ struct cht_int33fe_data {
>  
>  static const struct software_node nodes[];

I think you can remove that.

> -static const struct software_node_ref_args pi3usb30532_ref = {
> -	&nodes[INT33FE_NODE_PI3USB30532]
> -};
> -
> -static const struct software_node_ref_args dp_ref = {
> -	&nodes[INT33FE_NODE_DISPLAYPORT]
> -};
> -
>  static struct software_node_ref_args mux_ref;

I'm pretty sure you should now drop that one.

> -static const struct software_node_reference usb_connector_refs[] = {
> -	{ "orientation-switch", 1, &pi3usb30532_ref},
> -	{ "mode-switch", 1, &pi3usb30532_ref},
> -	{ "displayport", 1, &dp_ref},
> -	{ }
> -};
> -
> -static const struct software_node_reference fusb302_refs[] = {
> -	{ "usb-role-switch", 1, &mux_ref},
> -	{ }
> -};
> -
>  /*
>   * Grrr I severly dislike buggy BIOS-es. At least one BIOS enumerates
>   * the max17047 both through the INT33FE ACPI device (it is right there
> @@ -107,7 +87,13 @@ static const struct property_entry max17047_props[] = {
>  	{ }
>  };
>  
> -static const struct property_entry fusb302_props[] = {
> +/* Not const because we need to update "usb-role-switch" property. */
> +static struct property_entry fusb302_props[] = {
> +	/*
> +	 * usb-role-switch property must be first as we rely on fixed
> +	 * position to adjust it once we know the real node.
> +	 */
> +	PROPERTY_ENTRY_REF("usb-role-switch", NULL),
>  	PROPERTY_ENTRY_STRING("linux,extcon-name", "cht_wcove_pwrsrc"),
>  	{ }
>  };
> @@ -131,16 +117,22 @@ static const struct property_entry usb_connector_props[] = {
>  	PROPERTY_ENTRY_U32_ARRAY("source-pdos", src_pdo),
>  	PROPERTY_ENTRY_U32_ARRAY("sink-pdos", snk_pdo),
>  	PROPERTY_ENTRY_U32("op-sink-microwatt", 2500000),
> +	PROPERTY_ENTRY_REF("orientation-switch",
> +			   &nodes[INT33FE_NODE_PI3USB30532]),
> +	PROPERTY_ENTRY_REF("mode-switch",
> +			   &nodes[INT33FE_NODE_PI3USB30532]),
> +	PROPERTY_ENTRY_REF("displayport",
> +			   &nodes[INT33FE_NODE_DISPLAYPORT]),
>  	{ }
>  };
>  
>  static const struct software_node nodes[] = {
> -	{ "fusb302", NULL, fusb302_props, fusb302_refs },
> +	{ "fusb302", NULL, fusb302_props },
>  	{ "max17047", NULL, max17047_props },
>  	{ "pi3usb30532" },
>  	{ "displayport" },
>  	{ "usb-role-switch" },
> -	{ "connector", &nodes[0], usb_connector_props, usb_connector_refs },
> +	{ "connector", &nodes[0], usb_connector_props },
>  	{ }
>  };
>  
> @@ -174,7 +166,13 @@ static int cht_int33fe_setup_mux(struct cht_int33fe_data *data)
>  
>  	data->mux = fwnode_handle_get(dev->fwnode);
>  	put_device(dev);
> -	mux_ref.node = to_software_node(data->mux);
> +
> +	/*
> +	 * Update "usb-role-switch" property with real node. Note that we
> +	 * rely on software_node_register_nodes() to use the original
> +	 * instance of properties instead of copying them.
> +	 */
> +	fusb302_props[0].value.ref.node = to_software_node(data->mux);

There are other changes to this driver and to swnode.c in Rafael's
tree, so if you send v2 soon, then please rebase on top of his devprop
branch, or alternatively linux-next.


thanks,

-- 
heikki
