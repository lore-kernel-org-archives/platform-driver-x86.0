Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB5A95C;
	Tue,  7 Jan 2025 20:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736283023; cv=none; b=eKiHF5GlOQypyG+QocJABBD8vGSNb1vwMuw35bGExaRVhTqKmcaBW0KbQJpWh3b5PLgG4o7xTJMhau2cUuauVe5rRdE41DIFLruUd8bL+gFYhCnuLQPt2mAGLVF26rj/hvNLfVLcyTyrtTtlW63hkcnpyhQtWGKGMjAcSVQZIhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736283023; c=relaxed/simple;
	bh=3fpXhaKdKckhr/xl9Kb/o73niIHOMVUUksc6R347pt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMfQK88dMpWkfz2DPie5E0YeeC6m7rTGxSI8TMYlG3I7bnKfknre4e8dfIBCUXed4Ni9OhBqwSjSdJX/g0RAVO2nYNB6pcnDb5n0G9qHXYKDz2U+yv7HQxxd6ojtofu0XaCImV6QYhjHK4c0uDoHy9+SzWKbz/5xrcsESq0/NLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jabgQlIP; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jabgQlIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1736283011;
	bh=3fpXhaKdKckhr/xl9Kb/o73niIHOMVUUksc6R347pt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jabgQlIPR2UFN5WxvZBr+0/c9qkTdKqzfJcfrZh2kJ3Jz4Qii/FAVTEizjaCinfmJ
	 xajxOpEpOQP4h+akKB4mnuE7yqsPrKCafi+dZCZyg+eaYPLXW2H45BNKHHUKCtFcSx
	 A1ICVeTSczDdVMTDKXTG1A6ImNtzVbnoMvbO63aI=
Date: Tue, 7 Jan 2025 21:50:11 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joshua Grisham <josh@joshuagrisham.com>
Subject: Re: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
Message-ID: <88ae2335-86dd-4cb2-8e20-88973a8e28b7@t-8ch.de>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
 <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
 <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com>

On 2025-01-07 13:29:08-0600, Mario Limonciello wrote:
> On 1/7/2025 11:05, Thomas Weißschuh wrote:
> > The driver showcases the use of the new subsystem API.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >   drivers/platform/x86/Kconfig                    | 12 ++++
> >   drivers/platform/x86/Makefile                   |  1 +
> >   drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++++++++++++++++++
> >   3 files changed, 91 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f07074944d6c42dc204fc8825a42 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-tablets/Kconfig"
> >   config FW_ATTR_CLASS
> >   	tristate
> > +config FW_ATTR_TEST
> > +	tristate "Firmware attribute test driver"
> > +	select FW_ATTR_CLASS
> > +	help
> > +	  This driver provides a test user of the firmware attribute subsystem.
> > +
> > +	  An instance is created at /sys/class/firmware-attributes/test/
> > +	  container various example attributes.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called firmware_attributes_test.
> > +
> 
> I think if you're going to be introducing a test driver it should be
> compliant to what's in sysfs-class-firmware-attributes so that when it's
> inevitably copy/pasted we end up with higher quality drivers.
> 
> That is you need at a minimum 'type', 'current_value', 'default_value',
> 'display_name' and 'display_name_language_code'.  Then individual types
> employ additional requirements.
> 
> I see 'type', 'current_value', and 'default_value, but I don't see
> 'display_name' or 'display_name_language_code' here.
> 
> Furthermore as this is a "string" attribute you're supposed to also have a
> "max_length" and "min_length".

Agreed that more examples are better.

But are these attributes really mandatory?
"This attribute is mandatory" is only specified for "type" and
"current_value".
While "possible_values" certainly looks necessary for "enumeration",
"min_length" for "strings" does so much less.


Thomas
