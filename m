From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 09/12] platform/x86: wmi: create character devices when
 requested by drivers
Date: Thu, 21 Sep 2017 19:46:32 +0300
Message-ID: <CAHp75VcD+SK2sMMzx8VKed2vVtGJzdwTcM-a5FZyRidZL6jGYw@mail.gmail.com>
References: <cover.1505999739.git.mario.limonciello@dell.com> <0147d9b2d81428711f4e2c8cf1baff71ba81764e.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:50398 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751640AbdIUQqd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Sep 2017 12:46:33 -0400
In-Reply-To: <0147d9b2d81428711f4e2c8cf1baff71ba81764e.1505999739.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

On Thu, Sep 21, 2017 at 4:57 PM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> For WMI operations that are only Set or Query read or write sysfs
> attributes created by WMI vendor drivers make sense.
>
> For other WMI operations that are run on Method, there needs to be a
> way to guarantee to userspace that the results from the method call
> belong to the data request to the method call.  Sysfs attributes don't
> work well in this scenario because two userspace processes may be
> competing at reading/writing an attribute and step on each other's
> data.
>
> When a WMI vendor driver declares a set of functions in a
> file_operations object the WMI bus driver will create a character
> device that maps to those file operations.
>
> The WMI vendor drivers will be responsible for managing access to
> this character device and proper locking on it.
>
> When a WMI vendor driver is unloaded the WMI bus driver will clean
> up the character device.
>

> @@ -44,12 +44,17 @@
>  #include <linux/platform_device.h>
>  #include <linux/wmi.h>
>  #include <linux/uuid.h>
> +#include <linux/cdev.h>
> +#include <linux/idr.h>

Keep alphabetical ordering.


-- 
With Best Regards,
Andy Shevchenko
