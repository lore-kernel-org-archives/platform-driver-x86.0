From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Sun, 5 Jun 2011 14:31:12 +0900
Message-ID: <20110605053110.GA21142@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE93AC0.3000506@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:39357 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751486Ab1FEFbR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jun 2011 01:31:17 -0400
Received: by pwi15 with SMTP id 15so1589276pwi.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Jun 2011 22:31:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DE93AC0.3000506@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>

On Fri, Jun 03, 2011 at 09:49:20PM +0200, Marco Chiappero wrote:
> Vaio S1, F1, Z1, TT and probably some others are equipped with an
> ambient light sensor and full access to the sensor is provided via
> 0x012F or 0x0137 handle. On newer SA/SB/SC and CA/CB series, only
> the lux reading is provided. This patch provides full support for
> both types, including a driver for TAOS devices used in conjunction
> with handles 0x012F and 0x0137, and a generic layer that exposes
> control files for every handle. Some other model specific parameters
> provided by the hardware, to be used for ALS based backlight
> regulation, are exposed too.

could you document a bit better what managed mode is, the way GPE
notification works (under which conditions) and the general idea behind
your re-implementation of a backlight device and why we would ever want
to have it?

To my understanding, SNC will receive GPEs in two cases under managed
mode:
 1. when the user request a backlight change via the standard acpi_video
 2. when ambient light changes
In both cases your code sends an acpi event to userspace. Let alone the
acpi event discussion that belongs to another thread, why aren't we
just setting the requested brightness?

I'm also under the impression that the whole ALS driver could be split
out of sony-laptop (like meye was).

