From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: topstar-laptop: add optional WLAN
 LED workaround
Date: Wed, 8 Nov 2017 01:25:26 +0100
Message-ID: <20171108002526.GA17436@localhost>
References: <cover.1509229280.git.gdouezangrard@gmail.com>
 <4bfdea8bba83cd8f7fcdfdeee283f24574e4866d.1509229280.git.gdouezangrard@gmail.com>
 <CAHp75VdN2PDDKsAM8qp1ssZB+K_zgwvJBKK7UEVvsSHV_cK73g@mail.gmail.com>
 <20171103150735.GA13165@localhost>
 <CAHp75VdGZPZbVUSavq7VwTprtedH7hP56UQf8zPWn9dp-ViJCg@mail.gmail.com>
 <20171105223443.GF24317@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:44937 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751714AbdKHAZf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Nov 2017 19:25:35 -0500
Content-Disposition: inline
In-Reply-To: <20171105223443.GF24317@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Nov 05, 2017 at 02:34:43PM -0800, Darren Hart wrote:
> On Sun, Nov 05, 2017 at 03:28:09PM +0200, Andy Shevchenko wrote:
> > On Fri, Nov 3, 2017 at 5:07 PM, Guillaume Douézan-Grard
> > <gdouezangrard@gmail.com> wrote:
> > > On Fri, Nov 03, 2017 at 02:50:52PM +0200, Andy Shevchenko wrote:
> > >> On Sun, Oct 29, 2017 at 1:53 AM, Guillaume Douézan-Grard
> > >> <gdouezangrard@gmail.com> wrote:
> > >> > Topstar U931 laptops provide an LED synced with the WLAN adapter
> > >> > hard-blocking state. Unfortunately, some models seem to be defective,
> > >> > making impossible to hard-block the adapter with the WLAN switch and
> > >> > thus the LED is useless.
> > >> >
> > >> > An ACPI method is available to programmatically control this switch and
> > >> > it indirectly allows to control the LED.
> > >> >
> > >> > This commit registers the LED within the corresponding subsystem, making
> > >> > possible for instance to use an rfkill-based trigger to synchronize the
> > >> > LED with the soft-blocking state.
> > >> >
> > >> > This feature is disabled by default and can be enabled with the
> > >> > `led_workaround` module parameter.
> > >>
> > >> >  #include <linux/platform_device.h>
> > >> >  #include <linux/input.h>
> > >> >  #include <linux/input/sparse-keymap.h>
> > >> > +#include <linux/leds.h>
> > >>
> > >> Yep, exact place, esp. after moving platform_device to the right place.
> > >>
> > >> > +static bool led_workaround;
> > >> > +module_param_named(led_workaround, led_workaround, bool, 0444);
> > >> > +MODULE_PARM_DESC(led_workaround,
> > >> > +               "Enables software-based WLAN LED control on systems with defective hardware switch");
> > >>
> > >> So, this is most problematic piece in the series.
> > >>
> > >> We are not encouraging module parameters. Why do we need one? Can't be
> > >> detected automatically (perhaps based on DMI strings)?
> > >
> > > Darren told me that.
> > 
> > > I tried to answer this question in the cover letter:
> > 
> > Perhaps it makes sense to put this explanation in the commit message.
> > 
> > > "These are barebone laptops, sold under quite a lot of brands and
> > > configurations, with different firmwares and so on. I can only say for sure
> > > that this issue is present for all the models sold under a specific brand,
> > > that's why I'm reluctant to enable this by default with a DMI check."
> > >
> > > In my case for instance, the DMI info has not been filled in by the retailler
> > > since I only have the ODM base board information to identify a model.
> > 
> > I see. I would like to have a consensus on this one with Darren, the
> > rest (after addressing comments) looks good to me.
> 
> If you can definitively say that all models of brand X and this HID have this
> quirk, that is considerably better than a lot of quirks we deal with today. I
> suggest doing that and holding off on the option. If it gets to the point where
> a number otherwise unidentifiable systems have this problem, we can add the
> option then.

Thanks for your reviews.

I replaced the module parameter with a board name/version DMI check,
that will be included for the new patch serie.

Signed-off-by: Guillaume Douézan-Grard <gdouezangrard@gmail.com>
---
 drivers/platform/x86/topstar-laptop.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index 0ed1ce404ea1..72433cfdf231 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
@@ -26,15 +27,12 @@
 
 #define TOPSTAR_LAPTOP_CLASS "topstar"
 
-static bool led_workaround;
-module_param_named(led_workaround, led_workaround, bool, 0444);
-MODULE_PARM_DESC(led_workaround,
-		"Enables software-based WLAN LED control on systems with defective hardware switch");
-
 struct topstar_laptop {
 	struct acpi_device *device;
 	struct platform_device *platform;
 	struct input_dev *input;
+
+	bool led_registered;
 	struct led_classdev led;
 };
 
@@ -291,10 +289,16 @@ static int topstar_acpi_add(struct acpi_device *device)
 	if (err)
 		goto err_platform_exit;
 
-	if (led_workaround) {
+	/*
+	 * Enable software-based WLAN LED control on systems with defective
+	 * hardware switch.
+	 */
+	if (dmi_match(DMI_BOARD_NAME, "U931")
+			&& dmi_match(DMI_BOARD_VERSION, "RVP7")) {
 		err = topstar_led_init(topstar);
 		if (err)
 			goto err_input_exit;
+		topstar->led_registered = true;
 	}
 
 	return 0;
@@ -314,7 +318,7 @@ static int topstar_acpi_remove(struct acpi_device *device)
 {
 	struct topstar_laptop *topstar = acpi_driver_data(device);
 
-	if (led_workaround)
+	if (topstar->led_registered)
 		topstar_led_exit(topstar);
 
 	topstar_input_exit(topstar);
-- 
2.15.0
