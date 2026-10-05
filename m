Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9704C2251;
	Mon,  5 Oct 2026 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222278; cv=none; b=WYFHFiLaHY0/6vgj+RZtxMP5KMFqlMSUewvCpzZtDq1bcPMC4qrHKL8Qt//NAY4nPGmqKMwRR3NpEDW0EVdwdAhmBHHPFa/GQnjg8kw4Kt/H3tdlVaGPbrbSF2BRha68YaFc7SU7e9gEQxk6cbZ/uRDVtMxW90XKfqEycskT0Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222278; c=relaxed/simple;
	bh=0Hir+Ew0XS9p4L1MHwGmKj0ydKLnG1wwr+jkHvhETcQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mW9P4xIAr27nMvy+mMbmNSNbpuE+A25+gJO5CXU4QCrZoOkgLOdST0lniGuv1P4Yeqx75SkB2vMiPYsSJOu7mgvA805qgcSX203EBOeQRNEWP3HxQ3ABRCTOjv4CVjBtXJFlnVYiQ5LQMIO5MieDlTg3DeAI0juzKRhETIwptPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHJ3l6Kh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHJ3l6Kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791222277; x=1822758277;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=0Hir+Ew0XS9p4L1MHwGmKj0ydKLnG1wwr+jkHvhETcQ=;
  b=MHJ3l6KhjMwgU1LeWP7FBuqUD0EPQb8zywPGchTpxyzhxZo0pyUHNk9C
   wU+aFN/Iq666pI+6128v6LFfaSMU39OQpfsoxyZ/gZZpGNT6fcDuIt/3w
   HLyMZd5Nn5sFtcXHObPrOA6ZC6h3C02mZn/O+GOU4JX4ZJGlqUtdWpVGk
   aFT1dbVuI/Ud0jV0KDqgQpKv2iWDU5R1HyUp1CuxYqfy9th1vv4ZCnvpe
   KS2YH/0EkqzPr2nfTjhIrySIKDUo6+Qy3BiiV/9QtjStG6usZQQYdfRcX
   +yGN11LOO//jDi55vdis1VuPijVvjlBm9mk8HBy/dBG4GybzfjLR5LoYm
   A==;
X-CSE-ConnectionGUID: lIbdAZ9iRYCOOfW1NpNQ2Q==
X-CSE-MsgGUID: a2GG8FLHS5WciR0OjNhMfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94391055"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94391055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:44:35 -0700
X-CSE-ConnectionGUID: zys18tN7QPm1MW4AQ7FOBg==
X-CSE-MsgGUID: nDjC3tewTfmx7GDE1ktTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="314882028"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:44:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Thorsten Blum <blum@kernel.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260907090103.352995-3-blum@kernel.org>
References: <20260907090103.352995-3-blum@kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove unreachable code
 in beep_read()
Message-Id: <179122226544.27048.17572931467762515041.b4-ty@b4>
Date: Mon, 05 Oct 2026 20:44:25 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 07 Sep 2026 11:01:05 +0200, Thorsten Blum wrote:

> The procfs entry /proc/acpi/ibm/beep is only created if beep_init()
> succeeds, which requires beep_handle to be non-NULL. Remove the
> unreachable code branch from beep_read().

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Remove unreachable code in beep_read()
      commit: c48091a8ac16b0fd1e7ffed29f11c4e6ea1acbb4

--
 i.

