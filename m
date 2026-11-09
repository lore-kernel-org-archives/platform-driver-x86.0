Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235940;
	b=r9tDxXJhg5VuuKgoPCjbmfkt66Y/gch22TkmjeicOI5mZW8vR4PS+RCA4Q7VDE0YjH/B
	 GDGKehqbiSmiivZLWQUbcTDJ5/CrRU7UwkCAIaswQR8SH1iWlDIYsaUD0EUTxKK/K5Vvw
	 VOUtfU8qNsVe5w0XNIE2lCZJr7p4pj4gRqfl8mbzngbYB6t63v8/1VSczj+EQClAJtted
	 p2/HFoV4kN/IUYMGWANbiwDGot2ioDaE/7ziwGEb0gYDLKqHUYes77VCCVTlgI0j1aBCl
	 ba0TTR41LoD2Yv9EcDD5pE8mT7kr7x/pyy12p3PHxYYOPwFJXEIiXDheVBCp+VY9OPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235940;
	h=Received:DKIM-Signature:Content-Type:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:
	 In-Reply-To;
	bh=2oVPBYkb4OhMVyaoo0ulP7ahotUGDEEMMhcAhNtiOyo=;
	b=B8DDaQX6MhNq7z4ZWghdyU3tO8rL7XZXSr1wyXqH8q7xZ7i2wloDx5wvlxuC6KJ3a8EF
	 l7eSKnhiO8qcAQ27Bk4nO+D+kDcgeyzm5QWoBwUZpylAepfgAp/BP+BzW5cFTjcFreC4M
	 tc99YUuoSxZvrxaM0w6FegD/HuR9iaP0Lti0pMV7svzryF+yDFZa/I4PAk9qaDRO2wegQ
	 Y4cdlmTcLOR+I1imtzGL/k9HP9HBzIPaFk0qn/3vIurJZsE8DpID9xd3DLOe/MJez+L2u
	 faId1oi+knlR/0oS03d8KcipG26I3SAgR6XYYEKaypkRl1fHKDrCmeEy9qP91S+Lzjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bagm0+gy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F633606A323;
	Mon,  9 Nov 2026 14:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bagm0+gy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9545B1F0089F;
	Mon,  9 Nov 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794235940;
	bh=2oVPBYkb4OhMVyaoo0ulP7ahotUGDEEMMhcAhNtiOyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bagm0+gyxdr7Sq49F5EYKz9zS0WKdrzfZX14V+7WQpoVKwTtMI5IetHF9rmPnhiIt
	 CRgegoIwBVxhyHqaxD290GvdAcUzHHlE0Vcnf+4I1CYcKTbHPIoHwgk26pbMiIxFlc
	 QQ137I4Yx+MTT6X/yCGZH8zWtAl9hRtxJJo9j3Tkyg8qXV6BatrfxlVg0jsqIde18S
	 ySkDXWAmz2QDwJCRW0nQP/HsOx92AQS1fNEgUj6kOJ0uXjjnPPOjCXnN/YJYput3QB
	 myu8Zny8mzSgwIxtOyKifICjjZJ7BtbSSO16yPbXClOIpX6xjfYa6OD44yQtBcdU9O
	 aVF1er2Dx9U4w==
Content-Type: multipart/mixed; boundary="------------O8O2Dfm3OSRVuaGGnHVwKLEx"
Message-ID: <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
Date: Mon, 9 Nov 2026 15:52:16 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>

This is a multi-part message in MIME format.
--------------O8O2Dfm3OSRVuaGGnHVwKLEx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Abel,

On 6-Nov-26 23:01, Abel Vesa wrote:
> The embedded controller of the ThinkPad T14s Gen 7 uses the same
> register layout and event codes as the Gen 6 one, but a different set
> of I2C commands. Going by the ACPI EC accessors in the Gen 7 firmware:
> 
>   - register read:  write {0x80, reg}, then write {0x80} + read 1 byte
>   - register write: write {0x81, reg, val}
>   - event read:     write {0x84, 0x00}, then write {0x84} + read 1 byte
> > With the Gen 6 commands the EC never reports any event and the LED
> and keyboard backlight accesses have no effect.

Thank you for working in this. I've been testing this and my own T14s gen7
and also I've taken a closer look at the DSDT leading to a bunch of
improvements. Instead of making these as suggested I've just gone ahead and
implemented these as fixup-s to be squashed into a v2 patch.

For easier review by you I've split the improvements into 4 patches (attached):

1: Fix Fn-F12 not emitting a key-press + filter out some EC codes being reported
when pressing Fn + Fxx key combos which already send an I2C-HID kbd event.

2: Add Gen 7 suspend/resume handling

3: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
really just checks for the original (gen6) support vs gen7 support
drop the bools and directly check which variant ec->variant points
at instead.
4: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
really just checks for the original (gen6) support vs gen7 support
drop the bools and directly check which variant ec->variant points
at instead.

> Describe the bus accessors and event read per variant and add one for
> the Gen 7. The Gen 7 firmware does not use the second keyboard backlight
> register or the modern standby register, it drives the mic mute LED as a
> generic LED (id 0x0e) instead of a bit in the audio register and, when
> the keyboard backlight is cycled with Fn+Space, it also reports 3 for
> the high level, so handle those differences too. Also handle the Gen 7
> only events as known ones.

So about these differences:

1: For the spk / mic mute LEDs, on a hunch I tried using std LED controls
with a LED idx/id of 15 for the spk mute LED and that also works.

I did not find either way (REG_AUD vs REG_LED) for the spk mute LED in
the DSDT, instead the DSDT ends up sending an ACPI notify event, relying
on some windows driver to handle this.

How did you find that REG_AUD still works, did you just try the gen 6
method ?

2: For the kbd backlight, again the DSDT ends up sending an ACPI notify event
and does not access the EC itself at all.

How did you find that T14S_EC_REG_KBD_BL1 also works on gen 7?

