From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: provide access to ALS control
Date: Wed, 25 May 2016 13:25:38 -0700
Message-ID: <20160525202538.GB109010@f23x64.localdomain>
References: <1459510521-4682-1-git-send-email-linux@rempel-privat.de>
 <20160410030633.GB18689@dvhart-mobl5.amr.corp.intel.com>
 <570D2C0B.1010409@rempel-privat.de>
 <CAHR064hWV8v826gGzQYUOe2Zv8w9mYxo1sg90Gz4M32E6ojuQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35005 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbcEYUZk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 16:25:40 -0400
Content-Disposition: inline
In-Reply-To: <CAHR064hWV8v826gGzQYUOe2Zv8w9mYxo1sg90Gz4M32E6ojuQA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Oleksij Rempel <linux@rempel-privat.de>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Wed, May 25, 2016 at 09:08:25AM +0200, Corentin Chary wrote:
> On Tue, Apr 12, 2016 at 7:10 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
> >
> > Am 10.04.2016 um 05:06 schrieb Darren Hart:
> > > On Fri, Apr 01, 2016 at 01:35:21PM +0200, Oleksij Rempel wrote:
> > >> Asus Zenbook ux31a is providing ACPI0008 interface for ALS
> > >> (Ambient Light Sensor), which is accessible for OS => Win 7.
> > >> This sensor can be used with iio/acpi-als driver.
> > >> Since it is disabled by default, we should use asus-wmi
> > >> interface to enable it.
> > >>
> > >
> > > Corentin, any concerns?
> > >
> > >> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> > >> ---
> > >>  drivers/platform/x86/asus-wmi.c | 5 +++++
> > >>  1 file changed, 5 insertions(+)
> > >>
> > >> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > >> index a96630d..a26dca3 100644
> > >> --- a/drivers/platform/x86/asus-wmi.c
> > >> +++ b/drivers/platform/x86/asus-wmi.c
> > >> @@ -114,6 +114,7 @@ MODULE_LICENSE("GPL");
> > >>  #define ASUS_WMI_DEVID_LED6         0x00020016
> > >>
> > >>  /* Backlight and Brightness */
> > >> +#define ASUS_WMI_DEVID_ALS_ENABLE   0x00050001 /* Ambient Light Sensor */
> > >>  #define ASUS_WMI_DEVID_BACKLIGHT    0x00050011
> > >>  #define ASUS_WMI_DEVID_BRIGHTNESS   0x00050012
> > >>  #define ASUS_WMI_DEVID_KBD_BACKLIGHT        0x00050021
> > >
> > > Following this is:
> > >
> > > #define ASUS_WMI_DEVID_LIGHT_SENSOR   0x00050022 /* ?? */
> > >
> > > Is there any relationship with this patch and that device? It would be useful to
> > > understand the difference between these two DEVIDs (a comment in the source).
> >
> > I don't have this ID on my laptop. Hard to say what is it.
> >
> 
> I believe I found out this was somehow related to light sensors
> because the WMI device contained that kind of information, but it's
> likely that Asus didn't use this ID in a consistent way.

Thanks for the follow-up. This one is already queued for 4.7.
-- 
Darren Hart
Intel Open Source Technology Center
