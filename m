From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Thu, 06 Aug 2015 11:55:29 -0700
Message-ID: <1438887329.2679.64.camel@perches.com>
References: <1438838165-3791-1-git-send-email-yu.c.chen@intel.com>
	 <1438839022.2679.49.camel@perches.com> <1438860256.2127.37.camel@localhost>
	 <20150805234715.GB34034@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0046.hostedemail.com ([216.40.44.46]:46881 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751324AbbHFSze (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Aug 2015 14:55:34 -0400
In-Reply-To: <20150805234715.GB34034@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, "jslaby@suse.com" <jslaby@suse.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>, "arnd@arndb.de" <arnd@arndb.de>

On Wed, 2015-08-05 at 16:47 -0700, Darren Hart wrote:
> On Thu, Aug 06, 2015 at 11:20:44AM +0000, Chen, Yu C wrote:
[]
> > Is it ok to keep these codes and add comments like:

It's your code Yu, do whatever you think appropriate.

> > /*
> >  * When a button(power button/volume button/home button) is 
> >  * pressed down or released, different ACPI notification codes 
> >  * will be generated. We can distinguish different event code 
> >  * and value of buttons by these notification codes, then pass
> >  * (EV_KEY, event code(key_code), value(pressed)) to input layer.
> >  */
> 
> The commentary is useful regardless. However, I suspect Joe was
> referring to the approach pairing the PRESS and RELEASE cases?
> 

True.

btw Darren, your computer's email time setting seems off.
