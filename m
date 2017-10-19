From: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
Subject: RE: [PATCH v2] dell-laptop: Fix keyboard led =?UTF-8?Q?max=5Fbrightness?=
 =?UTF-8?Q?=20property=20for=20Dell=20Latitude=20E=36=34=31=30?=
Date: Thu, 19 Oct 2017 11:20:35 -0700
Message-ID: <20171019112035.669a95d04dbb6b53be537852cb8ecb8c.17664360de.wbe@email22.secureserver.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from p3plsmtp22-02-2.prod.phx3.secureserver.net ([68.178.252.56]:39502
        "EHLO p3plwbeout22-02.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752298AbdJSSVI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2017 14:21:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Pali =?UTF-8?Q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

-------- Original Message --------
Subject: Re: [PATCH v2] dell-laptop: Fix keyboard led max_brightness
property for Dell Latitude E6410
From: Darren Hart <dvhart@infradead.org>
Date: Wed, October 18, 2017 3:00 pm
To: Pali Rohár <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko
<andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>,
Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com,
platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 18, 2017 at 08:06:01PM +0200, Pali Rohár wrote:
> This machine reports number of keyboard backlight led levels, instead of
> value of the last led level index. Therefore max_brightness properly needs
> to be subtracted by 1 to match led max_brightness API.
> 
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=196913
> ---
> Changes since v1:
> * Update kbd_info.levels at initialization time based on quirk

This looks much cleaner IMO, thanks.

> ---
> drivers/platform/x86/dell-laptop.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index f42159f..3f9be8a 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -49,6 +49,7 @@
> 
> struct quirk_entry {
> u8 touchpad_led;
> + u8 kbd_led_num_of_levels_instead_of_last_index;

OK, I forgot to comment on this one :-)

A name should be descriptive, but that's just too much. So let's use
something
shorter, and add a comment if one is really needed to explain what it
is.
Something like:

u8 kbd_led_reports_num_levels is shorter, but still awfully long.

u8 kbd_led_num_levels is shorter, but obviously looks like it should be
the
levels value instead of a bool. So the above is probably best.


> 
> int needs_kbd_timeouts;
> /*
> @@ -79,6 +80,10 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
> .kbd_timeouts = { 0, 5, 15, 60, 5 * 60, 15 * 60, -1 },
> };
> 
> +static struct quirk_entry quirk_dell_latitude_e6410 = {
> + .kbd_led_num_of_levels_instead_of_last_index = 1,
> +};
> +
> static struct platform_driver platform_driver = {
> .driver = {
> .name = "dell-laptop",
> @@ -280,6 +285,15 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
> },
> .driver_data = &quirk_dell_xps13_9333,
> },
> + {
> + .callback = dmi_matched,
> + .ident = "Dell Latitude E6410",
> + .matches = {
> + DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> + DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6410"),
> + },
> + .driver_data = &quirk_dell_latitude_e6410,
> + },
> { }
> };
> 
> @@ -1200,6 +1214,9 @@ static int kbd_get_info(struct kbd_info *info)
> units = (buffer->output[2] >> 8) & 0xFF;
> info->levels = (buffer->output[2] >> 16) & 0xFF;
> 
> + if (quirks && quirks->kbd_led_num_of_levels_instead_of_last_index && info->levels)
> + info->levels--;
> +
> if (units & BIT(0))
> info->seconds = (buffer->output[3] >> 0) & 0xFF;
> if (units & BIT(1))
> -- 
> 1.7.9.5
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
-------- End Original Message --------

I will be happy to test out whichever patch(es) present the most
appropriate approach, as a matter of consensus.

Would that be the PATCH v2
(https://patchwork.kernel.org/patch/10015149/) that I should be testing?

thanks,
- Gabriel
