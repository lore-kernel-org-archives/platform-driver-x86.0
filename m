From: Javier Achirica <jachirica@gmail.com>
Subject: Re: [PATCH 10/11] sony-laptop: als support
Date: Tue, 25 Mar 2014 12:57:59 +0100
Message-ID: <CACixm22UHoMDzv8r+C2r-8RoVXnpqkaefT9ucLRJSyvx9g517A@mail.gmail.com>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
	<1395356482-7446-11-git-send-email-malattia@linux.it>
	<532F36D2.4020701@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:63769 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751293AbaCYL6A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Mar 2014 07:58:00 -0400
In-Reply-To: <532F36D2.4020701@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-iio@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Marco Chiappero <marco@absence.it>

Hello,

Jumping in the skipped part...

On Sun, Mar 23, 2014 at 8:32 PM, Jonathan Cameron <jic23@kernel.org> wrote:
>> +Ambient Light Sensor:
>> +---------------------
>> +On models equipped with ALS, sony-laptop will create an IIO device
>> available
>> +under:
>> +       /sys/bus/iio/devices/
>> +In addition to the sensor's readings, a number of other attributes are
>> exposed
>> +for userspace to consume:
>> +       typical_illuminance     Typical illuminance level for brightness
>> +                               control in lux.
>
> Is this a target value?  Need a better description for this as it's not
> immediately
> obvious what it is.

All these names come from the names that Sony used in Windows, but in
some cases we don't really fully understand its meaning. I
reverse-engineered Windows control module, and Sony uses these values
in quite sophisticated algorithms to calculate brightness, which I've
been able to partially replicate, but I'm not covering all cases.

In this specific case, this is the illuminance value used as a "middle
point" from where all brightness variations are calculated.

>> +       backlight_illuminance   Threshold in lux for keyboard backlight.
>> +       lux_correction_percent  Correction factor to apply to brightness
>> in
>> +                               percentage.
>
> If applied to the measurement before exposed to userspace then it should
> be handled using the iio info_mask element calibscale. If it's a value that
> should be applied in userspace then the scale infomask element.

It should be applied in userspace.

>> +       low_threshold_percent   Percentage from current lux level to
>> trigger
>> +                               event (low).
>
> Interesting.  These are a new one :)
> Anyhow the should be handled through additions to iio's iio_event_info
> enum and all the stuff that goes with that.
> Perhaps
> IIO_EV_INFO_PERCENT, with sysfs attributes
> events/in_illuminance_thresh_rising_percent
> events/in_illuminance_thresh_falling_percent
>
> Actually you don't seem to have any IIO_EV_INFO stuff in here yet you
> are still pushing out events via IIO. Interesting...

In fact, I implemented it, but only for the older Vaios (the
TAOS-based ones), but we couldn't figure out how to get this
information in the newer ones, as everything is hidden, so we ended up
removing it. Of course we could add it back, but what should we do
with the hidden ones?

>> +       high_threshold_percent  Percentage from current lux level to
>> trigger
>> +                               event (high).
>> +       als_event_rate          Time in milliseconds between brightness
>> changes
>> +                               when triggered by light change.
>
> The naming is not nearly descriptive enough as I'd read that as being how
> often an event (e.g. it going dark) is checked from the als.

As I said above, we took Sony names. Of course we can change them to anything.

>> +       als_event_delay         Percentage of brightness changes when
>> triggered
>> +                               by light change.
>> +       key_event_rate          Time in milliseconds between brightness
>> changes
>> +                               when triggered by keypress.
>> +       key_event_delay         Percentage of brightness changes when
>> triggered
>> +                               by keypress.
>
> These are so device dependent we'll probably just let them go.  Might be
> something that's worth checking with the input guys to discover if they
> have an interface already defined for this sort of thing.
>
>> +       interrupt_rate          Light sensor interrupt rate in
>> milliseconds.
>> +       light_compensation_x10  Light compensation needed due to sensor
>> cover.
>
> Offset, or a scale factor?  Either way there are well defined abi elements
> for
> this already.

Scale factor.

>> +       minimum_illuminance     Minimum expected illuminance level in lux.
>
> Expected in what sense?

Once again, is something that it's used in Sony code. This range is
the illuminance range where the backlight change is meaningful
(outside of it, backlight change is almost unnoticeable).

>> +       maximum_illuminance     Maximum expected illuminance level in lux.
>> +       algorithm               Brightness calculation algorithm to be
>> used.
>
> That's a lot of new abi as far as IIO is concerned.  It will all need
> documenting in
> Documentation/ABI/testing/sysfs-bus-iio-sony-laptop or the generic files if
> appropriate.
> Also, no units for some of the above.

