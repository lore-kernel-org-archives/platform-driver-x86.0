From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Implement irq_set_wake
Date: Sat, 2 Feb 2019 11:50:23 +0100
Message-ID: <5a56d2e8-c309-77f4-6ea6-a4e9d2bb0f1b@redhat.com>
References: <20180924143719.22191-1-hdegoede@redhat.com>
 <CAKErNvoeMs9cDDAvMfxaGLsKY3-q_JmrjCUB8VK4ZUXUVytwsQ@mail.gmail.com>
 <35cfd1f2-43eb-fc49-4777-a21413bb2d41@redhat.com>
 <CAHp75VfxuQ5SA7X_zwOiAZ41HvE-Oi32aBhCCZ_T7S9rDT48vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfxuQ5SA7X_zwOiAZ41HvE-Oi32aBhCCZ_T7S9rDT48vg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 2/2/19 12:25 AM, Andy Shevchenko wrote:
> On Sat, Feb 2, 2019 at 12:52 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/31/19 8:47 PM, Maxim Mikityanskiy wrote:
>>> On Mon, Sep 24, 2018 at 5:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> We were relying on the interrupt being shared with the ACPI SCI and the
>>>> ACPI core calling irq_set_wake. But that does not always happen on
>>>> Bay Trail devices, so we should do it ourselves.
>>>>
>>>> This fixes wake from USB not working on various Bay Trail devices.
>>>
>>> This patch breaks suspend on ASUS E202SA (bisecting pointed me to this
>>> patch, and if I revert it and build 4.20.5 without this patch,
>>> everything works flawlessly).
>>
>> Thank you for the bug report, can you please test 4.20.5 with the attached
>> patch on top? That should fix it. Once I've confirmation that this fixes
>> things I will submit the patch upstream.
> 
> Thanks for fast reply, Hans!
> 
> I looked at the patch and would propose one modification, i.e. use
> INTEL_CPU_FAM6() macro instead of ICPU().

I just tried and I like the idea, but this does not work.

The problem is that macro assumes that the driver_data being passed is
always a struct and the & to take the address of the struct is part of
the macro instead of passed with the argument, making it impossible to
pass a simple integer value or a bunch of flags (in a bitmask).

IMHO this is a shortcoming of the macro and should be fixed, moving
the & to the callers of the macro.

Given that this patch needs to go to stable to fix the regression I
think it is best to just keep the patch as is. And then for -next, once
the macro is fixed we can convert the int0002_vgpio driver to use it.

Regards,

Hans
