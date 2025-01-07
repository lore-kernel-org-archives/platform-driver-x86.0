Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C2486330;
	Tue,  7 Jan 2025 22:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736290027; cv=none; b=OSgzDC/qnqKnTprOexDX99u5XsHkMVdUoioM0kHrmxzCJeLF3Hj0s/Cp6Pjqq3xF7z4RBN1vdTuPKNWYco/G7Il1FDGu/G34LCjg9Ohfzquwy74oolN6BJhI3Yk1mGNOrj4RzO0Jn27voNI43mzLoo15gVkPVF5lJ85NSQncqqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736290027; c=relaxed/simple;
	bh=FoE3jLPlb8IbWzy60MFizu6s+vKA7KX8YCiVEN4pVws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qR0yfteBBpBTEQHLMeK4GJ5yf24NOz1nkCNursCsKjAjyaO8kHWxtFJ7lU+UfeEcBYPLnpAehGVco1qPzbikNfIQRfzmp5xi/J2KLt+2HFvGtlijS9Fox7c/Rtx3P5vU3ZzIbUuR4RxbYCYErh09XEdFvsNyO12tf3B/N2wtrpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=uJ0DZkpY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="uJ0DZkpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1736290023;
	bh=FoE3jLPlb8IbWzy60MFizu6s+vKA7KX8YCiVEN4pVws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJ0DZkpYsLi6UP8Yvl9hj8VKzHvBPuSHixUsbmqeYWCt5cxD0dwZN0o/gj984ci8V
	 mzmlt8i9Napag4Ti/UQRXDx29GmZd73l7ljEYfoMy8v+4eT//v/YsxbpKrJvyLTRG0
	 bLHTGDloi15iwBNnpRzO+P31yk7GNmVcl7n9vc2o=
Date: Tue, 7 Jan 2025 23:47:02 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joshua Grisham <josh@joshuagrisham.com>
Subject: Re: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
Message-ID: <acf81e37-3b3a-48ef-8b7a-8e8c50a161a4@t-8ch.de>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
 <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
 <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com>
 <88ae2335-86dd-4cb2-8e20-88973a8e28b7@t-8ch.de>
 <1f5b77f3-c427-496e-9c1d-3150177f29d6@amd.com>
 <7f568cbd-b299-41c6-8786-25f225de8f4f@t-8ch.de>
 <94769c30-af14-4111-8234-abf7e7333def@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94769c30-af14-4111-8234-abf7e7333def@amd.com>

On 2025-01-07 16:20:14-0600, Mario Limonciello wrote:
> On 1/7/2025 16:13, Thomas Weißschuh wrote:
> > On 2025-01-07 15:18:21-0600, Mario Limonciello wrote:
> > > On 1/7/2025 14:50, Thomas Weißschuh wrote:
> > > > On 2025-01-07 13:29:08-0600, Mario Limonciello wrote:
> > > > > On 1/7/2025 11:05, Thomas Weißschuh wrote:
> > > > > > The driver showcases the use of the new subsystem API.
> > > > > > 
> > > > > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > > > ---
> > > > > >     drivers/platform/x86/Kconfig                    | 12 ++++
> > > > > >     drivers/platform/x86/Makefile                   |  1 +
> > > > > >     drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++++++++++++++++++
> > > > > >     3 files changed, 91 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > > > > > index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f07074944d6c42dc204fc8825a42 100644
> > > > > > --- a/drivers/platform/x86/Kconfig
> > > > > > +++ b/drivers/platform/x86/Kconfig
> > > > > > @@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-tablets/Kconfig"
> > > > > >     config FW_ATTR_CLASS
> > > > > >     	tristate
> > > > > > +config FW_ATTR_TEST
> > > > > > +	tristate "Firmware attribute test driver"
> > > > > > +	select FW_ATTR_CLASS
> > > > > > +	help
> > > > > > +	  This driver provides a test user of the firmware attribute subsystem.
> > > > > > +
> > > > > > +	  An instance is created at /sys/class/firmware-attributes/test/
> > > > > > +	  container various example attributes.
> > > > > > +
> > > > > > +	  To compile this driver as a module, choose M here: the module
> > > > > > +	  will be called firmware_attributes_test.
> > > > > > +
> > > > > 
> > > > > I think if you're going to be introducing a test driver it should be
> > > > > compliant to what's in sysfs-class-firmware-attributes so that when it's
> > > > > inevitably copy/pasted we end up with higher quality drivers.
> > > > > 
> > > > > That is you need at a minimum 'type', 'current_value', 'default_value',
> > > > > 'display_name' and 'display_name_language_code'.  Then individual types
> > > > > employ additional requirements.
> > > > > 
> > > > > I see 'type', 'current_value', and 'default_value, but I don't see
> > > > > 'display_name' or 'display_name_language_code' here.
> > > > > 
> > > > > Furthermore as this is a "string" attribute you're supposed to also have a
> > > > > "max_length" and "min_length".
> > > > 
> > > > Agreed that more examples are better.
> > > > 
> > > > But are these attributes really mandatory?
> > > > "This attribute is mandatory" is only specified for "type" and>
> > > "current_value".
> > > 
> > > Ah wow, I had thought they were, but you're right they're not!
> > > 
> > > > While "possible_values" certainly looks necessary for "enumeration",
> > > > "min_length" for "strings" does so much less.
> > > 
> > > Even if they're not mandatory, I think it's better to include them for the
> > > same copy/paste reason I mentioned though.
> > 
> > Thinking about it some more, which attributes should all be included?
> > Having all of them in there could motivate driver authors to implement
> > them all even it would mean filling in random values.
> > The provided examples can already be copied-and-pasted and slightly
> > adapted to add more attributes.
> > 
> > Also as for providing an even higher level interface. There exists a
> > fairly big feature matrix. For example the display_name_language_code:
> > * Is it used at all?
> > * Is it the same for all attributes implemented by the driver and the
> >    sysfs attribute can be reused for them all.
> > * Should the same handler logic be reused between different settings which
> >    only differ in their language code?
> > 
> > The answers seem to differ between each driver and having a uniform
> > high-level interface that can handle all cases would look horrible.
> > So I'd like to stick with the API provided currently for now and we can
> > revisit it if there are more drivers.
> > As mentioned before, the current API should be a decent baseline to
> > build on top of.
> > 
> > 
> > Thomas
> 
> How about just adding min_length and max_length?  Since you're adding a
> string attribute then it makes a good example of a string attribute.
> It should be pretty trivial; AFAICT it's 0 to PAGE_SIZE.

IMO attributes should only exist if they provide useful, driver-specific
information. The proposed values are exactly what I'd like to avoid being
copied around.
min_length=0 does not add any information.
max_length=PAGE_SIZE exposes an implementation detail of sysfs. If that
limit should become an issue for a driver they can switch to a bin_attribute.

I would prefer using get_random_u32() for both attributes, so it's clear
that they are only placeholders.

But I'm also open to getting outvoted.
