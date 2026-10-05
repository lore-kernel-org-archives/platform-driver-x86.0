Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BCB4D37C0;
	Mon,  5 Oct 2026 18:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226353; cv=none; b=FEKnk9I5E4QWK8y3Ro3PnfVrK7G8EiITy7WXCcYDp/qfHToiPcOOjsG99Yb/4Pz3lOe2m7CPQS9qLBqvv4dk4oWpvtMyb/4GOfW0YR+APHOcW3jvpd+TuFVaox5UZTPA/DRv9fZZn//6nzsILvzMDRTCerClxHOXkCI9ZbZPNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226353; c=relaxed/simple;
	bh=yQyoVga8kMsYbUi/rqGp817wToj7Dew6xz7gq7oEY6Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qZxD8a9iBUC+kji50C+Q79HsDq5qRx50qA3ck0eP5+bsgBJYxV2x6xaeGmGqgFOBMaTnV2i1+onv/gUQZGA9CESFWhJbiMS+ARSdieYwTKDiqxtju5OUBdyTHVTHWmtjTcXAlHKZYmRtd12VXEhGKV1SPWNJofsX36O62wMk0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fM4+VL15; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fM4+VL15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226352; x=1822762352;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=yQyoVga8kMsYbUi/rqGp817wToj7Dew6xz7gq7oEY6Y=;
  b=fM4+VL15jLn9kOe2lYATw+Kqj2p/TtOEVmcKBpAeRR/kAc6EcRf92Mtb
   jYZ07cbpniELs8XVAHStXk8WTIt+jNhUaAgmeYNHAfiB/a5+aGR62D1Ce
   v6TpQRxegMpVvveD0CmfdjE0yB16C90Ssx4vQb0GOkhYDmuH+9UKpDYNb
   VUYTrVT0WLXbaURl/LsvLhfv4Bctf0bS7j1U7rGN0LTj2v3gcriSAvUtw
   6mmhoo3fpMsfVkEfOG5OyVHFFXfFfJd5YNjpZP7BChd9gCaFRA2O8bhh3
   V1XCoawSYNsfIK1m3Q54fh0IVCVM0FR6aU13np4l465WXKuiGuhHMaZeA
   g==;
X-CSE-ConnectionGUID: WnLLPsezQeumy7WxkqrY+A==
X-CSE-MsgGUID: dBL5wJ/zR9iZCbVPfE/j4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91116619"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91116619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:31 -0700
X-CSE-ConnectionGUID: CUDq2gwTQdSZAOO5th4GVA==
X-CSE-MsgGUID: YXnVHMryR9alwKZmLT87lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280185969"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, Luke Jones <luke@ljones.dev>, 
 busybox11 <busybox11th@gmail.com>, Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260925144229.3693-1-denis.benato@linux.dev>
References: <20260925144229.3693-1-denis.benato@linux.dev>
Subject: Re: [PATCH v3 0/4] platform/x86: asus-armoury: reorganize
 visibility and extend dgpu_disable
Message-Id: <179122634386.41716.6771881185872374204.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:52:23 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 25 Sep 2026 14:42:24 +0000, Denis Benato wrote:

> This patchset reorganizes the visibility of attribute groups in the Asus
> Armoury driver and extends the dGPU disable functionality with a fallback
> DEVID for the ProArt H7606 series.
> 
> This good idea comes from Ilpo and this patchset is the result of our
> productive exchange (link below).
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/4] platform/x86: asus-armoury: move has_valid_limit() above the attribute declarations
      commit: fa70f4104fcfbd94ce1c15aca806e40e006b613b
[2/4] platform/x86: asus-armoury: let attribute groups decide their own visibility
      commit: 82d43b56a3397de99d8837879a64867c01f94872
[3/4] platform/x86: asus-armoury: add dGPU disable fallback DEVID for ProArt H7606 series
      commit: b47f0835a61c43d5265fa329862729e99fd06c6e
[4/4] platform/x86: asus-armoury: use sysfs_create_groups() and sysfs_remove_groups()
      commit: 737d4d357ea21e3a071336f88c1d26f7e0405096

--
 i.

