From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [RESEND RFC PATCH 1/5] platform: x86: add driver for UP Board
 I/O CPLD
Date: Fri, 08 Jul 2016 18:05:45 +0100
Message-ID: <1467997545.17253.143.camel@nexus-software.ie>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
	 <1467648434-29080-1-git-send-email-dan@emutex.com>
	 <1467648434-29080-2-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:32986 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755501AbcGHRFs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Jul 2016 13:05:48 -0400
Received: by mail-wm0-f52.google.com with SMTP id r190so7940988wmr.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Jul 2016 10:05:47 -0700 (PDT)
In-Reply-To: <1467648434-29080-2-git-send-email-dan@emutex.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan O'Donovan <dan@emutex.com>, platform-driver-x86@vger.kernel.org, dvhart@infradead.org
Cc: lee.jones@linaro.org, andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org

On Mon, 2016-07-04 at 17:07 +0100, Dan O'Donovan wrote:
> +	cpld->pinctrl_pdev =3D
> +		platform_device_register_data(dev, "up-board-
> pinctrl",
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PLATFORM_DEVID_NONE,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&up_board_pinctrl_pdat
> a,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(up_board_pinctr
> l_pdata));
> +	if (IS_ERR(cpld->pinctrl_pdev)) {
> +		ret =3D PTR_ERR(cpld->pinctrl_pdev);
> +		goto fail_register_pinctrl_pdev;
> +	}
> +
> +	cpld->gpio_pdev =3D
> +		platform_device_register_data(dev, "up-board-gpio",
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PLATFORM_DEVID_NONE,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&up_board_gpio_pdata,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(up_board_gpio_p
> data));
> +	if (IS_ERR(cpld->gpio_pdev)) {
> +		ret =3D PTR_ERR(cpld->gpio_pdev);
> +		goto fail_register_gpio_pdev;
> +	}
> +
> +	cpld->leds_pdev =3D
> +		platform_device_register_data(dev, "up-board-leds",
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PLATFORM_DEVID_NONE,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&up_board_leds_pdata,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(up_board_leds_p
> data));
> +	if (IS_ERR(cpld->leds_pdev)) {
> +		ret =3D PTR_ERR(cpld->leds_pdev);
> +		goto fail_register_leds_pdev;
> +	}
> +
> +	return 0;
> +
> +fail_register_leds_pdev:
> +	platform_device_unregister(cpld->gpio_pdev);
> +fail_register_gpio_pdev:
> +	platform_device_unregister(cpld->pinctrl_pdev);
> +fail_register_pinctrl_pdev:

Because the subordinate drivers don't have remove routines if any of
these error paths are triggered you'll leak resources. Recommend adding
cleanup exit routines to the subordinate drivers which should then be
triggered on the failure jumps here.

---
bod
