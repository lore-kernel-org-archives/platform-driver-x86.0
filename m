From: =?UTF-8?Q?Bernhard_=c3=9cbelacker?= <bernhardu@mailbox.org>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Yourbook C11B
Date: Fri, 15 May 2020 16:07:52 +0200
Message-ID: <4787d347-b761-6283-7f9d-34c1a11b909f@mailbox.org>
References: <20200512204009.4751-1-bernhardu@mailbox.org>
 <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
 <CAHp75VejzaZL26ztQMFGjAAMC3B8mkSnXSvGhyFeiHUbUUpp=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CAHp75VejzaZL26ztQMFGjAAMC3B8mkSnXSvGhyFeiHUbUUpp=w@mail.gmail.com>
Content-Language: en-GB
Sender: linux-input-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-input <linux-input@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Otmar Meier <otmarjun.meier@nexgo.de>
List-Id: platform-driver-x86.vger.kernel.org


Am 13.05.20 um 19:17 schrieb Andy Shevchenko:
> On Tue, May 12, 2020 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>> On 5/12/20 10:40 PM, Bernhard Übelacker wrote:
>>> Add touchscreen info for the Trekstor Yourbook C11B. It seems to
>>> use the same touchscreen as the Primebook C11, so we only add a new DMI
>>> match.
>>>
>>> Cc: Otmar Meier <otmarjun.meier@nexgo.de>
>>> Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
>>> Signed-off-by: Bernhard Übelacker <bernhardu@mailbox.org>
>>
>> Thank you, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> This doesn't apply to our for-next.
> Please, rebase, add Hans' tag and resend, thanks!


Hello Andy,
I am not sure against which git tree I should rebase?

I tried to rebase against the branch for-next in the git tree below.
And tried to apply the patch saved from my
thunderbird and got no error.

Is this the right git tree?

Kind regards,
Bernhard


$ git clone -b for-next --single-branch --depth=10000  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
$ cd linux-gpio-intel
$ LANG=C git am ../'[PATCH] platform_x86: touchscreen_dmi: Add info for the Trekstor Yourbook C11B.eml'
Applying: platform/x86: touchscreen_dmi: Add info for the Trekstor Yourbook C11B
