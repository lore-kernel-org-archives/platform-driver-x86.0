From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 4/4] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Thu, 23 Mar 2017 09:58:00 +0100
Message-ID: <20170323085800.GD22916@pali>
References: <20170316105535.8885-1-hdegoede@redhat.com>
 <201703191610.38557@pali>
 <16957a6a-be85-8771-2000-978c4bc88270@redhat.com>
 <201703191911.43694@pali>
 <20170322165904.GB17578@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:37711 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933284AbdCWI6E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Mar 2017 04:58:04 -0400
Received: by mail-wm0-f48.google.com with SMTP id n11so56547086wma.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2017 01:58:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170322165904.GB17578@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

On Wednesday 22 March 2017 09:59:04 Darren Hart wrote:
> On Sun, Mar 19, 2017 at 07:11:43PM +0100, Pali Rohár wrote:
> > On Sunday 19 March 2017 19:06:19 Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 19-03-17 16:10, Pali Rohár wrote:
> > > > On Thursday 16 March 2017 11:55:35 Hans de Goede wrote:
> > > >> Changes in v9:
> > > >> -Only listen to type 0x0010 kbd-led events in dell-wmi.c, these
> > > >> only trigger on hotkey presses
> > > >> -Drop the new / previous brightness comparison from dell-laptop.c
> > > >> now that we only get events on hotkey presses it is no longer
> > > >> necessary ---
> > > > 
> > > > Hi! I'm really not sure if this change is correct there.
> > > > 
> > > > Now you are only listening for keypress "change kbd backlight", but
> > > > some dell machines could change keyboard backlight also in other
> > > > different situations, like attaching AC adapter. I guess (but I'm
> > > > not sure) this probably does not send keypress event.
> > > 
> > > I'm not aware of any Dells doing such a thing, if we encounter any
> > > then we can deal with that if and when that happens.
> > 
> > Ok, go ahead. We can fix issues when appear later.
> 
> These are queued to testing.
> 
> Pali, I can only add a tag from you if you provide it in email. If you want your
> reviewed by on these, please include that in your replies.

Sorry, add my Acked-by.

-- 
Pali Rohár
pali.rohar@gmail.com
