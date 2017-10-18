From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-laptop: Fix keyboard led max_brightness property
 for Dell Latitude E6410
Date: Wed, 18 Oct 2017 21:14:39 +0200
Message-ID: <20171018191439.qr6otmubzwfqzoke@pali>
References: <1508083394-22823-1-git-send-email-pali.rohar@gmail.com>
 <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75VfPW88YhJR97POu08POP+Edw2dEm1gwfGMxddLeOydtgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:46557 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750853AbdJRTOm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2017 15:14:42 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VfPW88YhJR97POu08POP+Edw2dEm1gwfGMxddLeOydtgQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday 18 October 2017 22:09:41 Andy Shevchenko wrote:
> On Wed, Oct 18, 2017 at 9:06 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > This machine reports number of keyboard backlight led levels, instead of
> > value of the last led level index. Therefore max_brightness properly needs
> > to be subtracted by 1 to match led max_brightness API.
> >
> > Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> > Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=196913
> 
> > +       u8 kbd_led_num_of_levels_instead_of_last_index;
> 
> Sorry for last minute review comments.
> 
> First of all, can it be just boolean?

Yes, touchpad_led and needs_kbd_timeouts are booleans too.

> Naming... Yes, too hard as always was, is and will be.
> 
> What about just
> 
> kbd_led_use_levels?

If you code:

  if (quirks->kbd_led_use_levels)
    info->levels--;

Then I think it does not help reader what that quirk represent.

> Also, does it make sense to create a quirks as an unsigned long and
> put there corresponding bits with definitions?

Problem is that part of quirk structure is variable length array
kbd_timeouts. So one unsigned long does not help.

> /* Comment what is this for */
> #define QUIRK_KBD_LED_USE_LEVELS   0
> 
> unsigned long quirks;
> 
> ?
> 
> > +       if (quirks && quirks->kbd_led_num_of_levels_instead_of_last_index && info->levels)
> > +               info->levels--;
> 
> With last suggestion if becomes something like
> 
> if (quirks & BIT(QUIRK_KBD_LED_USE_LEVELS) && info->levels)
> 
> 

-- 
Pali Rohár
pali.rohar@gmail.com
