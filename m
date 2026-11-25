Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644262;
	b=NmGhop6nfpfwkHXOthxG7IWHhcOke4LIlvvCe9ifbFhXHH2ElpPV4+A0juXVle9fCzPD
	 MP7yuglpIoTviup5Oz1nanmojD+JXayIFfbBo4773thneK4U7XE+M2jf1OHg2CAaEhv+W
	 quqiOh5xqr8Ktf9k+B8XYgoq9l6/zcJyoPPgvCvvWY3cBuZvlqlL0WkbEc7o0IHCAe961
	 KiHgyjhId3Z/j5KclWr8CDTYPUs5VHGtCjLJi1h5R2VnK2yYtRIpcaaFdu38LwIqyIl7W
	 gKGY+tZTpBOsldD7rZ5ikWdUq6S9AY17bxMt/iUkk5lwAk+PgKpBA+R6SUUQiGHk9yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644262;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=u6Qy1eP9AXMcS0YGdzUTIkDgXFyVXYB9cu5EHurdTks=;
	b=LCquvQPP76sPyPwwC+FtDYckSVV3n0mmKdyX1eepPOq1B5F76h0wV8J5mBmlrbM/5E2z
	 LoPQFfVma+9u0QpDOyDvvOFYZzeYsZTJ9TXF/XyOHUCyCKfZdSiDd54Jyh7L8K7a+R/4k
	 pfsXyUPiVKEfkfR9E1cv6Dj/VugEF7UHHpWbd044zgHT3jTmDyfSY7sbTqEkHmT+EIPXv
	 /ey0at4aOywP5hOYqkHY79u4PlbVwJHXrpCiEPkC1NyvRqqbq/7Jf+9qZIEpp4b/BBSjv
	 Yrxmk37pj/fKRrmWEfs+m2pEhB4AE+PEhlFzs5W4TAItdQyui5Lgn4UTjHIHwIeLibA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZbO7NfeI;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CE1606A31E;
	Wed, 25 Nov 2026 22:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZbO7NfeI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795644262; x=1827180262;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lMb/80yw09Qli5cfDrBkjICNjWURWuysaW0via6gAjw=;
  b=ZbO7NfeI+HtIVC0uW49+RWyMxgF/MfGXsAAqeXQS5Q6OjNjLm9BbqsT1
   79nHYDnSDzkJLShDFxGTaxouGSM1OjRoK9WqIQr7idM3EWp6ELJbBaxEe
   j5wNII8RjGIK/M+Tu9R7mWiroG6qKClC9IFZ++h3Kq1zuRzMEG2J64zBp
   /BFxemq2VJPkSNgSPW5GVLr/2rf65UTLGvF+0s3kwLg+kV9oBMrmlPl/4
   hRGsJ0Hp9HJF31OYfDdn0tMmx+un59DbPQxd4NS+x8tLuPT4VvSmv+CPY
   95SXYQB+OgqihPRDGE/BX4n1470gdkGfBenqZ4dMQM/5Op+h/GCIgx5Te
   w==;
X-CSE-ConnectionGUID: 09qw/9rPTJO4N08m5dXS5g==
X-CSE-MsgGUID: 9n9Bg7ZMRGO0FF31sqS8Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4563375"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4563375"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:04:19 -0800
X-CSE-ConnectionGUID: hRJzoclMT/W8IYj4zEVe+w==
X-CSE-MsgGUID: 66Ir4qgUSgaFnUxE/Zb+WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13646383"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:04:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Nov 2026 00:04:10 +0200 (EET)
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] platform: arm64: lenovo-thinkpad-t14s: Add Gen
 7 EC support
In-Reply-To: <20261123-t14s-gen7-ec-v2-2-3420a6202366@oss.qualcomm.com>
Message-ID: <f575410d-f0be-5ad5-834f-3b1c59109c53@linux.intel.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com> <20261123-t14s-gen7-ec-v2-2-3420a6202366@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2026, Abel Vesa wrote:

> The embedded controller of the ThinkPad T14s Gen 7 uses the same
> register layout and event codes as the Gen 6 one, but a different set
> of I2C commands. Going by the ACPI EC accessors in the Gen 7 firmware:
> 
>   - register read:  write {0x80, reg}, then write {0x80} + read 1 byte
>   - register write: write {0x81, reg, val}
>   - event read:     write {0x84, 0x00}, then write {0x84} + read 1 byte
> 
> With the Gen 6 commands the EC never reports any event and the LED
> and keyboard backlight accesses have no effect.
> 
> Describe the bus accessors and event read per variant and add one for
> the Gen 7. The multi-message Gen 7 reads are done with the I2C bus
> locked, as the Gen 6 ones already are.
> 
> Besides the protocol, the Gen 7 differs in a few other places:
> 
>   - there is no second keyboard backlight register and, when cycled
>     with Fn+Space, the keyboard backlight also reports level 3;
>   - the mic mute LED is a generic LED (id 0x0e) instead of a bit in the
>     audio register;
>   - Fn+F12 reports its own event code (0x19);
>   - suspend is signalled through bit 5 of register 0xcf instead of the
>     Gen 6 modern standby register, and the firmware makes the power and
>     lid logo LEDs glow while suspended;
>   - a few hotkeys which already come in through the I2C-HID keyboard
>     (volume, mute and some Fn+Fxx combinations) also raise an EC event,
>     and the firmware reports some status events nobody acts upon.
> 
> Handle those differences and treat the Gen 7 only events as known ones,
> ignoring the duplicate hotkey events.
> 
> Co-developed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 197 ++++++++++++++++++++++++--
>  1 file changed, 186 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> index 7a875877c8f3..cc7713aeac8e 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -17,7 +17,9 @@
>  #include <linux/interrupt.h>
>  #include <linux/leds.h>
>  #include <linux/lockdep.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/pm.h>
> @@ -26,8 +28,20 @@
>  #define T14S_EC_CMD_ECWR	0x03
>  #define T14S_EC_CMD_EVT		0xf0
>  
> +/*
> + * The Gen 7 (Snapdragon X2) EC uses a different command set over I2C, as
> + * described by the ACPI EC accessors in its firmware (RDEC, WREC, QEVT).
> + */
> +#define T14S_GEN7_EC_CMD_RD	0x80
> +#define T14S_GEN7_EC_CMD_WR	0x81
> +#define T14S_GEN7_EC_CMD_EVT	0x84
> +#define T14S_GEN7_EC_LED_MIC_MUTE	0x0e
> +
>  #define T14S_EC_REG_LED				0x0c
>  #define T14S_EC_REG_KBD_BL1			0x0d
> +#define T14S_EC_REG_MODERN_STANDBY_GEN7		0xcf
> +/* Gen 7 DSDT sets this bit on Windows modern standby entry */
> +#define T14S_EC_MODERN_STANDBY_GEN7_ESLS	BIT(5)
>  #define T14S_EC_REG_MODERN_STANDBY		0xe0
>  #define T14S_EC_MODERN_STANDBY_ENTRY		BIT(1)
>  #define T14S_EC_MODERN_STANDBY_EXIT		BIT(0)
> @@ -41,6 +55,7 @@
>  #define T14S_EC_EVT_NONE			0x00
>  #define T14S_EC_EVT_KEY_FN_4			0x13
>  #define T14S_EC_EVT_KEY_FN_F7			0x16
> +#define T14S_EC_EVT_KEY_FN_F12_GEN7		0x19
>  #define T14S_EC_EVT_KEY_FN_SPACE		0x1f
>  #define T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
>  #define T14S_EC_EVT_AC_CONNECTED		0x26
> @@ -67,6 +82,18 @@
>  #define T14S_EC_EVT_KEY_FN_F11			0x7a
>  #define T14S_EC_EVT_KEY_FN_G			0x7e
>  
> +/* Gen 7 only */
> +#define T14S_GEN7_EC_EVT_HKEY_1010		0x14
> +#define T14S_GEN7_EC_EVT_HKEY_1011		0x15
> +#define T14S_GEN7_EC_EVT_HKEY_1017		0x1c
> +#define T14S_GEN7_EC_EVT_STATUS_35		0x35
> +#define T14S_GEN7_EC_EVT_DYTC			0x3c
> +#define T14S_GEN7_EC_EVT_STATUS_40		0x40
> +#define T14S_GEN7_EC_EVT_STATUS_4B		0x4b
> +#define T14S_GEN7_EC_EVT_STATUS_4E		0x4e
> +#define T14S_GEN7_EC_EVT_HKEY_1016		0x76
> +#define T14S_GEN7_EC_EVT_HKEY_1015		0x7b
> +
>  /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
>  #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
>  
> @@ -83,6 +110,7 @@
>  enum t14s_ec_led_status_t {
>  	T14S_EC_LED_OFF =	0x00,
>  	T14S_EC_LED_ON =	0x80,
> +	T14S_EC_LED_GLOW =	0xa0, /* Gen 7 only, only works for power and lid LEDs */
>  	T14S_EC_LED_BLINK =	0xc0,
>  };
>  
> @@ -93,9 +121,18 @@ struct t14s_ec_led_classdev {
>  	struct t14s_ec *ec;
>  };
>  
> +struct t14s_ec;
> +
> +struct t14s_ec_variant {
> +	const struct regmap_bus *regmap_bus;
> +	int (*read_evt)(struct t14s_ec *ec, u8 *val);
> +};
> +
>  struct t14s_ec {
>  	struct regmap *regmap;
>  	struct device *dev;
> +	const struct t14s_ec_variant *variant;
> +	enum led_brightness mic_mute_cache;
>  	struct t14s_ec_led_classdev led_pwr_btn;
>  	struct t14s_ec_led_classdev led_chrg_orange;
>  	struct t14s_ec_led_classdev led_chrg_white;
> @@ -206,6 +243,85 @@ static int t14s_ec_read_evt(struct t14s_ec *ec, u8 *val)
>  	return ret;
>  }
>  
> +static int t14s_gen7_ec_cmd_read(struct t14s_ec *ec, u8 cmd, u8 arg, u8 *val)
> +{
> +	struct i2c_client *client = to_i2c_client(ec->dev);
> +	u8 req[2] = { cmd, arg };
> +	struct i2c_msg msgs[2] = {
> +		{ .addr = client->addr, .flags = 0, .len = 2, .buf = &req[0] },
> +		{ .addr = client->addr, .flags = I2C_M_RD, .len = 1, .buf = val },
> +	};
> +	int ret;
> +
> +	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +
> +	/* Send cmd + arg */
> +	ret = __i2c_transfer(client->adapter, msgs, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	/* Resend the cmd byte + read the value */
> +	msgs[0].len = 1;
> +	ret = __i2c_transfer(client->adapter, msgs, 2);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = ret == 2 ? 0 : -EIO;

Aren't these literal 2 same as ARRAY_SIZE(msgs) ? (x2)

I wish we could use guard() of the i2c lock.

--
 i.

> +out:
> +	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +	return ret;
> +}
> +
> +static int t14s_gen7_ec_write(void *context, unsigned int reg,
> +			      unsigned int val)
> +{
> +	struct t14s_ec *ec = context;
> +	struct i2c_client *client = to_i2c_client(ec->dev);
> +	u8 buf[3] = { T14S_GEN7_EC_CMD_WR, reg, val };
> +	int ret;
> +
> +	ret = i2c_master_send(client, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int t14s_gen7_ec_read(void *context, unsigned int reg,
> +			     unsigned int *val)
> +{
> +	struct t14s_ec *ec = context;
> +	u8 result;
> +	int ret;
> +
> +	ret = t14s_gen7_ec_cmd_read(ec, T14S_GEN7_EC_CMD_RD, reg, &result);
> +	if (ret)
> +		return ret;
> +
> +	*val = result;
> +	return 0;
> +}
> +
> +static const struct regmap_bus t14s_gen7_ec_regmap_bus = {
> +	.reg_write = t14s_gen7_ec_write,
> +	.reg_read = t14s_gen7_ec_read,
> +};
> +
> +static int t14s_gen7_ec_read_evt(struct t14s_ec *ec, u8 *val)
> +{
> +	return t14s_gen7_ec_cmd_read(ec, T14S_GEN7_EC_CMD_EVT, 0x00, val);
> +}
> +
> +static const struct t14s_ec_variant t14s_ec_variant = {
> +	.regmap_bus = &t14s_ec_regmap_bus,
> +	.read_evt = t14s_ec_read_evt,
> +};
> +
> +static const struct t14s_ec_variant t14s_gen7_ec_variant = {
> +	.regmap_bus = &t14s_gen7_ec_regmap_bus,
> +	.read_evt = t14s_gen7_ec_read_evt,
> +};
> +
>  static void t14s_ec_write_sequence(struct t14s_ec *ec, u8 reg, u8 val, u8 cnt)
>  {
>  	int i;
> @@ -318,6 +434,9 @@ static int t14s_kbd_bl_set(struct led_classdev *led_cdev,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (ec->variant == &t14s_gen7_ec_variant)
> +		return 0;
> +
>  	val = FIELD_PREP(T14S_EC_KBD_BL2_MASK, brightness);
>  	ret = regmap_update_bits(ec->regmap, T14S_EC_REG_KBD_BL2,
>  				 T14S_EC_KBD_BL2_MASK, val);
> @@ -338,7 +457,11 @@ static enum led_brightness t14s_kbd_bl_get(struct led_classdev *led_cdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	return FIELD_GET(T14S_EC_KBD_BL1_MASK, val);
> +	/*
> +	 * When cycled with Fn+Space, the Gen 7 EC also uses 3 for the high
> +	 * level, which looks the same as 2.
> +	 */
> +	return min(FIELD_GET(T14S_EC_KBD_BL1_MASK, val), 2);
>  }
>  
>  static void t14s_kbd_bl_update(struct t14s_ec *ec)
> @@ -383,7 +506,10 @@ static enum led_brightness t14s_mic_mute_led_get(struct led_classdev *led_cdev)
>  	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
>  					  led_mic_mute);
>  
> -	return t14s_audio_led_get(ec, T14S_EC_MIC_MUTE_LED);
> +	if (ec->variant == &t14s_ec_variant)
> +		return t14s_audio_led_get(ec, T14S_EC_MIC_MUTE_LED);
> +
> +	return ec->mic_mute_cache;
>  }
>  
>  static int t14s_mic_mute_led_set(struct led_classdev *led_cdev,
> @@ -391,8 +517,19 @@ static int t14s_mic_mute_led_set(struct led_classdev *led_cdev,
>  {
>  	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
>  					  led_mic_mute);
> +	int ret;
>  
> -	return t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
> +	if (ec->variant == &t14s_ec_variant)
> +		return t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
> +
> +	ret = regmap_write(ec->regmap, T14S_EC_REG_LED,
> +			   T14S_GEN7_EC_LED_MIC_MUTE |
> +			   (brightness ? T14S_EC_LED_ON : T14S_EC_LED_OFF));
> +	if (ret < 0)
> +		return ret;
> +
> +	ec->mic_mute_cache = brightness ? LED_ON : LED_OFF;
> +	return 0;
>  }
>  
>  static enum led_brightness t14s_spk_mute_led_get(struct led_classdev *led_cdev)
> @@ -444,6 +581,7 @@ static const struct key_entry t14s_keymap[] = {
>  	T14S_EC_KEY_ENTRY(FN_F10, KEY_SELECTIVE_SCREENSHOT),
>  	T14S_EC_KEY_ENTRY(FN_F11, KEY_LINK_PHONE),
>  	T14S_EC_KEY_ENTRY(FN_F12, KEY_BOOKMARKS),
> +	T14S_EC_KEY_ENTRY(FN_F12_GEN7, KEY_BOOKMARKS),
>  	T14S_EC_KEY_ENTRY(FN_SPACE, KEY_KBDILLUMTOGGLE),
>  	T14S_EC_KEY_ENTRY(FN_ESC, KEY_FN_ESC),
>  	T14S_EC_KEY_ENTRY(FN_TAB, KEY_ZOOM),
> @@ -478,7 +616,7 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  	int ret;
>  	u8 val;
>  
> -	ret = t14s_ec_read_evt(ec, &val);
> +	ret = ec->variant->read_evt(ec, &val);
>  	if (ret < 0) {
>  		dev_err(ec->dev, "Failed to read event\n");
>  		return IRQ_HANDLED;
> @@ -501,6 +639,7 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  	case T14S_EC_EVT_KEY_FN_4:
>  	case T14S_EC_EVT_KEY_FN_F8:
>  	case T14S_EC_EVT_KEY_FN_F12:
> +	case T14S_EC_EVT_KEY_FN_F12_GEN7:
>  	case T14S_EC_EVT_KEY_FN_TAB:
>  	case T14S_EC_EVT_KEY_FN_F10:
>  	case T14S_EC_EVT_KEY_FN_N:
> @@ -553,6 +692,23 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  	case T14S_EC_EVT_KEY_FN_D:
>  		dev_dbg(ec->dev, "FN + D - toggle privacy guard mode\n");
>  		break;
> +	case T14S_GEN7_EC_EVT_DYTC:
> +	/*
> +	 * Keys which send an EC event which the DSDT maps to a HKEY, which
> +	 * also send a key-press over I2C-HID, so ignore the EC event.
> +	 */
> +	case T14S_GEN7_EC_EVT_HKEY_1010:
> +	case T14S_GEN7_EC_EVT_HKEY_1011:
> +	case T14S_GEN7_EC_EVT_HKEY_1015:
> +	case T14S_GEN7_EC_EVT_HKEY_1016:
> +	case T14S_GEN7_EC_EVT_HKEY_1017:
> +	/* Status events the Gen 7 firmware does not act upon either */
> +	case T14S_GEN7_EC_EVT_STATUS_35:
> +	case T14S_GEN7_EC_EVT_STATUS_40:
> +	case T14S_GEN7_EC_EVT_STATUS_4B:
> +	case T14S_GEN7_EC_EVT_STATUS_4E:
> +		dev_dbg(ec->dev, "EC event 0x%02x\n", val);
> +		break;
>  	default:
>  		dev_info(ec->dev, "Unknown EC event: 0x%02x\n", val);
>  		break;
> @@ -572,9 +728,13 @@ static int t14s_ec_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	ec->dev = dev;
> +	ec->variant = i2c_get_match_data(client);
> +	if (!ec->variant)
> +		ec->variant = &t14s_ec_variant;
> +
>  	i2c_set_clientdata(client, ec);
>  
> -	ec->regmap = devm_regmap_init(dev, &t14s_ec_regmap_bus,
> +	ec->regmap = devm_regmap_init(dev, ec->variant->regmap_bus,
>  				      ec, &t14s_ec_regmap_config);
>  	if (IS_ERR(ec->regmap))
>  		return dev_err_probe(dev, PTR_ERR(ec->regmap),
> @@ -618,8 +778,15 @@ static int t14s_ec_suspend(struct device *dev)
>  
>  	led_classdev_suspend(&ec->kbd_backlight);
>  
> -	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
> -			       T14S_EC_MODERN_STANDBY_ENTRY, 3);
> +	if (ec->variant == &t14s_ec_variant) {
> +		t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
> +				       T14S_EC_MODERN_STANDBY_ENTRY, 3);
> +	} else {
> +		regmap_assign_bits(ec->regmap, T14S_EC_REG_MODERN_STANDBY_GEN7,
> +				   T14S_EC_MODERN_STANDBY_GEN7_ESLS, 1);
> +		t14s_led_set_status(ec, &ec->led_pwr_btn, T14S_EC_LED_GLOW);
> +		t14s_led_set_status(ec, &ec->led_lid_logo_dot, T14S_EC_LED_GLOW);
> +	}
>  
>  	return 0;
>  }
> @@ -628,8 +795,15 @@ static int t14s_ec_resume(struct device *dev)
>  {
>  	struct t14s_ec *ec = dev_get_drvdata(dev);
>  
> -	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
> -			       T14S_EC_MODERN_STANDBY_EXIT, 3);
> +	if (ec->variant == &t14s_ec_variant) {
> +		t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
> +				       T14S_EC_MODERN_STANDBY_EXIT, 3);
> +	} else {
> +		regmap_assign_bits(ec->regmap, T14S_EC_REG_MODERN_STANDBY_GEN7,
> +				   T14S_EC_MODERN_STANDBY_GEN7_ESLS, 0);
> +		t14s_led_set_status(ec, &ec->led_pwr_btn, T14S_EC_LED_ON);
> +		t14s_led_set_status(ec, &ec->led_lid_logo_dot, T14S_EC_LED_ON);
> +	}
>  
>  	led_classdev_resume(&ec->kbd_backlight);
>  
> @@ -637,13 +811,14 @@ static int t14s_ec_resume(struct device *dev)
>  }
>  
>  static const struct of_device_id t14s_ec_of_match[] = {
> -	{ .compatible = "lenovo,thinkpad-t14s-ec" },
> +	{ .compatible = "lenovo,thinkpad-t14s-ec", .data = &t14s_ec_variant },
> +	{ .compatible = "lenovo,thinkpad-t14s-gen7-ec", .data = &t14s_gen7_ec_variant },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, t14s_ec_of_match);
>  
>  static const struct i2c_device_id t14s_ec_i2c_id_table[] = {
> -	{ .name = "thinkpad-t14s-ec" },
> +	{ .name = "thinkpad-t14s-ec", .driver_data = (kernel_ulong_t)&t14s_ec_variant },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, t14s_ec_i2c_id_table);
> 
> 

