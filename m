Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB13670805
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 18:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733164448; cv=none; b=S4hiKy1pVjiw2EcoQC8DXOeF+AQYHjMqAf9rSjfy9VX/gSma472NILM/DPiLApKhKaOw423xLBsqYsVAJF6CN4axSzNWeTcpyw7pTOXQ6JH1I1fXu2xjcHF8wEPqYpX4KQcKo1ExR6wmIXttlDULC5roAqd7NiOMgfUoSqSpFpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733164448; c=relaxed/simple;
	bh=VDgzytpNDtpp8BRs3b6V1fCck8ZWvQjMXZt80cVSdWI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s6VFnVa3NqTZOgpj+k2cFOLXqJ258WZwcZHZEMyBkSsgvSuXqbc4dXFzyTZYHqvrMUxlCbANcb1YKtMii9w9jAAiPPOgQ1U9YlWR/vOXhZfzmPay+LL6jy2lWdxrxu6tbAHHpikmuHNTd6buJkm3r1wKzB31Zw/ygRC0/vcACVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tk/ZY++V; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tk/ZY++V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733164446; x=1764700446;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VDgzytpNDtpp8BRs3b6V1fCck8ZWvQjMXZt80cVSdWI=;
  b=Tk/ZY++VdJpdH5+V53SD9faV/PhRJx6cdrhL4YMgsw7xgorQTWM6d+Ra
   Iv6ocwdDIB3E3cIoJZzKVw8moMn9kBqgxrFyaLzabRFoVkGKlkQ7ntwEM
   GLQpQfnmFS3GXDnPU56ZOR6XuACuMoxrFXhe12ph0fBjl6eBA7mddgYES
   SNGi62u0PxvlmO2oNtbMnL+5UYswPbRtfGSQld6WbOYoAKJtbELZFGJzc
   6KMJBEotbBZflPas5FQRetikiLNC9DNCpH0bPKtt3K4yuE6lOZRw1FBP4
   cgVhTu+olTlezlOpGl64Up+H5ZzkkmZKi8P5ljp0BC6zk3X/2PCmR6LTf
   w==;
X-CSE-ConnectionGUID: HniaXABDTtusztOIdIhPrQ==
X-CSE-MsgGUID: rqjroupcSLKSWibV7BKClw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33595313"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33595313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 10:34:05 -0800
X-CSE-ConnectionGUID: VTV419RwTVKu9Ol0yVDzGA==
X-CSE-MsgGUID: VrZWHWDYRiu+/YbAzagPrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="124119308"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 10:34:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 2 Dec 2024 20:34:01 +0200 (EET)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add Vexia EDU
 ATLA 10 EC battery driver
In-Reply-To: <20241116121659.57487-2-hdegoede@redhat.com>
Message-ID: <b5b40432-77ed-2466-7d30-ce35a239d0ae@linux.intel.com>
References: <20241116121659.57487-1-hdegoede@redhat.com> <20241116121659.57487-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 16 Nov 2024, Hans de Goede wrote:

> The Vexia EDU ATLA 10 tablet has an embedded controller instead of
> giving the os direct access to the charger + fuel-gauge ICs as is normal
> on tablets designed for Android.
> 
> There is ACPI Battery device in the DSDT using the EC which should work
> except that it expects the I2C controller to be enumerated as an ACPI
> device and the tablet's BIOS enumerates all LPSS devices as PCI devices
> (and changing the LPSS BIOS settings from PCI -> ACPI does not work).
> 
> Add a power_supply class driver for the Atla 10 EC to expert battery info
> to userspace. This is made part of the x86-android-tablets directory and
> Kconfig option because the i2c_client it binds to is instantiated by
> the x86-android-tablets kmod.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Makefile tweaks
> - postfix variable/define names with units (e.g. _mV / _mAh)
> - Replace i2c_smbus_read_i2c_block_data() with i2c_smbus_read_block_data()
>   which takes care of the length byte prefixing the buffer for us
> - Adress other small review remarks
> ---
>  .../platform/x86/x86-android-tablets/Makefile |   2 +-
>  .../x86/x86-android-tablets/vexia_atla10_ec.c | 259 ++++++++++++++++++
>  2 files changed, 260 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
> index 41ece5a37137..313be30548bc 100644
> --- a/drivers/platform/x86/x86-android-tablets/Makefile
> +++ b/drivers/platform/x86/x86-android-tablets/Makefile
> @@ -3,7 +3,7 @@
>  # X86 Android tablet support Makefile
>  #
>  
> +obj-$(CONFIG_X86_ANDROID_TABLETS) += vexia_atla10_ec.o
>  obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
> -
>  x86-android-tablets-y := core.o dmi.o shared-psy-info.o \
>  			 asus.o lenovo.o other.o
> diff --git a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
> new file mode 100644
> index 000000000000..07df69f6db00
> --- /dev/null
> +++ b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * power_supply class (battery) driver for the I2C attached embedded controller
> + * found on Vexia EDU ATLA 10 (9V version) tablets.
> + *
> + * This is based on the ACPI Battery device in the DSDT which should work
> + * expect that it expects the I2C controller to be enumerated as an ACPI
> + * device and the tablet's BIOS enumerates all LPSS devices as PCI devices
> + * (and changing the LPSS BIOS settings from PCI -> ACPI does not work).
> + *
> + * Copyright (c) 2024 Hans de Goede <hansg@kernel.org>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/power_supply.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include <asm/byteorder.h>
> +
> +/* State field uses ACPI Battery spec status bits */
> +#define ACPI_BATTERY_STATE_DISCHARGING		BIT(0)
> +#define ACPI_BATTERY_STATE_CHARGING		BIT(1)
> +
> +#define ATLA10_EC_BATTERY_STATE_COMMAND		0x87
> +#define ATLA10_EC_BATTERY_INFO_COMMAND		0x88
> +
> +/* From broken ACPI battery device in DSDT */
> +#define ATLA10_EC_VOLTAGE_MIN_DESIGN_uV		3750000



