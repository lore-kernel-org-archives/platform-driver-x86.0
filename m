Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46A951DAEB;
	Fri, 18 Sep 2026 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755920; cv=none; b=mXU5rdQU3fG11rvFFbYwTijZkA0RSopCAt8YQJfBAxZTFhI85GHs5NFWNGy9ejaJf03PgtjGWL0XpTojBKtRla01RCKGMxCRTlr1kIP/drDoIEIB556DcbrfqJduuHYhumMKsUPfI+spdUsnteDuauw5Bjk+7Nm4E91wz1zKNUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755920; c=relaxed/simple;
	bh=RHMCe+FUY2G7MkIaUiGNC/v5bd564LJR/RJYG1v47+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RwOFnrlSpvPkZJUdRbfec124S9RWqbVZUPPavLKhGeXGG0iYGdaKbmVxOpPBWKIueODLp20iySl+FklrwjFMLNMJOOC45vVhO3198498OQcQBoOpagAiCokoaje7IRYByOzyDrhNQ70Up8D1H0BcWJjHK/avn5yzAYI5ENLbA3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5vkPMDc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5vkPMDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755919; x=1821291919;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RHMCe+FUY2G7MkIaUiGNC/v5bd564LJR/RJYG1v47+4=;
  b=g5vkPMDcAQV4+6sISAlyRE9vj5ZnNvyuFV/9chnsUIX6eU7e56HyY7d7
   Rj9Uw2WoPmluKf2XuA9a1RhxT8K5nyyRtFWdqbaQmhI4FPTIrm/U+PNxb
   26QBMH+U3RyxyYxPoAc5eDCHOWocDH/KtRgi3BSrIDeK3Wa1X2TX/lzCQ
   U6JUiePo13uRQxI2+pwoWY5XgEvNoUIPms2/Ns6naFsf4qJQrfUsfhfEj
   mJxIBNCHJfZNqF5avHZ+zf19hMdYHKlj5bho0DHE47PLR3UScJt3081Y2
   xXav8sa94a9rk4qhrTbG67Be2eVLeoAjsE4cicZeZueiN6Bn2NTSFrvhe
   g==;
X-CSE-ConnectionGUID: EHkrjhTeShy96D7ZCxmYfw==
X-CSE-MsgGUID: p4RZnFlgTr2hoe5l7tF4jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100880840"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100880840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:18 -0700
X-CSE-ConnectionGUID: 3AibeBMCQ6eDGqU7LEKs6g==
X-CSE-MsgGUID: XVPYUIdoTmii+GiSy9gr+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270815702"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hansg@kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20260826163611.2268377-1-mario.limonciello@amd.com>
References: <20260826163611.2268377-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] platform/x86/amd/pmf: Add AMDI0112 ACPI ID
Message-Id: <178975591067.29716.11178545999496873708.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:25:10 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 26 Aug 2026 11:36:11 -0500, Mario Limonciello wrote:

> The AMDI0112 ID is used to bind the PMF driver to some platforms.
> It doesn't have any Linux side code changes relative to the most
> similar AMDI0105.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Add AMDI0112 ACPI ID
      commit: f5a87c46b851d843279ef568b8035f7de5a18c34

--
 i.

