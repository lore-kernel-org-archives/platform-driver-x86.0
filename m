Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE21D530
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270726; cv=none; b=rzyK1cska+2cklZg0SV1qcTzSotsNWoeLe1zxAbmffA7GNB2YQo2xL7U4nJBMVojuTPrr2z8EH/WI5BUYmNoQ4NFm19g4m+i0ez99Bn2n92AuuxQsPdRq0VbDzQxEpRBMrYeRal16rSvYjlAKT9HU9W+XwCKZhH/aI1I+9t1lKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270726; c=relaxed/simple;
	bh=XON4Kc7v8VvBviwdmSUD9aqPsB0DcXli/U8Xf64wwV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b1EZr1NVY4mIwrpzMLixiZMGK1SRyjFByzroEOw+4yitrU+/JGIeFWaK2T6UUYdVIdm+e5X2E/9/Q8x9xBYy0Fk1Ui5vDlX63Pkdd8qE1UJ+eJytOM2+wkldQoiOXc6OhbUF97TdlRsHuS4zsdtaCRaLocP2xoWyNBMYZMkHTMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsfA6Ce9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsfA6Ce9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713270725; x=1744806725;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=XON4Kc7v8VvBviwdmSUD9aqPsB0DcXli/U8Xf64wwV8=;
  b=YsfA6Ce9q/1/rNnKO0w++KeTQeSaj782Rt/jU8wcMCJ1q2MrYe3qfEkb
   SeWoda6QXvBJgrsTwUnMzRQ/0r1NHMLj1jA8k4dhQodejXg6UrcJf4Vjs
   lmm94JbAJmuOee1Mwa/oPWK823kPgWOeRQagZ2kmvdPqjwPDOYPFUgI/f
   6br44XmNBfZl3HXUE0VWHqIb0F5qOMZDBkyy1JqbBg59CSwB0BiYvwlSj
   NM3Jqdz9IUvqxXZxVFnNPsBHJPB/WQtZqffMRfL7J9EELIqJEcSOGBhBr
   TELCYbzhzamWifrdZhO4llYR018GiFyzAC2pbU1qS3+zBLnucHXZ5HMx7
   Q==;
X-CSE-ConnectionGUID: N1zOQNlwTXWolh/TMp5UXg==
X-CSE-MsgGUID: BPnm1MywSnC9bJpSehk/xA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8868736"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8868736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:32:04 -0700
X-CSE-ConnectionGUID: Jf+Fv7YfRk6OhnLmmnKVRg==
X-CSE-MsgGUID: 7lNAi0wJQCelioTsUVtjCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="26887497"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.34])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:32:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, al0uette@outlook.com
In-Reply-To: <20240410140956.385-1-mario.limonciello@amd.com>
References: <20240410140956.385-1-mario.limonciello@amd.com>
Subject: Re: [PATCH 1/3] platform/x86/amd: pmf: Decrease error message to
 debug
Message-Id: <171327071596.3662.6978319849013106734.b4-ty@linux.intel.com>
Date: Tue, 16 Apr 2024 15:31:55 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 10 Apr 2024 09:09:54 -0500, Mario Limonciello wrote:

> ASUS ROG Zephyrus G14 doesn't have _CRS in AMDI0102 device and so
> there are no resources to walk.  This is expected behavior because
> it doesn't support Smart PC.  Decrease error message to debug.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86/amd: pmf: Decrease error message to debug
      commit: 03cea821b82cbf0ee4a285f9dca6cc1d660dbef3
[2/3] platform/x86/amd: pmf: Add infrastructure for quirking supported funcs
      commit: ed13f622bcd594d6cefd6239b1722ed8b84ba98f
[3/3] platform/x86/amd: pmf: Add quirk for ROG Zephyrus G14
      commit: 9d893061ed68820de24b572d1e193b5e4737f2e0

--
 i.

