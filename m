Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131F36C0AB;
	Fri, 10 Jul 2026 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706062; cv=none; b=cOugblvr0tTyvN8iSWnLIMm3mAKWiu85LArsqtyCoqG+I2qt1qeVN15gk7OG62fvhkwGa/DJ725tuzI4u5vk72EGeqydRfTl9o/YnVesTxHHUHHi7DM7mdWi4t08dOgL+Zpd7IjxCXVCib6WbtJzfUqjkn3jLA6yrJIFMo4iyH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706062; c=relaxed/simple;
	bh=qAUCCfNtS8d8zRI6VE2nLtqELVIUihpjRoeYA5Brv44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AOkJRdClq55VKMFKw6py9WFj/QJHA2nIpU82Z2L/FxF0St/WzKvZeduOleyqzRXDSnFS1fx7JYQTKaY8rjCz3URKoA5kcOeWgJebjKooYeBcK++qL2COEwDB8sPYOSoZbodW7kMYVDFuJpvsbnHdvxjQG1BnLADmZlY1StYD6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRWYu9hg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRWYu9hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783706062; x=1815242062;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=qAUCCfNtS8d8zRI6VE2nLtqELVIUihpjRoeYA5Brv44=;
  b=cRWYu9hgPweeipRLscOM4bgNRjQVvtoKHZiV8Q2Q76tUt3BtM5uJA75m
   CQdcoRWCP6mFr38ivds+uwsBN50U6n0f5f4ZFSdUkUvL8v3pgSSvYccIX
   r0g2YAEfuq2PmTFi+JBe127a6pWpOpXe2BSnCAdnLBpicTIUJZ47UuRSI
   ysLNVLec70WLfC0xUoJO6hNV6qvFBMcQtx6tHdFy6QWx3Vei9GGp2bbZY
   42SyKCiaxXYbDuOanIcMqnKZDsvWY+BnzcCfAc0Z+AIC9T+JHN/pE+P68
   U+rBf2e8qIf9ORvCuRuAq0JcE83XZ/AUja0036Q5BPX4n/yi89gAegWwa
   A==;
X-CSE-ConnectionGUID: 1c02+VcrTWKZD1Ea4ndt7w==
X-CSE-MsgGUID: zboLVnRTSnWSZnPP1CP/Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84601123"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84601123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:54:21 -0700
X-CSE-ConnectionGUID: JBWTCLCbS/e0upmOltbfqg==
X-CSE-MsgGUID: 9jqgP63hTguVkgIKCWHTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279353353"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:54:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>, 
 Travers Biddle <traversbiddle@gmail.com>
In-Reply-To: <20260710165841.59957-1-denis.benato@linux.dev>
References: <20260710165841.59957-1-denis.benato@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-wmi: temporarily revert to setting
 a charge limit
Message-Id: <178370605409.33235.3455138324911469742.b4-ty@b4>
Date: Fri, 10 Jul 2026 20:54:14 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 10 Jul 2026 16:58:41 +0000, Denis Benato wrote:

> A userspace regression has been observed leaving the battery charging
> threshold unconfigured, so while the fix is being shipped revert
> the change keeping the infrastructure in place to return to the
> preferred behaviour as soon as it's appropriate to do.


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: temporarily revert to setting a charge limit
      commit: 78bf392ba77dd8b2a25656e489449d2f91cfd1eb

--
 i.

