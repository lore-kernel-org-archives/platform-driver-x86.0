From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Status of merging "[PATCH resend v5 3/3] platform/x86:
 intel_cht_int33fe: Update fusb302 type string, add properties"
Date: Fri, 3 Nov 2017 14:11:47 +0200
Message-ID: <CAHp75VfDEnfKeRoTq0MEW7k3VZG-tUFk0wVafSK-DAv4v2QoeQ@mail.gmail.com>
References: <512ff43f-323f-5820-1cb4-6a1a6e0c632f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:51723 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750857AbdKCMLs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 08:11:48 -0400
Received: by mail-qk0-f172.google.com with SMTP id 17so2890597qkq.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Nov 2017 05:11:48 -0700 (PDT)
In-Reply-To: <512ff43f-323f-5820-1cb4-6a1a6e0c632f@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Wolfram Sang <wsa@the-dreams.de>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Fri, Nov 3, 2017 at 1:06 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi Darren, Andy,
>
> What is the status of merging:
> https://patchwork.ozlabs.org/patch/824314/
>
> ?

Just merged and pushed, thanks!

>
> Now that Wolfram has created an immutable-branch for the 2
> i2c commits this depends on for you to merge, this is
> ready for merging. And since one of those 2 i2c commits
> change the device-properties attached to the bq24190
> charger when instantiating it, the driver for the charger
> will now look at the fusb302 provided max-current instead
> of at the old usb2-only extcon stuff. So without also
> merging this patch, we end up regressing from charging
> at 5v 2A to slowly-discharging (when on) at 5V 0.5A,
> so we really need this in 4.15.
>
> Regards,
>
> Hans
>



-- 
With Best Regards,
Andy Shevchenko
