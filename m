From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v9 4/4] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Sun, 19 Mar 2017 19:06:19 +0100
Message-ID: <16957a6a-be85-8771-2000-978c4bc88270@redhat.com>
References: <20170316105535.8885-1-hdegoede@redhat.com>
 <20170316105535.8885-4-hdegoede@redhat.com> <201703191610.38557@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41348 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752254AbdCSSHb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Mar 2017 14:07:31 -0400
In-Reply-To: <201703191610.38557@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

Hi,

On 19-03-17 16:10, Pali Rohár wrote:
> On Thursday 16 March 2017 11:55:35 Hans de Goede wrote:
>> Changes in v9:
>> -Only listen to type 0x0010 kbd-led events in dell-wmi.c, these only
>> trigger on hotkey presses
>> -Drop the new / previous brightness comparison from dell-laptop.c now
>> that we only get events on hotkey presses it is no longer necessary
>> ---
>
> Hi! I'm really not sure if this change is correct there.
>
> Now you are only listening for keypress "change kbd backlight", but some
> dell machines could change keyboard backlight also in other different
> situations, like attaching AC adapter. I guess (but I'm not sure) this
> probably does not send keypress event.

I'm not aware of any Dells doing such a thing, if we encounter any then
we can deal with that if and when that happens.

Regards,

Hans
