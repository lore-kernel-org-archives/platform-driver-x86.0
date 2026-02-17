Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B762D94AD;
	Tue, 17 Feb 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314992; cv=none; b=YAUqMhC6WfjEgHCBhMebpS/+p0PtZz9kUrmzfKDmzZ8/j+Z0PLiYCQrylibejZADXV/IctMlQ6UljPKC24a7IzcaYG99KDdH6tmR81Q61C6P5l4fCEFiAeK9F4s2gyuNYU2+UCHsqZvxFqIsGzIpIoklBfaT3kuij5/QhCOe+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314992; c=relaxed/simple;
	bh=gWEDem7vF9NAA1Jqr+Lw8n4yMz1jA6hXLJw7mQn87xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcLDjOuhclueXdlfZYu/bKLOefvJfFjoxAH8NqVh0eIt2P6jFqdEuSGsXVcjOkUCnzuLnT2u0cviA746zWEd2msyD4CJlGWyIGAIdG9NVajbq2csi2UploJyNMKzWTCo5m32L1hs8m3Xx/Z+s7hlXsnoIKYP2jmoyfvfRk3V3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAvXPlpg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAvXPlpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771314990; x=1802850990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gWEDem7vF9NAA1Jqr+Lw8n4yMz1jA6hXLJw7mQn87xg=;
  b=fAvXPlpgsI5QMYyAVcVeTwHjyeVf42C18SICoa+wPqPQI51sD6db+aKj
   cb74J5V/MV8MpcWFVMigOoJX2SqvVtcudLo95wZjt8NoTKtFGfhH5HC2w
   YqwAxbe5xsiKgFckh+l4wC1u56nPmGc5wPCzZ/EmjaZk6GP1mMumKBDbD
   PkDjEri6URy4dINfaVgVljD/P0BjqJPOMWQ9k2HK4Tho6qRYJdV/1XL9m
   O27KLABz0UQ9gFQDVvUz+rOrTa1FJIkHDpx8pBx3U2ohwqkC5JEJfcr31
   ddi/vr3VEZ1u/JgiLwvYEPTiFnsPYEG0nOZ6lvJPQWiH2luotqf3aRziC
   A==;
X-CSE-ConnectionGUID: UpqFwF1ySJCyZIrIbEoH3Q==
X-CSE-MsgGUID: OUm6IgGVTA+UHt/DkoibxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83744440"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="83744440"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 23:56:29 -0800
X-CSE-ConnectionGUID: uaqG/Q8NRUOJota6ecyHlw==
X-CSE-MsgGUID: 22L0emfsTLiSL6wJSDj0uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213054013"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO localhost) ([10.124.220.245])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 23:56:27 -0800
Date: Tue, 17 Feb 2026 09:56:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: lpc_ich: expose the GPIO controller cell's
 software node
Message-ID: <aZQfKIsKA9JQ0_YT@smile.fi.intel.com>
References: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
 <20260213-meraki-swnodes-v1-1-8e032693456c@oss.qualcomm.com>
 <aY7r9qr-ngFSw7MC@smile.fi.intel.com>
 <CAMRc=Md5sPd=20=mM7H3qM8TQm0kqjoRnKdnBipjY7nbWu8Xpw@mail.gmail.com>
 <aZLgxEZzn_USmlkE@smile.fi.intel.com>
 <CAMRc=Mf1X0dq2TxeWET3kgiZEg+h0Rnd8OwWGFWEy+tv_AVPQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf1X0dq2TxeWET3kgiZEg+h0Rnd8OwWGFWEy+tv_AVPQQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Feb 16, 2026 at 11:15:46AM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 16, 2026 at 10:18 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Feb 16, 2026 at 09:51:18AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Feb 13, 2026 at 10:16 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, Feb 13, 2026 at 09:25:24AM +0100, Bartosz Golaszewski wrote:

...

> > > > > +EXPORT_SYMBOL(lpc_ich_gpio_swnode);
> > > >
> > > > Can we export in a dedicated namespace? Perhaps "LPC_ICH"?
> > >
> > > I can't test it so I would prefer to reduce the amount of runtime risk
> > > introduced by this change. We can do it separately later.
> >
> > I didn't get this, In this patch you use _NS (And in any case this should be _GPL).
> > In the other you need to add MODULE_IMPORT_NS(). There is nothing which needs a HW
> > to test.

> We're adding surface for an import failure

Yes, that's the point, to avoid importing unneeded symbol just for unknown reasons.
That's why the _NS variants appeared for.

> but whatever, I don't mind adding it.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


