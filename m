Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF31624C5
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201949; cv=none; b=AinU51I51U8rD0DD5LUpJAcpS9Q64rqkXZzWom4LvtaI9foLgUQGkbqxcInk00xpTGpyyyDUKxmQC3qJqPTsQ34t+J/Rvn+b+Zwp1PCoxSYDEEjmgSUDVHUNYrMUquP41W2QPqRexEM9TO8EgsOkjWHq/UCNJJ2VX2rXBouyvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201949; c=relaxed/simple;
	bh=fCg4FUOovRoRkZqQdF/aXUlP+noGsKr/r80nGXEHOyU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W2IoLCkeuh3Agy/R5oPHY1RxMe1vRstQLoHoCcphQaJ1rN2IjCUv2XLl/RnXGPKbyYhGxeQAHd209sBD1NpjXmGc0Ay3CKfzijfU1vVde+gEAxSbIfJ134kPZQI8W+xrlK9u/WR5GezY2AZpYhVRpTcwPQDh15tRIGhrT5rRvG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmqV8hDc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmqV8hDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779201949; x=1810737949;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fCg4FUOovRoRkZqQdF/aXUlP+noGsKr/r80nGXEHOyU=;
  b=kmqV8hDcMNXfNffyd5GwmFzX5Xc9mwAJshh376fn/LUoCptCIOhXxWJ7
   GvFzX1t6Zwc9C6/gsSHjCNZ3u76XntZqKYXkDLHpgPaYldkkyRqvryq6K
   ESfVVqmo19tDpQsXM9pRNp1u+4PZrKRS2GciBnywuynivyRlRkvMtiySr
   x1/OGMjZIXp3tzToqA4O24EW8OrrUV9box5P+CYNL1wQcrApfwjw9vYqI
   qzJ7OAFPtomvFqBIJkRdit4xno+//09Ap3aXf4ltY52Fpro5YBXpj+wvE
   xk93fovoKshzuNBslKQVWezjWn7Nq5xnwk42DrJ5qurakRYYuVvIOZdVI
   Q==;
X-CSE-ConnectionGUID: eClm78hvTACek5WpOQF1Dg==
X-CSE-MsgGUID: j9RVNWaMRkiroLLJMGnFkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90383163"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90383163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:45:48 -0700
X-CSE-ConnectionGUID: 7rnmYMltS+6LuwK08jg4WA==
X-CSE-MsgGUID: tZmySV92T6ePi6tF2LN10A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238793303"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:45:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Lukas Wunner <lukas@wunner.de>
Cc: platform-driver-x86@vger.kernel.org, 
 Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <bd594d09fa866dc51dddc9a447c3b23f9b1402cc.1778736835.git.lukas@wunner.de>
References: <bd594d09fa866dc51dddc9a447c3b23f9b1402cc.1778736835.git.lukas@wunner.de>
Subject: Re: [PATCH] platform/x86/intel/vsec: Fix enable_cnt imbalance on
 PCIe error recovery
Message-Id: <177920194118.22546.5310422538363395935.b4-ty@linux.intel.com>
Date: Tue, 19 May 2026 17:45:41 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 14 May 2026 07:40:42 +0200, Lukas Wunner wrote:

> After a PCIe Uncorrectable Error has been reported by a device with
> Intel Vendor Specific Extended Capabilities and has been recovered
> through a Secondary Bus Reset, its driver calls intel_vsec_pci_probe()
> to rescan and reinitialize VSECs.
> 
> intel_vsec_pci_probe() invokes pcim_enable_device() and thereby adds
> another devm action which calls pcim_disable_device() on driver unbind.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/vsec: Fix enable_cnt imbalance on PCIe error recovery
      commit: 348ccc754d8939e21ca5956ff45720b81d6e407f

--
 i.