3: For suspend/resume the DSDT does have modern-standby handling both
making the LEDS glow and setting some magic bit (which presumably makes
the EC use less power or maybe makes it send less wakeup events if we
were to make the EC IRQ a wakeup source) ?  This is implemented in
my second fixup patch.

Regards,

Hans






> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 176 ++++++++++++++++++++++++--
>  1 file changed, 166 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> index 7a875877c8f3..b488b85bf7c0 100644
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
> @@ -26,6 +28,15 @@
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
>  #define T14S_EC_REG_MODERN_STANDBY		0xe0
> @@ -67,6 +78,15 @@
>  #define T14S_EC_EVT_KEY_FN_F11			0x7a
>  #define T14S_EC_EVT_KEY_FN_G			0x7e
>  
> +/* Gen 7 only */
> +#define T14S_GEN7_EC_EVT_HKEY_1017		0x1c
> +#define T14S_GEN7_EC_EVT_STATUS_35		0x35
> +#define T14S_GEN7_EC_EVT_DYTC			0x3c
> +#define T14S_GEN7_EC_EVT_STATUS_40		0x40
> +#define T14S_GEN7_EC_EVT_STATUS_4B		0x4b
> +#define T14S_GEN7_EC_EVT_STATUS_4E		0x4e
> +#define T14S_GEN7_EC_EVT_HKEY_1016		0x76
> +
>  /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
>  #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
>  
> @@ -93,9 +113,24 @@ struct t14s_ec_led_classdev {
>  	struct t14s_ec *ec;
>  };
>  
> +struct t14s_ec;
> +
> +struct t14s_ec_variant {
> +	const struct regmap_bus *regmap_bus;
> +	int (*read_evt)(struct t14s_ec *ec, u8 *val);
> +	/* EC has the second keyboard backlight and the modern standby registers */
> +	bool has_kbd_bl2_and_standby;
> +	/* mic mute LED is a generic LED (in T14S_EC_REG_LED) and not a bit in T14S_EC_REG_AUD */
> +	bool mic_mute_led_generic;
> +};
> +
>  struct t14s_ec {
>  	struct regmap *regmap;
>  	struct device *dev;
> +	const struct t14s_ec_variant *variant;
> +	/* serializes the multi-message Gen 7 EC transactions */
> +	struct mutex xfer_lock;
> +	enum led_brightness mic_mute_cache;
>  	struct t14s_ec_led_classdev led_pwr_btn;
>  	struct t14s_ec_led_classdev led_chrg_orange;
>  	struct t14s_ec_led_classdev led_chrg_white;
> @@ -206,6 +241,85 @@ static int t14s_ec_read_evt(struct t14s_ec *ec, u8 *val)
>  	return ret;
>  }
>  
> +static int t14s_gen7_ec_cmd_read(struct t14s_ec *ec, u8 cmd, u8 arg, u8 *val)
> +{
> +	struct i2c_client *client = to_i2c_client(ec->dev);
> +	u8 req[2] = { cmd, arg };
> +	struct i2c_msg msgs[2] = {
> +		{ .addr = client->addr, .flags = 0, .len = 1, .buf = &req[0] },
> +		{ .addr = client->addr, .flags = I2C_M_RD, .len = 1, .buf = val },
> +	};
> +	int ret;
> +
> +	guard(mutex)(&ec->xfer_lock);
> +
> +	ret = i2c_master_send(client, req, sizeof(req));
> +	if (ret < 0)
> +		return ret;
> +
> +	fsleep(5000);
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret == ARRAY_SIZE(msgs) ? 0 : -EIO;
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
> +	guard(mutex)(&ec->xfer_lock);
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
> +	.has_kbd_bl2_and_standby = true,
> +};
> +
> +static const struct t14s_ec_variant t14s_gen7_ec_variant = {
> +	.regmap_bus = &t14s_gen7_ec_regmap_bus,
> +	.read_evt = t14s_gen7_ec_read_evt,
> +	.mic_mute_led_generic = true,
> +};
> +
>  static void t14s_ec_write_sequence(struct t14s_ec *ec, u8 reg, u8 val, u8 cnt)
>  {
>  	int i;
> @@ -318,6 +432,9 @@ static int t14s_kbd_bl_set(struct led_classdev *led_cdev,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!ec->variant->has_kbd_bl2_and_standby)
> +		return 0;
> +
>  	val = FIELD_PREP(T14S_EC_KBD_BL2_MASK, brightness);
>  	ret = regmap_update_bits(ec->regmap, T14S_EC_REG_KBD_BL2,
>  				 T14S_EC_KBD_BL2_MASK, val);
> @@ -338,7 +455,11 @@ static enum led_brightness t14s_kbd_bl_get(struct led_classdev *led_cdev)
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
> @@ -383,6 +504,9 @@ static enum led_brightness t14s_mic_mute_led_get(struct led_classdev *led_cdev)
>  	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
>  					  led_mic_mute);
>  
> +	if (ec->variant->mic_mute_led_generic)
> +		return ec->mic_mute_cache;
> +
>  	return t14s_audio_led_get(ec, T14S_EC_MIC_MUTE_LED);
>  }
>  
> @@ -391,8 +515,19 @@ static int t14s_mic_mute_led_set(struct led_classdev *led_cdev,
>  {
>  	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
>  					  led_mic_mute);
> +	int ret;
>  
> -	return t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
> +	if (!ec->variant->mic_mute_led_generic)
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
> @@ -478,7 +613,7 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  	int ret;
>  	u8 val;
>  
> -	ret = t14s_ec_read_evt(ec, &val);
> +	ret = ec->variant->read_evt(ec, &val);
>  	if (ret < 0) {
>  		dev_err(ec->dev, "Failed to read event\n");
>  		return IRQ_HANDLED;
> @@ -553,6 +688,16 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  	case T14S_EC_EVT_KEY_FN_D:
>  		dev_dbg(ec->dev, "FN + D - toggle privacy guard mode\n");
>  		break;
> +	case T14S_GEN7_EC_EVT_HKEY_1017:
> +	case T14S_GEN7_EC_EVT_HKEY_1016:
> +	case T14S_GEN7_EC_EVT_DYTC:
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
> @@ -572,9 +717,17 @@ static int t14s_ec_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	ec->dev = dev;
> +	ec->variant = i2c_get_match_data(client);
> +	if (!ec->variant)
> +		ec->variant = &t14s_ec_variant;
> +
> +	ret = devm_mutex_init(dev, &ec->xfer_lock);
> +	if (ret)
> +		return ret;
> +
>  	i2c_set_clientdata(client, ec);
>  
> -	ec->regmap = devm_regmap_init(dev, &t14s_ec_regmap_bus,
> +	ec->regmap = devm_regmap_init(dev, ec->variant->regmap_bus,
>  				      ec, &t14s_ec_regmap_config);
>  	if (IS_ERR(ec->regmap))
>  		return dev_err_probe(dev, PTR_ERR(ec->regmap),
> @@ -618,8 +771,9 @@ static int t14s_ec_suspend(struct device *dev)
>  
>  	led_classdev_suspend(&ec->kbd_backlight);
>  
> -	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
> -			       T14S_EC_MODERN_STANDBY_ENTRY, 3);
> +	if (ec->variant->has_kbd_bl2_and_standby)
> +		t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
> +				       T14S_EC_MODERN_STANDBY_ENTRY, 3);
>  
>  	return 0;
>  }
> @@ -628,8 +782,9 @@ static int t14s_ec_resume(struct device *dev)
>  {
>  	struct t14s_ec *ec = dev_get_drvdata(dev);
>  
> -	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
> -			       T14S_EC_MODERN_STANDBY_EXIT, 3);
> +	if (ec->variant->has_kbd_bl2_and_standby)
> +		t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
> +				       T14S_EC_MODERN_STANDBY_EXIT, 3);
>  
>  	led_classdev_resume(&ec->kbd_backlight);
>  
> @@ -637,13 +792,14 @@ static int t14s_ec_resume(struct device *dev)
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

