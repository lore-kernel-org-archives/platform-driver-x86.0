From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add no backlight quirk for Asus H87I-PLUS
 Motherboard
Date: Wed, 11 Jun 2014 16:19:00 +0100
Message-ID: <20140611151900.GA30253@srcf.ucam.org>
References: <1400146779-5607-1-git-send-email-hdegoede@redhat.com>
 <1400146779-5607-2-git-send-email-hdegoede@redhat.com>
 <1402417012.670.1.camel@x230>
 <1402417063.670.2.camel@x230>
 <539863EC.8090501@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:55847 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752649AbaFKPTJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jun 2014 11:19:09 -0400
Content-Disposition: inline
In-Reply-To: <539863EC.8090501@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: "karel.macha@karlitos.net" <karel.macha@karlitos.net>, "acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "corentin.chary@gmail.com" <corentin.chary@gmail.com>

On Wed, Jun 11, 2014 at 04:13:00PM +0200, Hans de Goede wrote:

> That might work, note that part of the problem is the BIOS exporting
> an acpi-video interface. So we would either need to do this check
> in the acpi-video driver, or alternatively do it in the asus-wmi driver
> and call acpi_video_dmi_promote_vendor() when the check fails.

Mm. Doing it in asus-wmi sounds like a reasonable plan for the moment if 
we don't see this more generally.

> I'm not 100% sold on adding this check in general, because it assumes
> that the chassis type will be reliable, which seems like a long shot,
> ie what if an all in one, with a backlight, uses 3 / Desktop as chassis
> type ?

I'm sure someone will let us know if we break that.

> Note that once the acpi-video interface is disabled by using e.g.
> acpi_backlight=vendor, then the asus-wmi driver will create a backlight
> control with a max_brightness of 0, which seems like a bug in the asus-wmi
> driver. I did not do a patch for this because I was afraid that not
> registering the asus-wmi brightness control when the max_brightness == 0
> might cause regressions (e.g. it will also remove the bl_power function,
> what if in some cases max_brightness == 0, but we want / need bl_power ?) .

I'd be... surprised if anyone's using the interface that way. Let's give 
it a go and see?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
