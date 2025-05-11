Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49C29D0E
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 May 2025 21:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746999960; cv=none; b=nRFkemCx0gwgI382tx0ORFrB7zDCoLA6DuNfVPYGRnMhcwvQ9q9z0WaF3IKLn3bBK5S1meSDlejfma66dB9avxr0ex/DhbnsPV2FKTSGy+rNDw+I6zhJrkZzt8vygajxjRzbLhSNUJs6H9UGvsb4nykGsmMfo5fxY3z2EkTYc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746999960; c=relaxed/simple;
	bh=ryH0gRz1Eud/OChhzlPcELSO6ZvS+6GRf/eMb+fichI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UeMjhQgFAo3KkvGPI5NZQ638ipSvT6GbgrnlK0o+yNIui87Q/xzkaNXEL1/Ce8gaZ3Xlz7WeUksZOlOR/1A5UKmT8XNw5R/zCpU4Rc1ArxZXXqIPLI+0o66kh1gFqYCwz2x8RCNMvJ4gw2b99f+J+8ONO06gPQrkZ6ve6R900jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPD5Sh4S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPD5Sh4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746999959; x=1778535959;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ryH0gRz1Eud/OChhzlPcELSO6ZvS+6GRf/eMb+fichI=;
  b=ZPD5Sh4SoXOYqkLvLXnTuM6OP28pCt+tsk8tajXrjjeMRcek/EmHSlsh
   xbfPyIKjjXUcT9pMQO51J0ywclN3Zd1L/mIpckJF4DctSmJg9bVu865Gw
   Jixtu8D0tnMBSZOuqP5ebLmAiYz5483DpQ5rSvqxgIp4I2ixla6bUGNkP
   xE668U6TQeT+pyszyUO7eBlFgmAQNYYOEP+fSoG50CSdVe0Xah5tcsYIq
   LaKKpGsYYkTdgCkhqws7JQ54x9pL9HRJ8/Oi8IiUmFnuT6J2UjDhKDBYl
   ri8XhPrKFMVTl0vZop0rg8LRRRKHDdFOAYGCY32b32ABgV5d/8Rlg8Xoh
   Q==;
X-CSE-ConnectionGUID: 3kLKlnmQTOiHq4Fh7l56vA==
X-CSE-MsgGUID: xZLEceqZSSKXUCOh+ji/og==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48865921"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48865921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 14:45:50 -0700
X-CSE-ConnectionGUID: XeDNUBNPR9u07w9c9LoaUw==
X-CSE-MsgGUID: 43MR0j/yQ0ClTfMfthZOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="141245032"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 14:45:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: hdegoede@redhat.com, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <20250506101542.200811-1-suma.hegde@amd.com>
References: <20250506101542.200811-1-suma.hegde@amd.com>
Subject: Re: [v4 1/3] platform/x86/amd/hsmp: Use a single DRIVER_VERSION
 for all hsmp modules
Message-Id: <174699994255.12637.15173942861915017654.b4-ty@linux.intel.com>
Date: Mon, 12 May 2025 00:45:42 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 06 May 2025 10:15:40 +0000, Suma Hegde wrote:

> Use a single DRIVER_VERSION for the plat, hsmp and acpi modules,
> as all these modules are connected to a common functionality.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86/amd/hsmp: Use a single DRIVER_VERSION for all hsmp modules
      commit: cf8dea42e42b243e41878b57c0ecd898688234e6
[2/3] platform/x86/amd/hsmp: Report power via hwmon sensors
      commit: 8957cb9cfa76f95aa05b1da514de9b82f04b5a07
[3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to display HSMP telemetry
      commit: 0d74cb76f711d08a5a745da6e2bdddbeb06ee328

--
 i.

