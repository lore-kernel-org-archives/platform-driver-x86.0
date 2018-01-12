From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: suppress warning about palm detection
Date: Fri, 12 Jan 2018 15:07:12 +0100
Message-ID: <CANq1E4RGo091oaG=0owKVfxOV8wR2qQ=nXfXzZsRxg6Q7_C8zw@mail.gmail.com>
References: <20180112110445.1876-1-dh.herrmann@gmail.com> <CAHp75Vc66ZfRmOoOKJRODpV0mS2aZru=b-r0cr8SKYH=hm+W6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc66ZfRmOoOKJRODpV0mS2aZru=b-r0cr8SKYH=hm+W6Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Thode <mthode@mthode.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy

On Fri, Jan 12, 2018 at 2:50 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jan 12, 2018 at 1:04 PM, David Herrmann <dh.herrmann@gmail.com> wrote:
>> This patch prevents the thinkpad_acpi driver from warning about 2 event
>> codes returned for keyboard palm-detection. No behavioral changes,
>> other than suppressing the warning in the kernel log. The events are
>> still forwarded via acpi-netlink channels.
>>
>> We could, optionally, decide to forward the event through a
>> input-switch on the tpacpi input device. However, so far no suitable
>> input-code exists, and no similar drivers report such events. Hence,
>> leave it an acpi event for now.
>>
>> Note that the event-codes are named based on empirical studies. On the
>> ThinkPad X1 5th Gen the sensor can be found underneath the arrow key.
>>
>
>> Cc: Matthew Thode <mthode@mthode.org>
>
> Shouldn't be Suggested-by or even Signed-off-by?

The patch is different (Matthew originally suppressed the ACPI event),
so I did not copy the sign-off. Please add Suggested-by, if that is an
acceptable tag.

>> Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
>
>
>> +       case TP_HKEY_EV_PALM_DETECTED:
>> +       case TP_HKEY_EV_PALM_UNDETECTED:
>
>> +               /* palm detected hovering the keyboard, forward to user-space
>> +                * via netlink for consumption */
>
> Comment style is
> /*
>  * Multi line comment.
>  * This is an example.
>  */

All other 6 comments in this function follow the style I used here, so
I tried to be consistent. But feel free to amend this change.

Thanks a lot!
David
