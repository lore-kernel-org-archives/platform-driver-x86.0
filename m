Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0A1386D7
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731317850; cv=none; b=DQJXeg+aToXlW9OmWqrFD3X/I/nAz9nFLhGcoIQ8bW8DL4KciWp6IgK7Kdxi/jbxM23B3GSkONfQ6U0ZXUineUv92lrVHL1HEdrN+DZfXoEgB/FGzlrxJkTcr5Jn7HPOdPTnepuHwRg/3d6jGvALp+oapCMDO2S8c+OB8vtn4Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731317850; c=relaxed/simple;
	bh=auy7DDKa5xAAH/t1C25VKaJbOD9RTviPc/77UPeyJm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlNn0c3CXWzRgDBGw9IpEH0Iimo48qkS0BaLbRZgV0RosLNI8qTVx+TcmgghEfm+Larpr8sWPlFYuD68CpAv3FS4lJgqwb7cB8rzZfHKnjnNxOubRWXNTbQkV0hgwSTqXQ7n/tyF/dDmWkpsnva81rkbLf/2JVQbxuyEPqVa5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: ArSItfQJS168B4OJH9sGiA==
X-CSE-MsgGUID: l4uwdIt5TmWeqn0DByGmwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34806325"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34806325"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:37:28 -0800
X-CSE-ConnectionGUID: mpQzV9hvSCKxHbYKywG7KA==
X-CSE-MsgGUID: e+ajoub7RguvdYLuvpLgaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91580732"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:37:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1tAQrM-0000000DXpG-1Vdk;
	Mon, 11 Nov 2024 11:37:24 +0200
Date: Mon, 11 Nov 2024 11:37:24 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 4/5] platform/x86: x86-android-tablets: Add support for
 getting serdev-controller by PCI parent
Message-ID: <ZzHQVAVJvbiRohPh@smile.fi.intel.com>
References: <20241109220530.83394-1-hdegoede@redhat.com>
 <20241109220530.83394-5-hdegoede@redhat.com>
 <CAHp75Vcp1AxcZcAqoA9e-YXerHPaRAxsoGT34R41aQeaMUrgCg@mail.gmail.com>
 <b8340169-5832-4aa2-8713-9639b7f7aec4@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8340169-5832-4aa2-8713-9639b7f7aec4@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Nov 10, 2024 at 11:27:31PM +0100, Hans de Goede wrote:
> On 10-Nov-24 12:51 PM, Andy Shevchenko wrote:
> > On Sun, Nov 10, 2024 at 12:05 AM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +       if (dev_info->use_pci)
> >> +               ctrl_dev = get_serdev_controller_by_pci_parent(info);
> >> +       else
> >> +               ctrl_dev = get_serdev_controller(info->ctrl_hid, info->ctrl_uid, 0,
> >> +                                                info->ctrl_devname);
> > 
> > I would expect that they both take info as an argument...
> 
> The "old" get_serdev_controller() helper for getting the controller
> by ACPI HID + UID is also used outside of the x86-android-tablets code
> and struct x86_serdev_info is x86-android-tablets specific.

I see, thanks for elaborating this.

> >>         if (IS_ERR(ctrl_dev))
> >>                 return PTR_ERR(ctrl_dev);

...

> >>  struct x86_serdev_info {
> >> +       /* For ACPI enumerated controllers */
> >>         const char *ctrl_hid;
> >>         const char *ctrl_uid;
> >> +       /* For PCI enumerated controllers */
> >> +       unsigned int ctrl_devfn;
> >> +       /* Typically "serial0" */
> >>         const char *ctrl_devname;
> > 
> > Why not union as we have a type selector, i.e. use_pci ?
> 
> A union would be possible. I simply did not think of that.
> 
> Not sure if it is worth the trouble though, since it saves
> only 8 bytes on a struct which is currently used only 3 
> times in the driver.

Saving bytes is not the main point, the main point is to make the code robust
against writing both fields and make things confusing. Along with that, union
gives a reader the clue that those fields are never used at the same time. So,
can you consider using union?

-- 
With Best Regards,
Andy Shevchenko


