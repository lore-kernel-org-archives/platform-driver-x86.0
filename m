From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Lenovo IdeaPAD ACPI driver
Date: Wed, 11 Aug 2010 14:55:20 +0100
Message-ID: <1281534920.3236.12.camel@localhost>
References: <1281480758.5887.33.camel@localhost>
	 <AANLkTin=Dwbe3gPDGd89Oc25mfOVVvc2_goP77sSVNeo@mail.gmail.com>
	 <1281533999.3236.8.camel@localhost>
	 <AANLkTinBqq+0rDE8DM0wz-FvUQqzH2Rf0F=YJgqVLHqM@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:51408 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752430Ab0HKNzX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Aug 2010 09:55:23 -0400
In-Reply-To: <AANLkTinBqq+0rDE8DM0wz-FvUQqzH2Rf0F=YJgqVLHqM@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Wed, 2010-08-11 at 15:51 +0200, Corentin Chary wrote:
> On Wed, Aug 11, 2010 at 3:39 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> > On Wed, 2010-08-11 at 14:59 +0200, Corentin Chary wrote:
> >> I'd suggest to name it ideapad-laptop (IDEAPAD_LAPTOP). We try to use
> >> that name for laptop related drivers.
> >
> > OK.
> >
> >> But ... new WMI drivers are named with the *-wmi suffix. So I'm not
> >> really sure. Anyway, it's not really important.
> >
> > It doesn't do any WMI stuff... yet. I was looking at your discussion
> > from April and hoping you'd help make it work...
> 
> I'd suggest you to read http://lwn.net/Articles/391230/  :)

Ah, thanks. I'd seen Matthew's article on basic ACPI drivers, but hadn't
seen this one.

> And you should probably make it a platform driver (being the parent of
> acpi, wmi, input, backlight, rfkill, etc..).

I had faked a platform device to start with, but got rid of it as soon
as I had the acpi_device to use instead.

> Is there a lot of thing hidden in ACPI / WMI on these models (like
> hotkeys, backlight, light sensors)  ?

I think so, yes. My primary focus was the rfkill, which was breaking
wireless connectivity unless we have a way to turn it off -- but now I'm
here I may as well see what else I can do with it.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
