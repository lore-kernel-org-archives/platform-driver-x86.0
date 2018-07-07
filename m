From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: intel-hid: Add support for Device
 Specific Methods
Date: Sat, 7 Jul 2018 19:24:44 +0300
Message-ID: <CAHp75VeW9y2z2N7bzwY-kztLvgJYmHECHRF1q5Mr8ude8LOMUQ@mail.gmail.com>
References: <20180628181906.54910-1-srinivas.pandruvada@linux.intel.com>
 <74ac9bf130074e0a8f86a7904783d091@ausx13mpc120.AMER.DELL.COM>
 <95b3748fcb911c7305bd2bbcfd4e368f044f8b14.camel@linux.intel.com>
 <CAHp75VdX+i_N_GttiL3QZrpivpUeJa0ofGfeJR1FkfuiBWocqA@mail.gmail.com>
 <cc4bc804434a40d9bdd2fa03bbb875aa@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VerxQrPwHTU9PF_q_8xkRm7=cBTPf2tb_5xPEoBQKcL8A@mail.gmail.com>
 <20180706235907.GE3041@fury> <1530935335264.5774@Dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530935335264.5774@Dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jul 7, 2018 at 6:48 AM,  <Mario.Limonciello@dell.com> wrote:
>>I strongly advocate for vendors to have more control over their drivers,
>>but this scenario really frustrates me. I don't think I can justify this
>>to Linus as a fix. But before we just say "no" (because hey, I want
>>these fixes available as early as possible too), let's ask Rafael if he
>>has an opinion or if there is precedent for this in his experience with
>>ACPI drivers in general:
>
> Full disclosure - an updated FW has since been rolled out that reverted this
> behavior back to previous FW behavior due to lack of Linux support for the
> new _DSM.  There is desire to use the new interface (as it did fix actual
> problems with the old one) so at some point it may return.  When that happens
> it would be ideal that people who are (for example) running an LTS kernel
> or distro kernel that tracks stable can pick it up too.

I am all for the better user experience and bugs especially in FW
should be fixed, but I think to support all kind of behaviour the new
FW release should always provide a knob by which we can check if some
feature is supported or not.

Above sounds to me as mistake in design of the fix.

-- 
With Best Regards,
Andy Shevchenko
