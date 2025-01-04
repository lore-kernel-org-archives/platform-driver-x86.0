Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7913AD26;
	Sat,  4 Jan 2025 07:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735974384; cv=none; b=cbok27ulGuzUCG5AiSwUQ2XsHzPg0elmsu1sG0Csk6UTaWqS+A1TCGgMUl/0XEKF3dzelaepoikHxsL2kAcls1exeO2lieK2wKziFGQlcY2vuzbl2MWEy8JYb75L/eF5ilK1RWI2cRG7r8ITzIk168OMtW9/LXKqo8f9P2RjeSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735974384; c=relaxed/simple;
	bh=baBSAguYByJoKKTLQwYyZQ6jGVLZIUDeCEb6gIloO7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxUYQMWqePyBOnddDdT/huNT4EAsX7nw9jvabMs65seVICFhKwpk6BUvwS2pGWnlefl25uf3o4NuaKV6NC9D0PsCej65lRrC9ik2J67t7dmvcFGTnbbRWGsczPdjDP6gSiw5JrVn7xgyNujt+tw2Vcq6HzPOJuMeAscrmkLpET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=QzsUJL3g; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QzsUJL3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735974378;
	bh=baBSAguYByJoKKTLQwYyZQ6jGVLZIUDeCEb6gIloO7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzsUJL3gxHgdifRNhp3mB10yrf/v8JSux2uW/BMTvsHzcsU3CEVd/xwDD346NFRZI
	 RZIH6OuHHRLWdHmm6WiF6Nphw/FKQsdgexV53fwWGrTUCit+XUmTnMwPKt0DXigpEj
	 aeSJZuuP4tblg9ZBJQm05PW1px4OaINO2okztJ2Q=
Date: Sat, 4 Jan 2025 08:06:18 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Mark Pearson <markpearson@lenovo.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 1/6] platform/x86: firmware_attributes_class: Move
 include linux/device/class.h
Message-ID: <3a553631-1936-4f29-ae91-8276327d5fb4@t-8ch.de>
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
 <20250104-firmware-attributes-simplify-v1-1-949f9709e405@weissschuh.net>
 <119c9e8a-6797-4774-bb08-9f911b6a8243@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <119c9e8a-6797-4774-bb08-9f911b6a8243@gmx.de>

Hi,

On 2025-01-04 07:55:15+0100, Armin Wolf wrote:
> Am 04.01.25 um 00:05 schrieb Thomas Weißschuh:
> 
> > The header firmware_attributes_class.h uses 'struct class'. It should
> > also include the necessary dependency header.

> i like this patch series, but i would prefer that we do not expose the raw class through the header.
> 
> Looking at the callers of fw_attributes_class_get(), everywhere the class value is used only to call:
> 
> 	device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", <driver name>);
> 
> I suggest that we introduce two new functions for that:
> 
> 	struct device *firmware_attributes_device_register(struct device *parent, const char *name);
> 
> 	void firmware_attributes_device_unregister(struct device *dev);
> 
> This would have three major benefits:
> 
> - the raw class can be made internal
> - reduced code size
> - drivers would stop copying the flawed use of device_destroy()
> 
> Regarding the use of device_destroy(): this is actually an error since device_destroy() cannot be
> reliably used when devt is not unique. Since all those drivers are setting devt to MKDEV(0, 0) this
> could result in a kernel panic should multiple firmware-attribute class devices exist at the same time.
> 
> What do you think?

Completely agree. This is exactly what the "further improvements"
mentioned in the cover letter do.
And also add devm_firmware_attributes_device_register() and a custom
sysfs attribute type that makes the driver code much simplerr.

But this will be some more work. Also the conversions of the drivers
will be harder and take longer, so we can't drop the raw exposed class
as easily and have to keep the "legacy" interface for a bit.

> Thanks,
> Armin Wolf
> 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >   drivers/platform/x86/firmware_attributes_class.c | 1 -
> >   drivers/platform/x86/firmware_attributes_class.h | 2 ++
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> > index 182a07d8ae3dfa8925bb5b71a43d0219c3cf0fa0..cbc56e5db59283ba99ac0b915ac5fb2432afbdc9 100644
> > --- a/drivers/platform/x86/firmware_attributes_class.c
> > +++ b/drivers/platform/x86/firmware_attributes_class.c
> > @@ -3,7 +3,6 @@
> >   /* Firmware attributes class helper module */
> > 
> >   #include <linux/mutex.h>
> > -#include <linux/device/class.h>
> >   #include <linux/module.h>
> >   #include "firmware_attributes_class.h"
> > 
> > diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
> > index 363c75f1ac1b89df879a8689b070e6b11d3bb7fd..8e0f47cfdf92eb4dc8722b7d8371916af0d84efa 100644
> > --- a/drivers/platform/x86/firmware_attributes_class.h
> > +++ b/drivers/platform/x86/firmware_attributes_class.h
> > @@ -5,6 +5,8 @@
> >   #ifndef FW_ATTR_CLASS_H
> >   #define FW_ATTR_CLASS_H
> > 
> > +#include <linux/device/class.h>
> > +
> >   int fw_attributes_class_get(const struct class **fw_attr_class);
> >   int fw_attributes_class_put(void);
> > 
> > 
