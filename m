Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FA9336888;
	Tue,  3 Mar 2026 23:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772579162; cv=none; b=fx5k+uPCOziPIbjNi3XGAm4yIaFO0+41dy3j7zeY5TQT/dcd8Q3uZjGNWNlN1Mo1gIxt9MYCWReLIRzPun7zsVxZ+nff20AL9TQpVKURuF9zVuF3+3UzYUczmo6gbB59Xz0HyQ9V5QI0KEgSJvqCiSS39fQBurFARDO7FcAWIjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772579162; c=relaxed/simple;
	bh=OElEBfnbOldn+Sxm3YxdH7hN6xyMPLPS1oLj3AULd4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baJSJjHZJcj0qG1o/DopfjaTqawC0+GeIML5ZQhwzuTUTGEHsJKmCCvNPl/PzUMEWkwS2X9SI79OzIShfRztyi+XyGGkbYEN0qMolnUh6Mtwk1QxsxMjTHlZrNdpfyUZbJQ+w+18/ViV3wbK4r08SMuqechKICbB9nQQ1AZXibc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jEtC3/Z/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jEtC3/Z/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ayyiYNF9x2S85wOOIfE9hijF9RXMW3OVt6BQPAL3BVM=; b=jEtC3/Z/VvzFUkLw/HZeBjyWb+
	XWD5VnXL1gDzTtE6PJ6e413QgCHuYYO4IQ4vpoOhbgjb1DAUPVjak8RYNN0r5NxQtptFeSLXmu8kD
	cIpA587N8OapQgkvnl3RPcTKHcT4HYLTdy09sCgaP0DQ1NTqwNlxHkEh6LYCrriame4Sxc+90h4XP
	VPzZ1+eIv/TL+t7tTi/jUikEgPT/Fp6kJLwF/UQ2WuC3Y9bKEEHa7Hha4qeFF3euvx3dVYOxHU47L
	dvw19GVy+VF7dp0NCPMkxCvMIQvCwL6iJM8SgowTsqsfc5iS8fJADx6a7QZfsFOKt01lkOMyos/LU
	tPzdNSEQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxYoN-0000000G4U7-3oFC;
	Tue, 03 Mar 2026 23:05:55 +0000
Message-ID: <40b5b8e2-bd45-4723-adc5-c0137c749fe3@infradead.org>
Date: Tue, 3 Mar 2026 15:05:54 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Werner Sembach <wse@tuxedocomputers.com>, W_Armin@gmx.de,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303225440.504358-1-wse@tuxedocomputers.com>
 <20260303225440.504358-6-wse@tuxedocomputers.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260303225440.504358-6-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 

On 3/3/26 2:54 PM, Werner Sembach wrote:
> Adds short description for two new sysfs entries, ctgp_offset and
> usb_c_power_priority, to the documentation of uniwill laptops.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>  .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> index 2df70792968f3..70b4bc97d91a8 100644
> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -51,3 +51,28 @@ Description:
>  
>  		Reading this file returns the current status of the breathing animation
>  		functionality.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/ctgp_offset
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	Werner Sembach <wse@tuxedocomputers.com>
> +Description:
> +		Allows userspace applications to set the configurable TGP offset on top of the base
> +		TGP. Base TGP and max TGP and therefore the max cTGP offset are device specific.
> +		Note that setting the maximal cTGP leaves no window open for Dynamic Boost,
> +		effectifly disabling that feature for the GPU to always be 

		effectively

prioritized.
> +
> +		Reading this file returns the current configurable TGP offset.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/usb_c_power_priority
> +Date:		February 2026
> +KernelVersion:	7.1
> +Contact:	Werner Sembach <wse@tuxedocomputers.com>
> +Description:
> +		Allows userspace applications to choose the USB-C power distribution profile between
> +		one that offers a bigger share of the power to the battery and one that offers more
> +		of it to the CPU. Writing "charging"/"performance" into this file selects the
> +		respective profile.
> +
> +		Reading this file returns the profile names with the currently active one in
> +		brackets.
> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> index aff5f57a6bd47..c89b8b3756f84 100644
> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -50,6 +50,10 @@ between 1 and 100 percent are supported.
>  Additionally the driver signals the presence of battery charging issues through the standard
>  ``health`` power supply sysfs attribute.
>  
> +It also let you set whether an USB-C power source should prioritise charging the 

          lets                 a USB-C

battery or
> +delivering immediate power to the cpu. See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for
> +details.
> +
>  Lightbar
>  --------
>  
> @@ -58,3 +62,11 @@ LED class device. The default name of this LED class device is ``uniwill:multico
>  
>  See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on how to control the various
>  animation modes of the lightbar.
> +
> +Configurable TGP
> +--------
> +
> +The ``uniwill-laptop`` driver allows to set the configurable TGP for devices with NVIDIA GPUs that
> +allow it.
> +
> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.

-- 
~Randy