I think we documented units every we know about them, but surely we'll recheck.

>> +static ssize_t sony_nc_als_kelvin_show(struct device *dev,
>> +               struct device_attribute *attr, char *buffer);
>
> Are we talking actual temperature or colour temperature here?
> Either way, I missed the documentation...

Colour temperature.

>> +static struct attribute *ngals_attributes[] = {
>> +       &als_attr_backlight_sensibility_table.attr,
>> +       &als_attr_minimum_illuminance.attr,
>> +       &als_attr_maximum_illuminance.attr,
>> +       &als_attr_als_event_rate.attr,
>> +       &als_attr_als_event_delay.attr,
>> +       &als_attr_key_event_rate.attr,
>> +       &als_attr_key_event_delay.attr,
>> +       &als_attr_algorithm.attr,
>
> So is algorithm going to give me a magic number?  Please convert this
> to something human readable if so.

Yes. From the code looks like right now the magic number can go from 0
to 3, but we don't really know how to name them (apart from
"first_algorithm", "new_algorithm", "nice_algorithm" or something
similar). Any suggestion?

>> +static const struct tsl256x_coeff tsl256x_coeff_fn[] = {
>> +       {
>> +               .ratio  = SCALE(12500), /* 0.125 * 2^LUX_SHIFT_BITS  */
>> +               .ch0    = SCALE(3040),  /* 0.0304 * 2^LUX_SHIFT_BITS */
>> +               .ch1    = SCALE(2720),  /* 0.0272 * 2^LUX_SHIFT_BITS */
>> +               .ka     = SCALE(313550000),
>> +               .kb     = -10651,
>> +       }, {
>> +               .ratio  = SCALE(25000), /* 0.250 * 2^LUX_SHIFT_BITS  */
>> +               .ch0    = SCALE(3250),  /* 0.0325 * 2^LUX_SHIFT_BITS */
>> +               .ch1    = SCALE(4400),  /* 0.0440 * 2^LUX_SHIFT_BITS */
>> +               .ka     = SCALE(203390000),
>> +               .kb     = -2341,
>> +       }, {
>> +               .ratio  = SCALE(37500), /* 0.375 * 2^LUX_SHIFT_BITS  */
>> +               .ch0    = SCALE(3510),  /* 0.0351 * 2^LUX_SHIFT_BITS */
>> +               .ch1    = SCALE(5440),  /* 0.0544 * 2^LUX_SHIFT_BITS */
>> +               .ka     = SCALE(152180000),
>> +               .kb     = 157,
>> +       }, {
>> +               .ratio  = SCALE(50000), /* 0.50 * 2^LUX_SHIFT_BITS   */
>> +               .ch0    = SCALE(3810),  /* 0.0381 * 2^LUX_SHIFT_BITS */
>> +               .ch1    = SCALE(6240),  /* 0.0624 * 2^LUX_SHIFT_BITS */
>> +               .ka     = SCALE(163580000),
>> +               .kb     = -145,
>> +       }, {
>> +               .ratio  = SCALE(61000), /* 0.61 * 2^LUX_SHIFT_BITS   */
>> +               .ch0    = SCALE(2240),  /* 0.0224 * 2^LUX_SHIFT_BITS */
>> +               .ch1    = SCALE(3100),  /* 0.0310 * 2^LUX_SHIFT_BITS */
>> +               .ka     = SCALE(180800000),
>> +               .kb     = -495,
>> +       }, {
>> +               .ratio  = SCALE(80000), /* 0.80 * 2^LUX_SHIFT_BITS   */
>> +               .ch0    = SCALE(1280),  /* 0.0128 * 2^LUX_SHIFT_BITS */
>> +               .ch1    = SCALE(1530),  /* 0.0153 * 2^LUX_SHIFT_BITS */
>> +               .ka     = SCALE(197340000),
>> +               .kb     = -765
>> +       }, {
>> +               .ratio  = SCALE(130000),/* 1.3 * 2^LUX_SHIFT_BITS     */
>> +               .ch0    = SCALE(146),   /* 0.00146 * 2^LUX_SHIFT_BITS */
>> +               .ch1    = SCALE(112),   /* 0.00112 * 2^LUX_SHIFT_BITS */
>> +               .ka     = SCALE(182900000),
>> +               .kb     = -608,
>> +       }, {
>> +               .ratio  = UINT_MAX,     /* for higher ratios */
>> +               .ch0    = 0,
>> +               .ch1    = 0,
>> +               .ka     = 0,
>> +               .kb     = 830,
>> +       }
>> +};
>>
> So what are _fn and _cs?

