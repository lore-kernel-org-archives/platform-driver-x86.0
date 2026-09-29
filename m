Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B41314B72;
	Tue, 29 Sep 2026 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668768; cv=none; b=NcqjwMyhcL2LJwCph9CEaY/d7UdfI00tQIm8EV3O3+tc0q0se8nUUJI6+OnkXIU/QuwDPliYekHKkVNh3SHvJaFuV7jHCcUhUqnz9+BoZfyEJVViwCowI1CFAIZ37mtrBFP3hzFp3Y91M1QuQ0EWtOFh55sIupBF6MP+vdklU00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668768; c=relaxed/simple;
	bh=2XNlLFRY+cHAxAzfJ2BVI4c5+DGJ5PqSloWx/ugmvm4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rKI5HaXH6mxPdkEe9lBc/uW7RK10DjwudtCfuPwWPDT0DCckA21l++BNoWdA0BELTn3b4fR49MrN3BfO2s/76ycU4jDR7kQsyQZCGXYHbGEdCF6lLG/esTDygecNPecYEY7GnsnEoNbtzYRTLD1nePUR2tsJ5niO7XjOZ9V8/Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIiRDZjY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIiRDZjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790668765; x=1822204765;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2XNlLFRY+cHAxAzfJ2BVI4c5+DGJ5PqSloWx/ugmvm4=;
  b=fIiRDZjYD45VmVspvbXRUd1WLt1B/W9EAmQ85aXsAflNsVZVBwNHYnHE
   ZOOcwqFn4s76wdw2Loa93dUZW6+Kps9tSjVaIvuWQENBgMcyUlMBVLtly
   /f1vRrC1u6D4A9xHWZ9Goswr3ppwjTFipGVfnMO8qxu4PJ4C/E6QdV2kc
   gyyfe0kruatAtVEg0DhJqW5ROtwKvVtxuLYREMBUQs/27pltYQshSWW/7
   qyBp52MSwdl4uzuKWkxtS/pzX6aHQ9sYBiG3oLVANWRHixgbDB4F7oSiZ
   /aD4ERkJJfHHRhNYUs4qY1YvRN9kwfuRpl60kXOcfztr4LdCzgjlyNG3g
   w==;
X-CSE-ConnectionGUID: OQ/7BLIHQVypajWMynL3eA==
X-CSE-MsgGUID: yASxXoydTD6U72wwmSGMKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101951007"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101951007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 00:59:24 -0700
X-CSE-ConnectionGUID: PiNoqnMjQXiPua/qwoSqhw==
X-CSE-MsgGUID: hUSaU7bETAqdYfSDFjoWgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275442984"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.234])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 00:59:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Sep 2026 10:59:15 +0300 (EEST)
To: Alex Robinson <alex@ironrobin.net>
cc: Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, 
    Steev Klimaszewski <threeway@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
In-Reply-To: <20260928222056.10044-3-alex@ironrobin.net>
Message-ID: <c24a6fb5-3281-6a6d-9913-8426fda8b842@linux.intel.com>
References: <20260928222056.10044-1-alex@ironrobin.net> <20260928222056.10044-3-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Sep 2026, Alex Robinson wrote:

> Add a standalone driver for the Lenovo ThinkPad X13s embedded controller,
> providing keyboard-backlight control and notifications of firmware-driven
> brightness changes. Keep the X13s-specific backlight, event and
> power-management handling separate from the T14s driver.
> 
> Use STOP-separated command and response transfers and serialize EC
> access, including keyboard-backlight read-modify-write operations.
> Follow the EC command and power-state GPIO sequence described by the
> X13s ACPI DSDT when entering and leaving low power.
> 
> Save the firmware-updated brightness in the EC on Fn+Space and restore
> it on lid open, following the DSDT's SCMS(0x20) and SCMS(0x21) operations.
> Also save software-selected brightness so lid opening does not reinstate
> an older setting; this extends the DSDT's MLCS path, which does not
> explicitly save it.
> 
> Defer event queries while suspended until normal resume, when the I2C
> controller is usable again. Save the hardware backlight brightness before
> entering low power and attempt to restore it on resume because the
> transition can reset it. Process deferred events afterwards so a lid-open
> restore takes precedence over a snapshot taken after lid closure blanked
> the light.
> 
> Disable EC wakeup by default, following the upstream ThinkPad T14s EC
> driver's policy. The interrupt multiplexes events and no selective X13s
> EC wake-event mask is currently known. In particular, lid-close event
> 0x53 can wake the system, but identifying the event requires querying the
> EC over QUP8/I2C after the system has resumed far enough to use the bus.
> Disable wake broadly rather than trying to filter an already-triggered
> wakeup. This also prevents other EC events from waking the system by
> default; normal runtime interrupt handling remains enabled.
> 
> Keep wakeup-source in DT to describe hardware capability. The I2C core
> sets up the wake IRQ before probe, and the driver disables wakeup policy
> without removing that capability. Userspace can explicitly re-enable it.
> Feedback on a selective X13s EC event-mask mechanism would be welcome.
> 
> This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
> 
> Assisted-by: LLM
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> 
> ---
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27177,6 +27177,12 @@ THINKPAD T14S EMBEDDED CONTROLLER DRIVER
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
> index e32e01b2a9bdd970d6f2b2bf6b051472c9a16103..c20b2fb40962f1d46e896ea7f7d0b16028f92f96 100644
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
> index 0000000000000000000000000000000000000000..c600a616c9b6e8f4259caf61fd5c16d129547c90
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> @@ -0,0 +1,416 @@
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
> +	bool suspended;
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
> +	ret = ret == 1 ? 0 : (ret < 0 ? ret : -EIO);

