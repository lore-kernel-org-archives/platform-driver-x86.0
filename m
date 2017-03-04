From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 0/4] fujitsu_init() cleanup
Date: Sat, 4 Mar 2017 12:17:23 +1030
Message-ID: <20170304014723.GA7944@marvin.atrad.com.au>
References: <20170301081044.12141-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:33438 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751571AbdCDCAb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Mar 2017 21:00:31 -0500
Content-Disposition: inline
In-Reply-To: <20170301081044.12141-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael

On Wed, Mar 01, 2017 at 09:10:40AM +0100, Micha?? K??pie?? wrote:
> These patches should make fujitsu_init() a bit more palatable.  No
> changes are made to platform device code yet, for clarity these will be
> posted in a separate series after this one gets applied.

I have a preliminary report.  The backlight functionality remains functional
on an S7020 across all four of the patches in this series and with the
additional 2-patch cleanup series applied.

With regard to patch 2/4 you wrote:
> Jonathan, this *really* needs testing on relevant hardware.  After
> applying this patch, you should be able to turn LCD backlight on and off
> using /sys/class/backlight/fujitsu-laptop/bl_power.  Also, the value
> returned by that attribute upon read should be in sync with actual
> backlight state even right after loading the module (i.e. before writing
> anything to bl_power).  Please let me know if any of the above is not
> true and the module works correctly without this patch applied.

With patch 2/4 applied:

 * It is possible to read bl_power

 * It is possible to write a value to bl_power and read that value back

 * Writing values to bl_power does not appear to affect the LCD panel in 
   any way.  That is, the backlight remains unchanged regardless of the 
   value written.

 * Behaviour is the same both under X and from the terminal.

Backing out patch 2/4 but with all others still in place, resulted in no
change in behaviour.  So while bl_power had no effect with patch 2/4 in
place, it seems that patch 2/4 is *not* the cause of this.

I shall run some more bl_power tests and complete a review of the code later
this weekend.

Regards
  jonathan
