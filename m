From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] platform/x86: silead_dmi: Add touchscreen info for
 PoV mobii wintab p800w
Date: Fri, 16 Jun 2017 16:38:29 -0700
Message-ID: <20170616233829.GA16249@fury>
References: <20170615064832.4148-1-hdegoede@redhat.com>
 <20170615165311.GF22450@fury>
 <CAHp75VeMN3eeQPbxive1JO2iGKr4g0g5RByoRTpZCpCjYvAb3A@mail.gmail.com>
 <7ea77786-beed-2bc5-9b93-4d2ee05a2d9c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:37208 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750927AbdFPXid (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 19:38:33 -0400
Content-Disposition: inline
In-Reply-To: <7ea77786-beed-2bc5-9b93-4d2ee05a2d9c@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 16, 2017 at 03:22:45PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 16-06-17 14:44, Andy Shevchenko wrote:
> > On Thu, Jun 15, 2017 at 7:53 PM, Darren Hart <dvhart@infradead.org> wrote:
> > > On Thu, Jun 15, 2017 at 08:48:31AM +0200, Hans de Goede wrote:
> > 
> > > > +             /* Point of View mobii wintab p800w */
> > > > +             .driver_data = (void *)&pov_mobii_wintab_p800w_data,
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
> > > > +                     DMI_MATCH(DMI_BIOS_VERSION, "3BAIR1013"),
> > > > +                     /* Above matches are too generic, add bios-date match */
> > > > +                     DMI_MATCH(DMI_BIOS_DATE, "08/22/2014"),
> > > 
> > > This is the first time I've seen a BIOS date match used to determine hardware
> > > features. DMI matching is a (necessary) hack to begin with (the vendors should
> > > be providing this data via ACPI _DSD anyway) but a date match means we would
> > > need a kernel patch every time one of these tablets gets a BIOS update...
> > > 
> > > With words like "Aptio CRB" it's clear the vendor isn't doing their job and just
> > > using unmodified reference code. The problem with this of course is that the
> > > vendor is not providing a way to identify this hardware.
> > > 
> > > Andy, I'd appreciate your thoughts on this... I'm leaning towards not accepting
> > > bios date (or indeed, BIOS version) as a way to identify a platform.
> > 
> > The question is what is the anticipated amount of affected devices
> > with BIOS date included and otherwise?
> 
> I expect there to be collisions (false positive matches) without the
> BIOS_DATE check, a quick web-search finds other devices with a
> 3BAIR1013 bios version. Those don't necessarily also use a Silead
> touchscreen (which is needed for a collision to happen), but given
> the popularity of Silead touchscreens on cheap devices a collision
> is not unlikely.
> 
> With the bios-date check added, I expect this match to be unique,
> for it to not be unique we would need to be really unlucky.
> 
> > If Hans believes that there will be no update for some devices,
> 
> Yeah I'm pretty sure this specific device will not see any
> BIOS updates ever.
> 
> > while there are devices with the same DMI strings, but different date and
> > _fixed_ issue, I think we have no other choice for now.
> > Also can we use some other strings to distinguish group of devices
> > which are affected?
> 
> bios_date: 08/22/2014
> bios_vendor: American Megatrends Inc.
> bios_version: 3BAIR1013
> board_asset_tag: To be filled by O.E.M.
> board_name: Aptio CRB
> board_serial: T80091A4C11B0848
> board_vendor: AMI Corporation
> board_version: To be filled by O.E.M.
> chassis_asset_tag: To Be Filled By O.E.M.
> chassis_serial: To Be Filled By O.E.M.
> chassis_type: 3
> chassis_vendor: To Be Filled By O.E.M.
> chassis_version: To Be Filled By O.E.M.
> product_name: To be filled by O.E.M.
> product_serial: To be filled by O.E.M.
> product_uuid: 03000200-0400-0500-0006-000700080009
> product_version: To be filled by O.E.M.
> sys_vendor: To be filled by O.E.M.
> 
> The product-uuid is a known example uuid, so is
> no good. The board_serial might be useful, but
> only if it is unique for the model and not per
> tablet. Unfortunately I only have 1 of these
> tablets, so I cannot tell.

Do we have any indication that this BIOS Date isn't just the default value
provided by AMI? Does it offer any more information than the BIOS Version?

I suppose we may be able to do some kind of a partial match on the Board Serial
if even that is platform specific (I suspect it is with the T800 at the
beginning.

The sloppy handling of this firmware really irks me. That's obviously not Hans'
fault, so we'll take the patch. If we see a conflict in the future, we'll just
have to compare the other DMI strings for a match and see what we can do.... I'm
even tempted to insert a printk on this match, dumping the DMI values and
requesting the user to copy.paste them into an email to this list....

I think we've already spent too much time on this patch based on this review:
https://www.notebookcheck.net/Point-of-View-Mobii-WinTab-800W-Tablet-Review.129561.0.html

Nice...

-- 
Darren Hart
VMware Open Source Technology Center
