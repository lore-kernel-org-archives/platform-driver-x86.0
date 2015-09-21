From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: restore kbd led level after resume
Date: Mon, 21 Sep 2015 10:12:43 -0700
Message-ID: <20150921171243.GB117557@vmdeb7>
References: <1442222190-8591-1-git-send-email-linux@rempel-privat.de>
 <20150918223144.GO66179@vmdeb7>
 <55FCF67B.4020201@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55577 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932611AbbIURMr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Sep 2015 13:12:47 -0400
Content-Disposition: inline
In-Reply-To: <55FCF67B.4020201@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sat, Sep 19, 2015 at 07:45:31AM +0200, Oleksij Rempel wrote:
> Hi,
> 
> Am 19.09.2015 um 00:31 schrieb Darren Hart:
> > On Mon, Sep 14, 2015 at 11:16:30AM +0200, Oleksij Rempel wrote:
> >> Afters suspend/resume cycle with closed lid the kbd backlight level
> >> is lost. This patch will will restore this value to last known level.
> >>
> >> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> > 
> > Hi Oleksij,
> > 
> > Please always run scripts/get_maintainer.pl -f path/to/files/changed
> > 
> > And include *all* the maintainers and lists on Cc. This will ensure a faster
> > response.
> > 
> >> ---
> >>  drivers/platform/x86/asus-wmi.c | 19 +++++++++++++++++--
> >>  1 file changed, 17 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> >> index efbc3f0..1f7d80f 100644
> >> --- a/drivers/platform/x86/asus-wmi.c
> >> +++ b/drivers/platform/x86/asus-wmi.c
> >> @@ -582,7 +582,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
> >>  
> >>  static int asus_wmi_led_init(struct asus_wmi *asus)
> >>  {
> >> -	int rv = 0;
> >> +	int rv = 0, led_val;
> >>  
> >>  	asus->led_workqueue = create_singlethread_workqueue("led_workqueue");
> >>  	if (!asus->led_workqueue)
> >> @@ -602,9 +602,11 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> >>  			goto error;
> >>  	}
> >>  
> >> -	if (kbd_led_read(asus, NULL, NULL) >= 0) {
> >> +	led_val = kbd_led_read(asus, NULL, NULL);
> >> +	if (led_val >= 0) {
> >>  		INIT_WORK(&asus->kbd_led_work, kbd_led_update);
> >>  
> >> +		asus->kbd_led_wk = led_val;
> >>  		asus->kbd_led.name = "asus::kbd_backlight";
> >>  		asus->kbd_led.brightness_set = kbd_led_set;
> >>  		asus->kbd_led.brightness_get = kbd_led_get;
> >> @@ -2160,6 +2162,16 @@ static int asus_hotk_thaw(struct device *device)
> >>  	return 0;
> >>  }
> >>  
> >> +static int asus_hotk_resume(struct device *device)
> >> +{
> >> +	struct asus_wmi *asus = dev_get_drvdata(device);
> >> +
> >> +	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
> > 
> > 	if (asus->kbd_led.dev)
> > 
> > 	should be sufficient, I don't see the dev pointer being stored as an
> > 	errno.
> > 
> > 	Corentin?
> 
> led_classdev_register
>   led_classdev_next_name
>     device_create_with_groups
>       device_create_groups_vargs
>         retval = -ENODEV;
>         retval = -ENOMEM;
>         return ERR_PTR(retval);
>   if (IS_ERR(led_cdev->dev))
> 
> this is how dev pointer is stored as errno.

Ah! Thank you for the correction. Noted.

-- 
Darren Hart
Intel Open Source Technology Center
