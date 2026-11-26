Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705491;
	b=pyyYftfQlzuh9mY58Y1Ht815LIcndDKG97I84CTbZtFgvb6MtU+uxuqJYfJdFR1m3ZVz
	 j881/QuLqwrk7NYRqWl7X89D4PIs7TJzlzNUQTjivp953N/ihp/3Vl1uU7NL5T3/qIVaa
	 AAVjjZWBvyfYBVfNstaJWBc4XtMzEofLVlBPIHu6QvBgapD51hE4LsTOQyoQygm9W23UA
	 fv7PRgCzIzmmUmz3yFyem3J++SsTk6dt/q+7DO1qX6DId/9CQMAUqxZJhGZAIzP0ly8mJ
	 tYW1qDfe0MU0na98A7eoOsn2Ww1tSaTNgRmeprXcFAocluOmAmNJ77JX3zSBVCj3DkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705491;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DxoeQUnqjrax7TOZA6qlXkeOvtgxZiLNkiFCezfCp1U=;
	b=wYnGJcgH2Ycqaz7KnKH608GVQeTGaOjiCiknkQyiAIBiYJZ9IwMjFItM+araIhDCraY4
	 Ep6GpeRhq3O3y+wvdQntvM7mQs7V1WgBczeclyAt1giIVr5tkYDB5+eUBa+4tACAcUGIZ
	 ZhshUi+9rhDeWoumcmewcDvsTCFJtRptcboqj+rYueEPfH1RTLD46r7frs2oobWqz/4H0
	 9YQFaKAovMI626WoCUmOn3khVZEXUG7EnoKjdMd99mjTEPOS77ZF1av72+ygProp5ynI/
	 8AZewhZrJCD2IaVmsRHPxLwBCMNJXWTcoaZaC5kbKFWXW3pATK5LWJu7vnG38wyZDxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuRoetxz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6AE606A31C;
	Thu, 26 Nov 2026 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuRoetxz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886A41F000C4;
	Thu, 26 Nov 2026 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705490;
	bh=DxoeQUnqjrax7TOZA6qlXkeOvtgxZiLNkiFCezfCp1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XuRoetxzLB5cN/ZOJHXhjAM3lYNwk/kx003krdL0WLjrofpSa2LCoTLuTfYec9jNE
	 jcSXWaqEGVi1US2VYq/U/oqZL/PbxQ22Sriwp0ydhYG38vwDLP/HmQMMQ/LqwioH3j
	 4GCH4H4tPd/gYr4o98stO7Jw0x1PtjBxwAWCfSv5sgq35v7LtmAh+mlOsUfJx0DRX5
	 RWBb+hgals6VuboRYkul4mLHT23/KC6vPld52EouWVQ+FWtTckYg1Wy7jX8Mk7jgPr
	 wTIH9wQASW0Ozc3No3xNs/QjJ28+wGHK/l0xn5Jn3Hi7daBa7bUSV+K4juqfE8gMAq
	 NlyIuKugFhgjA==
Message-ID: <9ca9842d-f0ae-4e21-8f89-9bd673ee7b03@kernel.org>
Date: Thu, 26 Nov 2026 16:04:45 +0100
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
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
 <20261123-t14s-gen7-ec-v2-2-3420a6202366@oss.qualcomm.com>
 <f575410d-f0be-5ad5-834f-3b1c59109c53@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <f575410d-f0be-5ad5-834f-3b1c59109c53@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 25-Nov-26 23:04, Ilpo Järvinen wrote:
