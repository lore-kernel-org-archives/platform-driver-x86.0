From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 6/8] platform/mellanox: Introduce support for Mellanox
 register access driver
Date: Fri, 8 Jun 2018 16:59:11 -0700
Message-ID: <20180608235911.GB111314@localhost.localdomain>
References: <1528203501-129092-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528203501-129092-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 05, 2018 at 12:58:19PM +0000, Vadim Pasternak wrote:
> Introduce new Mellanox platform driver to allow access to Mellanox
> programmable device register space trough sysfs interface.
> The driver purpose is to provide sysfs interface for user space for the
> registers essential for system control and monitoring.
> The sets of registers for sysfs access are supposed to be defined per
> system type bases and include the registers related to system resets
> operation, system reset causes monitoring and some kinds of mux selection.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Hi Vadim,

> ---
> v1->v2:
>  Change added by Vadim:
>  - Change ---help--- to help in Kconfig, according to new requirements;
> v2->v3:
>  Comments pointed out by Darren:
>  - Remove conditional assignment per attribute mode type, because mode
>    will guard against not permitted access.
>    Verified by Vadim.
> v4-v5:
>  Comments pointed out by Darren:
>  - Add more comments.
>  - Add validation for the buffer length in attribute store method.
>  - Remove unnecessary check for input value in attribute store method.
>  - Change name val to input_value in order to improve code readability.
>  Changes added by Vadim:
>  - Extend logic in attribute show and store methods to cover all
>    configurations.
> ---
>  drivers/platform/mellanox/Kconfig     |  11 ++
>  drivers/platform/mellanox/Makefile    |   1 +
>  drivers/platform/mellanox/mlxreg-io.c | 227 ++++++++++++++++++++++++++++++++++
>  3 files changed, 239 insertions(+)
>  create mode 100644 drivers/platform/mellanox/mlxreg-io.c
> 
> diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
> index 7c8385e..57074d9c 100644
> --- a/drivers/platform/mellanox/Makefile
> +++ b/drivers/platform/mellanox/Makefile
...
> +static ssize_t
> +mlxreg_io_attr_show(struct device *dev, struct device_attribute *attr,
> +		    char *buf)
> +{
> +	struct mlxreg_io_priv_data *priv = dev_get_drvdata(dev);
> +	int index = to_sensor_dev_attr(attr)->index;
> +	struct mlxreg_core_data *data = priv->pdata->data + index;
> +	u32 regval = 0;
> +	int ret;
> +
> +	ret = regmap_read(priv->pdata->regmap, data->reg, &regval);
> +	if (ret)
> +		goto access_error;
> +
> +	/*
> +	 * There are three kinds of attributes: single bit, full register's
> +	 * bits and bit sequence. For the first kind field mask indicates which
> +	 * bits are not related and filed bit is set zero. For the second kind
> +	 * field mask is set to zero and field bit is set with all bits one.

Is it "all bits one" or "all bits representing the length of the
register set to one" ? e.g. is it always 0xFFFFFFFF or can it be
0x0000000F for a 4 bit register?

> +	 * For the third kind, filed mask indicates which bits are related and
> +	 * field bit is set to the first bit number (from 1 to 32) is the bit
> +	 * sequence.
> +	 */

This is really useful for review - thank you for adding it. I presume
all instances of "filed" were intended to be "field" ?

> +	if (!data->bit)
> +		regval = !!(regval & ~data->mask);
> +	else if (!data->mask)
> +		regval &= data->bit;

If this is the second type (the full register).... and data->bit is all
1s. Why do the &=?  Why test for this at all? Isn't regval already what
you need?

> +	else
> +		regval = ror32(regval & data->mask, (data->bit - 1));
> +

So I think this can be rewritten as:

if (!data->bit)
	regval = !!(regval & ~data->mask
else if (data->mask)
	regval = ror32(regval & data->mask, (data->bit - 1));
/* Without bit or mask, the entire regval is used as is */

Am I missing something?

> +	return sprintf(buf, "%u\n", regval);
> +
> +access_error:
> +	return ret;
> +}
> +
> +static ssize_t
> +mlxreg_io_attr_store(struct device *dev, struct device_attribute *attr,
> +		     const char *buf, size_t len)
> +{
> +	struct mlxreg_io_priv_data *priv = dev_get_drvdata(dev);
> +	int index = to_sensor_dev_attr(attr)->index;
> +	struct mlxreg_core_data *data = priv->pdata->data + index;
> +	u32 input_val, regval;
> +	int ret;
> +
> +	if (len > MLXREG_IO_ATT_SIZE)
> +		return -EINVAL;

The bigger problem would be len < MLXREG_IO_ATT_SIZE right? Because next
we'll try to read beyond the end of buf. Right?

> +
> +	ret = kstrtou32(buf, MLXREG_IO_ATT_SIZE, &input_val);
> +	if (ret)
> +		return ret;
> +
> +	/* Convert buffer to input value. */
I think this comment describes the previous lines, right?

This line is reading the register into regval...

> +	ret = regmap_read(priv->pdata->regmap, data->reg, &regval);
> +	if (ret)
> +		goto access_error;
> +
> +	if (!data->bit) {
> +		/* Single bit, set or clear it according to the input value. */
> +		regval &= data->mask;
> +		if (input_val)
> +			regval |= ~data->mask;
> +	} else if (!data->mask) {
> +		/* All bits, clear out of range bits form the input value. */

                                                     from

> +		regval = input_val & data->bit;

Per the comments above - is this step necessary? Is data->bit all 1s? Or
is this just "all 1s for the length of the register, which is <=32 ? If
so, that wasn't clear from the above comments.

> +	} else {
> +		/* Bit sequence: shift to relevant position and mask. */
> +		input_val = rol32(input_val, data->bit - 1) & data->mask;
> +		/* Clear relevant bits and set them to new value. */
> +		regval = (regval & ~data->mask) | input_val;
> +	}

It seems to me we have a complex register value reading operation here
which we are now performing in two places. This often leads to errors
where only one gets updated if there is a bug in the logic. Can we pull
out the regval reading operation into a static local function?

> +
> +	ret = regmap_write(priv->pdata->regmap, data->reg, regval);
> +	if (ret)
> +		goto access_error;
> +
> +	return len;
> +
> +access_error:
> +	dev_err(&priv->pdev->dev, "Bus access error\n");
> +	return ret;
> +}
> +
> +static struct device_attribute mlxreg_io_devattr_rw = {
> +	.show	= mlxreg_io_attr_show,
> +	.store	= mlxreg_io_attr_store,
> +};
> +
> +static int mlxreg_io_attr_init(struct mlxreg_io_priv_data *priv)
> +{
> +	int i;
> +
> +	priv->group.attrs = devm_kzalloc(&priv->pdev->dev,
> +					 priv->pdata->counter *
> +					 sizeof(struct attribute *),
> +					 GFP_KERNEL);
> +	if (!priv->group.attrs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->pdata->counter; i++) {
> +		priv->mlxreg_io_attr[i] =
> +				&priv->mlxreg_io_dev_attr[i].dev_attr.attr;
> +		memcpy(&priv->mlxreg_io_dev_attr[i].dev_attr,
> +		       &mlxreg_io_devattr_rw, sizeof(struct device_attribute));
> +
> +		/* Set attribute name as a label. */
> +		priv->mlxreg_io_attr[i]->name =
> +				devm_kasprintf(&priv->pdev->dev, GFP_KERNEL,
> +					       priv->pdata->data[i].label);
> +
> +		if (!priv->mlxreg_io_attr[i]->name) {
> +			dev_err(&priv->pdev->dev, "Memory allocation failed for sysfs attribute %d.\n",
> +				i + 1);
> +			return -ENOMEM;
> +		}
> +
> +		priv->mlxreg_io_dev_attr[i].dev_attr.attr.mode =
> +						priv->pdata->data[i].mode;
> +		priv->mlxreg_io_dev_attr[i].dev_attr.attr.name =
> +					priv->mlxreg_io_attr[i]->name;
> +		priv->mlxreg_io_dev_attr[i].index = i;
> +		sysfs_attr_init(&priv->mlxreg_io_dev_attr[i].dev_attr.attr);
> +	}
> +
> +	priv->group.attrs = priv->mlxreg_io_attr;
> +	priv->groups[0] = &priv->group;
> +	priv->groups[1] = NULL;
> +
> +	return 0;
> +}
> +
> +static int mlxreg_io_probe(struct platform_device *pdev)
> +{
> +	struct mlxreg_io_priv_data *priv;
> +	int err;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->pdata = dev_get_platdata(&pdev->dev);
> +	if (!priv->pdata) {
> +		dev_err(&pdev->dev, "Failed to get platform data.\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->pdev = pdev;
> +
> +	err = mlxreg_io_attr_init(priv);
> +	if (err) {
> +		dev_err(&priv->pdev->dev, "Failed to allocate attributes: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	priv->hwmon = devm_hwmon_device_register_with_groups(&pdev->dev,
> +							     "mlxreg_io",
> +							      priv,
> +							      priv->groups);
> +	if (IS_ERR(priv->hwmon)) {
> +		dev_err(&pdev->dev, "Failed to register hwmon device %ld\n",
> +			PTR_ERR(priv->hwmon));
> +		return PTR_ERR(priv->hwmon);
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, priv);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mlxreg_io_driver = {
> +	.driver = {
> +	    .name = "mlxreg-io",
> +	},
> +	.probe = mlxreg_io_probe,
> +};
> +
> +module_platform_driver(mlxreg_io_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> +MODULE_DESCRIPTION("Mellanox regmap I/O access driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:mlxreg-io");
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
