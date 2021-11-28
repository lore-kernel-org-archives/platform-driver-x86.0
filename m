Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3509C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 28 Nov 2021 21:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhK1VOd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 28 Nov 2021 16:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359029AbhK1VMd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Nov 2021 16:12:33 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A27BC061574
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Nov 2021 13:09:16 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id j18so17394228ljc.12
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Nov 2021 13:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LijzGq9snJZmjCggFbgJcgMRhWBvSnfqO5uGrPRRW+c=;
        b=IKsTYUT+wq9J0mOgzmfkcizeucoBbLT7bNsQK07NaHRBxr5LiR/0GemNPWMurVYov2
         LZYQv1/iZaXTeWncqYBFWG8WOPmrVz/Hp2QaTcgIWia0wupvwdoNaykNuMmEMj9GqVre
         bFriqLbvEYlb69tKMjs7zECK4/rtBlYtkBXtwcnHwvfgM7gxgDR84LJdR7SbYwCLzNhA
         xhSKOdYwo15BCTds1Z0rVlnbZ5wEjHMrKR1E3M3LVp6LbqeE6PHB3y+dmxiiOs8yd3vx
         bb2Eo+88JuL8y+nTaMYpr3lcPZ/r/SGw0i92OIs/Cl45KqGaHDjcFjmJ+HtfvHqgAXTP
         1B6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LijzGq9snJZmjCggFbgJcgMRhWBvSnfqO5uGrPRRW+c=;
        b=Ps72r0Dvc1f80GCpQiYKsVmuQyZRrR9UT6A49PDgIc33d9YR5BnAUKEYc2dizyn6ox
         UH0trSqRL8BatGJok/gW9sw5V+nT3QtC4WkOBMizY4wq+NfCcl+1BylfhMYpHjPlKavm
         Ek6bLUNXLfEV/S/4qohsSWn19lNPzntnwQAOZ+l05qMx//MapAaHeQhdyBOb1D8ET8qJ
         FAGuO18hKK6gURoyzPcl7zZdqEcUC7YdDiipH5nDobDeA5C30KUllWKszydcPW9C4vmX
         /CFygq5m77FYtIvcKTFARJdlOYV4IIZSapAeetIJFsn7ZeutMdJIMdUsxP42VFHHLAPg
         x0XA==
X-Gm-Message-State: AOAM533d/dJjOKobpTzkZNrBtURa+3/D2zGc16QHJI8g9D82HgmuvZ9h
        M5lb9yntwvs5vjonpFDDXes=
X-Google-Smtp-Source: ABdhPJwckH/UaDfS14DUq4Q+dfOdV4925Tz7nyPDz9/FixpFDefWwolKkN0jMVsBuinZ0Gfm8I01vw==
X-Received: by 2002:a2e:2f10:: with SMTP id v16mr45477398ljv.167.1638133754742;
        Sun, 28 Nov 2021 13:09:14 -0800 (PST)
Received: from localhost.localdomain ([37.45.176.136])
        by smtp.gmail.com with ESMTPSA id p22sm1101365lfe.257.2021.11.28.13.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:09:14 -0800 (PST)
Received: from jek by localhost.localdomain with local (Exim 4.95)
        (envelope-from <jekhor@gmail.com>)
        id 1mrRQ9-0001an-0i;
        Mon, 29 Nov 2021 00:09:13 +0300
Date:   Mon, 29 Nov 2021 00:09:13 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 5/5] platform/x86: lenovo-yogabook-wmi: Add support for
 hall sensor on the back
Message-ID: <YaPv+W6MYK30FvPO@jeknote.loshitsa1.net>
References: <20211128190031.405620-1-hdegoede@redhat.com>
 <20211128190031.405620-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211128190031.405620-5-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Nov 28, 2021 at 08:00:31PM +0100, Hans de Goede wrote:
> On the back of the device there is a hall sensor connected to the
> "INT33FF:02" GPIO controller pin 18, which gets triggered when the
> device is fully folded into tablet-mode (when the back of the display
> touched the back of the keyboard).
> 
> Use this to disable both the touch-keyboard and the digitizer when
> the tablet is fully folded into tablet-mode.

Wonderful. I knew that this device would still bring surprises...I
didn't find this sensor in my investigation :)

