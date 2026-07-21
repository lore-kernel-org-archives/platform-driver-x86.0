Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2B63E63AE;
	Tue, 21 Jul 2026 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654166; cv=none; b=JXVBg/wDGbE6KUvj8yFh/sKznukWqSmL1asRL2s4yHqKpyAfyvTr/Kdt8x1SQ/BKw2HldonLMbweGQuRr3vmEnGdHq4Bf6zU3fot/5sWOWe1zM4s7IAz2BOcZML+aN0zUuuftfSFG4E2nYwWS/6omNGDLkSsHDEEflJ4ENFsMU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654166; c=relaxed/simple;
	bh=Ok+M0E6L3CXBgfNtOIVa9inx0M2WZCFurgdJpt6Ccy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BOARFUrxUidrZm3ekERojKjKFmdptqn88/USwiEsRsxV1BtJuP9fAXUcXuYXTLk4ilXRNdCUj6gDSp5vNmpwUmhwPfkPXTXlLgQ72pvXkqsq30q5e7P5iH114AVr+cP7ID0Qjc2Ecwti0TorxY1Qq95LPnCFhNe53UpXuI3Jqzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8gHXhid; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8gHXhid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784654166; x=1816190166;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Ok+M0E6L3CXBgfNtOIVa9inx0M2WZCFurgdJpt6Ccy0=;
  b=U8gHXhidSWpYkiyOFpDMQzOywfK0GMizII77Vp1ABGAWouPK+EIksaiG
   2tDtyVYe8PDF2ULrV6ej+xzT9QuByKyBN+xlJz7Y341nGbjuZztWzhe1I
   J22hZXx3nXqyULslWI2iX/EuFp/ya3dPoRzNF/RWm71VHmaYiPvJRVQ4t
   v5mypZ3ocv5Atabrm+flvUrqZDaKa0FR4+tI5KFYHtllYv65TvkuKAAFo
   n1YCOvqIUdyzrajKtca7oPW1YCj5w3Yy91elMaXKzsdtwI54YQtug/hx2
   CSG9uHvWeqZNYjG4RVEStSuVuYR7hdBPEI8zL6r+gNgc1ZIVL33nC7LUx
   Q==;
X-CSE-ConnectionGUID: N1eMVfhrRHGNXw/XelhIDg==
X-CSE-MsgGUID: +WAutTFVTJSuJzLd7dYLOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85464649"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85464649"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:16:05 -0700
X-CSE-ConnectionGUID: zeo9zSEVQ1q45Bo2kNPZXw==
X-CSE-MsgGUID: D8SiN7XkS2G5geEJmtOB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="257894097"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:16:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Yap Weei Choong <ywc8891@gmail.com>
Cc: hansg@kernel.org, Shyam-sundar.S-k@amd.com, mario.limonciello@amd.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260717060744.1252065-2-ywc8891@gmail.com>
References: <20260717060744.1252065-2-ywc8891@gmail.com>
Subject: Re: [PATCH] platform/x86/amd/pmc: Add T14 Gen2 AMD (20XL) to
 s2idle quirk list
Message-Id: <178465415823.18499.423675499330587923.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:15:58 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 17 Jul 2026 14:07:45 +0800, Yap Weei Choong wrote:

> The ThinkPad T14 Gen 2 AMD was sold under two machine types, 20XK and
> 20XL, but only 20XK has been in the s2idle quirk list since the quirk
> was introduced in commit 455cd867b85b ("platform/x86: thinkpad_acpi:
> Add a s2idle resume quirk for a number of laptops").
> 
> On 20XL machines the firmware SMI handler therefore still runs on the
> NVMe D3->D0 transition when exiting suspend-to-idle. With IOMMU
> translation enabled (the default), this intermittently stalls resume
> for ~10.25 seconds: seven devices across three root ports (nvme, both
> xhci_hcd functions, xhci-pci-renesas, snd_hda_intel x2, snd_rn_pci_acp3x)
> block in pci_pm_resume_noirq and are released simultaneously, consistent
> with all cores being held in SMM.
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
[1/1] platform/x86/amd/pmc: Add T14 Gen2 AMD (20XL) to s2idle quirk list
      commit: e25fb2258bddbcf70df69d1358be3e1274bdc5f2

--
 i.

