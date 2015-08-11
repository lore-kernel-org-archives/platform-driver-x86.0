From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] [v2] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Mon, 10 Aug 2015 19:45:24 -0700
Message-ID: <20150811024524.GA3095@vmdeb7>
References: <1438934272-17959-1-git-send-email-yu.c.chen@intel.com>
 <1438936078.2322.29.camel@perches.com>
 <1438937513.2723.10.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56864 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932991AbbHKCqx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Aug 2015 22:46:53 -0400
Content-Disposition: inline
In-Reply-To: <1438937513.2723.10.camel@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "joe@perches.com" <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, "jslaby@suse.com" <jslaby@suse.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>, "arnd@arndb.de" <arnd@arndb.de>

On Fri, Aug 07, 2015 at 08:48:18AM +0000, Chen, Yu C wrote:
> On Fri, 2015-08-07 at 01:27 -0700, Joe Perches wrote:
> > On Fri, 2015-08-07 at 15:57 +0800, Chen Yu wrote:					\
> > > +	ret;							\
> > > +})
> > 
> > This seems a bit complicated.
> > 
> > The else ret = 0 isn't necessary as it's initialized to 0.
> > bool might be better than int.
> > 
> Got.
> > > +static void surface_button_notify(struct acpi_device *device, u32 event)
> > > +{
> > > +	struct surface_button *button = acpi_driver_data(device);
> > > +	struct input_dev *input;
> > > +	int key_code = KEY_RESERVED;
> > > +	bool pressed = false;
> > > +
> > > +	if (!handle_surface_button_notify(POWER, KEY_POWER) &&
> > > +		!handle_surface_button_notify(HOME, KEY_LEFTMETA) &&
> > > +		!handle_surface_button_notify(VOLUME_UP, KEY_VOLUMEUP) &&
> > > +		!handle_surface_button_notify(VOLUME_DOWN, KEY_VOLUMEDOWN))
> > > +		dev_info_ratelimited(&device->dev,
> > > +			"Unsupported event [0x%x]\n", event);
> > 
> > Some might prefer alignment to the open parenthesis:
> > 
> > 	if (!handle_surface_button_notify(POWER, KEY_POWER) &&
> > 	    !handle_surface_button_notify(HOME, KEY_LEFTMETA) &&
> > 	    !handle_surface_button_notify(VOLUME_UP, KEY_VOLUMEUP) &&
> > 	    !handle_surface_button_notify(VOLUME_DOWN, KEY_VOLUMEDOWN))
> > 
> > I think the older switch/case was easier to understand.
> > 
> OK, then let's keep the switch/case.
> thanks.

Agreed.


-- 
Darren Hart
Intel Open Source Technology Center
