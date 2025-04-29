Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1A21ADC2
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939028; cv=none; b=PhsEub47qVe11w+pqPCCbm/7oX4q0EOfo2Ihh5H3r7aSpGT4Hl49FGqXEa9XXqrdR/5/DGZgJDMoCDVl3Le6onu5OuSIgTojlY7yXMC5ceGPom5mqV5eCfLB8SYLpkS9a9MHy09UuU86DLJ7B4OoiDbEe2P61gA1yocIOVkhURg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939028; c=relaxed/simple;
	bh=4Ioti+KOXo9jXs59B0HzHQNKA05gNUmWBW9zCfnx54c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cTC8Y5iiB3wwWWtfqhTA5ahJwA7hlwVYRbCwhJx647piuw1f1vadJnb5sYj1g7BG+cDFxgyuC0MUgNOAsk7/PRVlAH4X13VLtBERt9SPLPhyt2dLPjTakcx0EfPZ95jDfdnJGk9FXPCzrAMtA4R14Mp/0ri7NumEOWl5x1Z55ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c895exFX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c895exFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745939027; x=1777475027;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4Ioti+KOXo9jXs59B0HzHQNKA05gNUmWBW9zCfnx54c=;
  b=c895exFXzi05IB2mIrcQ7YAUVO7XsRQpuc9ZYSsBi0zz5sVuau01QaW2
   Fa/ZEMEq/ROf4ybwEe/e9wGVHr+KF0CIvEdufosTpXHtRkiTMfzMTGnP4
   oOYfb0pLnZf7dkHgfoPhLLwQxgQNeC4sy/BXSUTgvY0GT5md00YJnlAmh
   LqJDHNvdmYVScEAfYUG3S70l2GbehB6R+UYBHEnBMErn88SYFRB6SEFhT
   ZXmcEmfrS47b3T3C8xDabJNTiLxWYw+s4VxV9+wFwVDCkTPi23dTkciQn
   tMO2BfMyBRsvwwK59LRjrzUsI+E9LtTPzDwhko0vtsHqJPAubHW42FUVH
   Q==;
X-CSE-ConnectionGUID: 2IjrxDzCQXCAcas1isGcLQ==
X-CSE-MsgGUID: 6F2t86wlS22Bj4jabnGodA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46683895"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="46683895"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:03:46 -0700
X-CSE-ConnectionGUID: cRlQGJ7nTomZrAAUVgsRiA==
X-CSE-MsgGUID: +1XS6qJ7Qzybx0V4SQveYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="139039898"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:03:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: hdegoede@redhat.com, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Gregory Price <gourry@gourry.net>
In-Reply-To: <20250425102357.266790-1-suma.hegde@amd.com>
References: <20250425102357.266790-1-suma.hegde@amd.com>
Subject: Re: [v2] platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as
 mutually exclusive drivers
Message-Id: <174593901935.4398.15276215453608364449.b4-ty@linux.intel.com>
Date: Tue, 29 Apr 2025 18:03:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 25 Apr 2025 10:23:57 +0000, Suma Hegde wrote:

> amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
> amd_hsmp is for legacy platforms. To achieve this, it is essential to
> check for the presence of the ACPI device in plat.c. If the hsmp ACPI
> device entry is found, allow the hsmp_acpi driver to manage the hsmp
> and return an error from plat.c.
> 
> Additionally, rename the driver from amd_hsmp to hsmp_acpi to prevent
> "Driver 'amd_hsmp' is already registered, aborting..." error in case
> both drivers are loaded simultaneously.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as mutually exclusive drivers
      commit: 0581d384f344ed0a963dd27cbff3c7af80c189e7

--
 i.

