Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28BC16BE3A;
	Sun, 22 Dec 2024 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734869377; cv=none; b=QH79n8s8fm2j/yIPkMvzPSR9bdKHOV0FRaYXP36/omFt6mrtYaeceJsi6EIqurQiygpNJDD9fsHMRFxxw2/ulS+J8PoWr1kXrch5fvCyuzdEQ+dg7hv6bkcQSSidvZqKme6syWqi///xG4fVuRJzQbwakzmGaxsqch5hFE0sKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734869377; c=relaxed/simple;
	bh=JEcAWc+wXNEr2iT6chfisqG5h3apL3QfDBAMs+UovyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbqGQ9vGLZWydCTHOjNaqgcns0FcYyNZZUcvv7ZaQhukLtG1fNV17+ite7dQP6x1lN6DW0JyHiZUx1GHJwk9hmF+Y3I22HgTjwaj7nT4Z0tRmipuU+heAOm0Rc+Mama1Ti2czUrc4AHlGcW6nLxysXggE6Z4wl2ocNcHVnrXe3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Mk1gvV7Q; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Mk1gvV7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734869369;
	bh=JEcAWc+wXNEr2iT6chfisqG5h3apL3QfDBAMs+UovyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mk1gvV7Q7uZ4yQz0SZGlVzfrS25sbJb+w5IuxG616XnEkyyxqmpd8x0R0Fl7Sdc9P
	 y0dcwNqJdmdpJQQeGDb+NI4baP2735wWJMch61HKhBVyBKl5xTGpVz6Gzr5QTRNMEB
	 AHjaPOGoms8k8OjBHnue4ZfH3B7ndBJ2bQyXujRM=
Date: Sun, 22 Dec 2024 13:09:28 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com, 
	W_Armin@gmx.de, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <c2b5e0c8-651f-426e-ae96-13857313997a@t-8ch.de>
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de>
 <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
 <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>

Hi Joshua,

On 2024-12-19 18:31:22+0100, Joshua Grisham wrote:
> Thank you both Thomas and Hans for your review and comments! I am
> working on a v4 of the patch but had a few questions which I wanted to
> clarify (they can also come after in a v5 etc in case I managed to get
> this ready to go before anyone has the time to confirm and/or clarify
> some things!).

Keep them coming :-)

> Den tis 17 dec. 2024 kl 15:23 skrev Hans de Goede <hdegoede@redhat.com>:
> >
> > On 16-Dec-24 5:46 PM, Thomas Weißschuh wrote:
> > >> +Various hardware settings can be controlled by the following sysfs attributes:
> > >> +
> > >> +- ``allow_recording`` (allows or blocks usage of built-in camera and microphone)
> > >> +- ``start_on_lid_open`` (power on automatically when opening the lid)
> > >> +- ``usb_charge`` (allows USB ports to provide power even when device is off)
> > >
> > > Non-standard sysfs attributes should be avoided where possible.
> > > Userspace will need bespoke code to handle them.
> > > This looks like it could be handled by the standard firmware_attributes
> > > interface.
> > > This would standardize discovery and usage.
> >
> > Ack this really feels like firmware-attributes. I would not be surprised
> > if there are matching BIOS settings and if changing those also changes
> > the sysfs files and likewise if the sysfs settings persist over reboot.
> >
> 
> Yes 2 of these (not this "allow_recording" I think) are available via
> BIOS and all 3 of them persist over restarts.
> 
> Just so I am 100% clear what you mean here -- these type of attributes
> should be created using the utilities available in
> drivers/platform/x86/firmware_attributes_class.h so that they are
> created under the path /sys/class/firmware-attributes/*/attributes/*/
> ?

Yes.

> What exactly should they be named (any preference?) and should I also
> add some documentation for them in
> Documentation/ABI/testing/sysfs-class-firmware-attributes ?

I think they are meant to be named consistently with what the native
UEFI setup interface calls them.
And yes, they should be documented.

> I am fairly sure I understand the concept and can agree that it kind
> of makes a lot of sense to be able to standardize the userspace
> interface, especially for attributes which do the exact same thing
> across different vendors/devices (unless it just as easily possible to
> go based on some pattern matching e.g. like is done in udev and upower
> with "*kbd_backlight*" etc) but as of now it looks like the only
> examples implemented are for thinklmi, dell-wmi, and hp-bioscfg that I
> can see so far?

The firmware-attributes don't really have a standardized semantic.
Here the standardization is more about the discovery and interaction.
Somebody can build a generic UI to change these settings, without the UI
knowing anything about what the setting actually does.

If the setting maps to a another, more specific interface, that should
be used.

> Before, I had tried to look through all of the various platform/x86
> drivers and harmonize which names I picked for these sysfs attributes
> (that is how I landed on "usb_charge" and "start_on_lid_open" as I
> recall correctly) but I am not aware of any existing userspace tools
> which are looking for anything like these (apart for
> driver/vendor-specific utilities). Any recommendation from the very
> wise people here would certainly be appreciated for these :)

[..] Snip, I don't feel qualify to comment on the input bits.

> Other notifications that I am wondering what the "right" way to handle
> / using the right interface:

[..]

> - When the battery charge control end threshold is reached, there is
> an ACPI notification on this device as well that is the one I have
> marked "ACPI_NOTIFY_BATTERY_STATE_CHANGED" -- the Samsung background
> apps pop up a custom OSD that basically says something to the effect
> that their "Battery saver is protecting the battery by stopping
> charging" (can't remember the exact verbiage) and they change the
> battery icon, but without doing anything else in my driver currently
> the battery still reports state of "charging" even though it just sits
> constantly at the percentage (and has the charging icon in GNOME etc).
> I have seen the event come and go occasionally when I did not expect
> it, but my working theory is that maybe it is if/when the battery
> starts charging again if it dips too far below the target "end
> threshold" and then notifies again when the threshold has been
> reached. Armin also mentioned this before in a different mail; I guess
> I would hope/expect there is an event or a function I could call to
> have the state reflected correctly but I would not want that it
> negatively impacts the normal behavior of charging the battery itself
> (just that the state/icon would change would be ideal! as it functions
> perfectly, it is just that the state and icon are not accurate).

Optimally the ACPI event would integrate with the ACPI battery driver.
See the handling of POWER_SUPPLY_STATUS_NOT_CHARGING in
drivers/acpi/battery.c.
Does the battery report the current rate as 0 when limiting?
Then something like acpi_battery_handle_discharging() could be used.


Thomas