--------------O8O2Dfm3OSRVuaGGnHVwKLEx
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.patch"
Content-Disposition: attachment;
 filename*0="0001-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAyZTEyMDc4ODg2NmUyMzdiMzZmZTFmODg0ZmQ0YjExYjMwZTA0MzVlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBTdW4sIDggTm92IDIwMjYgMjE6Mzg6MzYgKzAxMDAK
U3ViamVjdDogW1BBVENIIDEvNF0gZml4dXAhIHBsYXRmb3JtOiBhcm02NDogbGVub3ZvLXRo
aW5rcGFkLXQxNHM6IGFkZCBHZW4gNwogRUMgc3VwcG9ydAoKRml4OgotIEZuLUYxMiBrZXkg
bm90IHJlZ2lzdGVyaW5nIGEga2V5cHJlc3MKLSB0aGlua3BhZC10MTRzLWVjIDctMDAyODog
VW5rbm93biBFQyBldmVudDogMHhYWCBtZXNzYWdlcyBmb3IKICBzb21lIG90aGVyIEZuLUZ4
eCBrZXkgY29tYm9zCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5n
b2VkZUBvc3MucXVhbGNvbW0uY29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVu
b3ZvLXRoaW5rcGFkLXQxNHMuYyB8IDE3ICsrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BsYXRmb3JtL2FybTY0L2xlbm92by10aGlua3BhZC10MTRzLmMgYi9kcml2ZXJz
L3BsYXRmb3JtL2FybTY0L2xlbm92by10aGlua3BhZC10MTRzLmMKaW5kZXggYjQ4OGI4NWJm
N2MwLi43NWIyMjE0MDNhODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQv
bGVub3ZvLXRoaW5rcGFkLXQxNHMuYworKysgYi9kcml2ZXJzL3BsYXRmb3JtL2FybTY0L2xl
bm92by10aGlua3BhZC10MTRzLmMKQEAgLTUyLDYgKzUyLDcgQEAKICNkZWZpbmUgVDE0U19F
Q19FVlRfTk9ORQkJCTB4MDAKICNkZWZpbmUgVDE0U19FQ19FVlRfS0VZX0ZOXzQJCQkweDEz
CiAjZGVmaW5lIFQxNFNfRUNfRVZUX0tFWV9GTl9GNwkJCTB4MTYKKyNkZWZpbmUgVDE0U19F
Q19FVlRfS0VZX0ZOX0YxMl9HRU43CQkweDE5CiAjZGVmaW5lIFQxNFNfRUNfRVZUX0tFWV9G
Tl9TUEFDRQkJMHgxZgogI2RlZmluZSBUMTRTX0VDX0VWVF9LRVlfVFBfRE9VQkxFX1RBUAkJ
MHgyMAogI2RlZmluZSBUMTRTX0VDX0VWVF9BQ19DT05ORUNURUQJCTB4MjYKQEAgLTc5LDYg
KzgwLDggQEAKICNkZWZpbmUgVDE0U19FQ19FVlRfS0VZX0ZOX0cJCQkweDdlCiAKIC8qIEdl
biA3IG9ubHkgKi8KKyNkZWZpbmUgVDE0U19HRU43X0VDX0VWVF9IS0VZXzEwMTAJCTB4MTQK
KyNkZWZpbmUgVDE0U19HRU43X0VDX0VWVF9IS0VZXzEwMTEJCTB4MTUKICNkZWZpbmUgVDE0
U19HRU43X0VDX0VWVF9IS0VZXzEwMTcJCTB4MWMKICNkZWZpbmUgVDE0U19HRU43X0VDX0VW
VF9TVEFUVVNfMzUJCTB4MzUKICNkZWZpbmUgVDE0U19HRU43X0VDX0VWVF9EWVRDCQkJMHgz
YwpAQCAtODYsNiArODksNyBAQAogI2RlZmluZSBUMTRTX0dFTjdfRUNfRVZUX1NUQVRVU180
QgkJMHg0YgogI2RlZmluZSBUMTRTX0dFTjdfRUNfRVZUX1NUQVRVU180RQkJMHg0ZQogI2Rl
ZmluZSBUMTRTX0dFTjdfRUNfRVZUX0hLRVlfMTAxNgkJMHg3NgorI2RlZmluZSBUMTRTX0dF
TjdfRUNfRVZUX0hLRVlfMTAxNQkJMHg3YgogCiAvKiBIYXJkd2FyZSBMRUQgYmxpbmsgcmF0
ZSBpcyAxIEh6ICg1MDBtcyBvZmYsIDUwMG1zIG9uKSAqLwogI2RlZmluZSBUMTRTX0VDX0JM
SU5LX1JBVEVfT05fT0ZGX01TCQk1MDAKQEAgLTU3OSw2ICs1ODMsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGtleV9lbnRyeSB0MTRzX2tleW1hcFtdID0gewogCVQxNFNfRUNfS0VZX0VO
VFJZKEZOX0YxMCwgS0VZX1NFTEVDVElWRV9TQ1JFRU5TSE9UKSwKIAlUMTRTX0VDX0tFWV9F
TlRSWShGTl9GMTEsIEtFWV9MSU5LX1BIT05FKSwKIAlUMTRTX0VDX0tFWV9FTlRSWShGTl9G
MTIsIEtFWV9CT09LTUFSS1MpLAorCVQxNFNfRUNfS0VZX0VOVFJZKEZOX0YxMl9HRU43LCBL
RVlfQk9PS01BUktTKSwKIAlUMTRTX0VDX0tFWV9FTlRSWShGTl9TUEFDRSwgS0VZX0tCRElM
TFVNVE9HR0xFKSwKIAlUMTRTX0VDX0tFWV9FTlRSWShGTl9FU0MsIEtFWV9GTl9FU0MpLAog
CVQxNFNfRUNfS0VZX0VOVFJZKEZOX1RBQiwgS0VZX1pPT00pLApAQCAtNjM2LDYgKzY0MSw3
IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB0MTRzX2VjX2lycV9oYW5kbGVyKGludCBpcnEsIHZv
aWQgKmRhdGEpCiAJY2FzZSBUMTRTX0VDX0VWVF9LRVlfRk5fNDoKIAljYXNlIFQxNFNfRUNf
RVZUX0tFWV9GTl9GODoKIAljYXNlIFQxNFNfRUNfRVZUX0tFWV9GTl9GMTI6CisJY2FzZSBU
MTRTX0VDX0VWVF9LRVlfRk5fRjEyX0dFTjc6CiAJY2FzZSBUMTRTX0VDX0VWVF9LRVlfRk5f
VEFCOgogCWNhc2UgVDE0U19FQ19FVlRfS0VZX0ZOX0YxMDoKIAljYXNlIFQxNFNfRUNfRVZU
X0tFWV9GTl9OOgpAQCAtNjg4LDkgKzY5NCwxNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgdDE0
c19lY19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQogCWNhc2UgVDE0U19FQ19F
VlRfS0VZX0ZOX0Q6CiAJCWRldl9kYmcoZWMtPmRldiwgIkZOICsgRCAtIHRvZ2dsZSBwcml2
YWN5IGd1YXJkIG1vZGVcbiIpOwogCQlicmVhazsKLQljYXNlIFQxNFNfR0VON19FQ19FVlRf
SEtFWV8xMDE3OgotCWNhc2UgVDE0U19HRU43X0VDX0VWVF9IS0VZXzEwMTY6CiAJY2FzZSBU
MTRTX0dFTjdfRUNfRVZUX0RZVEM6CisJLyoKKwkgKiBLZXlzIHdoaWNoIHNlbmQgYW4gRUMg
ZXZlbnQgd2hpY2ggdGhlIERTRFQgbWFwcyB0byBhIEhLRVksIHdoaWNoCisJICogYWxzbyBz
ZW5kIGEga2V5LXByZXNzIG92ZXIgSTJDLUhJRCwgc28gaWdub3JlIHRoZSBFQyBldmVudC4K
KwkgKi8KKwljYXNlIFQxNFNfR0VON19FQ19FVlRfSEtFWV8xMDEwOgorCWNhc2UgVDE0U19H
RU43X0VDX0VWVF9IS0VZXzEwMTE6CisJY2FzZSBUMTRTX0dFTjdfRUNfRVZUX0hLRVlfMTAx
NToKKwljYXNlIFQxNFNfR0VON19FQ19FVlRfSEtFWV8xMDE2OgorCWNhc2UgVDE0U19HRU43
X0VDX0VWVF9IS0VZXzEwMTc6CiAJLyogU3RhdHVzIGV2ZW50cyB0aGUgR2VuIDcgZmlybXdh
cmUgZG9lcyBub3QgYWN0IHVwb24gZWl0aGVyICovCiAJY2FzZSBUMTRTX0dFTjdfRUNfRVZU
X1NUQVRVU18zNToKIAljYXNlIFQxNFNfR0VON19FQ19FVlRfU1RBVFVTXzQwOgotLSAKMi41
NS4wCgo=
--------------O8O2Dfm3OSRVuaGGnHVwKLEx
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.patch"
Content-Disposition: attachment;
 filename*0="0002-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmZGIwMTYyMWVlYWZlNzc0ZDExNjcxZTgwYWRhNDAzYThjYzFkZjcwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBNb24sIDkgTm92IDIwMjYgMTM6MjE6MjQgKzAxMDAK
