From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: peaq-wmi: Add new peaq-wmi driver
Date: Tue, 9 May 2017 14:21:27 -0700
Message-ID: <20170509212127.GA11404@fury>
References: <20170509075431.17864-1-hdegoede@redhat.com>
 <20170509160055.GA17858@fury>
 <4a3f31f9-39d9-efef-342c-30f1aeb7035c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:45540 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750751AbdEIVVa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 17:21:30 -0400
Content-Disposition: inline
In-Reply-To: <4a3f31f9-39d9-efef-342c-30f1aeb7035c@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 09, 2017 at 08:33:13PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 05/09/2017 06:00 PM, Darren Hart wrote:
> > On Tue, May 09, 2017 at 09:54:31AM +0200, Hans de Goede wrote:
> > > PEAQ is a new European OEM, I've bought one of their 2-in-1 x86
> > > devices, which is actually quite a nice device. Under Windows it has
> > > Dolby software for "better" sound and you can select different equalizer
> > > presets using a special button.
> > > 
> > > This WMI interface for this button is not really nice, as it does not do
> > > notifies (it really does not I tripple checked), but since I had already
> > > figured out the entire WMI interface for this I decided to go the full
> > > mile anyways and also implent a WMI based input driver for this using
> > > input_polldev since, well, we need to poll.
> > > 
> > > This commit adds support for this button making it report KEY_SOUND input
> > > events. KEY_SOUND is already used in various places to switch sound into
> > > theatre mode and things like that so it seems appropriate here.
> > > 
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > +Dmitry (in case he wants to add a Reviewed-by, left all context below)
> > 
> > Queued to testing, thanks Hans.
> 
> I just noticed that this is causing dmesg spew about the driver not
> passing enough arguments to the WMBC method (it only consumes 2,
> but apparently its signature says it takes 3). So I need to do a v3
> fixing this, please drop this from your testing branch for now.

Done.
-- 
Darren Hart
VMware Open Source Technology Center
