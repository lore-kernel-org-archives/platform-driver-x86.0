From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Implement irq_set_wake
Date: Sat, 2 Feb 2019 01:25:44 +0200
Message-ID: <CAHp75VfxuQ5SA7X_zwOiAZ41HvE-Oi32aBhCCZ_T7S9rDT48vg@mail.gmail.com>
References: <20180924143719.22191-1-hdegoede@redhat.com> <CAKErNvoeMs9cDDAvMfxaGLsKY3-q_JmrjCUB8VK4ZUXUVytwsQ@mail.gmail.com>
 <35cfd1f2-43eb-fc49-4777-a21413bb2d41@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <35cfd1f2-43eb-fc49-4777-a21413bb2d41@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Feb 2, 2019 at 12:52 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/31/19 8:47 PM, Maxim Mikityanskiy wrote:
> > On Mon, Sep 24, 2018 at 5:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> We were relying on the interrupt being shared with the ACPI SCI and the
> >> ACPI core calling irq_set_wake. But that does not always happen on
> >> Bay Trail devices, so we should do it ourselves.
> >>
> >> This fixes wake from USB not working on various Bay Trail devices.
> >
> > This patch breaks suspend on ASUS E202SA (bisecting pointed me to this
> > patch, and if I revert it and build 4.20.5 without this patch,
> > everything works flawlessly).
>
> Thank you for the bug report, can you please test 4.20.5 with the attached
> patch on top? That should fix it. Once I've confirmation that this fixes
> things I will submit the patch upstream.

Thanks for fast reply, Hans!

I looked at the patch and would propose one modification, i.e. use
INTEL_CPU_FAM6() macro instead of ICPU().

-- 
With Best Regards,
Andy Shevchenko