U3ViamVjdDogW1BBVENIIDIvNF0gZml4dXAhIHBsYXRmb3JtOiBhcm02NDogbGVub3ZvLXRo
aW5rcGFkLXQxNHM6IGFkZCBHZW4gNwogRUMgc3VwcG9ydAoKQWRkIEdlbiA3IHN1c3BlbmQv
cmVzdW1lIGhhbmRsaW5nLiBOb3RlIHRoZSBuYW1lIG9mCnRoZSBoYXNfa2JkX2JsMl9hbmRf
c3RhbmRieSBib29sIGlzIG5vIGxvbmdlciBhY2N1cmF0ZSBhZnRlcgp0aGlzIHNpbmNlIEdl
biA3IGRvZXMgaGF2ZSBhIChkaWZmZXJlbnQpIG1vZGVybiBzdGFuZGJ5IHJlZ2lzdGVyLApy
ZXBsYWNlIHRoZSBib29sIGNoZWNrIHdpdGggY2hlY2tpbmcgYXQgd2hpY2ggdmFyaWFudCBl
Yy0+dmFyaWFudApwb2ludHMuCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxqb2hh
bm5lcy5nb2VkZUBvc3MucXVhbGNvbW0uY29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0vYXJt
NjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYyB8IDIwICsrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYyBi
L2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYwppbmRleCA3
NWIyMjE0MDNhODcuLmIyZjU3MTQxM2I4ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9y
bS9hcm02NC9sZW5vdm8tdGhpbmtwYWQtdDE0cy5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0v
YXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYwpAQCAtMzksNiArMzksOSBAQAogCiAjZGVm
aW5lIFQxNFNfRUNfUkVHX0xFRAkJCQkweDBjCiAjZGVmaW5lIFQxNFNfRUNfUkVHX0tCRF9C
TDEJCQkweDBkCisjZGVmaW5lIFQxNFNfRUNfUkVHX01PREVSTl9TVEFOREJZX0dFTjcJCTB4
Y2YKKy8qIEdlbiA3IERTRFQgc2V0cyB0aGlzIGJpdCBvbiBXaW5kb3dzIG1vZGVybiBzdGFu
ZGJ5IGVudHJ5ICovCisjZGVmaW5lIFQxNFNfRUNfTU9ERVJOX1NUQU5EQllfR0VON19FU0xT
CUJJVCg1KQogI2RlZmluZSBUMTRTX0VDX1JFR19NT0RFUk5fU1RBTkRCWQkJMHhlMAogI2Rl
ZmluZSBUMTRTX0VDX01PREVSTl9TVEFOREJZX0VOVFJZCQlCSVQoMSkKICNkZWZpbmUgVDE0
U19FQ19NT0RFUk5fU1RBTkRCWV9FWElUCQlCSVQoMCkKQEAgLTEwNyw2ICsxMTAsNyBAQAog
ZW51bSB0MTRzX2VjX2xlZF9zdGF0dXNfdCB7CiAJVDE0U19FQ19MRURfT0ZGID0JMHgwMCwK
IAlUMTRTX0VDX0xFRF9PTiA9CTB4ODAsCisJVDE0U19FQ19MRURfR0xPVyA9CTB4YTAsIC8q
IEdlbiA3IG9ubHksIG9ubHkgd29ya3MgZm9yIHBvd2VyIGFuZCBsaWQgTEVEcyAqLwogCVQx
NFNfRUNfTEVEX0JMSU5LID0JMHhjMCwKIH07CiAKQEAgLTc4NCw5ICs3ODgsMTUgQEAgc3Rh
dGljIGludCB0MTRzX2VjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCiAJbGVkX2Ns
YXNzZGV2X3N1c3BlbmQoJmVjLT5rYmRfYmFja2xpZ2h0KTsKIAotCWlmIChlYy0+dmFyaWFu
dC0+aGFzX2tiZF9ibDJfYW5kX3N0YW5kYnkpCisJaWYgKGVjLT52YXJpYW50ID09ICZ0MTRz
X2VjX3ZhcmlhbnQpIHsKIAkJdDE0c19lY193cml0ZV9zZXF1ZW5jZShlYywgVDE0U19FQ19S
RUdfTU9ERVJOX1NUQU5EQlksCiAJCQkJICAgICAgIFQxNFNfRUNfTU9ERVJOX1NUQU5EQllf
RU5UUlksIDMpOworCX0gZWxzZSB7CisJCXJlZ21hcF9hc3NpZ25fYml0cyhlYy0+cmVnbWFw
LCBUMTRTX0VDX1JFR19NT0RFUk5fU1RBTkRCWV9HRU43LAorCQkJCSAgIFQxNFNfRUNfTU9E
RVJOX1NUQU5EQllfR0VON19FU0xTLCAxKTsKKwkJdDE0c19sZWRfc2V0X3N0YXR1cyhlYywg
JmVjLT5sZWRfcHdyX2J0biwgVDE0U19FQ19MRURfR0xPVyk7CisJCXQxNHNfbGVkX3NldF9z
dGF0dXMoZWMsICZlYy0+bGVkX2xpZF9sb2dvX2RvdCwgVDE0U19FQ19MRURfR0xPVyk7CisJ
fQogCiAJcmV0dXJuIDA7CiB9CkBAIC03OTUsOSArODA1LDE1IEBAIHN0YXRpYyBpbnQgdDE0
c19lY19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCB0MTRzX2VjICpl
YyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCi0JaWYgKGVjLT52YXJpYW50LT5oYXNfa2Jk
X2JsMl9hbmRfc3RhbmRieSkKKwlpZiAoZWMtPnZhcmlhbnQgPT0gJnQxNHNfZWNfdmFyaWFu
dCkgewogCQl0MTRzX2VjX3dyaXRlX3NlcXVlbmNlKGVjLCBUMTRTX0VDX1JFR19NT0RFUk5f
U1RBTkRCWSwKIAkJCQkgICAgICAgVDE0U19FQ19NT0RFUk5fU1RBTkRCWV9FWElULCAzKTsK
Kwl9IGVsc2UgeworCQlyZWdtYXBfYXNzaWduX2JpdHMoZWMtPnJlZ21hcCwgVDE0U19FQ19S
RUdfTU9ERVJOX1NUQU5EQllfR0VONywKKwkJCQkgICBUMTRTX0VDX01PREVSTl9TVEFOREJZ
X0dFTjdfRVNMUywgMCk7CisJCXQxNHNfbGVkX3NldF9zdGF0dXMoZWMsICZlYy0+bGVkX3B3
cl9idG4sIFQxNFNfRUNfTEVEX09OKTsKKwkJdDE0c19sZWRfc2V0X3N0YXR1cyhlYywgJmVj
LT5sZWRfbGlkX2xvZ29fZG90LCBUMTRTX0VDX0xFRF9PTik7CisJfQogCiAJbGVkX2NsYXNz
ZGV2X3Jlc3VtZSgmZWMtPmtiZF9iYWNrbGlnaHQpOwogCi0tIAoyLjU1LjAKCg==
--------------O8O2Dfm3OSRVuaGGnHVwKLEx
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.patch"
Content-Disposition: attachment;
 filename*0="0003-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkZGM2MmEyY2QzNzZhZDE5MGYwNTExYTczZmMyODViYjc1ZGQwMTVjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBNb24sIDkgTm92IDIwMjYgMTM6Mjk6MjMgKzAxMDAK
