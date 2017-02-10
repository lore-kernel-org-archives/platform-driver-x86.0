From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Fri, 10 Feb 2017 10:46:17 +1030
Message-ID: <20170210001616.GH1950@marvin.atrad.com.au>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:34348 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751410AbdBJARl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Feb 2017 19:17:41 -0500
Content-Disposition: inline
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 08, 2017 at 02:46:23PM +0100, Micha?? K??pie?? wrote:
> This series of patches was originally submitted by Alan Jenkins in
> September 2009. ...

I have applied and tested this patch series on an S7020.  Being an older
model (and the one the driver was originally targetting) means that many
driver functions cannot be tested because the respective hardware isn't
present.  However, the driver was correctly loaded and the backlight
controls continue to work as they should.  That is, I see no regressions on
the S7020 hardware.

Patches 1-6 are essentially renames to tidy up the naming convention used
throughout the driver.  The original names date to the first implementation
which targeted more limited hardware than what we have now, hence the need
to generalise some of the fields, structure names and so on with the benefit
of hindsight.

Patch 7: I agree with this approach.  There's no need to clobber the actual
error code from acpi_bus_register_driver().

Patch 8: Good.  I can confirm that the backlight device is correctly
registered when FUJ02B1 is present.  I couldn't test the case where FUJ02B1
is not present because my hardware has the FUJ02B1 device, but can see no
reason why it won't work as described.

Patch 9: I think the original reasoning was that SBL2 was only ever seen on
laptops which required the hotkey keycode overrides.  However, testing for
SBL2 across all models should not change practical behaviour.  It also
breaks the somewhat arbitrary dependency between SBL2 and the need for
overrides which may not hold true for future hardware.

Patch 10: Agreed, there is no longer a need for these MODULE_ALIAS entries.

In summary, I see no issues with this patch series which provides a much
needed clean up of the code and naming conventions within the fujitsu-laptop
driver.  I'm happy for this series (patches 1-10/10) to be applied.

Signed-off-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
