Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF1426E71B
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761260016; cv=none; b=scRwxmuUoUcdHmuIsNCSst55SqGTPFEniDts/ZsdC7KDLRLQ66q/TrgfYfGNQ1OSAgTk87802DEKiVv3qU3pKxd2ksdrHaeZaAb9cX9LVNiEnNqUSkc5lbA/t1lGm1ghkxKk+5F45EWEDOe7ONWFjEFZlG28fXX/DMCUVKwS7Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761260016; c=relaxed/simple;
	bh=wp0Qp3uPaMoX0jA6DpU13Ox/9HuvNei+eCmrBiVz7/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KK5i5FqlQI+bWvsHXqkItTiVd/cZiFBqXsjRj2SeSRUnsbij2azGlYs4LaVCcLq5bCTiJVKeWV1pXXsTN5TfsRvM3+UlrUGGQVIjRREK8MyF8+ZTQViC5pe/XI21gvnhAsuM76EgL1r5/HwUEiAXx00hX6gbAKYs2vHbHTZsgpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl0P3UBP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl0P3UBP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4711810948aso10544265e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 15:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761260012; x=1761864812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9XWWQ/zB2k8rSoSKBXeLswAT4u6X6JqIy6JUmHLGkY=;
        b=dl0P3UBPItPJzsW0y2CzJP3GqmA2BrGZz+HYaw0WEj5ejBQtEsGp5OFAvwt1IRwhO1
         +QzAb1YpvY3rRSwjS78pScq279zbfLe9mxnVeVJzvCdHYgzcUgezF+nc+iQ30UGgQST8
         lGkoyQ+XBI/TMhIW9ITDCONNHv5jhaaWGs4eJlu8lvLK55XH+UzO3BgmBZB1JoQGC0L2
         nN7r9NdjRjhZjwd3td/agdbPJGHuvhwgsl2ixum92UM2Wn7WtARWiCoIgZv21Xn2jlVj
         HGjWFHhfpUkZsBBVhEeZ285ZiyDKDuZAotIziTd1Ww6WRuJYg0A1ihedj4lnMw0VeeMb
         He5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761260012; x=1761864812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9XWWQ/zB2k8rSoSKBXeLswAT4u6X6JqIy6JUmHLGkY=;
        b=sdbyRSjll2gO/HW/UzR0PKA4PD/ms3js5s7d+KijlgobA0VDoN7+I3WEkgHETaZsyU
         DNnXEE5SNK2+NgawTXk90bkkI8ZEHDkjTIQxYopnvluneEUcGrtfOGAUrqC6mEnm3zyW
         nci/Ez8pbLg+41o8s1GhOpXf3F7Iy4SdvlWKN1fNNAu0qMMEe5WQkHfybZvg+1GYnVA0
         mGJHIfYgWGBlGwJlgWhi5GxidFU3y2l7ihHckOPcR1UcINnV3MetPxb+yhYqndeOV/rd
         zMNGcd0Wu/9xA4a9g0w3LhF1QH5ecyarkNzB7Ipkx+yT+s00ku4+zUhKbydx06NW74e9
         Pcnw==
X-Gm-Message-State: AOJu0Yx1U2YCHt1EiZUhxQ+FxG3r6cluXeHFMsWreV3j1rOQ8XfLFp/c
	hi9GYuszaq/Lx6U4fJT8EdYGoYJAT7tLhhn/Vy9L6cdWxFu0ojYwJBNp
X-Gm-Gg: ASbGncugKO96/kFFY+tLAGplkGVLFd0+HereD0XB4HuT1F1QAsDlQlSgqX/b1hzKdkV
	c+ltVOxLa/LUvUG+Q8QZ0qoJgNyijOqtU1KpXv/njmc+c5k5oaZRR8xMnsbn1RkO9E2lAuJDWhi
	ad0IojZ56QwkN6AhW6CwKpFvpoQyotGk/Lcw8o20lZioVqzsifavImcQ5nj8MqqaVaU3UQtnBm/
	snHSUCYqsUbyTRha982cDCJ5udubWo5g0+GxgSMJMcj9DMdrGPkVFClsuUYlzS5sUnB0dju0SJ7
	Hhxz49VksiE/1T2rbs+90LdBw7PDvnGN1aA6DuWykdn2vsqQuaIv3kSaDJbV8vSLlFHMwGdA/gU
	GydM1PATNPoys8VjPRbmN48gPNNX89jhIBlImuKdQmaA7ZjEHMao05r2ZhK3WMnaOgGybTYHoir
	0I6l2U5nea93U=