> +
> +struct atla10_ec_battery_state {
> +	u8 status;			/* Using ACPI Battery spec status bits */
> +	u8 capacity;			/* Percent */
> +	__le16 charge_now_mAh;
> +	__le16 voltage_now_mV;
> +	__le16 current_now_mA;
> +	__le16 charge_full_mAh;
> +	__le16 temp;			/* centi degrees Celsius */
> +} __packed;
> +
> +struct atla10_ec_battery_info {
> +	__le16 charge_full_design_mAh;
> +	__le16 voltage_now_mV;		/* Should be design voltage, but is not ? */
> +	__le16 charge_full_design2_mAh;
> +} __packed;

Both struct have only naturally aligned members. Why is __packed needed?

> +
> +struct atla10_ec_data {
> +	struct i2c_client *client;
> +	struct power_supply *psy;
> +	struct delayed_work work;
> +	struct mutex update_lock;
> +	struct atla10_ec_battery_info info;
> +	struct atla10_ec_battery_state state;
> +	bool valid;			/* true if state is valid */
> +	unsigned long last_update;	/* In jiffies */
> +};
> +
> +static int atla10_ec_cmd(struct atla10_ec_data *data, u8 cmd, u8 len, u8 *values)
> +{
> +	struct device *dev = &data->client->dev;
> +	u8 buf[32]; /* i2c_smbus_read_block_data() transfers max 32 bytes */

I2C_SMBUS_BLOCK_MAX ?

> +	int ret;
> +
> +	ret = i2c_smbus_read_block_data(data->client, cmd, buf);
> +	if (ret != len) {
> +		dev_err(dev, "I2C command 0x%02x error: %d\n", cmd, ret);
> +		return -EIO;
> +	}
> +
> +	memcpy(values, buf, len);
> +	return 0;
> +}
> +
> +static int atla10_ec_update(struct atla10_ec_data *data)
> +{
> +	int ret;
> +
> +	/* Cache data for 5 seconds */
> +	if (data->valid && time_before(jiffies, data->last_update + 5 * HZ))

Make a named define out of 5s and put the comment at the define.

> +		return 0;
> +
> +	ret = atla10_ec_cmd(data, ATLA10_EC_BATTERY_STATE_COMMAND,
> +			    sizeof(data->state), (u8 *)&data->state);
> +	if (ret)
> +		return ret;
> +
> +	data->last_update = jiffies;
> +	data->valid = true;
> +	return 0;
> +}
> +
> +static int atla10_ec_psy_get_property(struct power_supply *psy,
> +				      enum power_supply_property psp,
> +				      union power_supply_propval *val)
> +{
> +	struct atla10_ec_data *data = power_supply_get_drvdata(psy);
> +	int charge_now_mAh, charge_full_mAh, ret;
> +
> +	guard(mutex)(&data->update_lock);
> +
> +	ret = atla10_ec_update(data);
> +	if (ret)
> +		return ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_STATUS:
> +		if (data->state.status & ACPI_BATTERY_STATE_DISCHARGING)
> +			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
> +		else if (data->state.status & ACPI_BATTERY_STATE_CHARGING)
> +			val->intval = POWER_SUPPLY_STATUS_CHARGING;
> +		else if (data->state.capacity == 100)
> +			val->intval = POWER_SUPPLY_STATUS_FULL;
> +		else
> +			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
> +		break;
> +	case POWER_SUPPLY_PROP_CAPACITY:
> +		val->intval = data->state.capacity;
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_NOW:
> +		/*
> +		 * The EC has a bug where it reports charge-full-design as
> +		 * charge-now when the battery is full. Clamp charge-now to
> +		 * charge-full to workaround this.
> +		 */
> +		charge_now_mAh = le16_to_cpu(data->state.charge_now_mAh);
> +		charge_full_mAh = le16_to_cpu(data->state.charge_full_mAh);
> +		val->intval = min(charge_now_mAh, charge_full_mAh) * 1000;
> +		break;
> +	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> +		val->intval = le16_to_cpu(data->state.voltage_now_mV) * 1000;
> +		break;
> +	case POWER_SUPPLY_PROP_CURRENT_NOW:
> +		val->intval = le16_to_cpu(data->state.current_now_mA) * 1000;
> +		/*
> +		 * Documentation/ABI/testing/sysfs-class-power specifies
> +		 * negative current for discharging.
> +		 */
> +		if (data->state.status & ACPI_BATTERY_STATE_DISCHARGING)
> +			val->intval = -val->intval;
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_FULL:
> +		val->intval = le16_to_cpu(data->state.charge_full_mAh) * 1000;
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP:
> +		val->intval = le16_to_cpu(data->state.temp) / 10;
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
> +		val->intval = le16_to_cpu(data->info.charge_full_design_mAh) * 1000;

I find it somewhat odd we seem to have Watt and Degree prefix conversion 
defines in linux/units.h but nothing for Amps nor Volts (I was going to 
suggest use the constants there instead of literal but it seems there 
were no defines).

-- 
 i.

> +		break;
> +	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
> +		val->intval = ATLA10_EC_VOLTAGE_MIN_DESIGN_uV;
> +		break;
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval = 1;
> +		break;
> +	case POWER_SUPPLY_PROP_TECHNOLOGY:
> +		val->intval = POWER_SUPPLY_TECHNOLOGY_LIPO;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void atla10_ec_external_power_changed_work(struct work_struct *work)
> +{
> +	struct atla10_ec_data *data = container_of(work, struct atla10_ec_data, work.work);
> +
> +	dev_dbg(&data->client->dev, "External power changed\n");
> +	data->valid = false;
> +	power_supply_changed(data->psy);
> +}
> +
> +static void atla10_ec_external_power_changed(struct power_supply *psy)
> +{
> +	struct atla10_ec_data *data = power_supply_get_drvdata(psy);
> +
> +	/* After charger plug in/out wait 0.5s for things to stabilize */
> +	mod_delayed_work(system_wq, &data->work, HZ / 2);
> +}
> +
> +static const enum power_supply_property atla10_ec_psy_props[] = {
> +	POWER_SUPPLY_PROP_STATUS,
> +	POWER_SUPPLY_PROP_CAPACITY,
> +	POWER_SUPPLY_PROP_CHARGE_NOW,
> +	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> +	POWER_SUPPLY_PROP_CURRENT_NOW,
> +	POWER_SUPPLY_PROP_CHARGE_FULL,
> +	POWER_SUPPLY_PROP_TEMP,
> +	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
> +	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
> +	POWER_SUPPLY_PROP_PRESENT,
> +	POWER_SUPPLY_PROP_TECHNOLOGY,
> +};
> +
> +static const struct power_supply_desc atla10_ec_psy_desc = {
> +	.name = "atla10_ec_battery",
> +	.type = POWER_SUPPLY_TYPE_BATTERY,
> +	.properties = atla10_ec_psy_props,
> +	.num_properties = ARRAY_SIZE(atla10_ec_psy_props),
> +	.get_property = atla10_ec_psy_get_property,
> +	.external_power_changed = atla10_ec_external_power_changed,
> +};
> +
> +static int atla10_ec_probe(struct i2c_client *client)
> +{
> +	struct power_supply_config psy_cfg = { };
> +	struct device *dev = &client->dev;
> +	struct atla10_ec_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	psy_cfg.drv_data = data;
> +	data->client = client;
> +
> +	ret = devm_mutex_init(dev, &data->update_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_delayed_work_autocancel(dev, &data->work,
> +					   atla10_ec_external_power_changed_work);
> +	if (ret)
> +		return ret;
> +
> +	ret = atla10_ec_cmd(data, ATLA10_EC_BATTERY_INFO_COMMAND,
> +			    sizeof(data->info), (u8 *)&data->info);
> +	if (ret)
> +		return ret;
> +
> +	data->psy = devm_power_supply_register(dev, &atla10_ec_psy_desc, &psy_cfg);
> +	return PTR_ERR_OR_ZERO(data->psy);
> +}
> +
> +static const struct i2c_device_id atla10_ec_id_table[] = {
> +	{ "vexia_atla10_ec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, atla10_ec_id_table);
> +
> +static struct i2c_driver atla10_ec_driver = {
> +	.driver = {
> +		.name = "vexia_atla10_ec",
> +	},
> +	.probe = atla10_ec_probe,
> +	.id_table = atla10_ec_id_table,
> +};
> +module_i2c_driver(atla10_ec_driver);
> +
> +MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_DESCRIPTION("Battery driver for Vexia EDU ATLA 10 tablet EC");
> +MODULE_LICENSE("GPL");
> 
