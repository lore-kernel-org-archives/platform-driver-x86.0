From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 01/12] platform/x86: dell-wmi: label driver as handling
 notifications
Date: Wed, 27 Sep 2017 08:43:07 -0700
Message-ID: <20170927154307.GB23572@fury>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <2c923ea1cdb0a336bf849fa8a2d81bb93060fccb.1505999739.git.mario.limonciello@dell.com>
 <20170925160405.GG22190@pali>
 <b8a5426211c541f8bcd938069a268a4d@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40034 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752931AbdI0PnJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 11:43:09 -0400
Content-Disposition: inline
In-Reply-To: <b8a5426211c541f8bcd938069a268a4d@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

On Mon, Sep 25, 2017 at 08:14:00PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Monday, September 25, 2017 12:04 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platform-driver-
> > x86@vger.kernel.org; quasisec@google.com
> > Subject: Re: [PATCH 01/12] platform/x86: dell-wmi: label driver as handling
> > notifications
> > 
> > On Thursday 21 September 2017 08:57:06 Mario Limonciello wrote:
> > > This driver serves the purpose of responding to WMI based notifications
> > > from the DELL_EVENT_GUID (9DBB5994-A997-11DA-B012-B622A1EF5492).
> > > Other GUIDs will be handled by separate drivers.
> > >
> > > Update the language used by this driver to avoid future confusion.
> > 
> > Hi! I'm not sure if if "notifications" word is better then "extras".
> > Basically the most important part of the dell-wmi driver is to deliver
> > key press events via input device.
> > 
> > Has anybody else better word or description for this?
> > 
> I was actually tempted to rename the driver itself to dell-wmi-notifications.
> Realistically it is hooking up to the notifications _WED0 AML method so yes
> it is picking up notifications exclusively.
> 
> I thought about this too, but I can also envision that the notifications that
> come through this driver that aren't consumed by the kernel for keypress
> purposes are also useful to user space potentially.  It's not part of this series
> but maybe in the future providing those through a character device too may
> make sense.

Naming is hard, but this seems like a reasonable refinement without
over-specifying.

-- 
Darren Hart
VMware Open Source Technology Center
