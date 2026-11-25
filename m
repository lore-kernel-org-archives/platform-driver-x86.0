Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643128;
	b=BHGFDI8Nibm0aQzNMdjFZDEb2+XlC6fz6+/Ijt8lbLHplTjCdDALPdZQr09kklXo7GJq
	 g6rypQPczjPEyzr4dc2w4bvtktVMzYshCNvLgB9FENfOfe6spIxbinBBWwD4pHj7Qu89s
	 xMhdMVogUGU76bfxscKOQHB6MBSuNywVfeF+VDS3yEamx700IPk4+t6Rk/kl/ugjFdhQa
	 G1Jec/pcdpWmLbLcK2YaDy5p7ULiqCBcN1ZDFani2O+4+9Yas7mo0bbR54qZilphW8vOA
	 zbwAIG/5w5dmoQ8DsmnZkmQmjOJsoL1WB8dfp1xekBLfqln7zlSsx1WCyWEAItqTtfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643128;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OnOuVvBlE+R1F82oqw1kEn2tKpIaZyG8AJ2iAgBkicQ=;
	b=e/3rH3xekaZysu/kAulpU22fugxHP4fVH8s25q0XsfhVkjksCT/xQQNyDAk8Gt1AVqjB
	 UIgW1fUQz4VoVgBNfOWVU7TuLaacDy8CQ5Duv26A76uxWIj1T4SbMZQO5A+cZ4jkTO6wd
	 W4eZXskqsUcSJMJY7zZN86aNFAjyi7RF5fHva6UdWI7rqqQDjfOnd/LYn94aFd0m0Nnnp
	 hhEvCPbhZAJEBkDrXvl45eML2xAiB8iRaUvrIkcYyd0AW62r0YOLb8d/T+GV23RVX3aVc
	 doCVcqFKFO1O0Z1mB6ec7IbYb5wCMIqEaQ3fEoc3dAjaDPa0fvk+a3OSo5mfyg3D8DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCULvuMI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF2E606A321;
	Wed, 25 Nov 2026 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCULvuMI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0471F000D8;
	Wed, 25 Nov 2026 21:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795643127;
	bh=OnOuVvBlE+R1F82oqw1kEn2tKpIaZyG8AJ2iAgBkicQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cCULvuMI+J9y9/TyYhArpyVrz7EJQdTN+d+7e6n1WZ0nsEoYh3lJncLyZCvxdrV91
	 xlPPsz0th3xwDg6qJfYjMuM1JA7pKEybjEg2i1zPw1F1vk0rsi95zINI5kHoSEqd7g
	 GZxtYcEwPqAk9QauKB+ilvlEJWO3GeZDXHeg1oazwNRCYJOiuEVXj9qmpkAN3DB5C/
	 wHNQJxuCBJjJ73NSzBuvKGsvoXv2j6dL+FVVFoliODpCpo6NvZse1kHpMXoJQPzoG1
	 ZC5cL1PMv6RBHU30e6mNhzBR7aZBDi3lV42kX54aBQxn5H1QQRuKVTPclr+3cmrp+o
	 mAf3/qvb9cN4A==
Message-ID: <2ce71659-6fec-4ac0-8f28-a2b490d46eff@kernel.org>
Date: Wed, 25 Nov 2026 22:45:22 +0100
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
Subject: Re: [PATCH v2 2/4] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7
 EC support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
 <20261123-t14s-gen7-ec-v2-2-3420a6202366@oss.qualcomm.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261123-t14s-gen7-ec-v2-2-3420a6202366@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Nov-26 10:35, Abel Vesa wrote:
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

Thank you for the new version. I've tested this successfully on
both a T14s gen6 and a gen7:

Thanks, patch looks good to me:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # T14s gen 6 and T14s gen 7

Regards,

Hans



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

