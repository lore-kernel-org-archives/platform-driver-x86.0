From: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
Subject: RE: [PATCH v3] dell-laptop: Fix keyboard led =?UTF-8?Q?max=5Fbrightness?=
 =?UTF-8?Q?=20property=20for=20Dell=20Latitude=20E=36=34=31=30?=
Date: Sun, 12 Nov 2017 10:01:10 -0700
Message-ID: <20171112100110.669a95d04dbb6b53be537852cb8ecb8c.107c268866.wbe@email22.secureserver.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from p3plsmtp22-06-2.prod.phx3.secureserver.net ([68.178.252.64]:49306
        "EHLO p3plsmtp22-06.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751418AbdKLRBm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Nov 2017 12:01:42 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?UTF-8?Q?Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


-------- Original Message --------
Subject: Re: [PATCH v3] dell-laptop: Fix keyboard led max_brightness
property for Dell Latitude E6410
From: Pali Rohár <pali.rohar@gmail.com>
Date: Sat, November 11, 2017 4:12 pm
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko
<andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>,
Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com,
platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 02 November 2017 18:18:43 Darren Hart wrote:
> On Thu, Nov 02, 2017 at 09:25:24PM +0100, Pali Rohár wrote:
> > This machine reports number of keyboard backlight led levels, instead of
> > value of the last led level index. Therefore max_brightness properly needs
> > to be subtracted by 1 to match led max_brightness API.
> > 
> > Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> > Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=196913
> > ---
> > Changes since v2:
> > * Rename quirk entry to kbd_led_levels_off_1
> > Changes since v1:
> > * Update kbd_info.levels at initialization time based on quirk
> > ---
> > drivers/platform/x86/dell-laptop.c | 17 +++++++++++++++++
> > 1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> > index f42159f..7424e53 100644
> > --- a/drivers/platform/x86/dell-laptop.c
> > +++ b/drivers/platform/x86/dell-laptop.c
> > @@ -49,6 +49,7 @@
> > 
> > struct quirk_entry {
> > u8 touchpad_led;
> > + u8 kbd_led_levels_off_1;
> 
> I believe you and Andy agreed to use a boolean type here?

I'm going to fix this and other entries to boolean type in another
patch.

-- 
Pali Rohár
pali.rohar@gmail.com
-------- End Original Message --------

If necessary, I am willing to test whatever final proposed patch the
community recommends, settles on, and accepts. Would you all like me to
test the v3 patch as well? Or are we calling it good at this point, and
can expect this to be merged into a final stable kernel release sometime
soon? I must admit, I'm looking forward to officially making this bug go
bye-bye!

- Gabriel
