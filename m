Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120557;
	b=b4piyhSSdNpcudOPvDUt3TIU0StSdZd2sL6PCxxu+iKMRSHTdV5kGLLqpzdz0A5ZYMsw
	 3pkaAH3o60ihFX7Kz9pYUljwQy2kW45O0E/yVTdC2pcqQq+jfL6n1RBpd0qjtNREHxSfD
	 NU81h6P6f5IzPcSQg58Y6i76sNYa7wIoW9I/KdFdUU3cVfGAEgPTdK8umeYMR1yrUBW1c
	 Y3ScINbkQAlc6l0ttz9bts6Eu2r+Fvfb3yauS0H4N4cLR5YNeObvBmjhy1Pfn40GyjQBh
	 I7BM0qLANWPLPfj+sb7EFoJEm/dXO7+WGZVAASH7B5SopJ7pyNZpZx1C6TD1xcCnDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120557;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=CiErdfrDPo45srEb1Hi/jgLRNxE5uhtR/aYYJeZVGfY=;
	b=AhzWOsL1bcT0qNdGjB+avaEROUNowOwHKSaZGi3bZN8PJLX/7BD9tgXwENLeNx729oXT
	 pZ/YB9H/HrA877leBXu1pKZbzp4jR2yRbkuOfg8DFyM65KaQrZRfS26gvhxmvQV97xCv/
	 OarJK45bxvCtJCpMxbZHFmtXRcOq1+pCSlj3ExshlRAA1GjAHmc5YMbRZnAOpOJmTZ36s
	 zA1PgWkFrr/4TLTVlQ6CL8LtiIz8NDXxXDrcDOOApH5rM4fz+oLaQvL8OWm8WSoK0IsLy
	 E2IHc+u5NtYXpAWTaW2Qfe2km9AiKbX2SaaE8cC9tnpg+HMEa/4YDXyrZ5rkZ+SkXEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n16SydDs;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59D60A3822
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 20:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E59D60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n16SydDs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795120558; x=1826656558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uFCB0Iv0xaZVDdjGRg97r+bReIZ98mfLLF7YWM5iTOU=;
  b=n16SydDs7gelq9+2cg+ILgcQEVFsFUbbJ+B5MtB9nOn7EHCAP0jEzKZQ
   hDDtIR7egZnKDNAHx330S8xo+czorLOeqiHW9ABhn/kpLyTYyrj4C6LzA
   5pdqsnYUUMG8Q2kazbfdQe2TZsU0PRRD+1s6zghMmcxCvhVTwda4ElWqG
   sp2t6EyBtpICdSbRqyFRkCnG+LXW79ViImSfew6qkyYUTjQ1ZEv/Rw9CK
   LzjmrCd9XhXD05fjkiXZQ8g5YosYWUyoYXvateUV/Y2xrU9wo4XH3WWT6
   fXpL++6jVCSvpH34O9GhoTipRRBg0R9hHW4cDZjJHLZYuCYxLRZdC0J4t
   A==;
X-CSE-ConnectionGUID: ENw+4I4RR7ijvnWU6lzGeA==
X-CSE-MsgGUID: nNYo3iy8QsSxpUAnRySTMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3876541"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3876541"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:34:59 -0800
X-CSE-ConnectionGUID: jbd4ZRYnQaWhOYXItCvHIg==
X-CSE-MsgGUID: /NW0d0wxRpSDWgujmk4J2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12238855"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:34:56 -0800
Date: Thu, 19 Nov 2026 22:34:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/4] platform/x86: dell: dcdbas: Suppress bind
 attributes of the platform driver
Message-ID: <av9dbXBwiVW2nUOk@ashevche-desk.local>
References: <20261118035638.11773-1-rosenp@gmail.com>
 <20261118035638.11773-3-rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118035638.11773-3-rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 07:56:36PM -0800, Rosen Penev wrote:
> The dcdbas platform device is created by the module itself and stays
> in use for as long as the module is loaded: dell-smbios-smm allocates
> its SMI buffers against it through dcdbas_smi_alloc() whether or not
> the driver is bound.
> 
> Binding the driver again after an unbind also leaks state:
> dcdbas_check_wsmt() runs a second time and memremap()s the firmware
> SMI buffer again, overwriting bios_buffer and leaking the previous
> mapping.
> 
> Unbinding or rebinding the device by hand is not useful, so hide the
> bind and unbind files.

Sounds legit and a proposed workaround is often the way to fix it.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


