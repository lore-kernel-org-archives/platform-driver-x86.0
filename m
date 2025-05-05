Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97301D54EE
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 May 2025 13:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453133; cv=none; b=idlYZtbTUVhhbs74ei67YbVenVZrT0OkJU3chi4cUtIuR/ECtD3Ywc9zRru5F+zCq9vUI3DeNmoQhVW05SFz9Cb8Nd9N4Uk4Y11BfW6wyrKUCbXKy8Bqu4S8XC+MPv3pw2ziGtyfHiWvk4giKHnf6ToysNmAvgToV4fxoFTNwq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453133; c=relaxed/simple;
	bh=/dnKWkCn0qVth+sjh9zdYX8+IpqMJJ/Iyo4hdN9veHI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GzKQgpGtOJwlmHatQgH/NFpVzggwZzBhF/3o5Nxi73siQN/nkrsM8mhc3ihOL13V67yui388MIaBPI+RmLsSpyho/fzPTP+cJM1RMH8nd/A2k7CEq1yDaH8qWsvwXp4r6tQMevXKQy8/010WZrBT0B+R/jhaSC5jnWZlkYpdKDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlCa5HSz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlCa5HSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453132; x=1777989132;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=/dnKWkCn0qVth+sjh9zdYX8+IpqMJJ/Iyo4hdN9veHI=;
  b=MlCa5HSzpmPVMmdDKg56qn5r2rrkQKhRL+q9FM71+QScb72hh+ctkR9+
   4L80FK+c9NvkCZIhrmro8hO3VesrZ/3WgPkaWN5U4YPXuHcKEmldH802F
   3AOHmg+IzTf1rP47YdOXF4D03leE0WBUA1+chU9vSjIOtycH3NCOKuH43
   kce1OGNC7zEn5rNQ5lBsviKSvCGK1psJ0Y9y424v+dtSneJ/Ypsa5fZmd
   MyDOAgHAvjObV726ij0BUOuhHExggwuxnt0pLULA2dncV2ky+h6dvBRKP
   cYWiUqgfm95cYtSukbHI9kWav0yB1gt3078xep4SM842SRnD13PwA6IoU
   w==;
X-CSE-ConnectionGUID: gap8rSxrSX2/3xgMXRsS5w==
X-CSE-MsgGUID: UMSmCNJvTraN+GJgYINK7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="48073033"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="48073033"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:12 -0700
X-CSE-ConnectionGUID: d0ipOUj8SBChuMeVdQaXAA==
X-CSE-MsgGUID: a57gIuESQe27GK/UThdksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="134994423"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Vadim Pasternak <vadimp@nvidia.com>
Cc: michaelsh@nvidia.com, alok.a.tiwari@oracle.com, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250504165507.9003-1-vadimp@nvidia.com>
References: <20250504165507.9003-1-vadimp@nvidia.com>
Subject: Re: [PATCH platform-next v11 0/2] Add support for new systems,
 documentation
Message-Id: <174645312453.23202.12181127273904515379.b4-ty@linux.intel.com>
Date: Mon, 05 May 2025 16:52:04 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 04 May 2025 19:55:05 +0300, Vadim Pasternak wrote:

> Patch #1 - new compact system SN2200 OCP rack complained.
> Patch #2 - Adds documentation.
> 
> Vadim Pasternak (2):
>   platform: mellanox: nvsw-sn2200: Add support for new system flavour
>   Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform: mellanox: nvsw-sn2200: Add support for new system flavour
      commit: 28c336807bcf0b330e080029e54216752d67fbd8
[2/2] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
      commit: f2bbc625cd6d8c99fac395004dd16260f0f50f8d

--
 i.

