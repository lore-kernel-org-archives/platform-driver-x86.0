From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH][V2] intel-hid: add a DMI quirk to support Wacom
 MobileStudio Pro
Date: Tue, 12 Dec 2017 10:02:36 +0200
Message-ID: <CAHp75VeDarmDs1tALkv4tiO_NMa7uhC26bF_Yc0Bv98KpK_nHw@mail.gmail.com>
References: <1512618023-30209-1-git-send-email-alex.hung@canonical.com>
 <20171209000423.GD14187@fury> <CANRwn3SpSfwpJk7OitXv6aLK4ES=AbHkmj7iyQsUP_dbZqbJTA@mail.gmail.com>
 <20171212005118.GF27831@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:39406 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750853AbdLLICh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Dec 2017 03:02:37 -0500
Received: by mail-qt0-f196.google.com with SMTP id k19so45155865qtj.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2017 00:02:37 -0800 (PST)
In-Reply-To: <20171212005118.GF27831@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jason Gerecke <killertofu@gmail.com>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Jason Gerecke <jason.gerecke@wacom.com>

On Tue, Dec 12, 2017 at 2:51 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, Dec 11, 2017 at 02:13:40PM -0800, Jason Gerecke wrote:
>> On Fri, Dec 8, 2017 at 4:04 PM, Darren Hart <dvhart@infradead.org> wrote:
>> > On Thu, Dec 07, 2017 at 11:40:23AM +0800, Alex Hung wrote:
>> >> HEBC method reports capabilities of 5 button array but Wacom
>> >> MobileStudio Pro does not have this control method. A DMI quirk
>> >> was created to enable 5 button array for this system.
>> >
>> > Jason, have you been able to verify this patch with testing?
>> >
>>
>> I tested the attachment at [1], which produces an identical copy of
>> intel-hid.c as applying this patch to the
>> platform-drivers-x86/review-dvhart branch of
>> git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git.
>>
>> Assuming that's the correct code, feel free to attach the following:
>> Tested-by: Jason Gerecke <jason.gerecke@wacom.com>
>
> Great, thanks. Queued up for testing.

Just in case you didn't promote it yet, could you move inclusion to be
more ordered alphabetically? (After linux/acpi.h I suppose)


-- 
With Best Regards,
Andy Shevchenko
