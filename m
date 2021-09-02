Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8174AC432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 10:19:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68D9B6109E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 10:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243149AbhIBKUn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 06:20:43 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:35139 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243560AbhIBKUm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 06:20:42 -0400
Date:   Thu, 2 Sep 2021 12:19:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1630577983;
        bh=ItIXs+S0TH6s7gJyPypsLHiotAFUD+vcEIyszV5lHqs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mXPQZZYW7gjRC14W2eWUCWZSIAmWz6yqzjSmY0dga0TFdksF80B0WUr7C2iybRsaK
         9PRW/ck9s41M6rJo0I+GxGEoIymne0K46LpUfkMAPg65dNHQHN7ckM2pdffjnQXimL
         B0J0vagSb6ibEW2DtkP4wlW3hE4hidwqGr04rHzE=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, andy.shevchenko@gmail.com,
        hdegoede@redhat.com, mario.limonciello@outlook.com,
        pobrn@protonmail.com, dvhart@infradead.org,
        Aaron Plattner <aplattner@nvidia.com>
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Message-ID: <cac5ceb8-86d3-4f67-bbac-fbaf191d5973@t-8ch.de>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com>
 <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
 <ce05cf8a-9b1f-e3a5-33bb-4f997bc2bcec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce05cf8a-9b1f-e3a5-33bb-4f997bc2bcec@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mi, 2021-09-01T21:12-0500, Daniel Dadap wrote:
> Thanks, Thomas:
> 
> On 9/1/21 4:25 AM, Thomas Weißschuh wrote:
> > Hi Daniel,
> > 
> > a few minor comments, not sure if they should be reason for a reroll.
> 
> 
> I don't mind rerolling until I get an ACK from the maintainer. :)
> 
> 
> > 
> > Thomas
> > 
> > Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>
> > 
> > On Di, 2021-08-31T17:49-0500, Daniel Dadap wrote:
> > > v2: Convert to WMI subsystem driver, suggested by Mario Limonciello
> > >       <mario.limonciello@outlook.com>; various cleanups suggested by
> > >       Barnab??s P??cze <pobrn@protonmail.com>
> > > v3: Address assorted style nits raised by Andy Shevchenko
> > >       <andy.shevchenko@gmail.com> in response to a related patch; remove
> > >       additional behavior change to WMI subsystem from patch series as
> > >       recommended by Hans de Goede <hdegoede@redhat.com>
> > > v4: Use MODULE_DEVICE_TABLE() (Thomas Wei??schuh <thomas@t-8ch.de>)
> > >      Fix scope of internal driver state; various style fixes (Barnab??s
> > >      P??cze, Andy Shevchenko)
> > >      Use devm_backlight_device_register() (Barnab??s P??cze)
> > >      Add kerneldoc comments for enums and structs (Andy Shevchenko)
> > It seems your Mailsetup breaks Unicode.
> 
> 
> Strange. I've just been sending the patches via git email-patch. These
> characters are appearing correctly with my MUA (Thunderbird) in the copy of
> the message I received, so I don't know where in the pipeline they're
> getting corrupted. I'll ignore this problem unless anybody has some specific
> tips on fixing it, since the non-ASCII characters aren't going to actually
> be part of the git history of the patch.

It seems that the encoding of the mail has been set as plain ASCII while it is
actually UTF-8.
Thunderbird is probly correctly inferring the actual encoding.
Normally git-format-patch would detect the Unicode characters and add a
matching content-type header to the patch.
But as these Unicode characters are added after format-patch has run it is now
git-send-emails task to add those headers again.

In my version of git I get the following message from git-send-email:

  The following files are 8bit, but do not declare a Content-Transfer-Encoding.
      0001-....patch
  Which 8bit encoding should I declare [UTF-8]?

As this feature seems to be really old already it should be available.
Is your "git email-patch" using "git send-email"?
Do you have "sendemail.assume8bitEncoding" set in your git config?
(It should either not be set or to UTF-8.

> > > diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
> > > new file mode 100644
> > > index 000000000000..cb1a973803b1
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
> > > @@ -0,0 +1,185 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> > Also 2021?
> 
> 
> The code was originally written in 2020. I'm not certain it's changed
> substantially enough to warrant updating the copyright date. Certainly
> there's no need to change the copyright date every time the file is touched.
> I suppose it wouldn't be wrong to have it read 2020-2021 or the like for the
> initial commit, but I personally prefer just having the initial date unless
> there's stronger guidance to do otherwise.

Ok.

> > 
> > > + */
> > > +
> > > +#include <linux/backlight.h>
> > > +#include <linux/module.h>
> > > +#include <linux/wmi.h>
> > > +
> > > +/**
> > > + * enum wmaa_method - WMI method IDs for ACPI WMAA
> > > + *
> > > + * @WMAA_LEVEL:  Get or set the brightness level,
> > > + *               or get the maximum brightness level.
> > > + * @WMAA_SOURCE: Get the source for backlight control.
> > > + */
> > > +enum wmaa_method {
> > > +	WMAA_LEVEL = 1,
> > > +	WMAA_SOURCE = 2,
> > > +};
> > Nitpick: No need for explicit values here.
> 
> 
> I think at least the 1 is required, but in any case I prefer to be explicit
> here to make it clear that these are the exact values required by the ACPI
> WMAA interface.

As this enum is part of the ABI to the firmware, the values should indeed have
explicit values.  Sorry for the noise.

> > > +
> > > +	if (ret)
> > > +		dev_err(&bd->dev, "ACPI WMAA failed to get backlight level.\n");
> > Would it make sense to log the actual error?
> 
> 
> I think the underlying ACPI error is already logged by wmi_call_wmaa().

Good point, disregard that comment then.

> > Also while the backlight core does not seem to actually handle it, other
> > drivers return a negative errno on failure.
> 
> 
> Thanks, I was aware that the backlight core doesn't seem to handle errors at
> all for .get_brightness, but I didn't think to check for precedent on
> backlight drivers returning error codes anyway. Returning negative errno
> does seem somewhat common amongst backlight drivers, so I'll go ahead and do
> that in case the backlight core is updated to handle them in the future.

FYI I plan on sending a patch that adds the missing errorhandling next week.

> > > +	props.type = BACKLIGHT_PLATFORM;
> > Is this WMI method a standard interface?
> > If so, BACKLIGHT_FIRMWARE might actually fit better and still fulfill the
> > requirements.
> > The actual maintainers would know better than me, though.
> 
> 
> I'm not certain what you mean by standard. It's defined as part of system
> design guidelines that NVIDIA shares with OEMs, but I'm not sure if it's
> part of the ACPI spec. It is implemented by multiple notebook system
> vendors, hence naming the driver after the ACPI method rather than a
> particular vendor. Reading the documentation on the backlight driver types,
> it does seem that this may fall more under the purview of BACKLIGHT_FIRMWARE
> than BACKLIGHT_PLATFORM. I'll go ahead and retest with the driver registered
> as BACKLIGHT_FIRMWARE, but I'm sure it'll still work after inspecting the
> code for at least gnome-settings-daemon, which implements the policy
> recommended by Documentation/ABI/stable/sysfs-class-backlight.

I only went by the comment about "standard firmware interface" from
backlight.h.
This was mostly a pointer for you (and the pdx86 maintainers) to take a look
and decide.

Thomas