U3ViamVjdDogW1BBVENIIDMvNF0gZml4dXAhIHBsYXRmb3JtOiBhcm02NDogbGVub3ZvLXRo
aW5rcGFkLXQxNHM6IGFkZCBHZW4gNwogRUMgc3VwcG9ydAoKVGhlIGhhc19rYmRfYmwyX2Fu
ZF9zdGFuZGJ5IGFuZCBtaWNfbXV0ZV9sZWRfZ2VuZXJpYyBjaGVja3MgYXJlCnJlYWxseSBq
dXN0IGNoZWNrcyBmb3IgdGhlIG9yaWdpbmFsIChnZW42KSBzdXBwb3J0IHZzIGdlbjcgc3Vw
cG9ydApkcm9wIHRoZSBib29scyBhbmQgZGlyZWN0bHkgY2hlY2sgd2hpY2ggdmFyaWFudCBl
Yy0+dmFyaWFudCBwb2ludHMKYXQgaW5zdGVhZC4KCldoaWxlIGF0IGl0IGFsc28gc3dhcCB0
aGUgZ2VuNiB2cyBnZW43IHBhdGhzIGluIHQxNHNfbWljX211dGVfbGVkX2dldCgpCnRvIG1p
cnJvciB0aGUgZmxvdyAoZ2VuNiBjaGVja2VkIGZvciwgaGFuZGxlZCB3aXRoIGVhcmx5IGV4
aXQpIHVzZWQKaW4gdDE0c19taWNfbXV0ZV9sZWRfc2V0KCkuCgpTaWduZWQtb2ZmLWJ5OiBI
YW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBvc3MucXVhbGNvbW0uY29tPgotLS0KIGRy
aXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYyB8IDE2ICsrKysr
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRo
aW5rcGFkLXQxNHMuYyBiL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFk
LXQxNHMuYwppbmRleCBiMmY1NzE0MTNiOGQuLmEyNGJmOTUyNjhkYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wbGF0Zm9ybS9hcm02NC9sZW5vdm8tdGhpbmtwYWQtdDE0cy5jCisrKyBiL2Ry
aXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYwpAQCAtMTI2LDEw
ICsxMjYsNiBAQCBzdHJ1Y3QgdDE0c19lYzsKIHN0cnVjdCB0MTRzX2VjX3ZhcmlhbnQgewog
CWNvbnN0IHN0cnVjdCByZWdtYXBfYnVzICpyZWdtYXBfYnVzOwogCWludCAoKnJlYWRfZXZ0
KShzdHJ1Y3QgdDE0c19lYyAqZWMsIHU4ICp2YWwpOwotCS8qIEVDIGhhcyB0aGUgc2Vjb25k
IGtleWJvYXJkIGJhY2tsaWdodCBhbmQgdGhlIG1vZGVybiBzdGFuZGJ5IHJlZ2lzdGVycyAq
LwotCWJvb2wgaGFzX2tiZF9ibDJfYW5kX3N0YW5kYnk7Ci0JLyogbWljIG11dGUgTEVEIGlz
IGEgZ2VuZXJpYyBMRUQgKGluIFQxNFNfRUNfUkVHX0xFRCkgYW5kIG5vdCBhIGJpdCBpbiBU
MTRTX0VDX1JFR19BVUQgKi8KLQlib29sIG1pY19tdXRlX2xlZF9nZW5lcmljOwogfTsKIAog
c3RydWN0IHQxNHNfZWMgewpAQCAtMzE5LDEzICszMTUsMTEgQEAgc3RhdGljIGludCB0MTRz
X2dlbjdfZWNfcmVhZF9ldnQoc3RydWN0IHQxNHNfZWMgKmVjLCB1OCAqdmFsKQogc3RhdGlj
IGNvbnN0IHN0cnVjdCB0MTRzX2VjX3ZhcmlhbnQgdDE0c19lY192YXJpYW50ID0gewogCS5y
ZWdtYXBfYnVzID0gJnQxNHNfZWNfcmVnbWFwX2J1cywKIAkucmVhZF9ldnQgPSB0MTRzX2Vj
X3JlYWRfZXZ0LAotCS5oYXNfa2JkX2JsMl9hbmRfc3RhbmRieSA9IHRydWUsCiB9OwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHQxNHNfZWNfdmFyaWFudCB0MTRzX2dlbjdfZWNfdmFyaWFu
dCA9IHsKIAkucmVnbWFwX2J1cyA9ICZ0MTRzX2dlbjdfZWNfcmVnbWFwX2J1cywKIAkucmVh
ZF9ldnQgPSB0MTRzX2dlbjdfZWNfcmVhZF9ldnQsCi0JLm1pY19tdXRlX2xlZF9nZW5lcmlj
ID0gdHJ1ZSwKIH07CiAKIHN0YXRpYyB2b2lkIHQxNHNfZWNfd3JpdGVfc2VxdWVuY2Uoc3Ry
dWN0IHQxNHNfZWMgKmVjLCB1OCByZWcsIHU4IHZhbCwgdTggY250KQpAQCAtNDQwLDcgKzQz
NCw3IEBAIHN0YXRpYyBpbnQgdDE0c19rYmRfYmxfc2V0KHN0cnVjdCBsZWRfY2xhc3NkZXYg
KmxlZF9jZGV2LAogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCi0JaWYgKCFlYy0+
dmFyaWFudC0+aGFzX2tiZF9ibDJfYW5kX3N0YW5kYnkpCisJaWYgKGVjLT52YXJpYW50ID09
ICZ0MTRzX2dlbjdfZWNfdmFyaWFudCkKIAkJcmV0dXJuIDA7CiAKIAl2YWwgPSBGSUVMRF9Q
UkVQKFQxNFNfRUNfS0JEX0JMMl9NQVNLLCBicmlnaHRuZXNzKTsKQEAgLTUxMiwxMCArNTA2
LDEwIEBAIHN0YXRpYyBlbnVtIGxlZF9icmlnaHRuZXNzIHQxNHNfbWljX211dGVfbGVkX2dl
dChzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2RldikKIAlzdHJ1Y3QgdDE0c19lYyAqZWMg
PSBjb250YWluZXJfb2YobGVkX2NkZXYsIHN0cnVjdCB0MTRzX2VjLAogCQkJCQkgIGxlZF9t
aWNfbXV0ZSk7CiAKLQlpZiAoZWMtPnZhcmlhbnQtPm1pY19tdXRlX2xlZF9nZW5lcmljKQot
CQlyZXR1cm4gZWMtPm1pY19tdXRlX2NhY2hlOworCWlmIChlYy0+dmFyaWFudCA9PSAmdDE0
c19lY192YXJpYW50KQorCQlyZXR1cm4gdDE0c19hdWRpb19sZWRfZ2V0KGVjLCBUMTRTX0VD
X01JQ19NVVRFX0xFRCk7CiAKLQlyZXR1cm4gdDE0c19hdWRpb19sZWRfZ2V0KGVjLCBUMTRT
X0VDX01JQ19NVVRFX0xFRCk7CisJcmV0dXJuIGVjLT5taWNfbXV0ZV9jYWNoZTsKIH0KIAog
c3RhdGljIGludCB0MTRzX21pY19tdXRlX2xlZF9zZXQoc3RydWN0IGxlZF9jbGFzc2RldiAq
bGVkX2NkZXYsCkBAIC01MjUsNyArNTE5LDcgQEAgc3RhdGljIGludCB0MTRzX21pY19tdXRl
X2xlZF9zZXQoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXYsCiAJCQkJCSAgbGVkX21p
Y19tdXRlKTsKIAlpbnQgcmV0OwogCi0JaWYgKCFlYy0+dmFyaWFudC0+bWljX211dGVfbGVk
X2dlbmVyaWMpCisJaWYgKGVjLT52YXJpYW50ID09ICZ0MTRzX2VjX3ZhcmlhbnQpCiAJCXJl
dHVybiB0MTRzX2F1ZGlvX2xlZF9zZXQoZWMsIFQxNFNfRUNfTUlDX01VVEVfTEVELCBicmln
aHRuZXNzKTsKIAogCXJldCA9IHJlZ21hcF93cml0ZShlYy0+cmVnbWFwLCBUMTRTX0VDX1JF
R19MRUQsCi0tIAoyLjU1LjAKCg==
--------------O8O2Dfm3OSRVuaGGnHVwKLEx
Content-Type: text/x-patch; charset=UTF-8;
 name="0004-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.patch"
