Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13A3EC805;
	Wed, 30 Sep 2026 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750351; cv=none; b=liVFamJfpma1P6WdRMJNXQz4OtQPEJEX/Zelxzg7D0d28cEdw5+JAG9b0LQsQXSK86L51zwIH2fYcV3Coo42hI6cm9H4wJzB2EG/pPSfrW+i3ZNWcb/mZtPr7KBtmifk7LjDDOfGZgDct+qbZwwPB5CwFlJkfbEjo/bK9oUhC4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750351; c=relaxed/simple;
	bh=00dQmWupPL5Gfzj13iH4jHhX+Q9fDUiWmT2XVMUn2+o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YW/KF9pHdHUmRhizHlV0Z7Rf9P4g3Y+8dkZjqk606gF8QXaIOkFy0qrDvjm2xASS2bmxXUOYx4i0mE5FnzU0MQu3Im5cVkTbxV/FJA0pfMzcf6ULqyfPUQ1EPj/9LPsHrzMS9Kb32KzjHaQTzeTEbctS9FBLtx0QoRGHdX1zSn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxlJHaVy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxlJHaVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790750349; x=1822286349;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=00dQmWupPL5Gfzj13iH4jHhX+Q9fDUiWmT2XVMUn2+o=;
  b=WxlJHaVys5KdovO+SwJ7sd4shmnSxpeYFGAcjIepqFvAFolmkYjtV33P
   hTikAyBLQGq1zft9CJAKdW1QbD8XYsIWgh0KFdZywp5lfV+TZtvpz5Pxq
   c5RI3o3FtykT9Ur6N4QHdhWq5F0dhPoK5Wq2zHYg5nXCq3LQEISL/heLP
   apQzEdxYPMvdrPJRSVTq0+l6y5VlJh9C/pT0TktEiQuMYl51nKIdqyoyc
   4zyh3cyokVBcQEABPMFvbcnrfAOTBRi5edx92JjHOuCdbzuzeM+l+pceH
   0yJuGGvu4hht4xmX3/pnuoZ5rXxUECYIXEjbIPwD/Pt4V/UqgTVSBHNZH
   g==;
X-CSE-ConnectionGUID: 9r4dK39yTnSbsYgPSrN7KA==
X-CSE-MsgGUID: mP4bop36Tl6Z+9z48JTN+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90340689"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90340689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 23:39:08 -0700
X-CSE-ConnectionGUID: kBSfPLFyS1aFDUMbMq919g==
X-CSE-MsgGUID: /nLbdXWpQSGv5RDgjNtIGA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 23:39:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Sep 2026 09:38:59 +0300 (EEST)
To: Alex Robinson <alex@ironrobin.net>
cc: Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, 
    Steev Klimaszewski <threeway@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
In-Reply-To: <20260929192908.16507-3-alex@ironrobin.net>
Message-ID: <87af07b0-a2aa-ac88-af6e-372fd6e92f5b@linux.intel.com>
References: <20260929192908.16507-1-alex@ironrobin.net> <20260929192908.16507-3-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Sep 2026, Alex Robinson wrote:

