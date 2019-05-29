From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 13/16] platform/x86: intel_cht_int33fe: Provide
 software nodes for the devices
Date: Wed, 29 May 2019 11:30:58 +0200
Message-ID: <7468b83c-3d75-b43f-559b-68b3140a89e9@redhat.com>
References: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
 <20190522105113.11153-14-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522105113.11153-14-heikki.krogerus@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/22/19 12:51 PM, Heikki Krogerus wrote:
> Software nodes provide two features that we will need later.
> 1) Software nodes can have references to other software nodes.
> 2) Software nodes can exist before a device entry is created.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/platform/x86/intel_cht_int33fe.c | 53 ++++++++++++++++++++----
>   1 file changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
> index 4ab47d6df413..a4ebd1d6b5b6 100644
> --- a/drivers/platform/x86/intel_cht_int33fe.c
> +++ b/drivers/platform/x86/intel_cht_int33fe.c
> @@ -27,6 +27,13 @@
>   
>   #define EXPECTED_PTYPE		4
>   
> +enum {
> +	INT33FE_NODE_FUSB302,
> +	INT33FE_NODE_MAX17047,
> +	INT33FE_NODE_PI3USB30532,
> +	INT33FE_NODE_MAX,
> +};
> +
>   struct cht_int33fe_data {
>   	struct i2c_client *max17047;
>   	struct i2c_client *fusb302;
> @@ -72,8 +79,13 @@ static const struct property_entry max17047_props[] = {
>   
>   static const struct property_entry fusb302_props[] = {
>   	PROPERTY_ENTRY_STRING("linux,extcon-name", "cht_wcove_pwrsrc"),
> -	PROPERTY_ENTRY_U32("fcs,max-sink-microvolt", 12000000),
> -	PROPERTY_ENTRY_U32("fcs,max-sink-microamp",   3000000),
> +	{ }
> +};
> +
> +static const struct software_node nodes[] = {
> +	{ "fusb302", NULL, fusb302_props },
> +	{ "max17047", NULL, max17047_props },
> +	{ "pi3usb30532" },
>   	{ }
>   };
>   
> @@ -82,14 +94,17 @@ cht_int33fe_register_max17047(struct device *dev, struct cht_int33fe_data *data)
>   {
>   	struct i2c_client *max17047 = NULL;
>   	struct i2c_board_info board_info;
> +	struct fwnode_handle *fwnode;
>   	int ret;
>   
> +	fwnode = software_node_fwnode(&nodes[INT33FE_NODE_MAX17047]);
> +	if (!fwnode)
> +		return -ENODEV;
> +
>   	i2c_for_each_dev(&max17047, cht_int33fe_check_for_max17047);
>   	if (max17047) {
>   		/* Pre-existing i2c-client for the max17047, add device-props */
> -		ret = device_add_properties(&max17047->dev, max17047_props);
> -		if (ret)
> -			return ret;
> +		max17047->dev.fwnode->secondary = fwnode;

I believe that you should do:
		fwnode->secondary = ERR_PTR(-ENODEV);
cht_int33fe_setup_dp
Before this call, as you are doing in the cht_int33fe_setup_dp function.

Regards,

Hans


>   		/* And re-probe to get the new device-props applied. */
>   		ret = device_reprobe(&max17047->dev);
>   		if (ret)
> @@ -100,7 +115,7 @@ cht_int33fe_register_max17047(struct device *dev, struct cht_int33fe_data *data)
>   	memset(&board_info, 0, sizeof(board_info));
>   	strlcpy(board_info.type, "max17047", I2C_NAME_SIZE);
>   	board_info.dev_name = "max17047";
> -	board_info.properties = max17047_props;
> +	board_info.fwnode = fwnode;
>   	data->max17047 = i2c_acpi_new_device(dev, 1, &board_info);
>   
>   	return PTR_ERR_OR_ZERO(data->max17047);
> @@ -111,6 +126,7 @@ static int cht_int33fe_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct i2c_board_info board_info;
>   	struct cht_int33fe_data *data;
> +	struct fwnode_handle *fwnode;
>   	struct regulator *regulator;
>   	unsigned long long ptyp;
>   	acpi_status status;
> @@ -170,10 +186,14 @@ static int cht_int33fe_probe(struct platform_device *pdev)
>   	if (!data)
>   		return -ENOMEM;
>   
> +	ret = software_node_register_nodes(nodes);
> +	if (ret)
> +		return ret;
> +
>   	/* Work around BIOS bug, see comment on cht_int33fe_check_for_max17047 */
>   	ret = cht_int33fe_register_max17047(dev, data);
>   	if (ret)
> -		return ret;
> +		goto out_remove_nodes;
>   
>   	data->connections[0].endpoint[0] = "port0";
>   	data->connections[0].endpoint[1] = "i2c-pi3usb30532-switch";
> @@ -187,10 +207,16 @@ static int cht_int33fe_probe(struct platform_device *pdev)
>   
>   	device_connections_add(data->connections);
>   
> +	fwnode = software_node_fwnode(&nodes[INT33FE_NODE_FUSB302]);
> +	if (!fwnode) {
> +		ret = -ENODEV;
> +		goto out_unregister_max17047;
> +	}
> +
>   	memset(&board_info, 0, sizeof(board_info));
>   	strlcpy(board_info.type, "typec_fusb302", I2C_NAME_SIZE);
>   	board_info.dev_name = "fusb302";
> -	board_info.properties = fusb302_props;
> +	board_info.fwnode = fwnode;
>   	board_info.irq = fusb302_irq;
>   
>   	data->fusb302 = i2c_acpi_new_device(dev, 2, &board_info);
> @@ -199,8 +225,15 @@ static int cht_int33fe_probe(struct platform_device *pdev)
>   		goto out_unregister_max17047;
>   	}
>   
> +	fwnode = software_node_fwnode(&nodes[INT33FE_NODE_PI3USB30532]);
> +	if (!fwnode) {
> +		ret = -ENODEV;
> +		goto out_unregister_fusb302;
> +	}
> +
>   	memset(&board_info, 0, sizeof(board_info));
>   	board_info.dev_name = "pi3usb30532";
> +	board_info.fwnode = fwnode;
>   	strlcpy(board_info.type, "pi3usb30532", I2C_NAME_SIZE);
>   
>   	data->pi3usb30532 = i2c_acpi_new_device(dev, 3, &board_info);
> @@ -221,6 +254,9 @@ static int cht_int33fe_probe(struct platform_device *pdev)
>   
>   	device_connections_remove(data->connections);
>   
> +out_remove_nodes:
> +	software_node_unregister_nodes(nodes);
> +
>   	return ret;
>   }
>   
> @@ -233,6 +269,7 @@ static int cht_int33fe_remove(struct platform_device *pdev)
>   	i2c_unregister_device(data->max17047);
>   
>   	device_connections_remove(data->connections);
> +	software_node_unregister_nodes(nodes);
>   
>   	return 0;
>   }
> 
