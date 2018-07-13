From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH resend v4] dell_rbu: make firmware payload memory uncachable
Date: Fri, 13 Jul 2018 17:26:20 +0300
Message-ID: <CAHp75VfpX7m3zLii3MKbW=S2rkh7O4BVygFdP7aB95jJ8hCBuA@mail.gmail.com>
References: <eb0db565-5f8a-ab1e-2bf3-2def3ec3eddc@gmail.com>
 <5318cc53-31b4-5c83-abb7-c3ff5d892af2@gmail.com> <eca11a9c20d14480ae02b2912b7a6447@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <eca11a9c20d14480ae02b2912b7a6447@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stuart.Hayes@dell.com, Takashi Iwai <tiwai@suse.de>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 6, 2018 at 7:28 PM,  <Mario.Limonciello@dell.com> wrote:

> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>

Pushed to my review and testing queue, thanks!

>> This driver has no maintainer.
>
> Stuart,
>
> Outside of this patch, I think it would make sense to send some follow up patch
> series that do the following:
>
> 1) Let you take over as maintainer (Update MAINTAINERS)

> 2) Move this driver to platform-x86

Darren, what do you think about this step?

If we would go this way, first move, then take maintainership to reduce a churn.

> 3) Update dell_rbu.txt with the correct URLs and mention that it's only for enterprise
> hardware.    Client hardware has instead opted to support UEFI capsules for updates
> from Linux.
>
> Since it's really a platform feature and specific to only Dell enterprise hardware
> I think it makes sense to move over to an area with subsystem maintainers that
> can help to review patches as needed.

-- 
With Best Regards,
Andy Shevchenko
