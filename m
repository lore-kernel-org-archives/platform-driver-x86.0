Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40B2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Nov 2021 09:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348769AbhK2Jxv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 29 Nov 2021 04:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbhK2Jvt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Nov 2021 04:51:49 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5B2C0613F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2021 01:28:47 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id t5so69217980edd.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2021 01:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LkuhXVB3JoQRNPhzJil32PzvMNtv/8UjPqrO+X0L0D0=;
        b=qMNHp9xsAdWxMoMEfO2RAfcfTuM04UMK0vdraiFYZtyRpgg2RXC3IxkZzr8IusGkBp
         T9hJToy1IzgBBen2pUQVFUy/BmiDSeNYAmwDe0nJztNzuOHmhtp7e3bhBXNwvBGoz9Yh
         hJ7mCgKFAereueWFqdRVcP6Ge/n7/HP690RmA9+sa2UjNXmqRZcpno6HcAhM0UdfEKtY
         zkeZatQlrHLBhMjedlx0WnLyzz4MqsSRz28xpJFGU5Eryzu3dsYNjmTTfS9XUToT/TkD
         k5A0E3XnnehuuVcuOjtyt7LSSvKKcP7wqVIozLhAidy3vkVvaJhK5z/almLL0Lj95ypT
         Ci/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LkuhXVB3JoQRNPhzJil32PzvMNtv/8UjPqrO+X0L0D0=;
        b=H5E+440NT7HVjmG/kOw9XAtl8pcv8WCpxJcBkWj75uzb54wHzAz1ZYYiHf26H2eUya
         Dli5Or7seADdxMTILjfyw/Viu6xo5ePwImyBOy0NSjIh0Imb6PpGiBgkUZ4onY3lOU+E
         6TbqeJZCAIaDnlSejaNsgkj9KiCm+jSyLVk+mvpGv2k5cck3ABQjdDVh/yggMojr4AI9
         sq/3OfR3Sy5xZgZbMDUbR3NwJclLw86ADyh6na3Au8fTaURD8bWR3a8XCgSYF6WETObf
         c+OUAyrmBbzA2+APwojM0rEMoymNl21BGiV/lj+99Jbez9VwUG2EKfCo7cZjYi+wVQGB
         e1eA==
X-Gm-Message-State: AOAM5302POARHEfsGOMty3AwY4MSYEJuwT3Yf4VN2rH6TOFBF5fRjxz1
        vLqzSTCBLwsoLkfwq4AN8OKg+IMsO4a+X95+zme9COBoa0JkLQ==
X-Google-Smtp-Source: ABdhPJweBEzPihSok+oZ6Zz+z0Ow5hoWjHT7jH+0ds4VlX0TueNSaul9qsIkncwFf3EfL224d4Fi68wGRWKX1T/07m8=
X-Received: by 2002:aa7:db8d:: with SMTP id u13mr40471077edt.111.1638178125523;
 Mon, 29 Nov 2021 01:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20211128190031.405620-1-hdegoede@redhat.com> <20211128190031.405620-5-hdegoede@redhat.com>
In-Reply-To: <20211128190031.405620-5-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Nov 2021 11:28:09 +0200
Message-ID: <CAHp75Veuaoq9htGpUPCgFzr1Ysc+6d-Li-OBqiE-ZqUbXzqMrA@mail.gmail.com>
Subject: Re: [PATCH 5/5] platform/x86: lenovo-yogabook-wmi: Add support for
 hall sensor on the back
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Nov 28, 2021 at 9:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> On the back of the device there is a hall sensor connected to the

Hall (it's name)

> "INT33FF:02" GPIO controller pin 18, which gets triggered when the
> device is fully folded into tablet-mode (when the back of the display
> touched the back of the keyboard).

touches?

> Use this to disable both the touch-keyboard and the digitizer when
> the tablet is fully folded into tablet-mode.

...

> +static irqreturn_t yogabook_backside_hall_irq(int irq, void *_data)
> +{
> +       struct yogabook_wmi *data = _data;

> +       if (gpiod_get_value(data->backside_hall_gpio))
> +               set_bit(YB_TABLET_MODE, &data->flags);
> +       else
> +               clear_bit(YB_TABLET_MODE, &data->flags);

assign_bit()?

> +       schedule_work(&data->work);
> +
> +       return IRQ_HANDLED;
> +}

...

> +       data->backside_hall_gpio =
> +               devm_gpiod_get(&wdev->dev, "backside_hall_sw", GPIOD_IN);
> +       if (IS_ERR(data->backside_hall_gpio)) {

> +               r = PTR_ERR(data->backside_hall_gpio);
> +               dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw GPIO\n");

Can be

  r = dev_err_probe(...);

but I think you did that on purpose to make lines shorter.

> +               goto error_put_devs;
> +       }

-- 
With Best Regards,
Andy Shevchenko
