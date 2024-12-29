Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CD17BEC6;
	Sun, 29 Dec 2024 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735487051; cv=none; b=e/Y/JGE76eAkQDLN4Ej+Fp7rHvIk8sA+gLMHGwMgr9hka6b05eRtBQ1s+tp11HJomm8szaxWcHHz7teMvGFMzoqc8530WyYLJNL9pa/5xu3gHyu5X70VX/Mpw6NEVni0mRt94gRlRnRY7M5fesZke/tJKpRVSu8JqVq2Zw+PXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735487051; c=relaxed/simple;
	bh=jgV7EThc5OXrzqhmSCGvN/oGkk7Ql67JSQorXK5XrzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VIsobLibdgYJ9BgUaEyh4I8EXVWp79f3uQywnXHZTdMsek706yie6iHq3E2SQ1yl7V2KQXykTfGiNgYuWdsdbCbeGwh+mpSrPEfK3uzs3YgLy3+7PJU2JLI4ECxr3eNS/e1gdhjqF13W/mu+J5gU6tgqCVSIzhKU7J+mQ0kNam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFgwJApu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFgwJApu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735487050; x=1767023050;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jgV7EThc5OXrzqhmSCGvN/oGkk7Ql67JSQorXK5XrzY=;
  b=VFgwJApu3Y1ax695uZHaVmxcY9brYTLRogVrsjp5b8J5g1VlmJCF5PmS
   ro2VABgOEDKxVvfX2CVe6jultw7lE7Jqe70k6vYrvQtmVwPZast5wRmgU
   vatAuSOOcz178ZZxIXsNkuYZgRdue28NxPitSWqVXyNygFwJEe4W1GLbY
   sTxjzQgMvne7EuYiDrYrf7CJ4faNaSZNafsI1U0WQNYcl/zwRjNcM+P/n
   9DS84f8gJSzIfbWFo8WGRxEE8z5Z6B/l20/b+yTpuB2xq0hGqqhgV5Sbd
   /Fd3WGFfqwerZvBPDKmRTUmEgpkpCxP1eYCn5OIPjb9L+6hSTaD5v1aHT
   w==;
X-CSE-ConnectionGUID: yiI8rhDURJeDS/JtDQWS1w==
X-CSE-MsgGUID: Q55HNPd7TnuKP8hK0adeBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35672357"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35672357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 07:44:08 -0800
X-CSE-ConnectionGUID: C/gIeM7IRRiZjO4cz6TScA==
X-CSE-MsgGUID: Htx3j1UmS3Oe18rBM/WWRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131531623"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 07:44:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: corbet@lwn.net, hmh@hmh.eng.br, hdegoede@redhat.com, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
 Vishnu Sankar <vishnuocv@gmail.com>
Cc: mpearson-lenovo@squebb.ca
In-Reply-To: <20241227231840.21334-1-vishnuocv@gmail.com>
References: <20241227231840.21334-1-vishnuocv@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for hotkey
 0x1401
Message-Id: <173548704063.4495.17991964884526324774.b4-ty@linux.intel.com>
Date: Sun, 29 Dec 2024 17:44:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 28 Dec 2024 08:18:40 +0900, Vishnu Sankar wrote:

> F8 mode key on Lenovo 2025 platforms use a different key code.
> Adding support for the new keycode 0x1401.
> 
> Tested on X1 Carbon Gen 13 and X1 2-in-1 Gen 10.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad-acpi: Add support for hotkey 0x1401
      commit: 7e16ae558a87ac9099b6a93a43f19b42d809fd78

--
 i.

