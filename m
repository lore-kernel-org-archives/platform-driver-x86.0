From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [RESEND RFC PATCH 1/5] platform: x86: add driver for UP Board
 I/O CPLD
Date: Thu, 07 Jul 2016 14:43:36 +0100
Message-ID: <1467899016.17253.135.camel@nexus-software.ie>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
	 <1467648434-29080-1-git-send-email-dan@emutex.com>
	 <1467648434-29080-2-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:36955 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751243AbcGGNnk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jul 2016 09:43:40 -0400
Received: by mail-wm0-f52.google.com with SMTP id a66so32587100wme.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Jul 2016 06:43:39 -0700 (PDT)
In-Reply-To: <1467648434-29080-2-git-send-email-dan@emutex.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan O'Donovan <dan@emutex.com>, platform-driver-x86@vger.kernel.org, dvhart@infradead.org
Cc: lee.jones@linaro.org, andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org

On Mon, 2016-07-04 at 17:07 +0100, Dan O'Donovan wrote:
> +static int cpld_reg_update(struct up_board_cpld *cpld)
> +{
> +	u64 dir_reg_verify =3D 0;
> +	int i;
> +
> +	/* Reset the CPLD internal counters */
> +	gpiod_set_value(cpld->reset_gpio.soc_gpiod, 0);
> +	gpiod_set_value(cpld->reset_gpio.soc_gpiod, 1);
> +
> +	/*
> +	=C2=A0* Update the CPLD dir register
> +	=C2=A0* data_in will be sampled on each rising edge of the strobe
> signal
> +	=C2=A0*/
> +	for (i =3D cpld->dir_reg_size - 1; i >=3D 0; i--) {
> +		gpiod_set_value(cpld->strobe_gpio.soc_gpiod, 0);
> +		gpiod_set_value(cpld->data_in_gpio.soc_gpiod,
> +				(cpld->dir_reg >> i) & 0x1);
> +		gpiod_set_value(cpld->strobe_gpio.soc_gpiod, 1);
> +	}
> +
> +	/*
> +	=C2=A0* Read back and verify the value
> +	=C2=A0* data_out will be set on each rising edge of the strobe
> signal
> +	=C2=A0*/
> +	for (i =3D cpld->dir_reg_size - 1; i >=3D 0; i--) {
> +		int data_out;
> +
> +		gpiod_set_value(cpld->strobe_gpio.soc_gpiod, 0);
> +		gpiod_set_value(cpld->strobe_gpio.soc_gpiod, 1);
> +		data_out =3D gpiod_get_value(cpld-
> >data_out_gpio.soc_gpiod);
> +		dir_reg_verify |=3D (u64)data_out << i;
> +	}
> +
> +	if (dir_reg_verify !=3D cpld->dir_reg) {
> +		pr_err("CPLD verify error (expected: %llX, actual:
> %llX)\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpld->dir_reg, dir_reg_v=
erify);

dev_err();

> +		return -EIO;
> +	}
> +
> +	/* Issue a dummy STB cycle to latch the dir register updates
> */
> +	gpiod_set_value(cpld->strobe_gpio.soc_gpiod, 0);
> +	gpiod_set_value(cpld->strobe_gpio.soc_gpiod, 1);
> +
> +	return 0;
> +}
> +
> +/**
> + * up_board_cpld_reg_set_bit() - update CPLD configuration
> + * @cpld:	CPLD internal context info reference
> + * @offset:	bit offset in CPLD register to set
> + * @value:	boolean value to set in CPLD register bit selected
> by offset
> + *
> + * Return:	Returns 0 if successful, or negative error value
> otherwise
> + */
> +static int up_board_cpld_reg_set_bit(struct up_board_cpld *cpld,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int offset, int value)
> +{
> +	u64 old_regval;
> +	int ret =3D 0;
> +
> +	spin_lock(&cpld->lock);
> +
> +	old_regval =3D cpld->dir_reg;
> +
> +	if (value)
> +		cpld->dir_reg |=3D 1ULL << offset;
> +	else
> +		cpld->dir_reg &=3D ~(1ULL << offset);
> +
> +	/* Only update the CPLD register if it has changed */
> +	if (cpld->dir_reg !=3D old_regval)
> +		ret =3D cpld_reg_update(cpld);
> +
> +	spin_unlock(&cpld->lock);

Seems to me as though cpld_reg_update() could be quite lengthy. Would a
mutex be a better choice here ?


> +static int up_board_cpld_setup(struct up_board_cpld *cpld)
> +{
> +	struct up_board_gpio_info *cpld_gpios[] =3D {
> +		&cpld->strobe_gpio,
> +		&cpld->reset_gpio,
> +		&cpld->data_in_gpio,
> +		&cpld->data_out_gpio,
> +		&cpld->oe_gpio,
> +	};
> +	int i, ret;
> +
> +	spin_lock_init(&cpld->lock);
> +
> +	/* Initialise the CPLD config input GPIOs as outputs,
> initially low */
> +	for (i =3D 0; i < ARRAY_SIZE(cpld_gpios); i++) {
> +		struct up_board_gpio_info *gpio =3D cpld_gpios[i];
> +
> +		ret =3D up_board_soc_gpio_setup(cpld, gpio);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D devm_gpio_request_one(cpld->dev, gpio-
> >soc_gpio,
> +					=C2=A0=C2=A0=C2=A0=C2=A0gpio->soc_gpio_flags,
> +					=C2=A0=C2=A0=C2=A0=C2=A0dev_name(cpld->dev));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Load initial CPLD configuration (all pins set for GPIO
> input) */
> +	ret =3D cpld_reg_update(cpld);
> +	if (ret) {

devm_gpio_free() ?

---
bod
