Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C1318ED2;
	Mon, 26 Jan 2026 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439449; cv=none; b=hLCeJDRz9sgaEp6Iy3Ljljmi223jYgG+6yJyX4lXXykizmKpVskF731Kx/lC5PXtJbz2IveL3r5v7Psv/MRes8Pv2h7Q0T613wTszRTv69m/a/wj7CQNf4zgD6XxpE7A391sGoIMriTcFq8YLTM91fDsA9/w2KQeums5kipUXw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439449; c=relaxed/simple;
	bh=sorTOyLUq+tKDoqlWN4pw59jcqu+5ZmjN7f5pxe0gdc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iVqqoNjamMP5hP6jvUBYOlECoKYZDozCm3XArWi31s7PWut6w/HZV9XIUV9GS6wqmZGo4phbF1vNWx85Gm8UQQAuCBq8c02JT0plKEUDBGBkH1Yz/l0ar8I4Xg4ZuGR3WIqU8KzEKSmDvCHpaUjauZQRl8jSTgfy+TFfA2c0R7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aStDlU6a; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aStDlU6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769439448; x=1800975448;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=sorTOyLUq+tKDoqlWN4pw59jcqu+5ZmjN7f5pxe0gdc=;
  b=aStDlU6a6uMvhtaPOJVjbVP3m0dxyYG6E3PQP2yEVP9yKR/7XlktM8q+
   L8XO3GPX84lCR/2GHsrWpZoFu8MuQ7lanDznGQhWHofW9zgEv4fjgPVXR
   KCtqFNDe6tKYoMF2EOW9WprBpfm7o4eMmCs1UtZZfmhMO5B6zZ+U972OZ
   4lj0LJCyV1MsB6PAOC7bI0gOwTAmQUBfwSznZlXyngL1fCzUQpgeJPEPS
   qbZWNdBDKyCziG/iSjrPMHZyPggYDlHT+WRzKeyiQquVcNXaNr3oJCO/o
   F/QWc+jzWm1sSpl+QSYa2qrOr41dTXRRSBRYL98lzzmFJof44mfqYNyML
   Q==;
X-CSE-ConnectionGUID: Ks3Ms27xT8a9mxb0tJQKpw==
X-CSE-MsgGUID: g5sLSjx/T5imEYncgsVVOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="80916139"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="80916139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:57:28 -0800
X-CSE-ConnectionGUID: WYPIJdqSSkOiU2FQg1IcVA==
X-CSE-MsgGUID: dx0Ov3OIThGFeNodsg00/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="238373154"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:57:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Matan Ziv-Av <matan@svgalib.org>, Hans de Goede <hansg@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Ringeis <private@glitchdev.me>
In-Reply-To: <20260123225503.493467-1-private@glitchdev.me>
References: <20260123225503.493467-1-private@glitchdev.me>
Subject: Re: [PATCH] platform/x86: lg-laptop: Recognize 2022-2025 models
Message-Id: <176943944202.16098.16734044384761299725.b4-ty@linux.intel.com>
Date: Mon, 26 Jan 2026 16:57:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 23 Jan 2026 23:54:23 +0100, Jonas Ringeis wrote:

> The lg-laptop driver uses the DMI to identify the product year.
> Currently, the driver recognizes all models released after 2022
> incorrectly as 2022.
> 
> Update logic to handle model identifiers for years 2022-2025.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: lg-laptop: Recognize 2022-2025 models
      commit: 662c9cb86fc322038647d8808e751f5c6c0cc13f

--
 i.

