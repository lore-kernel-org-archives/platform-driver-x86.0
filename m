Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFA21AA1E4
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733838750; cv=none; b=OO7vv95irSq9TQ9Mdvuucn3U0DX2sr2kIEqW2JnT2G5NEmZMNcgy3uhccBCgdfQZknox8f28hk0zF9T9fWlREKQWO8Q63iLNe/jn4czE/UmujGSIvhhmBPnHOJ+NDdXJs9v8r/EiPyXiruT9cBWvDjhUCA95gcuRz+n64zoqY5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733838750; c=relaxed/simple;
	bh=uPF8YgbbGTWJ7jgkWakZcBtYWVNEInmGu2/5ZN5kl1s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LXACJAdmkTut/0huVRBIFUOf27A21WLxj0hYXXgOdH7b+szsvtMljEpfIJY/lcYSOdvc326bmuP2rdG/u39G1ofhGsjlJDbboBNYKdtqX3FPRBL1tWbP0KGl+feyKzKzllrPh8ldNg5KzlBgMA436sQtxVhDvRTpON7y9ryTHHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iADvRmeH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iADvRmeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733838749; x=1765374749;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uPF8YgbbGTWJ7jgkWakZcBtYWVNEInmGu2/5ZN5kl1s=;
  b=iADvRmeHiE8dh5X02nwbtZV8meiQ+rtLRVRUROfI2eQ1UJ1w0B84eFTB
   OOWw6G4iFESrLpN61EzKRynxobeWuR2L/ZIVtDLrfpfjPKsGzPpHGxpss
   FtftUts9y0ROsUvrmJnXxHXRRHK6qQawpAJUdUSvbK79PdGnKvsOgaYqZ
   AY34xH+PQazii35jmcFdfuThPGe5bJKZlUrSasmV+obl78EpjdyBSlWjQ
   BIbJ92PlNGqBww4/CO/4/QCUBVILJ8aaEmQs/J7sUegReYm+Mq8Zzcksi
   UgxV0ElOTHqX+FECFmUrz3dQJTE2u7NzrsD/DD8a8eFWKcZ+oePchALg+
   Q==;
X-CSE-ConnectionGUID: pIHNStV6TlqgxMep7NWTrw==
X-CSE-MsgGUID: I747Ir/IRpehEtvlgmxwWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37014024"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="37014024"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 05:52:28 -0800
X-CSE-ConnectionGUID: b9ZtkjohSCKlxBGtXtRQhA==
X-CSE-MsgGUID: TweRL9BiSraOL6Hv5hJocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="126317551"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 05:52:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Dec 2024 15:52:23 +0200 (EET)
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
cc: Andrea.Ho@advantech.com.tw, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: adv_swbutton: disable wakeup in .remove()
 and the error path of .probe()
In-Reply-To: <20241206094848.1650137-1-joe@pf.is.s.u-tokyo.ac.jp>
Message-ID: <4e5fc1c6-ca8f-51a5-8ec4-5891166d8732@linux.intel.com>
References: <20241206094848.1650137-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Dec 2024, Joe Hattori wrote:

> Current code leaves the device's wakeup enabled in the error path of
> .probe() and .remove(), which results in a memory leak. Therefore, add
> the device_init_wakeup(&device->dev, false) calls.
> 
> Fixes: 3d904005f686 ("platform/x86: add support for Advantech software defined button")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/platform/x86/adv_swbutton.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
> index 6fa60f3fc53c..523836be6d4b 100644
> --- a/drivers/platform/x86/adv_swbutton.c
> +++ b/drivers/platform/x86/adv_swbutton.c
> @@ -84,6 +84,7 @@ static int adv_swbutton_probe(struct platform_device *device)
>  					     device);
>  	if (ACPI_FAILURE(status)) {
>  		dev_err(&device->dev, "Error installing notify handler\n");
> +		device_init_wakeup(&device->dev, false);
>  		return -EIO;
>  	}
>  
> @@ -96,6 +97,7 @@ static void adv_swbutton_remove(struct platform_device *device)
>  
>  	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY,
>  				   adv_swbutton_notify);
> +	device_init_wakeup(&device->dev, false);

Is the non-symmetric order here intentional?

How about using devm_add_action_or_reset() instead?

-- 
 i.

