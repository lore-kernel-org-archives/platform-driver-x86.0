From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/4] Topstar ACPI LED Workaround
Date: Fri, 27 Oct 2017 18:21:06 +0300
Message-ID: <CAHp75VejAgtj4swJhKCbtkBko+x2h6xzEtq-Q6gGdkNYPiW==g@mail.gmail.com>
References: <cover.1508255487.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1508255487.git.gdouezangrard@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guillaume_Dou=C3=A9zan=2DGrard?= <gdouezangrard@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 17, 2017 at 7:17 PM, Guillaume Dou=C3=A9zan-Grard
<gdouezangrard@gmail.com> wrote:
> Hi Darren,
>
> On Topstar U931 Notebooks, an issue prevents the WLAN toggle key from
> being properly managed by the Embedded Controller and successfully
> disconnect the adapter. A specific ACPI method allows to toggle the WLAN
> LED state regardless.
>
> These are barebone laptops, sold under quite a lot of brands and
> configurations, with different firmwares and so on. I can only say for su=
re
> that this issue is present for all the models sold under a specific brand=
,
> that's why I'm reluctant to enable this by default with a DMI check.
>
> Thus, the new `led_workaround` option registers this LED with the
> corresponding subsystem, making possible to use a software-based trigger
> (rfkill for instance to synchronize the LED with the softkill state).
>
> Thank you for your time,

I have applied to my review and testing queue with some changes:
- device names are left unchanged (it's ABI, we can't just change
device name to whatever we want if we can't guarantee that doesn't
break anything, at least I can't)
- labels should mark what is expected to be executed when code chooses that=
 path
- I split module authors to two macro calls (this makes slightly
better readability in the sources and when one calls modinfo)

Can you check if it's okay with your devices and works as expected?

If everything okay, take my them from review-andy branch, add commit
message to where it's missed and send a new version.

Thanks.

>
> --
> Guillaume Dou=C3=A9zan-Grard
>
> Guillaume Dou=C3=A9zan-Grard (4):
>   platform/x86: topstar-laptop: non-functional changes
>   platform/x86: topstar-laptop: change to generic module
>   platform/x86: topstar-laptop: add platform device
>   platform/x86: topstar-laptop: add optional WLAN LED workaround
>
>  drivers/platform/x86/Kconfig          |   2 +
>  drivers/platform/x86/topstar-laptop.c | 339 ++++++++++++++++++++++++++--=
------
>  2 files changed, 267 insertions(+), 74 deletions(-)
>
> --
> 2.14.1
>



--=20
With Best Regards,
Andy Shevchenko
