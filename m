From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/4] Topstar ACPI LED Workaround
Date: Fri, 3 Nov 2017 13:56:46 +0200
Message-ID: <CAHp75VcHYRevrGMw6Tf-V371yhf=Sn+AdmMWXUWbsAV+V+0kJQ@mail.gmail.com>
References: <cover.1509229280.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:57138 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750826AbdKCL4s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 07:56:48 -0400
In-Reply-To: <cover.1509229280.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Guillaume_Dou=C3=A9zan=2DGrard?= <gdouezangrard@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Oct 29, 2017 at 1:49 AM, Guillaume Dou=C3=A9zan-Grard
<gdouezangrard@gmail.com> wrote:
> Hi Andy,
>
> Thank you for your review. Changes since the previous submission are
> highlighted below.

Thanks for an update.

Unfortunately patch series needs more work (and we have time, since
it's -rc7 already, to improve).

I'm going to comment per patch slightly later.

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
>
> --
> Guillaume Dou=C3=A9zan-Grard
>
>
> Changes since v1:
>
> * leave devices names unchanged for ABI compatibility,
> * fix label names,
> * separate module authors definition,
> * add commit description to Patch 3.
>
>
> Guillaume Dou=C3=A9zan-Grard (4):
>   platform/x86: topstar-laptop: non-functional changes
>   platform/x86: topstar-laptop: change to generic module
>   platform/x86: topstar-laptop: add platform device
>   platform/x86: topstar-laptop: add optional WLAN LED workaround
>
>  drivers/platform/x86/Kconfig          |   2 +
>  drivers/platform/x86/topstar-laptop.c | 334 ++++++++++++++++++++++++++--=
------
>  2 files changed, 265 insertions(+), 71 deletions(-)
>
> --
> 2.14.3
>



--=20
With Best Regards,
Andy Shevchenko
