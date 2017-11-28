From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Actually use mask parameter in hp_wmi_hw_state
Date: Tue, 28 Nov 2017 21:30:33 +0200
Message-ID: <CAHp75VdSiR=X-Dq2dto2osc3UiTid7h=T764cZkNgXEyTpEJcg@mail.gmail.com>
References: <20171128151758.9234-1-michel@daenzer.net> <20171128165724.GA16349@fury>
 <e8ff5280-537e-bb60-f0ba-791117abb4a4@daenzer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e8ff5280-537e-bb60-f0ba-791117abb4a4@daenzer.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 28, 2017 at 8:06 PM, Michel D=C3=A4nzer <michel@daenzer.net> wr=
ote:
> On 2017-11-28 05:57 PM, Darren Hart wrote:
>> On Tue, Nov 28, 2017 at 04:17:58PM +0100, Michel D=C3=A4nzer wrote:
>>> We were always checking bit 0 (which represents the docked state)
>>> regardless of the mask.
>>>
>>> Fixes the "tablet mode" state always being reported the same as the
>>> docked state, which with current libinput can cause the built-in input
>>> devices of laptops to be incorrectly disabled while docked.

>> Merged in 4.15-rc1
>
> AFAIK commits without
>
>  Cc: stable@vger.kernel.org
>
> don't get automatically picked up for stable branches. Can you manually
> nominate 9968e12 for stable?

AFAIK Greg picks up patches based on Fixes tag as well.
Feel free to ping us or just forward that one yourself if Greg will
not pick up in reasonable (month?) time.

--=20
With Best Regards,
Andy Shevchenko