X-Google-Smtp-Source: AGHT+IH4OBhgW4sCyAhMwGOnKHeNR0V09d/a8qkchAKk44irEOwnukh9k00Hfb/iKGiF5yI370r2cw==
X-Received: by 2002:a05:600c:8b8c:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-471178a4af1mr159390945e9.13.1761260011829;
        Thu, 23 Oct 2025 15:53:31 -0700 (PDT)
Received: from [192.168.1.121] ([151.61.20.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae9f571sm60537695e9.7.2025.10.23.15.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 15:53:31 -0700 (PDT)
Message-ID: <b91de7c7-74b8-4cf5-82a4-f3d4eaf418d4@gmail.com>
Date: Fri, 24 Oct 2025 00:53:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] HID: asus: simplify RGB init sequence
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251018101759.4089-1-lkml@antheas.dev>
 <20251018101759.4089-2-lkml@antheas.dev>
 <e6328da3-8099-4540-9cb0-4fc28b359ee7@gmail.com>
 <CAGwozwG+gf09PQf9o9YkKFYVgVn-1w5CDVrpOe4uFavVYCNijQ@mail.gmail.com>
 <3947f772-691b-46a2-af68-15825e7f4939@gmail.com>
 <CAGwozwFbQWyuQB6EwLMLon5muff2WudR+oVL62DqP_MXGW+p-Q@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwFbQWyuQB6EwLMLon5muff2WudR+oVL62DqP_MXGW+p-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/23/25 23:30, Antheas Kapenekakis wrote:
> On Thu, 23 Oct 2025 at 22:05, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 10/23/25 20:06, Antheas Kapenekakis wrote:
>>> On Thu, 23 Oct 2025 at 19:38, Denis Benato <benato.denis96@gmail.com> wrote:
>>>> On 10/18/25 12:17, Antheas Kapenekakis wrote:
>>>>> Currently, RGB initialization forks depending on whether a device is
>>>>> NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
>>>>> endpoints, and non-NKEY devices with 0x5a and then a
>>>>> backlight check, which is omitted for NKEY devices.
>>>>>
>>>>> Remove the fork, using a common initialization sequence for both,
>>>>> where they are both only initialized with 0x5a, then checked for
>>>>> backlight support. This patch should not affect existing functionality.
>>>>>
>>>>> 0x5d and 0x5e endpoint initializations are performed by Windows
>>>>> userspace programs associated with different usages that reside under
>>>>> the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
>>>>> controls RGB and 0x5e by an animation program for certain Asus laptops.
>>>>> Neither is used currently in the driver.
>>>> What benefits do we get from removing the unused initialization?
>>>>
>>>> If this has never caused any troubles I don't see the reason for removing
>>>> them. Moreover the lighting protocol is known and I might as well add
>>>> support for it in the near future,
>>> I already have a patch that adds RGB and delay inits that endpoint. It
>>> got removed to make this easier to merge. See [1].
>>>
>>> [1] https://lore.kernel.org/lkml/20250324210151.6042-10-lkml@antheas.dev/
>> I have to main concerns about this:
>>
>> 1. taking away initialization commands in one patchset to make it
>> easier to merge another unrelated patch doesn't seem the right thing
>> to do if the other patch it's not in the same series.
>>
>> I can see [1] has been removed from the set for a later moment in time,
>> it's fine if it needs more work, just send something that function in the
>> same way and do not remove initialization commands when unnecessary,
>> especially since there will be for sure future development.
> The initialization was removed as part of general cleanup. Not to make
> it easier to merge the RGB patch. In addition, the RGB patch only runs
> the init in a lazy fashion, so if nobody uses the RGB sysfs the init
> does not run and the behavior is the same.
There are a few problems here:
1. sope creep: either do a cleanup or solve bugs. The fact that your flow z13
doesn't load hid-asus correctly has nothing to do with the initialization of anime.
The fact that hid-asus is driving leds instead of asus-wmi has nothing to do with
anime matrix initialization either.
2. not sending the initialization can get hardware misbehave because it
is left in an uninitialized state.
3. there are absolutely zero reasons to do that. There are even less reasons
as to do it as part of this patchset.

>> 2. Your patchset resolves around keyboard backlight control and how
>> the keyboard device is exposed to userspace: it's fine but I do not see
>> the point in removing initialization commands that has nothing to do
>> with the issue we are trying to solve here.
>>
>> Please leave 0x5E and 0x5D initialization commands where they are now.
> I mean the second part of the patchset does that. The first part is a
> cleanup. What would be the reason for keeping 0x5E and 0x5D? They are
> only used when initializing those endpoints to write further commands
> to them and for identification. The current driver does not write
> commands to those endpoints and identifies itself over 0x5A.
There are no bugs opened that ties initialization of devices to bugs.
Quite the opposite: I can guarantee you that removing part of the
init will introduce regressions.

The onus is on you to provide strong evidence that the removal is
a necessary act.

Regardless it is not in the scope of this patchset: remove it.
> I do get that it is a bit risky as some laptops might be hardcoded to
> wait for 0x5D to turn on RGB. Which is why we had the last patch until
> V4. But we have yet to find a laptop that has this problem, so I find
> it difficult to justify keeping the init.
Yes it's risky to remove initialization sequences for a device that is
in every modern ASUS laptop and is tied to the EC.
> Do note that you might need to add the 0x5D init to your userspace
> program for certain laptops if you haven't already. But that is ok,
> since in doing so you are also validating you are speaking to an Asus
> device, which is important.
This doesn't make much sense: why would anyone remove
a command from the kernel, that can be very well essential to some models
(sleep can break, for example) just to add it back in a userspace program?

What does it mean I have to validate I am speaking to an asus device?
Software selects devices by known attribute, one of them is the vid:pid....
Beside what does this have to do with the removal of initialization commands
from the kernel?

Even late initializing devices can lead to problems. Windows doesn't do that:
as soon as asus drivers are loaded all relevant initialization sequences are 
sent; Windows is the only officially supported OS: do not introduce commands
flow divergence without strong reasons backing it up.

> Antheas
>
Denis
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
>>>>>  1 file changed, 19 insertions(+), 37 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>>> index a444d41e53b6..7ea1037c3979 100644
>>>>> --- a/drivers/hid/hid-asus.c
>>>>> +++ b/drivers/hid/hid-asus.c
>>>>> @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>>>       unsigned char kbd_func;
>>>>>       int ret;
>>>>>
>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>>> -             /* Initialize keyboard */
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> -
>>>>> -             /* The LED endpoint is initialised in two HID */
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> -
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> -
>>>>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>>>> -                     ret = asus_kbd_disable_oobe(hdev);
>>>>> -                     if (ret < 0)
>>>>> -                             return ret;
>>>>> -             }
>>>>> -
>>>>> -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
>>>>> -                     intf = to_usb_interface(hdev->dev.parent);
>>>>> -                     udev = interface_to_usbdev(intf);
>>>>> -                     validate_mcu_fw_version(hdev,
>>>>> -                             le16_to_cpu(udev->descriptor.idProduct));
>>>>> -             }
>>>>> +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>>
>>>>> -     } else {
>>>>> -             /* Initialize keyboard */
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> +     /* Get keyboard functions */
>>>>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>>
>>>>> -             /* Get keyboard functions */
>>>>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>>>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>>>> +             ret = asus_kbd_disable_oobe(hdev);
>>>>>               if (ret < 0)
>>>>>                       return ret;
>>>>> +     }
>>>>>
>>>>> -             /* Check for backlight support */
>>>>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>> -                     return -ENODEV;
>>>>> +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
>>>>> +             intf = to_usb_interface(hdev->dev.parent);
>>>>> +             udev = interface_to_usbdev(intf);
>>>>> +             validate_mcu_fw_version(
>>>>> +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
>>>>>       }
>>>>>
>>>>> +     /* Check for backlight support */
>>>>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>> +             return -ENODEV;
>>>>> +
>>>>>       drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>>>>>                                             sizeof(struct asus_kbd_leds),
>>>>>                                             GFP_KERNEL);