> Add support for the ThinkPad X13s embedded controller to expose keyboard
> backlight control and firmware-driven brightness changes when booting
> with Device Tree. Its backlight, event and power-management interfaces
> differ from the T14s EC and require separate handling.
> 
> Preserve brightness across lid and system-sleep transitions using the
> sequences described by the X13s ACPI firmware.
> 
> Leave EC wakeup disabled by default because the shared interrupt can
> wake the system on lid closure and no selective event mask is known.
> Userspace can enable wakeup when desired.
> 
> This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
> 
> Assisted-by: LLM
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> 
> ---
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc3cae2e378b34aeb705cef654c720ca9f2ba223..86ae65ac93e7575815f34dbc7a690042ad9ca3b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27177,6 +27177,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>  F:	drivers/platform/arm64/lenovo-thinkpad-t14s.c
>  
> +THINKPAD X13S EMBEDDED CONTROLLER DRIVER
> +M:	Alex Robinson <alex@ironrobin.net>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-x13s-ec.yaml
> +F:	drivers/platform/arm64/lenovo-thinkpad-x13s.c
> +
>  THINKPAD LMI DRIVER
>  M:	Mark Pearson <mpearson-lenovo@squebb.ca>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index e32e01b2a9bdd970d6f2b2bf6b051472c9a16103..eb0b84e5a93733ca16fc871ea94eda30f5760b3c 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -90,6 +90,22 @@ config EC_LENOVO_THINKPAD_T14S
>  
>  	  Say M or Y here to include this support.
>  
> +config EC_LENOVO_THINKPAD_X13S
> +	tristate "Lenovo ThinkPad X13s Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on GPIOLIB
> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	select LEDS_BRIGHTNESS_HW_CHANGED
> +	help
> +	  Driver for the embedded controller in the Lenovo ThinkPad X13s.
> +	  Provides keyboard backlight control, hardware brightness change
> +	  notifications and system sleep power sequencing.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-thinkpad-x13s.
> +
>  config EC_QCOM_HAMOA
>  	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 7681be4a46e94e7cb80e50bcc5b724cb0961357b..23ed6eef7ce41a5f45d48f5f83b281ebbca94cbb 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -9,4 +9,5 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> +obj-$(CONFIG_EC_LENOVO_THINKPAD_X13S) += lenovo-thinkpad-x13s.o
>  obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-x13s.c b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..4a7d5d03690955ba6fd3760a8af4e76b999a68bc
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Lenovo ThinkPad X13s embedded controller */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/leds.h>
> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/pm.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/ratelimit.h>

I think this was wrong/unnecessary include to add, I was expecting 
dev_printk.h which has those dev_*_retelimited() (and dev_*() printing in 
general).

