From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] samsung-laptop: Add use_native_backlight quirk, and
 enable it on some models
Date: Tue, 13 Jan 2015 09:53:12 -0800
Message-ID: <20150113175312.GA130525@vmdeb7>
References: <1420812601-7983-1-git-send-email-hdegoede@redhat.com>
 <20150113040308.GA98306@vmdeb7>
 <54B4CC75.4030807@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55195 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751347AbbAMRxO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Jan 2015 12:53:14 -0500
Content-Disposition: inline
In-Reply-To: <54B4CC75.4030807@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Bertrik Sikken <bertrik@sikken.nl>

On Tue, Jan 13, 2015 at 08:42:45AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 13-01-15 05:03, Darren Hart wrote:
> >On Fri, Jan 09, 2015 at 03:10:01PM +0100, Hans de Goede wrote:
> >>Since kernel 3.14 the backlight control has been broken on various Samsung
> >>Atom based netbooks. This has been bisected and this problem happens since
> >>commit b35684b8fa94 ("drm/i915: do full backlight setup at enable time")
> >>
> >>This has been reported and discussed in detail here:
> >>http://lists.freedesktop.org/archives/intel-gfx/2014-July/049395.html
> >>
> >>Unfortunately no-one has been able to fix this. This only affects Samsung
> >>Atom netbooks, and the Linux kernel and the BIOS of those laptops have never
> >>worked well together. All affected laptops already have a quirk to avoid using
> >>the standard acpi-video interface and instead use the samsung specific SABI
> >>interface which samsung-laptop uses. It seems that recent fixes to the i915
> >>driver have also broken backlight control through the SABI interface.
> >>
> >>The intel_backlight driver OTOH works fine, and also allows for finer grained
> >>backlight control. So add a new use_native_backlight quirk, and replace the
> >>broken_acpi_video quirk with this quirk for affected models. This new quirk
> >>disables acpi-video as before and also stops samsung-laptop from registering
> >
> >
> >I take this to me this quirk is broken_acpi_video && use_native_backlight.
> 
> In what it does yes, but I've chosen to make it a standalone quirk named after
> the acpi/video.c use_native_backlight option, which also disables both acpi-video
> and vendor backlight interfaces, so for consistency I'm using the same setup here.
> 
> We cannot use the acpi/video.c option here because that option, which is on by
> default, only triggers on win8 ready BIOS-es and these machines do not have such
> a BIOS.
> 
> Eventually I would like to see the acpi/video.c code switch away from having
> the 2 semi-orthogonal kernel cmdline options it currently has, which are
> acpi_backlight=[vendor|video] vs video.use_native_backlight=[0|1], while what
> we really have is just three options:
> 
> acpi_backlight=[vendor|video|native]
> 
> I've explained what I would like to see happen / think needs to happen to clean
> up this mess here: https://lkml.org/lkml/2014/12/27/54
> 
> So the way I see it the broken_acpi_video quirks means use acpi_backlight=vendor
> where as the new use_native_backlight option means acpi_backlight=native, and
> eventually these 2 quirks would end up in just one call in samsung-laptop.c, which
> says:
> 
> acpi_video_set_backlight_type(acpi_video_backlight_vendor);
> 
> resp:
> 
> acpi_video_set_backlight_type(acpi_video_backlight_native);
> 
> So I really see this as an either or thing, yes native implies disabling
> acpi_video# but that does not mean that it is the same thing as vendor.

Thank you for the detailed response. Queued for 3.20.

-- 
Darren Hart
Intel Open Source Technology Center
