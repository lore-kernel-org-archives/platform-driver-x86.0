From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Thu, 9 Feb 2017 21:56:06 +0200
Message-ID: <CAHp75VcppJdTqXXK3aVzkOk_d4hnVFc-4ZpSiHJHGjJOBSKMTQ@mail.gmail.com>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com>
 <20170204011439.GD38511@f23x64.localdomain> <CAHp75Vf3_WVGWKo18RikCJMtF9xgYSHem_wK4vTjXQn1WJvJCA@mail.gmail.com>
 <20170209022238.GB185952@localhost.localdomain> <CAJ=jquYFgiPEUc248fHb7MhHuqJih-=1SHrbypeS9HGWwPqh3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35762 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932131AbdBIT4H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Feb 2017 14:56:07 -0500
Received: by mail-qt0-f195.google.com with SMTP id s58so1957481qtc.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Feb 2017 11:56:07 -0800 (PST)
In-Reply-To: <CAJ=jquYFgiPEUc248fHb7MhHuqJih-=1SHrbypeS9HGWwPqh3Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

On Thu, Feb 9, 2017 at 5:09 AM, Alex Hung <alex.hung@canonical.com> wrote:
> On Thu, Feb 9, 2017 at 10:22 AM, Darren Hart <dvhart@infradead.org> wrote:
>> On Sat, Feb 04, 2017 at 04:58:33PM +0200, Andy Shevchenko wrote:
>>> On Sat, Feb 4, 2017 at 3:14 AM, Darren Hart <dvhart@infradead.org> wrote:
>>> > On Thu, Jan 26, 2017 at 03:33:01PM +0800, Alex Hung wrote:
>>> >> New firmwares include a feature called 5 button array that supports
>>> >> super key, volume up/down, rotation lock and power button. Especially,
>>> >> support for this feature is required to fix power button on some recent
>>> >> systems.

>>> >> +     ret = input_register_device(priv->array);
>>> >> +     if (ret)
>>> >> +             goto err_free_array_device;
>>> >> +
>>> >> +     return 0;
>>> >> +
>>> >> +err_free_array_device:
>>> >> +     input_free_device(priv->array);
>>> >> +     return ret;
>>> >
>>> > This return path is more complex than it could be, since you test for ret before
>>> > return anyway:
>>> >
>>> >  out:
>>> >  if (ret)
>>> >          input_free_device(priv->array);
>>> >  return ret;
>>> >
>>> > There is no need for a second return point that I can see. Same for the
>>> > hid_input_setup function. We can remove 8 lines.
>>>
>>> Darren, if I didn't miss anything the function is purely used in
>>> ->probe() path and thus devm_ version of input_allocate_device() would
>>> make this error path gone.

>> These are optional input devices for the driver, so if I understand the
>> semantics of devm_ correctly, the input device would remain allocated until such
>> time as the driver is unloaded or if it fails to bind - which for systems with
>> intel-hid, but no 5 button array, the unused input device would remain allocated
>> until system shutdown.
>>
>> Alex, is that correct?
>
> Yes, the input device will be only allocated if 5 button array is
> supported. Previous firmware that does not support 5 button array
> won't be affected.

I guess there is a misunderstanding.

From code I see that
1. input_allocate_device() is called only at ->probe() and only for
devices that *have* 5 button HID array.
2. Time of live of allocated device is until device driver unbound or unloaded.

From the above I conclude that using devm_input_allocate_device() will
reduce burden on error path w/o affecting functionality.

If I;m correct, please, use devm_*() variant.

-- 
With Best Regards,
Andy Shevchenko
