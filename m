Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E02E737F
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991139; cv=none; b=HB57qF9hb/48e/n9iTyEczn/ZtkZiUbmjtwPEPJpnNW5eCXnAdHjRXSefJGC5o9Z+pVMptGtV500C6qL9FBx8GhpAYLxRHKaCYYGrYWD9n1sKECw2j57erc5I/EOpLI25RJpmk8HySKiLx3WHBd0bcYbqbnwLRZWPnY3j7759AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991139; c=relaxed/simple;
	bh=MYHO0hjlPFx1MpINQeWgKX1WzoabnW2piWFoFGFkgqY=;
	h=From:Date:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=NqJDFIn1Jd5henyRBha4E68v1ZmsQWk+bqxdyHYTKgXIw4D7Kcfc8tq76qIM/Cr4MUdABKms0js5aC6F5mpFVNpLjLnW00O6XnZfqvX558CPRbR6adYp7oXUMWWnV+FFFjyfxqUoesp7cnWCMh4pGG99SvD+fEbyB3WTegbIS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUXb1yjm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUXb1yjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780991133; x=1812527133;
  h=from:date:to:cc:subject:message-id:mime-version;
  bh=MYHO0hjlPFx1MpINQeWgKX1WzoabnW2piWFoFGFkgqY=;
  b=IUXb1yjmthz8Rwqh59eTuJDbAEmCdV6x5fsj53XKGnnLqS+Pr1t78e/Q
   bVQQnIqoNY7gfmD6yelksPfVpl15OndupxmrDVPZ+yUXHAmkZzor3lK0I
   yRsyGlwCvLJ/aqo6rbEuWaPosnI75TJ/A+HWrWLYCIwZrXR6J4TL5u1/A
   1aAVXFl/KDd2ryER4IMPg9xyFu8ZVK+cyAotz53KS3PhVZAJQTcmatZ49
   LIRmcR2WzCFIFlEEVVoARPAWTvzaR9BfrFe1RHmVQe53XVPUhnCQkq4HB
   1JGZ/cY5SzBfucNbxSMXNx98KnZQf79TgI98e0G3sQZPMsK19CnwAXCNI
   Q==;
X-CSE-ConnectionGUID: 8V564+oyRVCJWt+zZkGykQ==
X-CSE-MsgGUID: r3/wTstFTpytdFNQhrtd7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81808734"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81808734"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 00:45:32 -0700
X-CSE-ConnectionGUID: X+tURiCcSXmtd+UpeWmpFw==
X-CSE-MsgGUID: 4yjZUCVPTTCqRC6NNMyCvQ==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 00:45:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 10:45:25 +0300 (EEST)
To: PDx86 ML <platform-driver-x86@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>
cc: Alexander Egorov <begeebe@gmail.com>, 
    ZhaoJinming <zhaojinming@uniontech.com>, 
    yahia ahmed <yahia.a.abdrabou@gmail.com>, 
    Mike Bommarito <michael.bommarito@gmail.com>, 
    Krishna Chomal <krishna.chomal108@gmail.com>, 
    Gleb Sonichev <sonichev555@gmail.com>, 
    Luis de Carlos <reskoldo73@gmail.com>
Subject: Recent patches accepted to fixes moved to review-ilpo-next /
 for-next
Message-ID: <830c8271-3d7b-ca2c-8607-4afacb628e17@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I've decided to move the queued patches from the fixes branch into the 
for-next branch (first they appear in review-ilpo-next where they progress 
into for-next). The reason for this is Linus' recent change in the fixes 
acceptance policy:

  https://lore.kernel.org/lkml/CAHk-=wjt1NiKOdyAMz_DT7NmZ++SizPOhRSi492ukdTnpDzHQw@mail.gmail.com/

This also means the fixes branch (and review-ilpo-fixes) are reset to 
the commit pointed by the platform-drivers-x86-v7.1-4 tag.

I'm sorry if this sudden change causes some inconvienience for you.

-- 
 i.

