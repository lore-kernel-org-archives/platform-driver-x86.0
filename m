Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550E312829;
	Mon, 23 Feb 2026 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864521; cv=none; b=asXfg4PcMCmjiWFv+MvUz3bhXIbcS9DUF+d2nRFeTnSL1Heo/oNn2svBs0jUMpR0kgvBo8BEhF9Nwflhg4W9pi3wG0WMNpg0mIrddxndFj6wB31dI0/jDh4OExuT/df6mrX1BH24OyCkrXhjepH/moK+vraqrmDAd0XeE+vGEts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864521; c=relaxed/simple;
	bh=jAhviwpMpWonjSPUxB12t1KSXgsoRf0XHLxQot+jY6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EZQe63eqXR70VDiEtNvkW4L+lm/IRk3C1jML6Nb+XHf41VydLNU78DHUqgHiWGrc8DO/fPbVQ7CdIo9oz9Iax/As6/5UFos4Y5LYuYGCFH9baoS1aapboXafG0sDTmvEOXWxgbqC2/6hS3vjazMkAquEXojxbW82obC21nLRnD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJleo4Ma; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJleo4Ma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864519; x=1803400519;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jAhviwpMpWonjSPUxB12t1KSXgsoRf0XHLxQot+jY6w=;
  b=HJleo4MaGGRgUBEDoYVppyauM3k+/zPY7m9qKISIcX+28GgECW2UMPoZ
   kYWkI9SFp3/Q11DVTstAnFKoJ4GHOvnmCg8ghgnHSML8Usd57HV/YePqs
   mKPbZ57OV70W16SRerHeZJhC6kkYsP1y3TrKa29Eo4TT9PQE3dh+zA8wq
   ZbWdt1Xsdr/7vI7UJzYuJCx7g1Si0sZ1fXtJTG6rrU8W5XQsEu0KbW340
   GAHCvG3PPomyE317t88d1mFh1qpHeBfBwzEJRlCxOqOcWE8o7zrlZ6+x1
   ANziNkjJWdBgUQtIY9N43AT/b4EQccnRpGZ8APwRUR8OtNIM6H6eP9yhJ
   Q==;
X-CSE-ConnectionGUID: KJ4bx6vhQXGBxMrfdrv2JA==
X-CSE-MsgGUID: A+ddvDczTbOcuXjNF8sWBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83575307"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="83575307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:35:18 -0800
X-CSE-ConnectionGUID: ospfdpxRSw60taDw/Ro4vw==
X-CSE-MsgGUID: VmezmPk8RK6JLvIbT8d1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="219733381"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:35:15 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Gladyshev Ilya <foxido@foxido.dev>, Hans de Goede <hansg@kernel.org>, 
 Jesse Guo <JesseGuoTech@outlook.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <TYCPR01MB6851636256C39B170F2312E5D192A@TYCPR01MB6851.jpnprd01.prod.outlook.com>
References: <TYCPR01MB6851636256C39B170F2312E5D192A@TYCPR01MB6851.jpnprd01.prod.outlook.com>
Subject: Re: [PATCH v2] platform/x86: redmi-wmi: Add more hotkey mappings
Message-Id: <177186450916.17917.11056298825778059208.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:35:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 26 Jan 2026 04:48:26 +0800, Jesse Guo wrote:

> This patch adds more Fn hotkeys (like Refresh rate toggle).
> Additionally, remap the setup key from KEY_SETUP to KEY_CONFIG.
> As KEY_CONFIG is supported by Desktop Environments for launching
> system settings, whereas KEY_SETUP is often ignored by userspace.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: redmi-wmi: Add more hotkey mappings
      commit: e3aa6feaf0cc30a3c941d15ff04bc1005a8aa315

--
 i.

