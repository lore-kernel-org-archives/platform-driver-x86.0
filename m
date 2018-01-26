From: Marco Martin <notmart@gmail.com>
Subject: Re: [PATCH v5] Support intel-vbtn based tablet mode switch
Date: Fri, 26 Jan 2018 17:18:09 +0100
Message-ID: <CAD6_BovK7A4kyBW1S5TOGxxXKnqaitSfg0bOuCkqRKSkSmicfA@mail.gmail.com>
References: <1516965688-9286-1-git-send-email-notmart@gmail.com> <CAHp75VftsyEGz-ap_UQDwP33yXtNEnuekLJpwm4-qXxw8Ud3vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:54444 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751776AbeAZQSK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 11:18:10 -0500
In-Reply-To: <CAHp75VftsyEGz-ap_UQDwP33yXtNEnuekLJpwm4-qXxw8Ud3vw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bhushan Shah <bhush94@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Mario Limonciello <mario_limonciello@dell.com>

On Fri, Jan 26, 2018 at 4:57 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jan 26, 2018 at 1:21 PM, Marco Martin <notmart@gmail.com> wrote:
>> Some laptops such as Dell Inspiron 7000 series have the
>> tablet mode switch implemented in Intel ACPI,
>> the events to enter and exit the tablet mode are 0xCC and 0xCD
>
> Thanks for an update. It doesn't apply.
>
> Please, rebase on top of our testing branch, add Mario's tag and resend.

what clone/branch I should look at?
