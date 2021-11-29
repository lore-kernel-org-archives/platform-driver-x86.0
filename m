Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AF4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Nov 2021 08:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243054AbhK2IeL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 29 Nov 2021 03:34:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36810 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243539AbhK2IcL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Nov 2021 03:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638174534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RlHJUDenrm7LCa/Ne9s+6jjY741plf5HA4nRNl5SfzA=;
        b=P0DZISbMR1OS6WQEMSAr0rcrhqOvTrmc8fMf5GEFc9UbvfFkEtce9nyEcR1cXrPqcyfqiy
        IzgMsBk/0NqudN/1l9X/rkdJ/08O/30UBjVM4u/QOgVrXuDJjfEURk/RHnHn/zYXkBgq7e
        U/OYtO0bqL+rZmZIhtv7zPztUQrGrk0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-wu3j8tgSNmmsJqx-fDgghg-1; Mon, 29 Nov 2021 03:28:52 -0500
X-MC-Unique: wu3j8tgSNmmsJqx-fDgghg-1
Received: by mail-ed1-f70.google.com with SMTP id q17-20020aa7da91000000b003e7c0641b9cso13024480eds.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2021 00:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RlHJUDenrm7LCa/Ne9s+6jjY741plf5HA4nRNl5SfzA=;
        b=wQw6sLaqgyoBfSFoxTjs+KM3qlfsU1/I/c8mFkWuBkl50d0leD8GDaxXw8DGNC+Fvj
         z9cKd/3AiciFvmrN3s33yhZlRFznDpan10FIffHjfRFntvVbOVTIDmIQtgCyBQWXrcRu
         HercfmGK+udUz1zx0T/7wnsb7f7ST2hOzYNQy9VteJzmQdFKkrLKL9qQk6FgAdIp/ln7
         oFURPkLHkXGsPA3SAKSCzh0BmGs7x9wKjmm14+wfib4RuxymRqmTIO4Wj3/Zm2YjyZwC
         0jv/A1MXMPBPMoAT/lNOQDStoHHgEnosuku9ZmW2+jeLaSvP6YM7+5IJbkdsF9bnoxKu
         q+iQ==
X-Gm-Message-State: AOAM531bGDBuWnJ9dshXcho6+1kedcX6sk98rje1RaLv9JlxX7WFONLB
        MoRtROd1VSv4a7G7Tw0qgUfpEu7jHIY/4wVcfDynPjtZlj3VzV+Cli2ummE9JpT2qusf1S7oluI
        +mZRRcpiq3EcV7+5DgrtT63nUdY8kSGUNAw==
X-Received: by 2002:a17:906:4fc5:: with SMTP id i5mr59720266ejw.475.1638174531072;
        Mon, 29 Nov 2021 00:28:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIExqNtkj6HSdBr9uDd4CrCr7ujI8AwaNBWu8Lg2LalGOUoD6zk9R2h71eZcqiuwzlBOM6wQ==
X-Received: by 2002:a17:906:4fc5:: with SMTP id i5mr59720242ejw.475.1638174530789;
        Mon, 29 Nov 2021 00:28:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e8sm6791202edz.73.2021.11.29.00.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 00:28:50 -0800 (PST)
Message-ID: <dca6d82c-d843-6f96-d96c-54aebeb83684@redhat.com>
Date:   Mon, 29 Nov 2021 09:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] platform/x86: lenovo-yogabook-wmi: Add support for
 hall sensor on the back
Content-Language: en-US
To:     Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20211128190031.405620-1-hdegoede@redhat.com>
 <20211128190031.405620-5-hdegoede@redhat.com>
 <YaPv+W6MYK30FvPO@jeknote.loshitsa1.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YaPv+W6MYK30FvPO@jeknote.loshitsa1.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/28/21 22:09, Yauhen Kharuzhy wrote:
