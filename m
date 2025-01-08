Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA8119D090;
	Wed,  8 Jan 2025 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334702; cv=none; b=FqS1ZeqRaAloLSF4IyOB9D9elPfmbH+DdWhhFHu9fVsZ4+ohsYC2NHLNSfilac6Sui+a+v1uTRC5k4IqQnsnQlUc5J6hJWMJvKv2AgSMWFhIdFR6lNhCvMzezno565wIdJpN2TDt2qOlywKd0SuQ22A2Gfy6LHZo6Mw+tgeqeFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334702; c=relaxed/simple;
	bh=kwsCgzQSdcOrLoritevWf1RublreepjcPEFnm6tkEYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lSRwkE75naqc2uIS1NWsmHi6pcmS0eNQilQFzLQrZmwIxM59ghAvsE/1gjxck3D8bJwpURcYUKItUIsMAB11/epQeZNQ3Zn/oiDByAXXL9CeWrAjGLAuudYlph6lwnMJVh5hWPLCW1ZCMaSu712sDFnZVgj+JKFOtrNoHS14s1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6FhjQHO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6FhjQHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736334701; x=1767870701;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=kwsCgzQSdcOrLoritevWf1RublreepjcPEFnm6tkEYk=;
  b=T6FhjQHOZ6Y0QDWwYS8N+aUPqbIFK9Y9VXFLt+g64AIjucKhvsMEZJ37
   YjKCJGphf79yxX2Rc0XbNOWanauCxwg3cBwuX/C5pGfa7upPr12k5rXPv
   Gmod0CvSeqM4icw1ln/bi4EmrB2QCx1KBjZrHXCmq0Q96XZDiCcVQG5lh
   RO5PHDR/XMtBahP7+WpiP7yw7BF7v09YaR4lb1NLRNA9zonT/nsd1x8O5
   Nhg5pt7pWYNr/gOdH22NnV7zK/gnPYc9qA+pq7PnPPHz9akW/V/XsAHGG
   rAILpXS1TiIlzeKeOVEmUQV4L16vdYiq5CpKHrhSQqqQ8wATIWnPKznND
   g==;
X-CSE-ConnectionGUID: O679FiMVTciLLo4GHt2UTg==
X-CSE-MsgGUID: 4pMbY0yDQ82m+2nLCENAFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47050240"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47050240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:11:41 -0800
X-CSE-ConnectionGUID: PRUa4kdSQ/6xUCFQujhr0g==
X-CSE-MsgGUID: bBli7EP7SjigimY1SPIk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107089828"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.87])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:11:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Joshua Grisham <josh@joshuagrisham.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com
In-Reply-To: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
Subject: Re: [PATCH 0/6] platform/x86: firmware_attributes_class: Simplify
 API
Message-Id: <173633469220.6326.1216394066803003676.b4-ty@linux.intel.com>
Date: Wed, 08 Jan 2025 13:11:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sat, 04 Jan 2025 00:05:08 +0100, Thomas Weißschuh wrote:

> Looking at the users of firmware_attributes_class makes my head hurt.
> Simplify the subsystem and its users.
> 
> This will break the currently developed samsung-galaxybook driver,
> resolving the breakage should be trivial.
> 
> Only compile-tested.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/6] platform/x86: firmware_attributes_class: Move include linux/device/class.h
      commit: 34a5894672f73ebce2a7efec2a8a7d785c76adab
[2/6] platform/x86: firmware_attributes_class: Simplify API
      commit: ab12105347d50857aece92b65a3edbe93c0d3060
[3/6] platform/x86: think-lmi: Directly use firmware_attributes_class
      commit: 20d23c51a0d69c38f4f2b02ae969b9cb33cf1555
[4/6] platform/x86: hp-bioscfg: Directly use firmware_attributes_class
      commit: 2765aa5e28fdab6590e9b4633a2f7ad26f3b7392
[5/6] platform/x86: dell-sysman: Directly use firmware_attributes_class
      commit: e8866e8892753dcdad48d6aa9192d91dcd32d94c
[6/6] platform/x86: firmware_attributes_class: Drop lifecycle functions
      commit: c200f9b6c2a461fbbdae3a04fee9a045ec215297

--
 i.

