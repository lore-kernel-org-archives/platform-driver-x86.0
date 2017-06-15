From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] platform/x86: silead_dmi: Add touchscreen info for
 PoV mobii wintab p800w
Date: Thu, 15 Jun 2017 09:53:11 -0700
Message-ID: <20170615165311.GF22450@fury>
References: <20170615064832.4148-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:56613 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750803AbdFOQxO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jun 2017 12:53:14 -0400
Content-Disposition: inline
In-Reply-To: <20170615064832.4148-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 15, 2017 at 08:48:31AM +0200, Hans de Goede wrote:
> Add touchscreen info for the Point of View mobii wintab p800w tablet.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/silead_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

...

> +		/* Point of View mobii wintab p800w */
> +		.driver_data = (void *)&pov_mobii_wintab_p800w_data,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "3BAIR1013"),
> +			/* Above matches are too generic, add bios-date match */
> +			DMI_MATCH(DMI_BIOS_DATE, "08/22/2014"),

This is the first time I've seen a BIOS date match used to determine hardware
features. DMI matching is a (necessary) hack to begin with (the vendors should
be providing this data via ACPI _DSD anyway) but a date match means we would
need a kernel patch every time one of these tablets gets a BIOS update...

With words like "Aptio CRB" it's clear the vendor isn't doing their job and just
using unmodified reference code. The problem with this of course is that the
vendor is not providing a way to identify this hardware.

Andy, I'd appreciate your thoughts on this... I'm leaning towards not accepting
bios date (or indeed, BIOS version) as a way to identify a platform.

-- 
Darren Hart
VMware Open Source Technology Center
