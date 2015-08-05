From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Wed, 5 Aug 2015 16:47:15 -0700
Message-ID: <20150805234715.GB34034@vmdeb7>
References: <1438838165-3791-1-git-send-email-yu.c.chen@intel.com>
 <1438839022.2679.49.camel@perches.com>
 <1438860256.2127.37.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47676 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754254AbbHFR2T (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Aug 2015 13:28:19 -0400
Content-Disposition: inline
In-Reply-To: <1438860256.2127.37.camel@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "joe@perches.com" <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, "jslaby@suse.com" <jslaby@suse.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>, "arnd@arndb.de" <arnd@arndb.de>

On Thu, Aug 06, 2015 at 11:20:44AM +0000, Chen, Yu C wrote:
> Thanks Joe,
> On Wed, 2015-08-05 at 22:30 -0700, Joe Perches wrote:
> > On Thu, 2015-08-06 at 13:16 +0800, Chen Yu wrote:
> > > Since Surface Pro 3 does not follow the specs of "Windows ACPI Design
> > > Guide for SoC Platform", code in drivers/input/misc/soc_array.c can
> > > not detect these buttons on it.
> > 
> > style trivia:
> > 
> > > diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
> > []
> > > +static void surface_button_notify(struct acpi_device *device, u32 event)
> > > +{
> > []
> > > +	switch (event) {
> > > +	case SURFACE_BUTTON_NOTIFY_PRESS_POWER:
> > > +		pressed = true;
> > > +		/*go through*/
> > 
> > /* fall through */ is more common
> > 
> OK.
> > > +	case SURFACE_BUTTON_NOTIFY_PRESS_HOME:
> > > +		pressed = true;
> > > +	case SURFACE_BUTTON_NOTIFY_RELEASE_HOME:
> > > +		key_code = KEY_LEFTMETA;
> > > +		break;
> > 
> > It may be better to add a comment about the style or
> > maybe add a macro like
> > 
> > #define HANDLE_SURFACE_BUTTON_NOTIFY(type, code)	\
> > 	case SURFACE_BUTTON_NOTIFY_PRESS_##type:	\
> > 		pressed = true;	/* and fall-through */	\
> > 	case SURFACE_BUTTON_NOTIFY_RELEASE_##type:	\
> > 		key_code = code;			\
> > 		break;
> > 
> WRT macro HANDLE_SURFACE_BUTTON_NOTIFY, the checkpatch.pl
> complains that multi lines of codes should be wrapped in 'do
> while'state, but doing like this might lead to incorrect semantic.
> Is it ok to keep these codes and add comments like:
> /*
>  * When a button(power button/volume button/home button) is 
>  * pressed down or released, different ACPI notification codes 
>  * will be generated. We can distinguish different event code 
>  * and value of buttons by these notification codes, then pass
>  * (EV_KEY, event code(key_code), value(pressed)) to input layer.
>  */

The commentary is useful regardless. However, I suspect Joe was
referring to the approach pairing the PRESS and RELEASE cases?

-- 
Darren Hart
Intel Open Source Technology Center