In your opinion, is it possible to use this sensor to correct of the custom
hinge angle sensor readings from the Intel sensor hub? The hinge angle sensor
uses accelerometers to calculate the angle and cannot reliably
distinquish between 0 and 360 degrees. I used the lid switch status in a my
patch for iio-sensors-proxy but this sensor looks like a yet another candidate.
The lid switch is more generic soultion, of course.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/lenovo-yogabook-wmi.c | 71 +++++++++++++++++++++-
>  1 file changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
> index ecd624d9108f..65dd1ed97762 100644
> --- a/drivers/platform/x86/lenovo-yogabook-wmi.c
> +++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
> @@ -3,6 +3,9 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/devm-helpers.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/leds.h>
>  #include <linux/wmi.h>
> @@ -22,6 +25,7 @@ enum {
>  	YB_KBD_IS_ON,
>  	YB_DIGITIZER_IS_ON,
>  	YB_DIGITIZER_MODE,
> +	YB_TABLET_MODE,
>  	YB_SUSPENDED,
>  };
>  
> @@ -31,6 +35,8 @@ struct yogabook_wmi {
>  	struct acpi_device *dig_adev;
>  	struct device *kbd_dev;
>  	struct device *dig_dev;
> +	struct gpio_desc *backside_hall_gpio;
> +	int backside_hall_irq;
>  	struct work_struct work;
>  	struct led_classdev kbd_bl_led;
>  	unsigned long flags;
> @@ -109,7 +115,10 @@ static void yogabook_wmi_work(struct work_struct *work)
>  	if (test_bit(YB_SUSPENDED, &data->flags))
>  		return;
>  
> -	if (test_bit(YB_DIGITIZER_MODE, &data->flags)) {
> +	if (test_bit(YB_TABLET_MODE, &data->flags)) {
> +		kbd_on = false;
> +		digitizer_on = false;
> +	} else if (test_bit(YB_DIGITIZER_MODE, &data->flags)) {
>  		digitizer_on = true;
>  		kbd_on = false;
>  	} else {
> @@ -171,6 +180,20 @@ static void yogabook_wmi_notify(struct wmi_device *wdev, union acpi_object *dumm
>  	schedule_work(&data->work);
>  }
>  
> +static irqreturn_t yogabook_backside_hall_irq(int irq, void *_data)
> +{
> +	struct yogabook_wmi *data = _data;
> +
> +	if (gpiod_get_value(data->backside_hall_gpio))
> +		set_bit(YB_TABLET_MODE, &data->flags);
> +	else
> +		clear_bit(YB_TABLET_MODE, &data->flags);
> +
> +	schedule_work(&data->work);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static enum led_brightness kbd_brightness_get(struct led_classdev *cdev)
>  {
>  	struct yogabook_wmi *data =
> @@ -197,6 +220,19 @@ static int kbd_brightness_set(struct led_classdev *cdev,
>  	return yogabook_wmi_set_kbd_backlight(wdev, data->brightness);
>  }
>  
> +static struct gpiod_lookup_table yogabook_wmi_gpios = {
> +	.dev_id		= "243FEC1D-1963-41C1-8100-06A9D82A94B4",
> +	.table		= {
> +		GPIO_LOOKUP("INT33FF:02", 18, "backside_hall_sw", GPIO_ACTIVE_LOW),
> +		{}
> +	},
> +};
> +
> +static void yogabook_wmi_rm_gpio_lookup(void *unused)
> +{
> +	gpiod_remove_lookup_table(&yogabook_wmi_gpios);
> +}
> +
>  static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
>  {
>  	struct yogabook_wmi *data;
> @@ -242,6 +278,36 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
>  		goto error_put_devs;
>  	}
>  
> +	gpiod_add_lookup_table(&yogabook_wmi_gpios);
> +
> +	r = devm_add_action_or_reset(&wdev->dev, yogabook_wmi_rm_gpio_lookup, NULL);
> +	if (r)
> +		goto error_put_devs;
> +
> +	data->backside_hall_gpio =
> +		devm_gpiod_get(&wdev->dev, "backside_hall_sw", GPIOD_IN);
> +	if (IS_ERR(data->backside_hall_gpio)) {
> +		r = PTR_ERR(data->backside_hall_gpio);
> +		dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw GPIO\n");
> +		goto error_put_devs;
> +	}
> +
> +	r = gpiod_to_irq(data->backside_hall_gpio);
> +	if (r < 0) {
> +		dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw IRQ\n");
> +		goto error_put_devs;
> +	}
> +	data->backside_hall_irq = r;
> +
> +	r = devm_request_irq(&wdev->dev, data->backside_hall_irq,
> +			     yogabook_backside_hall_irq,
> +			     IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
> +			     "backside_hall_sw", data);
> +	if (r) {
> +		dev_err_probe(&wdev->dev, r, "Requesting backside_hall_sw IRQ\n");
> +		goto error_put_devs;
> +	}
> +
>  	schedule_work(&data->work);
>  
>  	data->kbd_bl_led.name = "ybwmi::kbd_backlight";
> @@ -307,6 +373,9 @@ __maybe_unused int yogabook_wmi_resume(struct device *dev)
>  
>  	clear_bit(YB_SUSPENDED, &data->flags);
>  
> +	/* Check for YB_TABLET_MODE changes made during suspend */
> +	schedule_work(&data->work);
> +
>  	return 0;
>  }
>  
> -- 
> 2.33.1
> 

-- 
Yauhen Kharuzhy
