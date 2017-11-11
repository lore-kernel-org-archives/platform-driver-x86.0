From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3] dell-laptop: Fix keyboard led max_brightness property
 for Dell Latitude E6410
Date: Sat, 11 Nov 2017 23:12:07 +0100
Message-ID: <20171111221207.njayezgw36o7mwle@pali>
References: <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
 <1509654324-709-1-git-send-email-pali.rohar@gmail.com>
 <20171103011843.GF7971@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:54572 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751651AbdKKWMM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Nov 2017 17:12:12 -0500
Content-Disposition: inline
In-Reply-To: <20171103011843.GF7971@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

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
> >  drivers/platform/x86/dell-laptop.c |   17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> > index f42159f..7424e53 100644
> > --- a/drivers/platform/x86/dell-laptop.c
> > +++ b/drivers/platform/x86/dell-laptop.c
> > @@ -49,6 +49,7 @@
> >  
> >  struct quirk_entry {
> >  	u8 touchpad_led;
> > +	u8 kbd_led_levels_off_1;
> 
> I believe you and Andy agreed to use a boolean type here?

I'm going to fix this and other entries to boolean type in another
patch.

-- 
Pali Rohár
pali.rohar@gmail.com
