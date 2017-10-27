From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: new backlight driver
 for DELL AIO
Date: Fri, 27 Oct 2017 23:23:55 +0300
Message-ID: <CAHp75Ve6f7zcD3jNCcRFj1reMg5wupzgJEHBmSH5S6-R0_apNQ@mail.gmail.com>
References: <1509004429-1596-1-git-send-email-acelan.kao@canonical.com>
 <08add166d5b34992ba167a878ca2a808@ausx13mpc124.AMER.DELL.COM>
 <CAMz9Wg-gMCsZGhfy7tmo4H-BYA7FnwA0mi+1VkBaQ7A4aC-TmA@mail.gmail.com> <377b9a237f6448bba0f5a0b83c77d7bd@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <377b9a237f6448bba0f5a0b83c77d7bd@ausx13mpc124.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: AceLan Kao <acelan.kao@canonical.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Oct 27, 2017 at 6:52 PM,  <Mario.Limonciello@dell.com> wrote:

>> and there is a new interface to deal with this kind of requirement, serdev.
>> But serdev is introduced after v4.12, to make it work before serdev, I
>> can't find other good solutions for it.
>
> Right, I know you have a need for this to work on older kernel too, so I think
> this interface as you did it makes sense on older kernel, but please do use serdev
> on newer kernel and as this is upstreamed.

Exactly, we don't care about old kernels in a new code.

>> >> +     /* unregister acpi backlight interface */
>> >> +     acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
>> >
>> > Since you change this when the driver is loaded, you should cache the old
>> > value and restore it when the driver is unloaded too.
>>
>> In this case, acpi backlight doesn't work, all the backlight
>> operations would go through UART commands.
>> So, it safe to remove it.
>
> OK.
> I think it would be good to include a command about this so that folks who
> look at this later understand this.

s/command/comment/ I suppose.

-- 
With Best Regards,
Andy Shevchenko
