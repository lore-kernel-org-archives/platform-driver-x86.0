Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488DF21D595;
	Thu,  9 Jan 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435871; cv=none; b=TgHp81i9NcAFvdYejwFJaGDTxsZesFQIbq6S2tncoWWKZPHRU43fQ/34/3qMmnlQEgkE+V9mDqoqGBM14qMEYIM3X28jHMWqp19dozb4i7j9opjBXzOt59sTaeJLFQf8fLdjMjOdVRdDoENANpGJAGqwKtiGzl+WNiqnWzITqdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435871; c=relaxed/simple;
	bh=6VV2hk34lxjbsai/AGg7CVmM33aZUxRcJq6bb5eSotM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3sosUWxOvba1V5OiUV6xeB+ISyKUbpbPYXXKtoO41SPTOrHsg96Y9r/QZRH7wl1bnPGz1dcB8gEYEgtJdr3tPrVqRKYib9Nfq8/Wi0KzGzPUcKxcYBvKPJSqoWM66g/bckhg/hZsdxxa30/41KibbOyqP+EMKe1U4+tWf2eY4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=bR8o4sYj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="bR8o4sYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1736435862;
	bh=6VV2hk34lxjbsai/AGg7CVmM33aZUxRcJq6bb5eSotM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bR8o4sYjgQf2XsyfXDPgmhm7itTpgFfw1JNfk4NdrAuMnPGh27m5cX9WzGut74dgX
	 GQYl/rPY15WsASh99JxBrjKehzOehu20pecIcFcm6WJzqVBo6Rnutg86f68maB2Sbg
	 hw4JKuQVUcnGRE+YBXddeJI2/msVJbmvsSmex6cw=
Date: Thu, 9 Jan 2025 16:17:42 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Joshua Grisham <josh@joshuagrisham.com>
Subject: Re: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
Message-ID: <c58ee2ba-7800-4da0-81a3-faa971515cab@t-8ch.de>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
 <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
 <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com>
 <88ae2335-86dd-4cb2-8e20-88973a8e28b7@t-8ch.de>
 <1f5b77f3-c427-496e-9c1d-3150177f29d6@amd.com>
 <7f568cbd-b299-41c6-8786-25f225de8f4f@t-8ch.de>
 <39e1f247-3b9e-2919-439b-edf95bb7927d@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39e1f247-3b9e-2919-439b-edf95bb7927d@linux.intel.com>

On 2025-01-08 11:30:12+0200, Ilpo Järvinen wrote:
> On Tue, 7 Jan 2025, Thomas Weißschuh wrote:
> 
> > On 2025-01-07 15:18:21-0600, Mario Limonciello wrote:
> > > On 1/7/2025 14:50, Thomas Weißschuh wrote:
> > > > On 2025-01-07 13:29:08-0600, Mario Limonciello wrote:
> > > > > On 1/7/2025 11:05, Thomas Weißschuh wrote:
> > > > > > The driver showcases the use of the new subsystem API.
> > > > > > 
> > > > > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > > > ---
> > > > > >    drivers/platform/x86/Kconfig                    | 12 ++++
> > > > > >    drivers/platform/x86/Makefile                   |  1 +
> > > > > >    drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++++++++++++++++++
> > > > > >    3 files changed, 91 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > > > > > index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f07074944d6c42dc204fc8825a42 100644
> > > > > > --- a/drivers/platform/x86/Kconfig
> > > > > > +++ b/drivers/platform/x86/Kconfig
> > > > > > @@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-tablets/Kconfig"
> > > > > >    config FW_ATTR_CLASS
> > > > > >    	tristate
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
> 
> Can't you like add comments to the optional ones to reduce the incentive 
> to fill them with random junk as it's a lot easier to just delete them than 
> generating some random junk. So if a developer is unsure what to do a 
> comment telling something is optional would help to lean towards 'I can 
> safely delete this'?

That would be possible. But I'm still not convinced.
If driver authors can't be expected to know how to implement their own
sysfs attribute groups from the similar provided examples as needed, we
would have to provide example code for sysfs attributes of all firmware
attributes. And that would be a lot of them.

Also the attributes themselves would be highly repetitive. The
interesting logic would be how to wire it up the the rest of the driver,
and the example code can't provide copy-paste code for that.
