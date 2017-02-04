From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Sat, 4 Feb 2017 16:58:33 +0200
Message-ID: <CAHp75Vf3_WVGWKo18RikCJMtF9xgYSHem_wK4vTjXQn1WJvJCA@mail.gmail.com>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com> <20170204011439.GD38511@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:32856 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbdBDO6e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2017 09:58:34 -0500
Received: by mail-qk0-f194.google.com with SMTP id 11so2660218qkl.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Feb 2017 06:58:34 -0800 (PST)
In-Reply-To: <20170204011439.GD38511@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, pali@f23x64.localdomain

On Sat, Feb 4, 2017 at 3:14 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Jan 26, 2017 at 03:33:01PM +0800, Alex Hung wrote:
>> New firmwares include a feature called 5 button array that supports
>> super key, volume up/down, rotation lock and power button. Especially,
>> support for this feature is required to fix power button on some recent
>> systems.

>> +static int intel_button_array_input_setup(struct platform_device *device)
>> +{
>> +     struct intel_hid_priv *priv = dev_get_drvdata(&device->dev);
>> +     int ret;
>> +
>> +     /* Setup input device for 5 button array */
>> +     priv->array = input_allocate_device();
>> +     if (!priv->array)
>> +             return -ENOMEM;
>> +
>> +     ret = sparse_keymap_setup(priv->array, intel_array_keymap, NULL);
>> +     if (ret)
>> +             goto err_free_array_device;
>> +
>> +     priv->array->dev.parent = &device->dev;
>> +     priv->array->name = "Intel HID 5 button array";
>> +     priv->array->id.bustype = BUS_HOST;
>> +
>> +     ret = input_register_device(priv->array);
>> +     if (ret)
>> +             goto err_free_array_device;
>> +
>> +     return 0;
>> +
>> +err_free_array_device:
>> +     input_free_device(priv->array);
>> +     return ret;
>
> This return path is more complex than it could be, since you test for ret before
> return anyway:
>
>  out:
>  if (ret)
>          input_free_device(priv->array);
>  return ret;
>
> There is no need for a second return point that I can see. Same for the
> hid_input_setup function. We can remove 8 lines.

Darren, if I didn't miss anything the function is purely used in
->probe() path and thus devm_ version of input_allocate_device() would
make this error path gone.

-- 
With Best Regards,
Andy Shevchenko