> This patch has been written by Marco Chiappero and Javier Achirica.
> 
> Signed-off-by: Marco Chiappero <marco@absence.it>
> ---
> 
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1412,6 +1412,1009 @@ static int sony_nc_rfkill_setup(struct a
>  	return 0;
>  }
> 
> +/*	ALS controlled backlight feature	*/
> +/* generic ALS data and interface */
> +#define ALS_TABLE_SIZE	25
> +
> +struct als_device_ops {
> +	int (*init)(const u8 defaults[]);
> +	int (*exit)(void);
> +	int (*event_handler)(void);
> +	int (*set_power)(unsigned int);
> +	int (*get_power)(unsigned int *);
> +	int (*get_lux)(unsigned int *, unsigned int *);
> +	int (*get_kelvin)(unsigned int *);
> +};
> +
> +struct als_device {
> +	unsigned int power;
> +	unsigned int managed;
> +
> +	unsigned int levels_num;
> +	u8 *levels;
> +	unsigned int defaults_num;
> +	u8 *defaults;
> +	u8 parameters[ALS_TABLE_SIZE];
> +
> +	/* common device operations */
> +	const struct als_device_ops *ops;
> +
> +	/* basic ALS sys interface */
> +	unsigned int attrs_num;
> +	struct device_attribute attrs[7];
> +};
> +
> +static struct als_device *als_handle;
> +static int sony_als_handle = -1;
> +
> +/*
> +	model specific ALS data and controls
> +	TAOS TSL256x device data
> +*/
> +#define LUX_SHIFT_BITS		16	/* for non-floating point math */
> +/* scale 100000 multiplied fractional coefficients rounding the values */
> +#define SCALE(u)	((((((u64) u) << LUX_SHIFT_BITS) / 10000) + 5) / 10)
> +
> +#define TSL256X_REG_CTRL	0x00
> +#define TSL256X_REG_TIMING	0x01
> +#define TSL256X_REG_TLOW	0x02
> +#define TSL256X_REG_THIGH	0x04
> +#define TSL256X_REG_INT		0x06
> +#define TSL256X_REG_ID		0x0a
> +#define TSL256X_REG_DATA0	0x0c
> +#define TSL256X_REG_DATA1	0x0e
> +
> +#define TSL256X_POWER_ON	0x03
> +#define TSL256X_POWER_OFF	0x00
> +
> +#define TSL256X_POWER_MASK	0x03
> +#define TSL256X_INT_MASK	0x10
> +
> +struct tsl256x_coeff {
> +	u32 ratio;
> +	u32 ch0;
> +	u32 ch1;
> +	u32 ka;
> +	s32 kb;
> +};
> +
> +struct tsl256x_data {
> +	unsigned int gaintime;
> +	unsigned int periods;
> +	u8 *defaults;
> +	struct tsl256x_coeff const *coeff_table;
> +};
> +static struct tsl256x_data *tsl256x_handle;
> +
> +static const struct tsl256x_coeff tsl256x_coeff_fn[] = {
> +	{
> +		.ratio	= SCALE(12500),	/* 0.125 * 2^LUX_SHIFT_BITS  */
> +		.ch0	= SCALE(3040),	/* 0.0304 * 2^LUX_SHIFT_BITS */
> +		.ch1	= SCALE(2720),	/* 0.0272 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(313550000),
> +		.kb	= -10651,
> +	}, {
> +		.ratio	= SCALE(25000),	/* 0.250 * 2^LUX_SHIFT_BITS  */
> +		.ch0	= SCALE(3250),	/* 0.0325 * 2^LUX_SHIFT_BITS */
> +		.ch1	= SCALE(4400),	/* 0.0440 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(203390000),
> +		.kb	= -2341,
> +	}, {
> +		.ratio	= SCALE(37500),	/* 0.375 * 2^LUX_SHIFT_BITS  */
> +		.ch0	= SCALE(3510),	/* 0.0351 * 2^LUX_SHIFT_BITS */
> +		.ch1	= SCALE(5440),	/* 0.0544 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(152180000),
> +		.kb	= 157,
> +	}, {
> +		.ratio	= SCALE(50000),	/* 0.50 * 2^LUX_SHIFT_BITS   */
> +		.ch0	= SCALE(3810),	/* 0.0381 * 2^LUX_SHIFT_BITS */
> +		.ch1	= SCALE(6240),	/* 0.0624 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(163580000),
> +		.kb	= -145,
> +	}, {
> +		.ratio	= SCALE(61000),	/* 0.61 * 2^LUX_SHIFT_BITS   */
> +		.ch0	= SCALE(2240),	/* 0.0224 * 2^LUX_SHIFT_BITS */
> +		.ch1	= SCALE(3100),	/* 0.0310 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(180800000),
> +		.kb	= -495,
> +	}, {
> +		.ratio	= SCALE(80000),	/* 0.80 * 2^LUX_SHIFT_BITS   */
> +		.ch0	= SCALE(1280),	/* 0.0128 * 2^LUX_SHIFT_BITS */
> +		.ch1	= SCALE(1530),	/* 0.0153 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(197340000),
> +		.kb	= -765
> +	}, {
> +		.ratio	= SCALE(130000),/* 1.3 * 2^LUX_SHIFT_BITS     */
> +		.ch0	= SCALE(146),	/* 0.00146 * 2^LUX_SHIFT_BITS */
> +		.ch1	= SCALE(112),	/* 0.00112 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(182900000),
> +		.kb	= -608,
> +	}, {
> +		.ratio	= UINT_MAX,	/* for higher ratios */
> +		.ch0	= 0,
> +		.ch1	= 0,
> +		.ka	= 0,
> +		.kb	= 830,
> +	}
> +};
> +
> +static const struct tsl256x_coeff tsl256x_coeff_cs[] = {
> +	{
> +		.ratio  = SCALE(13000),	/* 0.130 * 2^LUX_SHIFT_BITS  */
> +		.ch0    = SCALE(3150),	/* 0.0315 * 2^LUX_SHIFT_BITS */
> +		.ch1    = SCALE(2620),	/* 0.0262 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(300370000),
> +		.kb	= -9587,
> +	}, {
> +		.ratio  = SCALE(26000),	/* 0.260 * 2^LUX_SHIFT_BITS  */
> +		.ch0    = SCALE(3370),	/* 0.0337 * 2^LUX_SHIFT_BITS */
> +		.ch1    = SCALE(4300),	/* 0.0430 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(194270000),
> +		.kb	= -1824,
> +	}, {
> +		.ratio  = SCALE(39000),	/* 0.390 * 2^LUX_SHIFT_BITS  */
> +		.ch0    = SCALE(3630),	/* 0.0363 * 2^LUX_SHIFT_BITS */
> +		.ch1    = SCALE(5290),	/* 0.0529 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(152520000),
> +		.kb	= 145,
> +	}, {
> +		.ratio  = SCALE(52000),	/* 0.520 * 2^LUX_SHIFT_BITS  */
> +		.ch0    = SCALE(3920),	/* 0.0392 * 2^LUX_SHIFT_BITS */
> +		.ch1    = SCALE(6050),	/* 0.0605 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(165960000),
> +		.kb	= -200,
> +	}, {
> +		.ratio  = SCALE(65000),	/* 0.650 * 2^LUX_SHIFT_BITS  */
> +		.ch0    = SCALE(2290),	/* 0.0229 * 2^LUX_SHIFT_BITS */
> +		.ch1    = SCALE(2910),	/* 0.0291 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(184800000),
> +		.kb	= -566,
> +	}, {
> +		.ratio  = SCALE(80000),	/* 0.800 * 2^LUX_SHIFT_BITS  */
> +		.ch0    = SCALE(1570),	/* 0.0157 * 2^LUX_SHIFT_BITS */
> +		.ch1    = SCALE(1800),	/* 0.0180 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(199220000),
> +		.kb	= -791,
> +	}, {
> +		.ratio  = SCALE(130000),/* 0.130 * 2^LUX_SHIFT_BITS  */
> +		.ch0    = SCALE(338),	/* 0.00338 * 2^LUX_SHIFT_BITS */
> +		.ch1    = SCALE(260),	/* 0.00260 * 2^LUX_SHIFT_BITS */
> +		.ka	= SCALE(182900000),
> +		.kb	= -608,
> +	}, {
> +		.ratio  = UINT_MAX,	/* for higher ratios */
> +		.ch0    = 0,
> +		.ch1    = 0,
> +		.ka	= 0,
> +		.kb	= 830,
> +	}
> +};
> +
> +/*	TAOS helper & control functions		*/
> +static inline int tsl256x_exec_writebyte(unsigned int reg,
> +						unsigned int const *value)
> +{
> +	unsigned int result;
> +
> +	return (sony_call_snc_handle(sony_als_handle, (*value << 0x18) |
> +		(reg << 0x10) | 0x800500, &result) || !(result & 0x01))
> +		? -EIO : 0;
> +}
> +
> +static inline int tsl256x_exec_writeword(unsigned int reg,
> +						unsigned int const *value)
> +{
> +	u8 result[1];
> +	u64 arg = *value;
> +
> +	/* using sony_call_snc_handle_buffer due to possible input overflows */
> +	return ((sony_call_snc_handle_buffer(sony_als_handle, (arg << 0x18) |
> +				(reg << 0x10) | 0xA00700, result, 1) < 0) ||
> +				!(result[0] & 0x01)) ? -EIO : 0;
> +}
> +
> +static inline int tsl256x_exec_readbyte(unsigned int reg, unsigned
> int *result)
> +{
> +	if (sony_call_snc_handle(sony_als_handle, (reg << 0x10)
> +		| 0x800400, result) || !(*result & 0x01))
> +		return -EIO;
> +	*result = (*result >> 0x08) & 0xFF;
> +
> +	return 0;
> +}
> +
> +static inline int tsl256x_exec_readword(unsigned int reg, unsigned
> int *result)
> +{
> +	if (sony_call_snc_handle(sony_als_handle, (reg << 0x10)
> +		| 0xA00600, result) || !(*result & 0x01))
> +		return -EIO;
> +	*result = (*result >> 0x08) & 0xFFFF;
> +
> +	return 0;
> +}
> +
> +static int tsl256x_interrupt_ctrls(unsigned int *interrupt,
> +					unsigned int *periods)
> +{
> +	unsigned int value, result;
> +
> +	/* if no interrupt parameter, retrieve interrupt status */
> +	if (!interrupt) {
> +		if (tsl256x_exec_readbyte(TSL256X_REG_INT, &result))
> +			return -EIO;
> +
> +		value = (result & TSL256X_INT_MASK);
> +	} else {
> +		value = *interrupt << 0x04;
> +	}
> +
> +	/* if no periods provided use the last one set */
> +	value |= (periods ? *periods : tsl256x_handle->periods);
> +
> +	if (tsl256x_exec_writebyte(TSL256X_REG_INT, &value))
> +		return -EIO;
> +
> +	if (periods)
> +		tsl256x_handle->periods = *periods;
> +
> +	return 0;
> +}
> +
> +static int tsl256x_setup(void)
> +{
> +	unsigned int interr = 1, zero = 0;
> +
> +	/*
> +	 *   reset the threshold settings to trigger an event as soon
> +	 *   as the event goes on, forcing a backlight adaptation to
> +	 *   the current lighting conditions
> +	 */
> +	tsl256x_exec_writeword(TSL256X_REG_TLOW, &zero);
> +	tsl256x_exec_writeword(TSL256X_REG_THIGH, &zero);
> +
> +	/* set gain and time */
> +	if (tsl256x_exec_writebyte(TSL256X_REG_TIMING,
> +				&tsl256x_handle->gaintime))
> +		return -EIO;
> +
> +	/* restore persistence value and enable the interrupt generation */
> +	if (tsl256x_interrupt_ctrls(&interr, &tsl256x_handle->periods))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int tsl256x_set_power(unsigned int status)
> +{
> +	int ret;
> +
> +	if (status) {
> +		ret = tsl256x_setup();
> +		if (ret)
> +			return ret;
> +	}
> +
> +	status = status ? TSL256X_POWER_ON : TSL256X_POWER_OFF;
> +	ret = tsl256x_exec_writebyte(TSL256X_REG_CTRL, &status);
> +
> +	return ret;
> +}
> +
> +static int tsl256x_get_power(unsigned int *status)
> +{
> +	if (tsl256x_exec_readbyte(TSL256X_REG_CTRL, status))
> +		return -EIO;
> +
> +	*status = ((*status & TSL256X_POWER_MASK) == TSL256X_POWER_ON) ? 1 : 0;
> +
> +	return 0;
> +}
> +
> +static int tsl256x_get_raw_data(unsigned int *ch0, unsigned int *ch1)
> +{
> +	if (!ch0)
> +		return -1;
> +
> +	if (tsl256x_exec_readword(TSL256X_REG_DATA0, ch0))
> +		return -EIO;
> +
> +	if (ch1) {
> +		if (tsl256x_exec_readword(TSL256X_REG_DATA1, ch1))
> +			return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tsl256x_set_thresholds(const unsigned int *ch0)
> +{
> +	unsigned int tlow, thigh;
> +
> +	tlow = (*ch0 * tsl256x_handle->defaults[0]) / 100;
> +	thigh = ((*ch0 * tsl256x_handle->defaults[1]) / 100) + 1;
> +
> +	if (thigh > 0xffff)
> +		thigh = 0xffff;
> +
> +	if (tsl256x_exec_writeword(TSL256X_REG_TLOW, &tlow) ||
> +		tsl256x_exec_writeword(TSL256X_REG_THIGH, &thigh))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +#define MAX_LUX 1500
> +static void tsl256x_calculate_lux(const u32 ch0, const u32 ch1,
> +				unsigned int *integ, unsigned int *fract)
> +{
> +	/* the raw output from the sensor is just a "count" value, as
> +	   it is the result of the integration of the analog sensor
> +	   signal, the counts-to-lux curve (and its approximation can
> +	   be found on the datasheet.
> +	*/
> +	const struct tsl256x_coeff *coeff = tsl256x_handle->coeff_table;
> +	u32 ratio, temp, integer, fractional;
> +
> +	if (ch0 >= 65535 || ch1 >= 65535)
> +		goto saturation;
> +
> +	/* STEP 1: ratio calculation, for ch0 & ch1 coeff selection */
> +
> +	/* protect against division by 0 */
> +	ratio = ch0 ? ((ch1 << (LUX_SHIFT_BITS + 1)) / ch0) : UINT_MAX;
> +	/* round the ratio value */
> +	ratio = (ratio + 1) >> 1;
> +
> +	/* coeff selection rule */
> +	while (coeff->ratio < ratio)
> +		coeff++;
> +
> +	/* STEP 2: lux calculation formula using the right coeffcients */
> +	temp = (ch0 * coeff->ch0) - (ch1 * coeff->ch1);
> +	/* the sensor is placed under a plastic or glass cover which filters
> +	   a certain ammount of light (depending on that particular material).
> +	   To have an accurate reading, we need to compensate for this loss,
> +	   multiplying for compensation parameter, taken from the DSDT.
> +	*/
> +	temp *= tsl256x_handle->defaults[3] / 10;
> +
> +	/* STEP 3: separate integer and fractional part */
> +	/* remove the integer part and multiply for the 10^N, N decimals  */
> +	fractional = (temp % (1 << LUX_SHIFT_BITS)) * 100; /* two decimals */
> +	/* scale down the value */
> +	fractional >>= LUX_SHIFT_BITS;
> +
> +	/* strip off fractional portion to obtain the integer part */
> +	integer = temp >> LUX_SHIFT_BITS;
> +
> +	if (integer > MAX_LUX)
> +		goto saturation;
> +
> +	*integ = integer;
> +	*fract = fractional;
> +
> +	return;
> +
> +saturation:
> +	*integ = MAX_LUX;
> +	*fract = 0;
> +}
> +
> +static void tsl256x_calculate_kelvin(const u32 *ch0, const u32 *ch1,
> +					unsigned int *temperature)
> +{
> +	const struct tsl256x_coeff *coeff = tsl256x_handle->coeff_table;
> +	u32 ratio;
> +
> +	/* protect against division by 0 */
> +	ratio = *ch0 ? ((*ch1 << (LUX_SHIFT_BITS + 1)) / *ch0) : UINT_MAX;
> +	/* round the ratio value */
> +	ratio = (ratio + 1) >> 1;
> +
> +	/* coeff selection rule */
> +	while (coeff->ratio < ratio)
> +		coeff++;
> +
> +	*temperature = ratio ? coeff->ka / ratio + coeff->kb : 0;
> +}
> +
> +static int tsl256x_get_lux(unsigned int *integ, unsigned int *fract)
> +{
> +	int ret = 0;
> +	unsigned int ch0, ch1;
> +
> +	if (!integ || !fract)
> +		return -1;
> +
> +	ret = tsl256x_get_raw_data(&ch0, &ch1);
> +	if (!ret)
> +		tsl256x_calculate_lux(ch0, ch1, integ, fract);
> +
> +	return ret;
> +}
> +
> +static int tsl256x_get_kelvin(unsigned int *temperature)
> +{
> +	int ret = -1;
> +	unsigned int ch0, ch1;
> +
> +	if (!temperature)
> +		return ret;
> +
> +	ret = tsl256x_get_raw_data(&ch0, &ch1);
> +	if (!ret)
> +		tsl256x_calculate_kelvin(&ch0, &ch1, temperature);
> +
> +	return ret;
> +}
> +
> +static int tsl256x_get_id(char *model, unsigned int *id, bool *cs)
> +{
> +	int ret;
> +	unsigned int result;
> +	char *name = NULL;
> +	bool unknown = false;
> +	bool type_cs = false;
> +
> +	ret = tsl256x_exec_readbyte(TSL256X_REG_ID, &result);
> +	if (ret)
> +		return ret;
> +
> +	switch ((result >> 0x04) & 0x0F) {
> +	case 11:
> +		name = "TAOS TSL2569";
> +		break;
> +	case 5:
> +		name = "TAOS TSL2561";
> +		break;
> +	case 3:
> +		name = "TAOS TSL2563";
> +		break;
> +	case 0:
> +		type_cs = true;
> +		name = "TAOS TSL2560CS";
> +		break;
> +	default:
> +		unknown = true;
> +		break;
> +	}
> +
> +	if (id)
> +		*id = result;
> +	if (cs)
> +		*cs = type_cs;
> +	if (model && name)
> +		strcpy(model, name);
> +
> +	return unknown;
> +}
> +
> +static int tsl256x_event_handler(void)
> +{
> +	unsigned int ch0, interr = 1;
> +
> +	/* wait for the EC to clear the interrupt */
> +/*      schedule_timeout_interruptible(msecs_to_jiffies(100));	*/
> +	/* ...or force the interrupt clear immediately */
> +	sony_call_snc_handle(sony_als_handle, 0x04C60500, &interr);
> +
> +	/* read the raw data */
> +	tsl256x_get_raw_data(&ch0, NULL);
> +
> +	/* set the thresholds */
> +	tsl256x_set_thresholds(&ch0);
> +
> +	/* enable interrupt */
> +	tsl256x_interrupt_ctrls(&interr, NULL);
> +
> +	return 0;
> +}
> +
> +static int tsl256x_init(const u8 defaults[])
> +{
> +	unsigned int id;
> +	int ret = 0;
> +	bool cs; /* if CS package choose CS coefficients */
> +	char model[64];
> +
> +	/* detect the device */
> +	ret = tsl256x_get_id(model, &id, &cs);
> +	if (ret < 0)
> +		return ret;
> +	if (ret) {
> +		dprintk("unsupported ALS found (unknown model "
> +			"number %u rev. %u\n", id >> 4, id & 0x0F);
> +		return ret;
> +	} else {
> +		dprintk("found ALS model number %u rev. %u (%s)\n",
> +				id >> 4, id & 0x0F, model);
> +	}
> +
> +	tsl256x_handle = kzalloc(sizeof(struct tsl256x_data), GFP_KERNEL);
> +	if (!tsl256x_handle)
> +		return -ENOMEM;
> +
> +	tsl256x_handle->defaults = kzalloc(sizeof(u8) * 4, GFP_KERNEL);
> +	if (!tsl256x_handle->defaults) {
> +		kfree(tsl256x_handle);
> +		return -ENOMEM;
> +	}
> +
> +	/* populate the device data */
> +	tsl256x_handle->defaults[0] = defaults[3];  /* low threshold % */
> +	tsl256x_handle->defaults[1] = defaults[4];  /* high threshold % */
> +	tsl256x_handle->defaults[2] = defaults[9];  /* sensor interrupt rate */
> +	tsl256x_handle->defaults[3] = defaults[10]; /* light compensat. rate */
> +	tsl256x_handle->gaintime = 0x12;
> +	tsl256x_handle->periods = defaults[9];
> +	tsl256x_handle->coeff_table = cs ? tsl256x_coeff_cs : tsl256x_coeff_fn;
> +
> +	ret = tsl256x_setup();
> +
> +	return ret;
> +}
> +
> +static int tsl256x_exit(void)
> +{
> +	unsigned int interr = 0, periods = tsl256x_handle->defaults[2];
> +
> +	/* disable the interrupt generation, restore defaults */
> +	tsl256x_interrupt_ctrls(&interr, &periods);
> +
> +	tsl256x_handle->coeff_table = NULL;
> +	kfree(tsl256x_handle->defaults);
> +	tsl256x_handle->defaults = NULL;
> +	kfree(tsl256x_handle);
> +
> +	return 0;
> +}
> +
> +/* TAOS TSL256x specific ops */
> +static const struct als_device_ops tsl256x_ops = {
> +	.init = tsl256x_init,
> +	.exit = tsl256x_exit,
> +	.event_handler = tsl256x_event_handler,
> +	.set_power = tsl256x_set_power,
> +	.get_power = tsl256x_get_power,
> +	.get_lux = tsl256x_get_lux,
> +	.get_kelvin = tsl256x_get_kelvin,
> +};
> +
> +/* unknown ALS sensors controlled by the EC present on newer Vaios */
> +static inline int ngals_get_raw_data(unsigned int *data)
> +{
> +	if (sony_call_snc_handle(sony_als_handle, 0x1000, data))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int ngals_get_lux(unsigned int *integ, unsigned int *fract)
> +{
> +	unsigned int data;
> +
> +	if (sony_call_snc_handle(sony_als_handle, 0x1000, &data))
> +		return -EIO;
> +
> +	/* if we have a valid lux data */
> +	if (!!(data & 0xff0000) == 0x01) {
> +		*integ = 0xffff & data;
> +		*fract = 0;
> +	} else {
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct als_device_ops ngals_ops = {
> +	.init = NULL,
> +	.exit = NULL,
> +	.event_handler = NULL,
> +	.set_power = NULL,
> +	.get_power = NULL,
> +	.get_lux = ngals_get_lux,
> +	.get_kelvin = NULL,
> +};
> +
> +/*	ALS common data and functions	*/
> +static int sony_nc_als_event_handler(void)
> +{
> +	/* call the device handler */
> +	if (als_handle->ops->event_handler)
> +		als_handle->ops->event_handler();
> +
> +	return 0;
> +}
> +
> +static int sony_nc_als_power_set(unsigned int status)
> +{
> +	if (!als_handle->ops->set_power)
> +		return -EPERM;
> +
> +	if (als_handle->ops->set_power(status))
> +		return -EIO;
> +
> +	als_handle->power = status;
> +
> +	return 0;
> +}
> +
> +static int sony_nc_als_managed_set(unsigned int status)
> +{
> +	int ret = 0;
> +	unsigned int result, cmd;
> +	static bool was_on;
> +
> +	/*  turn on/off the event notification
> +	 *  (and enable als_backlight writes)
> +	 */
> +	cmd = sony_als_handle == 0x0143 ? 0x2200 : 0x0900;
> +	if (sony_call_snc_handle(sony_als_handle,
> +		(status << 0x10) | cmd, &result))
> +		return -EIO;
> +
> +	als_handle->managed = status;
> +
> +	/* turn on the ALS; this will also enable the interrupt generation */
> +	if (status) /* store the power state else check the previous state */
> +		was_on = als_handle->power;
> +	else if (was_on)
> +		return 0;

I don't quite understand what you want to achieve with the code above.
Also, if als_power and als_managed have to go along together why not
just have one single file that allows 3 values, i.e. 0:off, 1:on,
2:managed ?

> +	ret = sony_nc_als_power_set(status);
> +	if (ret == -EPERM) /* new models do not allow power control */
> +		ret = 0;
> +
> +	return ret;
> +}
> +
> +/*	ALS sys interface	*/
> +static ssize_t sony_nc_als_power_show(struct device *dev,
> +		struct device_attribute *attr, char *buffer)
> +{
> +	ssize_t count = 0;
> +	int status;
> +
> +	if (!als_handle->ops->get_power)
> +		return -EPERM;
> +
> +	if (als_handle->ops->get_power(&status))
> +		return -EIO;
> +
> +	count = snprintf(buffer, PAGE_SIZE, "%d\n", status);
> +
> +	return count;
> +}
> +
> +static ssize_t sony_nc_als_power_store(struct device *dev,
> +		struct device_attribute *attr,
> +		const char *buffer, size_t count)
> +{
> +	int ret;
> +	unsigned long value;
> +
> +	if (count > 31)
> +		return -EINVAL;
> +
> +	if (strict_strtoul(buffer, 10, &value) || value > 1)
> +		return -EINVAL;
> +
> +	/* no action if already set */
> +	if (value == als_handle->power)
> +		return count;
> +
> +	ret = sony_nc_als_power_set(value);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t sony_nc_als_managed_show(struct device *dev,
> +		struct device_attribute *attr, char *buffer)
> +{
> +	ssize_t count = 0;
> +	unsigned int status, cmd;
> +
> +	cmd = sony_als_handle == 0x0143 ? 0x2100 : 0x0A00;
> +	if (sony_call_snc_handle(sony_als_handle, cmd, &status))
> +		return -EIO;
> +
> +	count = snprintf(buffer, PAGE_SIZE, "%d\n", status & 0x01);
> +
> +	return count;
> +}
> +
> +static ssize_t sony_nc_als_managed_store(struct device *dev,
> +		struct device_attribute *attr,
> +		const char *buffer, size_t count)
> +{
> +	unsigned long value;
> +
> +	if (count > 31)
> +		return -EINVAL;
> +
> +	if (strict_strtoul(buffer, 10, &value) || value > 1)
> +		return -EINVAL;
> +
> +	if (als_handle->managed != value) {
> +		int ret = sony_nc_als_managed_set(value);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t sony_nc_als_lux_show(struct device *dev,
> +		struct device_attribute *attr, char *buffer)
> +{
> +	ssize_t count = 0;
> +	unsigned int integ = 0, fract = 0;
> +
> +	if (als_handle->power)
> +		/* als_handle->ops->get_lux is mandatory, no check */
> +		als_handle->ops->get_lux(&integ, &fract);
> +
> +	count = snprintf(buffer, PAGE_SIZE, "%u.%.2u\n", integ, fract);
> +
> +	return count;
> +}
> +
> +static ssize_t sony_nc_als_parameters_show(struct device *dev,
> +		struct device_attribute *attr, char *buffer)
> +{
> +	ssize_t count = 0;
> +	unsigned int i, num;
> +	u8 *list;
> +
> +	if (!strcmp(attr->attr.name, "als_defaults")) {
> +		list = als_handle->defaults;
> +		num = als_handle->defaults_num;
> +	} else { /* als_backlight_levels */
> +		list = als_handle->levels;
> +		num = als_handle->levels_num;
> +	}
> +
> +	for (i = 0; i < num; i++)
> +		count += snprintf(buffer + count, PAGE_SIZE - count,
> +				"0x%.2x ", list[i]);
> +
> +	count += snprintf(buffer + count, PAGE_SIZE - count, "\n");
> +
> +	return count;
> +}
> +
> +static ssize_t sony_nc_als_backlight_show(struct device *dev,
> +		struct device_attribute *attr, char *buffer)
> +{
> +	ssize_t count = 0;
> +	unsigned int result, cmd;
> +
> +	cmd = sony_als_handle == 0x0143 ? 0x3100 : 0x0200;
> +	if (sony_call_snc_handle(sony_als_handle, cmd, &result))
> +		return -EIO;
> +
> +	count = snprintf(buffer, PAGE_SIZE, "%d\n", result & 0xff);
> +
> +	return count;
> +}
> +
> +static ssize_t sony_nc_als_backlight_store(struct device *dev,
> +		struct device_attribute *attr,
> +		const char *buffer, size_t count)
> +{
> +	unsigned long value;
> +	unsigned int result, cmd, max = als_handle->levels_num - 1;
> +
> +	if (count > 31)
> +		return -EINVAL;
> +
> +	if (strict_strtoul(buffer, 10, &value))
> +		return -EINVAL;
> +
> +	if (!als_handle->managed)
> +		return -EPERM;
> +
> +	/* verify that the provided value falls inside the model
> +	   specific backlight range */
> +	if ((value < als_handle->levels[0])
> +			|| (value > als_handle->levels[max]))
> +		return -EINVAL;
> +
> +	cmd = sony_als_handle == 0x0143 ? 0x3000 : 0x0100;
> +	if (sony_call_snc_handle(sony_als_handle, (value << 0x10) | cmd,
> +				&result))
> +		return -EIO;
> +
> +	return count;
> +}
> +
> +static ssize_t sony_nc_als_kelvin_show(struct device *dev,
> +		struct device_attribute *attr, char *buffer)
> +{
> +	ssize_t count = 0;
> +	unsigned int kelvin = 0;
> +
> +	if (als_handle->ops->get_kelvin && als_handle->power)
> +		als_handle->ops->get_kelvin(&kelvin);
> +
> +	count = snprintf(buffer, PAGE_SIZE, "%d\n", kelvin);
> +
> +	return count;
> +}
> +
> +
> +/*	ALS attach/detach functions	*/
> +static int sony_nc_als_setup(struct platform_device *pd)
> +{
> +	int i = 0;
> +
> +	/* check the device presence */
> +	if (sony_als_handle == 0x0137) {
> +		unsigned int result;
> +
> +		if (sony_call_snc_handle(sony_als_handle, 0xB00, &result))
> +			return -EIO;
> +
> +		if (!(result & 0x01)) {
> +			pr_info("no ALS present\n");
> +			return 0;
> +		}
> +	}
> +
> +	als_handle = kzalloc(sizeof(struct als_device), GFP_KERNEL);
> +	if (!als_handle)
> +		return -ENOMEM;
> +
> +	/* set model specific data */
> +	/* if handle 0x012f or 0x0137 use tsl256x_ops, else new als controls */
> +	if (sony_als_handle == 0x0143) {
> +		als_handle->ops = &ngals_ops;
> +		als_handle->levels_num = 16;
> +		als_handle->defaults_num = 9;
> +	} else {
> +		als_handle->ops = &tsl256x_ops;
> +		als_handle->levels_num = 9;
> +		als_handle->defaults_num = 13;
> +	}
> +	/* backlight levels are the first levels_num values, the remaining
> +	   defaults_num values are default settings for als regulation
> +	*/
> +	als_handle->levels = als_handle->parameters;
> +	als_handle->defaults = als_handle->parameters + als_handle->levels_num;
> +
> +	/* get power state */
> +	if (als_handle->ops->get_power) {
> +		if (als_handle->ops->get_power(&als_handle->power))
> +			pr_warn("unable to retrieve the power status\n");
> +	}
> +
> +	/* set managed to 0, userspace daemon should enable it */
> +	sony_nc_als_managed_set(0);
> +
> +	/* get ALS parameters */
> +	if (sony_call_snc_handle_buffer(sony_als_handle, 0x0000,
> +		als_handle->parameters, ALS_TABLE_SIZE) < 0)
> +		goto nosensor;
> +
> +	/* initial device configuration */
> +	if (als_handle->ops->init)
> +		if (als_handle->ops->init(als_handle->defaults)) {
> +			pr_warn("ALS setup failed\n");
> +			goto nosensor;
> +		}
> +
> +	/* set up the sys interface */
> +
> +	/* notifications and backlight enable control file */
> +	sysfs_attr_init(&als_handle->attrs[0].attr);
> +	als_handle->attrs[0].attr.name = "als_managed";
> +	als_handle->attrs[0].attr.mode = S_IRUGO | S_IWUSR;
> +	als_handle->attrs[0].show = sony_nc_als_managed_show;
> +	als_handle->attrs[0].store = sony_nc_als_managed_store;
> +	/* lux equivalent value */
> +	sysfs_attr_init(&als_handle->attrs[1].attr);
> +	als_handle->attrs[1].attr.name = "als_lux";
> +	als_handle->attrs[1].attr.mode = S_IRUGO;
> +	als_handle->attrs[1].show = sony_nc_als_lux_show;
> +	/* ALS default parameters */
> +	sysfs_attr_init(&als_handle->attrs[2].attr);
> +	als_handle->attrs[2].attr.name = "als_defaults";
> +	als_handle->attrs[2].attr.mode = S_IRUGO;
> +	als_handle->attrs[2].show = sony_nc_als_parameters_show;
> +	/* ALS default backlight levels */
> +	sysfs_attr_init(&als_handle->attrs[3].attr);
> +	als_handle->attrs[3].attr.name = "als_backlight_levels";
> +	als_handle->attrs[3].attr.mode = S_IRUGO;
> +	als_handle->attrs[3].show = sony_nc_als_parameters_show;
> +	/* als backlight control */
> +	sysfs_attr_init(&als_handle->attrs[4].attr);
> +	als_handle->attrs[4].attr.name = "als_backlight";
> +	als_handle->attrs[4].attr.mode = S_IRUGO | S_IWUSR;
> +	als_handle->attrs[4].show = sony_nc_als_backlight_show;
> +	als_handle->attrs[4].store = sony_nc_als_backlight_store;
> +
> +	als_handle->attrs_num = 5;
> +	/* end mandatory sys interface */
> +
> +	if (als_handle->ops->get_power || als_handle->ops->set_power) {
> +		int i = als_handle->attrs_num++;
> +
> +		/* als power control */
> +		sysfs_attr_init(&als_handle->attrs[i].attr);
> +		als_handle->attrs[i].attr.name = "als_power";
> +		als_handle->attrs[i].attr.mode = S_IRUGO | S_IWUSR;
> +		als_handle->attrs[i].show = sony_nc_als_power_show;
> +		als_handle->attrs[i].store = sony_nc_als_power_store;
> +	}
> +
> +	if (als_handle->ops->get_kelvin) {
> +		int i = als_handle->attrs_num++;
> +
> +		/* light temperature */
> +		sysfs_attr_init(&als_handle->attrs[i].attr);
> +		als_handle->attrs[i].attr.name = "als_kelvin";
> +		als_handle->attrs[i].attr.mode = S_IRUGO;
> +		als_handle->attrs[i].show = sony_nc_als_kelvin_show;
> +	}
> +
> +	/* everything or nothing, otherwise unable to control the ALS */
> +	for (; i < als_handle->attrs_num; i++) {
> +		if (device_create_file(&pd->dev, &als_handle->attrs[i]))
> +			goto attrserror;
> +	}
> +
> +	return 0;
> +
> +attrserror:
> +	for (; i > 0; i--)
> +		device_remove_file(&pd->dev, &als_handle->attrs[i]);
> +nosensor:
> +	kfree(als_handle);
> +	als_handle = NULL;
> +
> +	return -1;
> +}
> +
> +static void sony_nc_als_resume(void)
> +{
> +	if (als_handle->managed) /* it restores the power state too */
> +		sony_nc_als_managed_set(1);
> +	else if (als_handle->power)
> +		sony_nc_als_power_set(1);
> +}
> +
> +static int sony_nc_als_cleanup(struct platform_device *pd)
> +{
> +	if (als_handle) {
> +		int i;
> +
> +		for (i = 0; i < als_handle->attrs_num; i++)
> +			device_remove_file(&pd->dev, &als_handle->attrs[i]);
> +
> +		/* disable the events notification */
> +		if (als_handle->managed)
> +			if (sony_nc_als_managed_set(0))
> +				pr_info("ALS notifications disable failed\n");
> +
> +		if (als_handle->power)
> +			if (sony_nc_als_power_set(0))
> +				pr_info("ALS power off failed\n");
> +
> +		if (als_handle->ops->exit)
> +			if (als_handle->ops->exit())
> +				pr_info("ALS device cleaning failed\n");
> +
> +		kfree(als_handle);
> +		als_handle = NULL;
> +	}
> +
> +	return 0;
> +}
> +/*	end ALS code	*/
> +
>  /* Keyboard backlight feature */
>  struct kbd_backlight {
>  	unsigned int base;
> @@ -2899,6 +3902,9 @@ static void sony_nc_snc_setup_handles(st
>  		case 0x0143:
>  			sony_kbd_handle = handle;
>  			ret = sony_nc_kbd_backlight_setup(pd);
> +		case 0x012f: /* no keyboard backlight */
> +			sony_als_handle = handle;
> +			ret = sony_nc_als_setup(pd);
>  			break;
>  		case 0x0131:
>  			ret = sony_nc_highspeed_charging_setup(pd);
> @@ -2964,6 +3970,8 @@ static void sony_nc_snc_cleanup_handles(
>  		case 0x0137:
>  		case 0x0143:
>  			sony_nc_kbd_backlight_cleanup(pd);
> +		case 0x012f:
> +			sony_nc_als_cleanup(pd);
>  			break;
>  		case 0x0131:
>  			sony_nc_highspeed_charging_cleanup(pd);
> @@ -3082,6 +4090,8 @@ static int sony_nc_snc_resume(void)
>  		case 0x0137: /* kbd + als */
>  		case 0x0143:
>  			sony_nc_kbd_backlight_resume();
> +		case 0x012f: /* als only */
> +			sony_nc_als_resume();
>  			break;
>  		default:
>  			continue;
> @@ -3146,6 +4156,31 @@ static void sony_nc_notify(struct acpi_d
>  			ev = 1;
>  			break;
> 
> +		case 0x0143:
> +			sony_call_snc_handle(sony_als_handle, 0x2000, &result);
> +			/* event reasons are reverted */

inverted with respect to?

> +			value = (result & 0x03) == 1 ? 2 : 1;
> +			dprintk("sony_nc_notify, ALS event received (reason:"
> +				       " %s change)\n", value == 1 ? "light" :
> +				       "backlight");
> +			/* no further actions needed */
> +
> +			ev = 3;
> +			break;
> +
> +		case 0x012f:
> +		case 0x0137:
> +			sony_call_snc_handle(sony_als_handle, 0x0800, &result);
> +			value = result & 0x03;
> +			dprintk("sony_nc_notify, ALS event received (reason:"
> +					" %s change)\n", value == 1 ? "light" :
> +					"backlight");
> +			if (value == 1) /* lighting change reason */
> +				sony_nc_als_event_handler();
> +
> +			ev = 3;
> +			break;
> +
>  		case 0x0124:
>  		case 0x0135:
>  			sony_call_snc_handle(sony_rfkill_handle, 0x0100,
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
mattia
:wq!
