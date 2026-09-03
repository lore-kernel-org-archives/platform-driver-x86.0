Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D78481FCA
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436507; cv=none; b=UEb/BvwAoNzADH8xBZGhpIVAvXlChaJh8s51zI7N5ymhxqQW6V64rpn/4maWaL1eHDcSQiYSsneEJuGs2m79wlLXL8VzKxTTzJ4Uqko9DbLhgOH+g6IEpCkynWvEcm/KGXb764RjJXbUaCZxfGJ0gO/hPPp7kLhP68LnPRFSYXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436507; c=relaxed/simple;
	bh=He5KYgd8LGr0JDILdjFiWnXT4WO2N5uoKpgb+PgoOdE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uNzVe8BSqwPgQocDo4z69UIh75oECg98hGqIqHh4oCnWSmm+AaVNSzvYdRTdWlzD02QoeIdn9EwCVrNpZho0S3LQT2BmeoCPphtughDH776X3b5f8zNPzftAF5OQ8FJiT+NwJtPNEIFX+eOFfSq0GmwhQqqVUI1WxuciIMgViUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIoXjURE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIoXjURE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436503; x=1819972503;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=He5KYgd8LGr0JDILdjFiWnXT4WO2N5uoKpgb+PgoOdE=;
  b=eIoXjURE+bm+PSylByhHEqE42gXJ2UsdlQOhniELAFnLzJImb/CQpAsg
   9BQWYNQW8oWcWnzsb4p9ni4dZ91DI6dj5UNkX/D5xYopRCYCHDUr7yAI0
   u05OHuyw2iudwjhNVmdjwwOobyUESk/pk1jsCO3KlauGGgOACJWevXr7G
   Zw8nC1sYDfA8tXeHHNxijw+ehZ2FsNzCJH0LhLs8t4TNt7Hj/rlIKsSrJ
   LkcAtfNYkapM2TsJR7xQyuxPU4nKuEyxJjiKNeR5P8dT4/qtcdt3yKrae
   eBAFX/M68fQd9Kj1zSfxRHU7molbFK6W5nOLjMSGz59sbRi/SoaxTtVk1
   g==;
X-CSE-ConnectionGUID: 4xuKWGkCTq+xL6p/kSyZNA==
X-CSE-MsgGUID: WPWI9e/wTl+u/EKKZzoA3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92617019"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92617019"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:54:58 -0700
X-CSE-ConnectionGUID: xuWM6BF/SeKx0IoxfEci7A==
X-CSE-MsgGUID: yIfGx2TAS82sn5B/sEGQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267941400"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.119])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:54:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Sep 2026 14:54:51 +0300 (EEST)
To: Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <johannes.goede@oss.qualcomm.com>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: fix gpio_secondary_fwnode_init()
 not working
In-Reply-To: <apcRAvoHkh9blDwK@black.igk.intel.com>
Message-ID: <74f149f6-caa8-db4e-9ef4-5c15b7a5845f@linux.intel.com>
References: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com> <apcRAvoHkh9blDwK@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Sep 2026, Andy Shevchenko wrote:

> On Mon, Aug 31, 2026 at 10:11:57PM +0200, Hans de Goede wrote:
> > acpi_bus_find_device_by_name() call returns a pointer to the device object
> > on the ACPI bus, aka the ACPI companion device.
> > 
> > gpio_secondary_fwnode_init() then continues with setting the secondary
> > fwnode on this device. But this is not the actual physical device for
> > the GPIO controller (e.g. the GPIO controller platform bus device).
> > 
> > This mismatch is causing GPIO lookups by secondary fwnode to not work.
> > 
> > Modify gpio_secondary_fwnode_init() to instead set the secondary fwnode
> > of the first physical device associated with the ACPI companion device.
> > 
> > This fixes the GPIO lookups not working.
> 
> ...
> 
> > static int gpio_secondary_fwnode_init(struct device *parent,
> 
> >  		if (WARN_ON(!fwnode))
> >  			return -ENOENT;
> >  
> > -		set_secondary_fwnode(dev, fwnode);
> > +		struct device *phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
> 
> It doesn't look like an auto cleaning pointer, so let's make a declaration
> outside of the code?
> 
> > +		if (!phys_dev)
> > +			return dev_err_probe(parent,
> > +					     -ENODEV, "No physical device for ACPI GPIO dev: %s\n",
> > +					     (*swnode)->name);
> 
> Hmm... Why not %pfwP?

Hi Hans,

I'm waiting for v2.

-- 
 i.