Different chips with different tables. Chip model names end in FN and CS.

[Lots of nice code cleaning suggestions removed...]

> Prefix this appropriately. SONY_LAPTOP_TSL256X_MAX_LUX or similar.
>>
>> +#define MAX_LUX 700000
>
> I'd like to know how this differs form the function in tsl2563.c...
>
> This takes a few more things into account perhaps, but they are
> fundamentally
> the same and we should only have one...

It uses multiple ranges available in the chip, it surely can be merged
in the tsl2563.c code.

>> +static unsigned int tsl256x_calculate_lux(const u32 ch0, const u32 ch1)
>> +{
>> +       /* the raw output from the sensor is just a "count" value, as it
>> is the
>> +        * result of the integration of the analog sensor signal, the
>> +        * counts-to-lux curve (and its approximation can be found on the
>> +        * datasheet).
>> +        */
>> +       const struct tsl256x_coeff *coeff = tsl256x_handle->coeff_table;
>> +       u32 ratio, temp, integer;
>> +
>> +       if (ch0 >= 65535 || ch1 >= 65535)
>> +               return MAX_LUX;
>> +
>> +       /* STEP 1: ratio calculation, for ch0 & ch1 coeff selection */
>> +
>> +       /* protect against division by 0 */
>> +       ratio = ch0 ? ((ch1 << (LUX_SHIFT_BITS + 1)) / ch0) : UINT_MAX -
>> 1;
>> +       /* round the ratio value */
>> +       ratio = (ratio + 1) >> 1;
>> +
>> +       /* coeff selection rule */
>> +       while (coeff->ratio < ratio)
>> +               coeff++;
>> +
>> +       /* STEP 2: lux calculation formula using the right coeffcients */
>> +       temp = (ch0 * coeff->ch0) - (ch1 * coeff->ch1);
>> +       temp *= tsl256x_handle->gain->scale;
>> +       /* the sensor is placed under a plastic or glass cover which
>> filters
>> +        * a certain ammount of light (depending on that particular
>> material).
>> +        * To have an accurate reading, we need to compensate for this
>> loss,
>> +        * multiplying for compensation parameter, taken from the DSDT.
>> +        */
>> +       temp *= tsl256x_handle->defaults[3] / 10;
>> +
>> +       /* round fractional portion to obtain the integer part */
>> +       integer = (temp + (1 << (LUX_SHIFT_BITS - 1))) >> LUX_SHIFT_BITS;
>> +
>> +       if (integer > MAX_LUX)
>> +               return MAX_LUX;
>> +
>> +       return integer;
>> +}
>> +
>
> This is new for a tsl256x chip..  Hmm. approximate temperature form the
> infrared channel?  How accurate is it? (just currious as I wouldn't have
> through these were really suitable for use as thermopiles)

It's reasonable accurate while using black-body light sources
(incandescent, halogen, sunlight), not so good with sodium, mercury,
fluorescent or LEDs.

The temperature is obtained comparing the relative level of visible
and infrared channels. In fact this is a correction that has to be
than to determine the visible illuminance level, so I just mapped it
to temperature in kelvins.

> integ?  Why that variable name?
>
>> +static int tsl256x_get_lux(unsigned int *integ)
>> +{
>> +       int ret = 0;
>> +       unsigned int ch0, ch1;
>> +
>> +       if (!integ)
>> +               return -1;
>> +
>> +       ret = tsl256x_get_raw_data(&ch0, &ch1);
>> +       if (!ret)

Used to be integer and fractional part, but as the fractional part
wasn't available in the newer versions, we just removed it.

> I'd argue this is just a temperature reading and hence should be done
> via a temperature channel. Irritatingly they are in celcius, but
> the conversion is at least nice and easy ;)
>
>> +static ssize_t sony_nc_als_kelvin_show(struct device *dev,
>> +               struct device_attribute *attr, char *buffer)
>> +{
>> +       ssize_t count = 0;
>> +       unsigned int kelvin = 0;
>> +
>> +       if (als_handle->ops->get_kelvin)
>> +               als_handle->ops->get_kelvin(&kelvin);
>> +
>> +       count = snprintf(buffer, PAGE_SIZE, "%d\n", kelvin);
>> +
>> +       return count;
>> +}

In kelvin, not exactly celsius. That's what happens when you're
european and have a physics background :-)

Anyway, thank you very much for all the work you've put into reviewing
all this code and all useful comments.

Javier
