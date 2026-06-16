Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100EF37C0E5;
	Tue, 16 Jun 2026 02:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781577960; cv=none; b=eINJZwwhtCOdq2L4x5eboe3y5pK8IbbBTVqsUPOkEDYGJuMhrBc5ihQ6SCarMeFr65boP9BGgkb53Rwv/KI8qIF1tTg9cEjNUZ08GXKYzE4Ge6caQx54YjvTF03D5gGyBcL5viM75/sWKHl7t1EDcKdXct9Cgg+T4GZDid+DviI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781577960; c=relaxed/simple;
	bh=26C3+qAzIjXbhY7uqzHXiw7FwG1kl2GW5rlxP3hlFRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqpbuGX/WSWxzeKfHvzcvolksOdDEG3Br+r/Nv8YRZVMHPaZpd5q/4tJFRgWv1Ekde5WTN3qsNL3UK2XnmR3Ouiwn9+qy77VSU2FaGXhnw31G8GaHhWd5KCKeP+0P7/yqYkO5hqADUbAg4hYRaGyS1vVKnC/Ha574I83BOJvK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JonKOVvz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JonKOVvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E771F000E9;
	Tue, 16 Jun 2026 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781577958;
	bh=E5OmWmJXOpkCq7v6z/Yhmia00qZVhjKxgypa+M5bFxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JonKOVvzG1giuHNEOnKb0WrZGe1jGQ4bf0/BSxbPnG9b0RnJXc7V2DiJCcvE09qZs
	 XYISdZ7haqcL+VXv7pTaNQ8/n1o+F3vozOil5ZPR6GeLyb6PdbeEEu9S7sTvk5NOfZ
	 oHtU7dsF3ZbGFiu1ey0yxPQo7z6ipoEkZrMKKSxY=
Date: Tue, 16 Jun 2026 08:14:53 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free in _copy_to_user from
 platform/x86/dell-smbios-wmi
Message-ID: <2026061608-moisture-marathon-bdb4@gregkh>
References: <178144969601.60470.13396800403157907003@gmail.com>
 <543e7c0f-ae4b-49e4-8bdf-6bf7d0dc4775@gmx.de>
 <2026061525-dayroom-backspace-4273@gregkh>
 <5ddd81bd-b7eb-4c3f-b222-4fa3b4768d5b@gmx.de>
 <c2445ace-95af-402d-865b-b9451e92de88@app.fastmail.com>
 <fa9833ee-f86e-491b-a1fa-625011a1ec47@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa9833ee-f86e-491b-a1fa-625011a1ec47@gmx.de>

On Tue, Jun 16, 2026 at 12:28:05AM +0200, Armin Wolf wrote:
> Am 15.06.26 um 23:00 schrieb Arnd Bergmann:
> 
> > On Mon, Jun 15, 2026, at 22:21, Armin Wolf wrote:
> > > Am 15.06.26 um 15:30 schrieb gregkh@linuxfoundation.org:
> > > 
> > > Its a "unbind" operation, either from sysfs or started by the WMI driver core.
> > > 
> > > I do not think that this has something to do with the module reference counter,
> > The misc_device reference count. The module reference count is
> > protected by the wmi_driver object.
> > 
> > > because the UAF is triggered by the device state container being freed:
> > > 
> > > 1. devm_kzalloc() + misc_register()
> > > 2. open(), uses data previously allocated with devm_kzalloc()
> > > 3. unbind, misc_unregister() + freeing of state container data.
> > > 4. read(), access to already freed state container data.
> > > 
> > > I assume that misc_unregister() does not prevent read(), write() and ioctl()
> > > on already opened file descriptors? If yes then i think a RW-lock inside the
> > > driver would be necessary to synchronize the removal of the misc device with
> > > any outstanding read()/ioctl() operations.
> > A get_device() in ->open() should prevent the misc_device from
> > going away during read() and ioctl(). You need to put_device() in
> > ->release() then.
> > 
> > If the driver->probe() function takes a reference on the wmi_device,
> > that prevents it from going away underneath the misc_device.
> > 
> >        Arnd
> 
> IMHO this is not the problem here, the issue is that file operations
> continue to access struct wmi_smbios_priv even after misc_unregister()
> was called during driver unbind.
> 
> The UAF is not the WMI or the misc device, it is the driver state container.

Yes, this is the "classic" issue that the many revisions and discussions
around the "revocable" patch series was attempting to resolve.  Look at
the discussions on the lists for this, and the cros_ec_chardev patch
series for ways to potentially resolve this.

In other words, it's a well known problem, and people are working on it,
but it will take work for each driver to resolve it.  For
non-removable-bus devices, it's not a big deal as this can not happen in
the real world, so don't worry too much about it now.

thanks,

greg k-h
