From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Implement irq_set_wake
Date: Sun, 3 Feb 2019 10:43:43 +0100
Message-ID: <c41941b0-c655-8263-f0a8-b65364515655@redhat.com>
References: <20180924143719.22191-1-hdegoede@redhat.com>
 <CAKErNvoeMs9cDDAvMfxaGLsKY3-q_JmrjCUB8VK4ZUXUVytwsQ@mail.gmail.com>
 <35cfd1f2-43eb-fc49-4777-a21413bb2d41@redhat.com>
 <CAKErNvptohPtM_Zf8oLk_tgQMNq3ypdrGen6Juv-4veba-pbaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKErNvptohPtM_Zf8oLk_tgQMNq3ypdrGen6Juv-4veba-pbaQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 2/2/19 8:04 PM, Maxim Mikityanskiy wrote:
> On Sat, Feb 2, 2019 at 12:52 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 1/31/19 8:47 PM, Maxim Mikityanskiy wrote:
>>> Hi,
>>>
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
> I've tested your patch against both 4.20.5 and 4.20.6, and it works
> fine. Thank you for such a quick fix.

Thank you for the bug-report and for testing the fix. I've submitted
the patch upstream now, so hopefully it will show up in a 4.20.x
release soon.

Regards,

Hans
