From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: your mail
Date: Mon, 11 May 2020 14:29:24 +0200
Message-ID: <5ee2b9ef-25e3-c049-3f82-d3d51d392824@redhat.com>
References: <526351589195104@mail.yandex.com>
 <20200511113506.GB2062175@kuha.fi.intel.com>
 <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: jakub-FiUXBBwNs2Q@public.gmane.org, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/11/20 1:44 PM, Andy Shevchenko wrote:
> +Cc: Hans

Thank you, I'm afraid that I do not have much of value
to add here, Heikki knows these systems (with an INT3515 device)
a lot better then I do.

> On Mon, May 11, 2020 at 2:38 PM Heikki Krogerus
> <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>
>> +Andy
>>
>> Adding also the linux-usb mailing list.
>>
>> On Mon, May 11, 2020 at 01:06:18PM +0200, jakub-FiUXBBwNs2Q@public.gmane.org wrote:
>>> Hello, I'm running Intel NUC10i3 with Ubuntu 20.04 on board. I have a problem
>>> with cpu interrups causing issues with deeper CPU sleep and increased power
>>> usage. Also load is always 1 even if machine has nothing to do.
>>>
>>> I made a reasearch and found that device named TPS6598x interrupts my CPU. This
>>> device is related with USB and according to datasheet it's "USB Interface IC USB
>>> Type-CG and USB PD controller power switch and high-speed multiplexer ". I have
>>> nothing connected to NUC except power plug and ethernet cable.
>>>
>>> Screenshots: https://imgur.com/a/uw9NDCi
>>>
>>> How to solve this issue? Could you help me?
>>
>> My guess is that the IRQ resource is not correct for the PD
>> controller causing you to see irq flood.
>>
>> The problem is that the ACPI device entry (the node) on this platform
>> has 4 I2CSerialBus resources and 4 IRQ resources. The idea is that the
>> single ACPI device entry can represent up to 4 USB PD controllers. The
>> problem is that there is no way to know which IRQ resource belongs to
>> which I2CSerialBus resource :-(.
>>
>> Andy, this is one of those multi-instantiate I2C slave devices with
>> HID INT3515.
>>
>> The only solution I can think of is that we start maintaining DMI
>> quirk table in drivers/platform/x86/i2c-multi-instantiate.c where we
>> supply the correct i2c to irq resource mapping for every platform
>> that has this device(s).
> 
> I would rather disable them and issue a firmware bug.
> Vendors, including us, should do something sane about this.

I have to partially disagree here. I agree that for future hardware
versions the firmware team of those devices should offer a saner
interface. But for the current hardware gen I guess we are stuck
with this and having a DMI table for popular models (well any model
a Linux user is willing to submit a quirk for) is better then simply
not having things working under Linux.

I do wonder what Windows does here though. Perhaps the INT3513 device
has some ACPI methods to query for more info, like how many Type-C
controllers there actually are?

Regards,

Hans