> +#include <linux/slab.h>
> +
> +#define X13S_EC_CMD_READ		0x02
> +#define X13S_EC_CMD_WRITE		0x03
> +#define X13S_EC_CMD_EVENT		0xf0
> +#define X13S_EC_REG_POWER_STATE	0x80
> +#define X13S_EC_POWER_STATE_ENTER	0x55
> +#define X13S_EC_POWER_STATE_EXIT	0xaa
> +#define X13S_EC_REG_KBD_BACKLIGHT	0xc0
> +#define X13S_EC_BACKLIGHT_MASK	GENMASK(5, 4)
> +#define X13S_EC_REG_KBD_BACKLIGHT_SAVED	0x15
> +#define X13S_EC_BACKLIGHT_SAVED_MASK	GENMASK(2, 1)
> +#define X13S_EC_EVENT_FN_SPACE	0x1f
> +#define X13S_EC_EVENT_LID_OPEN	0x52
> +
> +struct x13s_ec {
> +	struct i2c_client *client;
> +	struct gpio_desc *power_state;
> +	/* Serializes EC transactions, backlight RMW and suspend/event state. */
> +	struct mutex lock;
> +	struct led_classdev led;
> +	enum led_brightness saved_brightness;
> +	bool saved_brightness_valid;
> +	bool suspended;

Why you need this, doesn't pm core already have this information for you?

> +	bool event_pending;
> +};
> +
> +/*
> + * Each single-message transfer ends in STOP. Hold the bus segment across
> + * both halves so another client cannot interleave them. Keep the 10 ms
> + * post-command settling delay, including on failure.
> + */
> +static int x13s_read(struct x13s_ec *ec, u8 cmd, u8 reg, u8 *value)
> +{
> +	struct i2c_client *client = ec->client;
> +	u8 buf[] = { cmd, reg, 0, 1 };
> +	struct i2c_msg request = {
> +		.addr = client->addr,
> +		.flags = I2C_M_STOP,
> +		.len = sizeof(buf),
> +		.buf = buf,
> +	};
> +	struct i2c_msg response = {
> +		.addr = client->addr,
> +		.flags = I2C_M_RD,
> +		.len = 1,
> +		.buf = value,
> +	};
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	if (ec->suspended)
> +		return -EBUSY;
> +
> +	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +	ret = __i2c_transfer(client->adapter, &request, 1);
> +	if (ret == 1)
> +		ret = __i2c_transfer(client->adapter, &response, 1);
> +	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +	fsleep(10000);
> +
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	return 0;

Much easier to read, thanks.

--
 i.

> +}
> +
> +/* Also used by normal PM callbacks while ordinary EC access is blocked. */
> +static int x13s_write(struct x13s_ec *ec, u8 reg, u8 value)
> +{
> +	u8 buf[] = { X13S_EC_CMD_WRITE, reg, 0, 1, value };
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +
> +	ret = i2c_master_send(ec->client, buf, sizeof(buf));
> +	fsleep(10000);
> +
> +	if (ret < 0)
> +		return ret;
> +	if (ret != sizeof(buf))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int x13s_brightness(struct x13s_ec *ec)
> +{
> +	u8 value;
> +	int brightness, ret;
> +
> +	ret = x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT, &value);
> +	if (ret)
> +		return ret;
> +
> +	brightness = FIELD_GET(X13S_EC_BACKLIGHT_MASK, value);
> +	if (brightness > ec->led.max_brightness)
> +		return -EINVAL;
> +
> +	return brightness;
> +}
> +
> +static enum led_brightness x13s_brightness_get(struct led_classdev *led)
> +{
> +	struct x13s_ec *ec = container_of(led, struct x13s_ec, led);
> +	int ret;
> +
> +	mutex_lock(&ec->lock);
> +	ret = x13s_brightness(ec);
> +	mutex_unlock(&ec->lock);
> +	return ret;
> +}
> +
> +static int x13s_set_brightness_locked(struct x13s_ec *ec,
> +				      enum led_brightness brightness)
> +{
> +	u8 value;
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	if (brightness > ec->led.max_brightness)
> +		return -EINVAL;
> +
> +	ret = x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT, &value);
> +	if (ret)
> +		return ret;
> +	/* Never interpret or overwrite a reserved current brightness. */
> +	if (FIELD_GET(X13S_EC_BACKLIGHT_MASK, value) > ec->led.max_brightness)
> +		return -EINVAL;
> +	FIELD_MODIFY(X13S_EC_BACKLIGHT_MASK, &value, brightness);
> +	return x13s_write(ec, X13S_EC_REG_KBD_BACKLIGHT, value);
> +}
> +
> +/* SCMS(0x20): save the brightness obtained from C0 in the EC. */
> +static int x13s_save_brightness_locked(struct x13s_ec *ec,
> +				       enum led_brightness brightness)
> +{
> +	u8 value;
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	ret = x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT_SAVED,
> +			&value);
> +	if (ret)
> +		return ret;
> +
> +	FIELD_MODIFY(X13S_EC_BACKLIGHT_SAVED_MASK, &value, brightness);
> +	return x13s_write(ec, X13S_EC_REG_KBD_BACKLIGHT_SAVED, value);
> +}
> +
> +/* SCMS(0x21): restore C0 from the EC's saved brightness. */
> +static int x13s_restore_brightness_locked(struct x13s_ec *ec)
> +{
> +	u8 value;
> +	int brightness, ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	ret = x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT_SAVED,
> +			&value);
> +	if (ret)
> +		return ret;
> +
> +	brightness = FIELD_GET(X13S_EC_BACKLIGHT_SAVED_MASK, value);
> +	ret = x13s_set_brightness_locked(ec, brightness);
> +	return ret ? ret : brightness;
> +}
> +
> +static int x13s_brightness_set(struct led_classdev *led,
> +			       enum led_brightness brightness)
> +{
> +	struct x13s_ec *ec = container_of(led, struct x13s_ec, led);
> +	int ret;
> +
> +	guard(mutex)(&ec->lock);
> +	ret = x13s_set_brightness_locked(ec, brightness);
> +	if (ret)
> +		return ret;
> +
> +	/* Keep software selections across the EC's lid blank/restore cycle. */
> +	return x13s_save_brightness_locked(ec, brightness);
> +}
> +
> +static void x13s_refresh_brightness(struct x13s_ec *ec)
> +{
> +	int brightness, ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	/* Firmware owns the transition; save its result as _Q1F does. */
> +	brightness = x13s_brightness(ec);
> +	if (brightness < 0) {
> +		dev_err_ratelimited(&ec->client->dev,
> +				    "Backlight refresh failed: %d\n", brightness);
> +		return;
> +	}
> +	ret = x13s_save_brightness_locked(ec, brightness);
> +	if (ret) {
> +		dev_err_ratelimited(&ec->client->dev,
> +				    "Backlight save failed: %d\n", ret);
> +	}
> +	led_classdev_notify_brightness_hw_changed(&ec->led, brightness);
> +}
> +
> +static void x13s_query_event(struct x13s_ec *ec)
> +{
> +	u8 event;
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	/* One query per interrupt, with no event-draining loop or retry. */
> +	ret = x13s_read(ec, X13S_EC_CMD_EVENT, 0, &event);
> +	if (ret) {
> +		dev_err_ratelimited(&ec->client->dev, "Event query failed: %d\n", ret);
> +		return;
> +	}
> +	if (event == X13S_EC_EVENT_FN_SPACE) {
> +		x13s_refresh_brightness(ec);
> +	} else if (event == X13S_EC_EVENT_LID_OPEN) {
> +		ret = x13s_restore_brightness_locked(ec);
> +		if (ret < 0) {
> +			dev_err_ratelimited(&ec->client->dev,
> +					    "Backlight lid restore failed: %d\n", ret);
> +			return;
> +		}
> +		ec->led.brightness = ret;
> +		led_classdev_notify_brightness_hw_changed(&ec->led, ret);
> +	}
> +}
> +
> +static void x13s_process_pending_event(struct x13s_ec *ec)
> +{
> +	lockdep_assert_held(&ec->lock);
> +	if (ec->event_pending) {
> +		ec->event_pending = false;
> +		x13s_query_event(ec);
> +	}
> +}
> +
> +static irqreturn_t x13s_irq(int irq, void *data)
> +{
> +	struct x13s_ec *ec = data;
> +
> +	mutex_lock(&ec->lock);
> +	/* Coalesce suspended IRQs into one query; never access I2C here. */
> +	if (ec->suspended)
> +		ec->event_pending = true;
> +	else
> +		x13s_query_event(ec);
> +	mutex_unlock(&ec->lock);
> +	return IRQ_HANDLED;
> +}
> +
> +static int x13s_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct x13s_ec *ec;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return -EOPNOTSUPP;
> +	if (client->irq <= 0)
> +		return dev_err_probe(dev, -EINVAL, "Missing event IRQ\n");
> +	if (irq_get_trigger_type(client->irq) != IRQ_TYPE_EDGE_FALLING)
> +		return dev_err_probe(dev, -EINVAL, "Expected falling-edge IRQ\n");
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +	ec->client = client;
> +	ret = devm_mutex_init(dev, &ec->lock);
> +	if (ret)
> +		return ret;
> +	i2c_set_clientdata(client, ec);
> +
> +	ec->power_state = devm_gpiod_get(dev, "power-state", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ec->power_state)) {
> +		return dev_err_probe(dev, PTR_ERR(ec->power_state),
> +				     "Failed to acquire power-state GPIO high\n");
> +	}
> +
> +	ec->led.name = "platform::kbd_backlight";
> +	ec->led.max_brightness = 2;
> +	ec->led.flags = LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
> +	ec->led.brightness_get = x13s_brightness_get;
> +	ec->led.brightness_set_blocking = x13s_brightness_set;
> +	ret = devm_led_classdev_register(dev, &ec->led);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register keyboard backlight\n");
> +
> +	/* Devres synchronizes the IRQ before unregistering the LED. */
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, x13s_irq,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request event IRQ\n");
> +
> +	/*
> +	 * As on the T14s, disable wakeup by default since selective EC event
> +	 * masking is not known. Keep runtime IRQ handling enabled.
> +	 */
> +	device_wakeup_disable(dev);
> +
> +	return 0;
> +}
> +
> +static int x13s_power_gpio(struct x13s_ec *ec, int value)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	ret = gpiod_set_value_cansleep(ec->power_state, value);
> +	if (ret) {
> +		dev_err(&ec->client->dev, "Failed to set power-state GPIO to %d: %d\n",
> +			value, ret);
> +	}
> +	return ret;
> +}
> +
> +static void x13s_exit_low_power(struct x13s_ec *ec)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	x13s_power_gpio(ec, 1);
> +	/* DSDT: GPIO176 high, Sleep(10), then register 0x80 <- 0xaa. */
> +	fsleep(10000);
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_EXIT);
> +	if (ret)
> +		dev_err(&ec->client->dev, "Failed to exit low power: %d\n", ret);
> +
> +	/* Resume ordinary access even if the EC exit attempt failed. */
> +	ec->suspended = false;
> +}
> +
> +static int x13s_suspend(struct device *dev)
> +{
> +	struct x13s_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Finish in-flight access while the GENI parent is still usable. */
> +	guard(mutex)(&ec->lock);
> +	if (ec->suspended)
> +		return 0;
> +	/* Only restore a snapshot captured during this suspend. */
> +	ec->saved_brightness_valid = false;
> +	ret = x13s_brightness(ec);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to save backlight brightness: %d\n", ret);
> +	} else {
> +		ec->saved_brightness = ret;
> +		ec->saved_brightness_valid = true;
> +	}
> +
> +	/* DSDT: register 0x80 <- 0x55, then GPIO176 low. */
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_ENTER);
> +	if (ret)
> +		dev_err(dev, "Failed to enter low power: %d\n", ret);
> +	else
> +		x13s_power_gpio(ec, 0);
> +	/* Defer event queries throughout host suspend, even on EC failure. */
> +	ec->suspended = true;
> +	return 0;
> +}
> +
> +static int x13s_resume(struct device *dev)
> +{
> +	struct x13s_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/*
> +	 * Normal resume runs after the adapter and its GENI parent. In
> +	 * particular, device_resume_early() has re-enabled runtime PM:
> +	 * GENI's resume_noirq() alone is not sufficient for I2C transfers.
> +	 * Consume the pending query under the IRQ thread's mutex, without
> +	 * a worker that could race a new IRQ or the next suspend.
> +	 */
> +	mutex_lock(&ec->lock);
> +	x13s_exit_low_power(ec);
> +	if (ec->saved_brightness_valid) {
> +		ret = x13s_set_brightness_locked(ec, ec->saved_brightness);
> +		if (ret) {
> +			dev_err(dev, "Failed to restore backlight brightness: %d\n", ret);
> +		} else {
> +			/* A software restore is not a hardware brightness change. */
> +			ec->led.brightness = ec->saved_brightness;
> +		}
> +		ec->saved_brightness_valid = false;
> +	}
> +
> +	/* A deferred lid-open restore must supersede the PM snapshot. */
> +	x13s_process_pending_event(ec);
> +	mutex_unlock(&ec->lock);
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(x13s_pm_ops, x13s_suspend, x13s_resume);
> +
> +static const struct of_device_id x13s_of_match[] = {
> +	{ .compatible = "lenovo,thinkpad-x13s-ec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, x13s_of_match);
> +
> +static struct i2c_driver x13s_driver = {
> +	.probe = x13s_probe,
> +	.driver = {
> +		.name = "thinkpad-x13s-ec",
> +		.of_match_table = x13s_of_match,
> +		.pm = pm_sleep_ptr(&x13s_pm_ops),
> +	},
> +};
> +module_i2c_driver(x13s_driver);
> +
> +MODULE_DESCRIPTION("Lenovo ThinkPad X13s Embedded Controller");
> +MODULE_LICENSE("GPL");
> 