Content-Disposition: attachment;
 filename*0="0004-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjYjdkYjZmNGVjNzg2YWEwOGRjYWZmMjc2YmRlYjJkYWM2NWYwZjQ5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBNb24sIDkgTm92IDIwMjYgMTQ6Mjk6MzcgKzAxMDAK
U3ViamVjdDogW1BBVENIIDQvNF0gZml4dXAhIHBsYXRmb3JtOiBhcm02NDogbGVub3ZvLXRo
aW5rcGFkLXQxNHM6IGFkZCBHZW4gNwogRUMgc3VwcG9ydAoKRHJvcCB0aGUgeGZlcl9sb2Nr
IG11dGV4IGFuZCBpbnN0ZWFkIHVzZSBpMmNfbG9ja19idXMoKSBsaWtlCnRoZSBleGlzdGlu
ZyB0MTRzIGdlbjYgc3VwcG9ydCBkb2VzIGZvciBtdWx0aS1tc2cgdHJhbnNhY3Rpb25zLgoK
QWxzbyBkcm9wIHRoZSBmc2xlZXAoNTAwMCkgaW4gdDE0c19nZW43X2VjX2NtZF9yZWFkKCkg
dGhlIERTRFQgY29kZQpoYXMgbm8gZGVsYXkgYmV0d2VlbiB0aGUgdHJhbnNmZXJzIHNvIHRo
aXMgaXMgbm90IG5lY2Vzc2FyeS4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGpv
aGFubmVzLmdvZWRlQG9zcy5xdWFsY29tbS5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS9h
cm02NC9sZW5vdm8tdGhpbmtwYWQtdDE0cy5jIHwgMzMgKysrKysrKysrLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMu
YyBiL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYwppbmRl
eCBhMjRiZjk1MjY4ZGMuLjdmMzBmNjcxNzNjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0
Zm9ybS9hcm02NC9sZW5vdm8tdGhpbmtwYWQtdDE0cy5jCisrKyBiL2RyaXZlcnMvcGxhdGZv
cm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYwpAQCAtMTMyLDggKzEzMiw2IEBAIHN0
cnVjdCB0MTRzX2VjIHsKIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7CiAJc3RydWN0IGRldmlj
ZSAqZGV2OwogCWNvbnN0IHN0cnVjdCB0MTRzX2VjX3ZhcmlhbnQgKnZhcmlhbnQ7Ci0JLyog
c2VyaWFsaXplcyB0aGUgbXVsdGktbWVzc2FnZSBHZW4gNyBFQyB0cmFuc2FjdGlvbnMgKi8K
LQlzdHJ1Y3QgbXV0ZXggeGZlcl9sb2NrOwogCWVudW0gbGVkX2JyaWdodG5lc3MgbWljX211
dGVfY2FjaGU7CiAJc3RydWN0IHQxNHNfZWNfbGVkX2NsYXNzZGV2IGxlZF9wd3JfYnRuOwog
CXN0cnVjdCB0MTRzX2VjX2xlZF9jbGFzc2RldiBsZWRfY2hyZ19vcmFuZ2U7CkBAIC0yNTAs
MjQgKzI0OCwzMSBAQCBzdGF0aWMgaW50IHQxNHNfZ2VuN19lY19jbWRfcmVhZChzdHJ1Y3Qg
dDE0c19lYyAqZWMsIHU4IGNtZCwgdTggYXJnLCB1OCAqdmFsKQogCXN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KGVjLT5kZXYpOwogCXU4IHJlcVsyXSA9IHsg
Y21kLCBhcmcgfTsKIAlzdHJ1Y3QgaTJjX21zZyBtc2dzWzJdID0gewotCQl7IC5hZGRyID0g
Y2xpZW50LT5hZGRyLCAuZmxhZ3MgPSAwLCAubGVuID0gMSwgLmJ1ZiA9ICZyZXFbMF0gfSwK
KwkJeyAuYWRkciA9IGNsaWVudC0+YWRkciwgLmZsYWdzID0gMCwgLmxlbiA9IDIsIC5idWYg
PSAmcmVxWzBdIH0sCiAJCXsgLmFkZHIgPSBjbGllbnQtPmFkZHIsIC5mbGFncyA9IEkyQ19N
X1JELCAubGVuID0gMSwgLmJ1ZiA9IHZhbCB9LAogCX07CiAJaW50IHJldDsKIAotCWd1YXJk
KG11dGV4KSgmZWMtPnhmZXJfbG9jayk7CisJaTJjX2xvY2tfYnVzKGNsaWVudC0+YWRhcHRl
ciwgSTJDX0xPQ0tfU0VHTUVOVCk7CiAKLQlyZXQgPSBpMmNfbWFzdGVyX3NlbmQoY2xpZW50
LCByZXEsIHNpemVvZihyZXEpKTsKKwkvKiBTZW5kIGNtZCArIGFyZyAqLworCXJldCA9IF9f
aTJjX3RyYW5zZmVyKGNsaWVudC0+YWRhcHRlciwgbXNncywgMSk7CiAJaWYgKHJldCA8IDAp
Ci0JCXJldHVybiByZXQ7CisJCWdvdG8gb3V0OwogCi0JZnNsZWVwKDUwMDApOwotCi0JcmV0
ID0gaTJjX3RyYW5zZmVyKGNsaWVudC0+YWRhcHRlciwgbXNncywgQVJSQVlfU0laRShtc2dz
KSk7CisJLyogUmVzZW5kIHRoZSBjbWQgYnl0ZSArIHJlYWQgdGhlIHZhbHVlICovCisJbXNn
c1swXS5hZGRyID0gY2xpZW50LT5hZGRyOworCW1zZ3NbMF0uZmxhZ3MgPSAwOworCW1zZ3Nb
MF0ubGVuID0gMTsKKwltc2dzWzBdLmJ1ZiA9ICZjbWQ7CisJcmV0ID0gX19pMmNfdHJhbnNm
ZXIoY2xpZW50LT5hZGFwdGVyLCBtc2dzLCAyKTsKIAlpZiAocmV0IDwgMCkKLQkJcmV0dXJu
IHJldDsKKwkJZ290byBvdXQ7CiAKLQlyZXR1cm4gcmV0ID09IEFSUkFZX1NJWkUobXNncykg
PyAwIDogLUVJTzsKKwlyZXQgPSByZXQgPT0gMiA/IDAgOiBFSU87CitvdXQ6CisJaTJjX3Vu
bG9ja19idXMoY2xpZW50LT5hZGFwdGVyLCBJMkNfTE9DS19TRUdNRU5UKTsKKwlyZXR1cm4g
cmV0OwogfQogCiBzdGF0aWMgaW50IHQxNHNfZ2VuN19lY193cml0ZSh2b2lkICpjb250ZXh0
LCB1bnNpZ25lZCBpbnQgcmVnLApAQCAtMjc4LDggKzI4Myw2IEBAIHN0YXRpYyBpbnQgdDE0
c19nZW43X2VjX3dyaXRlKHZvaWQgKmNvbnRleHQsIHVuc2lnbmVkIGludCByZWcsCiAJdTgg
YnVmWzNdID0geyBUMTRTX0dFTjdfRUNfQ01EX1dSLCByZWcsIHZhbCB9OwogCWludCByZXQ7
CiAKLQlndWFyZChtdXRleCkoJmVjLT54ZmVyX2xvY2spOwotCiAJcmV0ID0gaTJjX21hc3Rl
cl9zZW5kKGNsaWVudCwgYnVmLCBzaXplb2YoYnVmKSk7CiAJaWYgKHJldCA8IDApCiAJCXJl
dHVybiByZXQ7CkBAIC03MzIsMTAgKzczNSw2IEBAIHN0YXRpYyBpbnQgdDE0c19lY19wcm9i
ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWlmICghZWMtPnZhcmlhbnQpCiAJCWVj
LT52YXJpYW50ID0gJnQxNHNfZWNfdmFyaWFudDsKIAotCXJldCA9IGRldm1fbXV0ZXhfaW5p
dChkZXYsICZlYy0+eGZlcl9sb2NrKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCiAJ
aTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgZWMpOwogCiAJZWMtPnJlZ21hcCA9IGRldm1f
cmVnbWFwX2luaXQoZGV2LCBlYy0+dmFyaWFudC0+cmVnbWFwX2J1cywKLS0gCjIuNTUuMAoK


--------------O8O2Dfm3OSRVuaGGnHVwKLEx--
