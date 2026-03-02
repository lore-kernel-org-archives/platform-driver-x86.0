Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8784B421A18;
	Mon,  2 Mar 2026 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469767; cv=none; b=gyvn8rtLUA+bOM2EzkvDsCnc8eEp8jIQqcIZI6thTLAACSmRQ24wf+qV92VkUHCuI8+XfQ5t4gTTlSI3zu2UCfN4+ztKcEXHIctOhbGaAbA9GC7xpBcb9ddaYSdWAB5IUMrZNHLc8Nbh2z7bD5vC1Ayw+WA+vxGw2eM3CW6wYy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469767; c=relaxed/simple;
	bh=ea5m3BFJT8EgMgV7cqAaMAOpJTe2w1hqDB6okih/QPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GJjbwdjNz61dZap24LHsYgIMyNrUoQWJ5pzQXlUvpklvGYXSmCB31WK47+mzbHv9u7sQOkWSWw0eSdGfO8NJCuaTQBekYud5GZC2FRQjOfCXSBrNHb8z0VlO6qUkGLfrEit1x422KbgWRl+furlkFYMrnWB5g6iIoRS2Pa9uqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ld3ME+2r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ld3ME+2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772469767; x=1804005767;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ea5m3BFJT8EgMgV7cqAaMAOpJTe2w1hqDB6okih/QPk=;
  b=Ld3ME+2rtcrySXi9zl4xte8Ykxp3nr9aQdtt3s9Y/K3tvNSk3emy1eLg
   TFHGxqaM2dVe9H4xFt4d3xMmiHnhhAYcy8ZnSZluyYDlN8NOJaMeyfKZx
   hcR839fa+XvJEtnCmH/+qj7nis5A6onmUCozrzjBwh5qzJ694ITil0SBR
   16HjOFhpsrjzNUSQRd0NJl601lrPy+q6tkKyYzIXyMS/hAeqNegnNToNn
   QsEU8LnF25XcFgBbS3/73gOX9LLlTygF5VZlGKeK3riS8S5i0QkxIT2Xe
   eKIzmYEzsBn8Wnq7rKd0uUR1bHiaDr1bPiYDAaBgQ1I/JOAosTnq3WEso
   A==;
X-CSE-ConnectionGUID: xXLtyRPgTU67a5XtzqOP2g==
X-CSE-MsgGUID: Qr0rFqlXSjuFVqcX0vGyUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77349264"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="77349264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 08:42:46 -0800
X-CSE-ConnectionGUID: +bWo5r+vRHSmnlXExDnFyA==
X-CSE-MsgGUID: X/EiG+wvSiqQqeUv5EKJmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="215322321"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 08:42:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, 
 Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <aY-oAVI0TubcaD2K@google.com>
References: <aY-oAVI0TubcaD2K@google.com>
Subject: Re: [PATCH] platform/x86: pcengines-apuv2: attach software node to
 the gpiochip
Message-Id: <177246975826.2818.5117247389052101379.b4-ty@linux.intel.com>
Date: Mon, 02 Mar 2026 18:42:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 13 Feb 2026 14:40:32 -0800, Dmitry Torokhov wrote:

> GPIO subsystem is switching the way it locates GPIO chip instances for
> GPIO references in software nodes from matching on node names to
> identity matching, which necessitates assigning firmware nodes
> (software nodes) to GPIO chips.
> 
> Attach apu2_gpiochip_node to the platform device representing the GPIO
> controller.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: pcengines-apuv2: attach software node to the gpiochip
      commit: 0e59b31dbd3bfca96567e3d22518f4b6a7051a40

--
 i.

