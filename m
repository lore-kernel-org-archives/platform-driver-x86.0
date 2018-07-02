From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: intel-hid: Add support for Device
 Specific Methods
Date: Mon, 2 Jul 2018 17:06:14 +0300
Message-ID: <CAHp75VerxQrPwHTU9PF_q_8xkRm7=cBTPf2tb_5xPEoBQKcL8A@mail.gmail.com>
References: <20180628181906.54910-1-srinivas.pandruvada@linux.intel.com>
 <74ac9bf130074e0a8f86a7904783d091@ausx13mpc120.AMER.DELL.COM>
 <95b3748fcb911c7305bd2bbcfd4e368f044f8b14.camel@linux.intel.com>
 <CAHp75VdX+i_N_GttiL3QZrpivpUeJa0ofGfeJR1FkfuiBWocqA@mail.gmail.com> <cc4bc804434a40d9bdd2fa03bbb875aa@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cc4bc804434a40d9bdd2fa03bbb875aa@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 2, 2018 at 4:51 PM,  <Mario.Limonciello@dell.com> wrote:

>> > So there are some customers who will have issue with power button
>> > without this patch, so it should be also marked for stable also.
>> > Also this may be a candidate for 4.18-rcX.
>> >
>>
>> I'm not sure Greg will take this selling point for rather big patch.
>> From changelog, honestly, I don't see any regression description,
>> looks like "it wasn't working before change anyway".
>>
>
> Just for adding some context.
>
> Some platforms have moved to different interface in ASL in FW upgrade
> due to deficiencies/bugs present with old interface.  So yes it's platform FW
> change in behavior that leads to Linux kernel regression.  Windows driver has supported
> both interfaces for a long time.  Linux kernel however doesn't support this interface until now.
>
>> For now, I pushed this to my review and testing queue as is, thanks!
>
> If not stable I think it would at least be ideal to try to bring this to 4.18-rcX if possible for
> compatibility with more platforms that will come with this other interface instead.

Citing Linus:

--- 8< --- 8< ---
So please, people, the "fixes" during the rc series really should be
things that are _regressions_. If it used to work, and it no longer does,
then fixing that is a good and proper fix. Or if something oopses or has a
security implication, then the fix for that is a real fix.

But if it's something that has never worked, even if it "fixes" some
behavior, then it's new development, and that should come in during the
merge window. Just because you think it's a "fix" doesn't mean that it
really is one, at least in the "during the rc series" sense.
--- 8< --- 8< ---

So, if we can sell him that it used to work and firmware fix is a
Linux regression I'm fine.

Darren, what do you think?

-- 
With Best Regards,
Andy Shevchenko
