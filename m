From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v9 4/4] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Wed, 22 Mar 2017 09:53:40 -0700
Message-ID: <20170322165340.GA17578@localhost.localdomain>
References: <20170316105535.8885-1-hdegoede@redhat.com>
 <20170316105535.8885-4-hdegoede@redhat.com>
 <201703191610.38557@pali>
 <16957a6a-be85-8771-2000-978c4bc88270@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52679 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759571AbdCVRU3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2017 13:20:29 -0400
Content-Disposition: inline
In-Reply-To: <16957a6a-be85-8771-2000-978c4bc88270@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

On Sun, Mar 19, 2017 at 07:06:19PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 19-03-17 16:10, Pali Rohár wrote:
> > On Thursday 16 March 2017 11:55:35 Hans de Goede wrote:
> > > Changes in v9:
> > > -Only listen to type 0x0010 kbd-led events in dell-wmi.c, these only
> > > trigger on hotkey presses
> > > -Drop the new / previous brightness comparison from dell-laptop.c now
> > > that we only get events on hotkey presses it is no longer necessary
> > > ---
> > 
> > Hi! I'm really not sure if this change is correct there.
> > 
> > Now you are only listening for keypress "change kbd backlight", but some
> > dell machines could change keyboard backlight also in other different
> > situations, like attaching AC adapter. I guess (but I'm not sure) this
> > probably does not send keypress event.
> 
> I'm not aware of any Dells doing such a thing, if we encounter any then
> we can deal with that if and when that happens.

In general, let's always focus on what we know and can test. Hypotheticals with
these drivers will trap us in endless loops of discussions that ultimately just
prevent us from moving forward.

-- 
Darren Hart
VMware Open Source Technology Center
