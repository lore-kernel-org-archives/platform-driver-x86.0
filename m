Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820F36E466;
	Thu, 10 Sep 2026 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033675; cv=none; b=aCnqF5+TitwQ7oVO96Xxrj1tEJMpPd39Y5NrKhbW8XYjsC+xEjtEYhkP9/hutSW7dBmwcD2w1kftbOrZaA0MxjM2wgp6EzysCDTcIu/j7wQNkF6YUQPjj9Np3VMG9YRSsROncqluEbcFEIeVfrrmO2qcttKMKOniomeZxwbZPm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033675; c=relaxed/simple;
	bh=FgRa9MbekD4pnSjio7Oe86VRKpqZTlJhArf1vNnpPaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbDru/EW6sNQGifVHuK15a2BCPq5MmdH2b9EZ4jw3mqPIyraRS/cAUFx8v9kUwIYdkMSO2qyqhG9HXXD3lgq75KmNy/7d5ULE+K1kFMwV7jo0cZnu2zEYZ+LulmywXv1TAXNAjWPOVqpjvO+MH3w3hZOQMLCWg5t+DobwZq3M2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGSzJXTQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGSzJXTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517051F000FF;
	Thu, 10 Sep 2026 09:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033670;
	bh=RWl089K04JkRps4gbZ6ATSdqNPJV+rcA2HgmVS3d9+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kGSzJXTQaPj3mJgbiFu8XOpRyuhBGJVyVMjZ0Y4uT26UDkqpyosH5l5NdFYL6UV1P
	 VhAb/T16Dx1Glt9yTj6h08HYDMToyKwEMytXVom7MXQra4JX00tsoRGJHAiQhIyzjm
	 wsWKZ7DpsnqvIRYrgoCJXFGtxzxJH/j2wFuhLXVsilu4t+j622SJ+OlU8DZ+PyVS3L
	 5ds/Mhr3HgUOteN/ny7GWEuM0RgIlg9kbRnd0KqKsCl5CBD++pLlEzRrNGHgCuRpy6
	 EYVlVGwAZEINcp1A8W5piITuSbPdGpaZPI0nrTMuZU6BheHwOKKrEfSZigLFXkD2O0
	 4plhxvLJ66mZw==
Date: Thu, 10 Sep 2026 10:47:44 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "D. Manresa" <dmanresa@gmail.com>, Thierry Chatard <tchatard@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource
 conflict quirk
Message-ID: <20260910094744.GQ2133376@google.com>
References: <20260831160754.9857-2-tchatard@gmail.com>
 <20260908161629.335223-1-dmanresa@gmail.com>
 <aqDkwTkAsvs8Escx@ashevche-desk.local>
 <20260909065104.15817-1-dmanresa@gmail.com>
 <20260909151027.GA2133376@google.com>
 <aqGEuTVpGolbznxN@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqGEuTVpGolbznxN@ashevche-desk.local>

On Wed, 09 Sep 2026, Andy Shevchenko wrote:

> On Wed, Sep 09, 2026 at 04:10:27PM +0100, Lee Jones wrote:
> > On Wed, 09 Sep 2026, D. Manresa wrote:
> > 
> > > On Wed, 9 Sep 2026, Andy Shevchenko wrote:
> > > > Do not fold, just add into the series this one as patch 2, for example.
> > > 
> > > Fine by me. Thierry, please carry it as patch 2 of v11 with Hans'
> > > Reviewed-by; no need to change anything else.
> > 
> > Why can't I just apply it?
> 
> This patch on its own can't be applied as it relies on the one
> in the other series. You can apply both patches, from that series
> and this one. No objections from my side.

What is the hard / build dep.  I can't see it.

-- 
Lee Jones