This looks unnecessarily convoluted. Please move this to the end and split 
it to multiple if checks that return immediately. Preferrably make the 
error returning checks first and leave return 0 as the last.

> +	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +	fsleep(10000);
> +	return ret;
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
> +	ret = ret == sizeof(buf) ? 0 : (ret < 0 ? ret : -EIO);

Ditto.

> +	fsleep(10000);
> +	return ret;
> +}
> +
> +static int x13s_brightness(struct x13s_ec *ec)
> +{
> +	u8 value;
> +	int ret;
> +
> +	ret = x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT, &value);
> +	if (ret)
> +		return ret;
> +
> +	ret = FIELD_GET(X13S_EC_BACKLIGHT_MASK, value);
> +	return ret == 3 ? -EINVAL : ret;

Is that ret == 3 actually a > max_brightness check?

Add another variable that is called "brigthness", do not use a generic 
return variable for this.

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
> +	u8 old, new;
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	if (brightness > 2)

> max_brightness ?

> +		return -EINVAL;
> +
> +	ret = x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT, &old);
> +	if (ret)
> +		return ret;
> +	/* Never interpret or overwrite a reserved current brightness. */
> +	if (FIELD_GET(X13S_EC_BACKLIGHT_MASK, old) == 3)

Here too?

> +		return -EINVAL;
> +	new = (old & ~X13S_EC_BACKLIGHT_MASK) |
> +		FIELD_PREP(X13S_EC_BACKLIGHT_MASK, brightness);

The indentation seems off by a bit but I think this could use 
FIELD_MODIFY() instead.

> +	return x13s_write(ec, X13S_EC_REG_KBD_BACKLIGHT, new);
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
> +	value &= ~X13S_EC_BACKLIGHT_SAVED_MASK;
> +	value |= FIELD_PREP(X13S_EC_BACKLIGHT_SAVED_MASK, brightness);

FIELD_MODIFY()

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
> +	mutex_lock(&ec->lock);
> +	ret = x13s_set_brightness_locked(ec, brightness);
> +	/* Keep software selections across the EC's lid blank/restore cycle. */
> +	if (!ret)

Please use guard() so that this can return error immediately (reverse 
the logic and handle error first).

> +		ret = x13s_save_brightness_locked(ec, brightness);
> +	mutex_unlock(&ec->lock);
> +	return ret;
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

Add include.

> +		return;
> +	}
> +	ret = x13s_save_brightness_locked(ec, brightness);
> +	if (ret)
> +		dev_err_ratelimited(&ec->client->dev,
> +				    "Backlight save failed: %d\n", ret);

Use braces for multiline constructs.

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
> +	if (IS_ERR(ec->power_state))
> +		return dev_err_probe(dev, PTR_ERR(ec->power_state),
> +				     "Failed to acquire power-state GPIO high\n");

Braces.

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
> +	if (ret)
> +		dev_err(&ec->client->dev, "Failed to set power-state GPIO to %d: %d\n",
> +			value, ret);

Braces.

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
> +	mutex_lock(&ec->lock);

Please convert to guard() so you can return immediately as needed.

> +	if (ec->suspended)
> +		goto out;
> +	/* Keep the previous snapshot if reading the hardware fails. */
> +	ret = x13s_brightness(ec);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to save backlight brightness: %d\n", ret);
> +	else
> +		ec->saved_brightness = ret;
> +
> +	/* DSDT: register 0x80 <- 0x55, then GPIO176 low. */
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_ENTER);
> +	if (ret)
> +		dev_err(dev, "Failed to enter low power: %d\n", ret);
> +	else
> +		x13s_power_gpio(ec, 0);
> +	/* Defer event queries throughout host suspend, even on EC failure. */
> +	ec->suspended = true;
> +out:
> +	mutex_unlock(&ec->lock);
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
> +	ret = x13s_set_brightness_locked(ec, ec->saved_brightness);

What if it was not stored? Or ->saved_brightness is stale (from an 
earlier suspend than the latest one)?

> +	if (ret)
> +		dev_err(dev, "Failed to restore backlight brightness: %d\n", ret);
> +	else
> +		/* A software restore is not a hardware brightness change. */
> +		ec->led.brightness = ec->saved_brightness;

Braces needed.

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

-- 
 i.