> On Mon, 23 Nov 2026, Abel Vesa wrote:
> 
>> The embedded controller of the ThinkPad T14s Gen 7 uses the same
>> register layout and event codes as the Gen 6 one, but a different set
>> of I2C commands. Going by the ACPI EC accessors in the Gen 7 firmware:
>>
>>   - register read:  write {0x80, reg}, then write {0x80} + read 1 byte
>>   - register write: write {0x81, reg, val}
>>   - event read:     write {0x84, 0x00}, then write {0x84} + read 1 byte
>>
>> With the Gen 6 commands the EC never reports any event and the LED
>> and keyboard backlight accesses have no effect.
>>
>> Describe the bus accessors and event read per variant and add one for
>> the Gen 7. The multi-message Gen 7 reads are done with the I2C bus
>> locked, as the Gen 6 ones already are.
>>
>> Besides the protocol, the Gen 7 differs in a few other places:
>>
>>   - there is no second keyboard backlight register and, when cycled
>>     with Fn+Space, the keyboard backlight also reports level 3;
>>   - the mic mute LED is a generic LED (id 0x0e) instead of a bit in the
>>     audio register;
>>   - Fn+F12 reports its own event code (0x19);
>>   - suspend is signalled through bit 5 of register 0xcf instead of the
>>     Gen 6 modern standby register, and the firmware makes the power and
>>     lid logo LEDs glow while suspended;
>>   - a few hotkeys which already come in through the I2C-HID keyboard
>>     (volume, mute and some Fn+Fxx combinations) also raise an EC event,
>>     and the firmware reports some status events nobody acts upon.
>>
>> Handle those differences and treat the Gen 7 only events as known ones,
>> ignoring the duplicate hotkey events.
>>
>> Co-developed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 197 ++++++++++++++++++++++++--
>>  1 file changed, 186 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
>> index 7a875877c8f3..cc7713aeac8e 100644
>> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
>> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
>> @@ -17,7 +17,9 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/leds.h>
>>  #include <linux/lockdep.h>
>> +#include <linux/minmax.h>
>>  #include <linux/module.h>
>> +#include <linux/mutex.h>
>>  #include <linux/regmap.h>
>>  #include <linux/slab.h>
>>  #include <linux/pm.h>
>> @@ -26,8 +28,20 @@
>>  #define T14S_EC_CMD_ECWR	0x03
>>  #define T14S_EC_CMD_EVT		0xf0
>>  
>> +/*
>> + * The Gen 7 (Snapdragon X2) EC uses a different command set over I2C, as
>> + * described by the ACPI EC accessors in its firmware (RDEC, WREC, QEVT).
>> + */
>> +#define T14S_GEN7_EC_CMD_RD	0x80
>> +#define T14S_GEN7_EC_CMD_WR	0x81
>> +#define T14S_GEN7_EC_CMD_EVT	0x84
>> +#define T14S_GEN7_EC_LED_MIC_MUTE	0x0e
>> +
>>  #define T14S_EC_REG_LED				0x0c
>>  #define T14S_EC_REG_KBD_BL1			0x0d
>> +#define T14S_EC_REG_MODERN_STANDBY_GEN7		0xcf
>> +/* Gen 7 DSDT sets this bit on Windows modern standby entry */
>> +#define T14S_EC_MODERN_STANDBY_GEN7_ESLS	BIT(5)
>>  #define T14S_EC_REG_MODERN_STANDBY		0xe0
>>  #define T14S_EC_MODERN_STANDBY_ENTRY		BIT(1)
>>  #define T14S_EC_MODERN_STANDBY_EXIT		BIT(0)
>> @@ -41,6 +55,7 @@
>>  #define T14S_EC_EVT_NONE			0x00
>>  #define T14S_EC_EVT_KEY_FN_4			0x13
>>  #define T14S_EC_EVT_KEY_FN_F7			0x16
>> +#define T14S_EC_EVT_KEY_FN_F12_GEN7		0x19
>>  #define T14S_EC_EVT_KEY_FN_SPACE		0x1f
>>  #define T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
>>  #define T14S_EC_EVT_AC_CONNECTED		0x26
>> @@ -67,6 +82,18 @@
>>  #define T14S_EC_EVT_KEY_FN_F11			0x7a
>>  #define T14S_EC_EVT_KEY_FN_G			0x7e
>>  
>> +/* Gen 7 only */
>> +#define T14S_GEN7_EC_EVT_HKEY_1010		0x14
>> +#define T14S_GEN7_EC_EVT_HKEY_1011		0x15
>> +#define T14S_GEN7_EC_EVT_HKEY_1017		0x1c
>> +#define T14S_GEN7_EC_EVT_STATUS_35		0x35
>> +#define T14S_GEN7_EC_EVT_DYTC			0x3c
>> +#define T14S_GEN7_EC_EVT_STATUS_40		0x40
>> +#define T14S_GEN7_EC_EVT_STATUS_4B		0x4b
>> +#define T14S_GEN7_EC_EVT_STATUS_4E		0x4e
>> +#define T14S_GEN7_EC_EVT_HKEY_1016		0x76
>> +#define T14S_GEN7_EC_EVT_HKEY_1015		0x7b
>> +
>>  /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
>>  #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
>>  
>> @@ -83,6 +110,7 @@
>>  enum t14s_ec_led_status_t {
>>  	T14S_EC_LED_OFF =	0x00,
>>  	T14S_EC_LED_ON =	0x80,
>> +	T14S_EC_LED_GLOW =	0xa0, /* Gen 7 only, only works for power and lid LEDs */
>>  	T14S_EC_LED_BLINK =	0xc0,
>>  };
>>  
>> @@ -93,9 +121,18 @@ struct t14s_ec_led_classdev {
>>  	struct t14s_ec *ec;
>>  };
>>  
>> +struct t14s_ec;
>> +
>> +struct t14s_ec_variant {
>> +	const struct regmap_bus *regmap_bus;
>> +	int (*read_evt)(struct t14s_ec *ec, u8 *val);
>> +};
>> +
>>  struct t14s_ec {
>>  	struct regmap *regmap;
>>  	struct device *dev;
>> +	const struct t14s_ec_variant *variant;
>> +	enum led_brightness mic_mute_cache;
>>  	struct t14s_ec_led_classdev led_pwr_btn;
>>  	struct t14s_ec_led_classdev led_chrg_orange;
>>  	struct t14s_ec_led_classdev led_chrg_white;
>> @@ -206,6 +243,85 @@ static int t14s_ec_read_evt(struct t14s_ec *ec, u8 *val)
>>  	return ret;
>>  }
>>  
>> +static int t14s_gen7_ec_cmd_read(struct t14s_ec *ec, u8 cmd, u8 arg, u8 *val)
>> +{
>> +	struct i2c_client *client = to_i2c_client(ec->dev);
>> +	u8 req[2] = { cmd, arg };
>> +	struct i2c_msg msgs[2] = {
>> +		{ .addr = client->addr, .flags = 0, .len = 2, .buf = &req[0] },
>> +		{ .addr = client->addr, .flags = I2C_M_RD, .len = 1, .buf = val },
>> +	};
>> +	int ret;
>> +
>> +	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
>> +
>> +	/* Send cmd + arg */
>> +	ret = __i2c_transfer(client->adapter, msgs, 1);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	/* Resend the cmd byte + read the value */
>> +	msgs[0].len = 1;
>> +	ret = __i2c_transfer(client->adapter, msgs, 2);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	ret = ret == 2 ? 0 : -EIO;
> 
> Aren't these literal 2 same as ARRAY_SIZE(msgs) ? (x2)

Yes, but we first want to transfer 1 msg and then 2 msgs.

IOW the array is sized after the max amount of msgs we
need to transfer vs we do not necessarily want to transfer
the total amount of messages in the array.

I went with literal '2' here instead of ARRAY_SIZE()
to match the literal '1' in the transfer above and
because we want to transfer 2 msgs, not max msgs
(which happens to be the same).

I'm fine with changing this, but IMHO using ARRAY_SIZE()
for the second transfer looks a bit weird vs the literal
'1' for the first transfer.
> I wish we could use guard() of the i2c lock.

Agreed.

Regards,

Hans


