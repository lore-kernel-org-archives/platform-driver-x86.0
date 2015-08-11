From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Mon, 10 Aug 2015 19:56:51 -0700
Message-ID: <20150811025651.GB3095@vmdeb7>
References: <1438838165-3791-1-git-send-email-yu.c.chen@intel.com>
 <1438839022.2679.49.camel@perches.com>
 <1438860256.2127.37.camel@localhost>
 <20150805234715.GB34034@vmdeb7>
 <1438887329.2679.64.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33652 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933433AbbHKC6U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Aug 2015 22:58:20 -0400
Content-Disposition: inline
In-Reply-To: <1438887329.2679.64.camel@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, "jslaby@suse.com" <jslaby@suse.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>, "arnd@arndb.de" <arnd@arndb.de>

On Thu, Aug 06, 2015 at 11:55:29AM -0700, Joe Perches wrote:
> On Wed, 2015-08-05 at 16:47 -0700, Darren Hart wrote:
> > On Thu, Aug 06, 2015 at 11:20:44AM +0000, Chen, Yu C wrote:
> []
> > > Is it ok to keep these codes and add comments like:
> 
> It's your code Yu, do whatever you think appropriate.
> 
> > > /*
> > >  * When a button(power button/volume button/home button) is 
> > >  * pressed down or released, different ACPI notification codes 
> > >  * will be generated. We can distinguish different event code 
> > >  * and value of buttons by these notification codes, then pass
> > >  * (EV_KEY, event code(key_code), value(pressed)) to input layer.
> > >  */
> > 
> > The commentary is useful regardless. However, I suspect Joe was
> > referring to the approach pairing the PRESS and RELEASE cases?
> > 
> 
> True.
> 
> btw Darren, your computer's email time setting seems off.

Nothing gets past kernel devs! Corporate firewall broke ntp for Linux VM from
where I sent this, didn't notice until too late.

-- 
Darren Hart
Intel Open Source Technology Center