> On Sun, Nov 28, 2021 at 08:00:31PM +0100, Hans de Goede wrote:
>> On the back of the device there is a hall sensor connected to the
>> "INT33FF:02" GPIO controller pin 18, which gets triggered when the
>> device is fully folded into tablet-mode (when the back of the display
>> touched the back of the keyboard).
>>
>> Use this to disable both the touch-keyboard and the digitizer when
>> the tablet is fully folded into tablet-mode.
> 
> Wonderful. I knew that this device would still bring surprises...I
> didn't find this sensor in my investigation :)
> 
> In your opinion, is it possible to use this sensor to correct of the custom
> hinge angle sensor readings from the Intel sensor hub? The hinge angle sensor
> uses accelerometers to calculate the angle and cannot reliably
> distinquish between 0 and 360 degrees. I used the lid switch status in a my
> patch for iio-sensors-proxy but this sensor looks like a yet another candidate.
> The lid switch is more generic soultion, of course.

Right, there are quite a few yoga / 360° hinges devices which have 2
accelerometers, one in each half. So any solutions in iio-sensors-proxy
really should be generic.

I did think about this before, because I'm interested in the iio-sensor-proxy
solution for this in general and my thoughts on this are that it is fine to make
iio-sensor-proxy send SW_TABLET_MODE=1 for any angle below 5° (and above 185°).

The idea being that if the lid is almost closed in laptop mode then the device is
not being interacted with anyways and then SW_TABLET_MODE=1 does not matter.
In practice what SW_TABLET_MODE=1 does is:

1. Enable auto-rotation of the display, does not matter if the display is almost
fully closed, since clearly the user is not looking at it.

2. Enable automatic pop-up of on-screen-keyboard when selecting text input-fields,
again this does not matter since with the lid almost closed the user is not likely
to select any text-input fields.

3. Suppress *built-in* keyboard and touchpad events to avoid accidental pressed
on the keyboard / touchpad to register, and again with the lid almost fully closed
the user is unlikely to actually want to use the touchpad/keyboard so the false-positive
SW_TABLET_MODE=1 reporting for angles below 5° should not be an issue.

Using the lid switch is an interesting idea. But I believe that the angle accuracy
won't be all that great, so we would need to check the lid-switch for any angle below
say 5° then and in many cases the lid-switch will not report 1 until the lid is
very close to being fully closed, so then their will still be a window where we
do a false-positive reporting of SW_TABLET_MODE=1 . At which point we might just
as well live with the false-positive reporting of SW_TABLET_MODE=1 and not bother
with the lid-switch. At least that is my 2 cents.

Feel free to copy and paste parts of this email to a big comment in the code
explaining why angles below 5° report SW_TABLET_MODE=1, assuming you implement
that idea.

Regards,

Hans




> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/lenovo-yogabook-wmi.c | 71 +++++++++++++++++++++-
>>  1 file changed, 70 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
>> index ecd624d9108f..65dd1ed97762 100644
>> --- a/drivers/platform/x86/lenovo-yogabook-wmi.c
>> +++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
>> @@ -3,6 +3,9 @@
>>  
>>  #include <linux/acpi.h>
>>  #include <linux/devm-helpers.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/machine.h>
>> +#include <linux/interrupt.h>
>>  #include <linux/module.h>
>>  #include <linux/leds.h>
>>  #include <linux/wmi.h>
>> @@ -22,6 +25,7 @@ enum {
>>  	YB_KBD_IS_ON,
>>  	YB_DIGITIZER_IS_ON,
>>  	YB_DIGITIZER_MODE,
>> +	YB_TABLET_MODE,
>>  	YB_SUSPENDED,
>>  };
>>  
>> @@ -31,6 +35,8 @@ struct yogabook_wmi {
>>  	struct acpi_device *dig_adev;
>>  	struct device *kbd_dev;
>>  	struct device *dig_dev;
>> +	struct gpio_desc *backside_hall_gpio;
>> +	int backside_hall_irq;
>>  	struct work_struct work;
>>  	struct led_classdev kbd_bl_led;
>>  	unsigned long flags;
>> @@ -109,7 +115,10 @@ static void yogabook_wmi_work(struct work_struct *work)
>>  	if (test_bit(YB_SUSPENDED, &data->flags))
>>  		return;
>>  
>> -	if (test_bit(YB_DIGITIZER_MODE, &data->flags)) {
>> +	if (test_bit(YB_TABLET_MODE, &data->flags)) {
>> +		kbd_on = false;
>> +		digitizer_on = false;
>> +	} else if (test_bit(YB_DIGITIZER_MODE, &data->flags)) {
>>  		digitizer_on = true;
>>  		kbd_on = false;
>>  	} else {
>> @@ -171,6 +180,20 @@ static void yogabook_wmi_notify(struct wmi_device *wdev, union acpi_object *dumm
>>  	schedule_work(&data->work);
>>  }
>>  
>> +static irqreturn_t yogabook_backside_hall_irq(int irq, void *_data)
>> +{
>> +	struct yogabook_wmi *data = _data;
>> +
>> +	if (gpiod_get_value(data->backside_hall_gpio))
>> +		set_bit(YB_TABLET_MODE, &data->flags);
>> +	else
>> +		clear_bit(YB_TABLET_MODE, &data->flags);
>> +
>> +	schedule_work(&data->work);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>  static enum led_brightness kbd_brightness_get(struct led_classdev *cdev)
>>  {
>>  	struct yogabook_wmi *data =
>> @@ -197,6 +220,19 @@ static int kbd_brightness_set(struct led_classdev *cdev,
>>  	return yogabook_wmi_set_kbd_backlight(wdev, data->brightness);
>>  }
>>  
>> +static struct gpiod_lookup_table yogabook_wmi_gpios = {
>> +	.dev_id		= "243FEC1D-1963-41C1-8100-06A9D82A94B4",
>> +	.table		= {
>> +		GPIO_LOOKUP("INT33FF:02", 18, "backside_hall_sw", GPIO_ACTIVE_LOW),
>> +		{}
>> +	},
>> +};
>> +
>> +static void yogabook_wmi_rm_gpio_lookup(void *unused)
>> +{
>> +	gpiod_remove_lookup_table(&yogabook_wmi_gpios);
>> +}
>> +
>>  static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
>>  {
>>  	struct yogabook_wmi *data;
>> @@ -242,6 +278,36 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
>>  		goto error_put_devs;
>>  	}
>>  
>> +	gpiod_add_lookup_table(&yogabook_wmi_gpios);
>> +
>> +	r = devm_add_action_or_reset(&wdev->dev, yogabook_wmi_rm_gpio_lookup, NULL);
>> +	if (r)
>> +		goto error_put_devs;
>> +
>> +	data->backside_hall_gpio =
>> +		devm_gpiod_get(&wdev->dev, "backside_hall_sw", GPIOD_IN);
>> +	if (IS_ERR(data->backside_hall_gpio)) {
>> +		r = PTR_ERR(data->backside_hall_gpio);
>> +		dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw GPIO\n");
>> +		goto error_put_devs;
>> +	}
>> +
>> +	r = gpiod_to_irq(data->backside_hall_gpio);
>> +	if (r < 0) {
>> +		dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw IRQ\n");
>> +		goto error_put_devs;
>> +	}
>> +	data->backside_hall_irq = r;
>> +
>> +	r = devm_request_irq(&wdev->dev, data->backside_hall_irq,
>> +			     yogabook_backside_hall_irq,
>> +			     IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
>> +			     "backside_hall_sw", data);
>> +	if (r) {
>> +		dev_err_probe(&wdev->dev, r, "Requesting backside_hall_sw IRQ\n");
>> +		goto error_put_devs;
>> +	}
>> +
>>  	schedule_work(&data->work);
>>  
>>  	data->kbd_bl_led.name = "ybwmi::kbd_backlight";
>> @@ -307,6 +373,9 @@ __maybe_unused int yogabook_wmi_resume(struct device *dev)
>>  
>>  	clear_bit(YB_SUSPENDED, &data->flags);
>>  
>> +	/* Check for YB_TABLET_MODE changes made during suspend */
>> +	schedule_work(&data->work);
>> +
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.33.1
>>
> 

