Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B38D18C32B
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Aug 2024 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723118811; cv=none; b=cLqD7qFJFGyDpGXtOAZOKcI59Z89zhKaIwbjHtVFdb8LEO45IJ/LJCYpLuJED6AGmViLen5FBTPVxSPo1/K5Nv8WUgiFZs7I13NkNYa4t5BeeoBr+zxgbUdvIuQ9RN24XR8BZtEpcjefExk4eNpFF4r5uDBDrklTGQyWiNYjaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723118811; c=relaxed/simple;
	bh=pIAVZKZebxQGtZP1gYOleHnrDad9m/biW6KgYEsQ2KA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J8kLPmWGEiWr/wWYJkGUZtIaqciDk6ORvYJaHqUxUep2rD7wiWFMxGsfbuo4CbFVWQ+d+l0QabxM7sME40ADwKQQfnAMBaE3nn0kANudjp64FCwrd5Yl6ExCURrm2b4N6Uq8KeYNpkXe8EkhMmsVCXAdBko7huET76jw0TwrDAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuVtqyyq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuVtqyyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723118810; x=1754654810;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=pIAVZKZebxQGtZP1gYOleHnrDad9m/biW6KgYEsQ2KA=;
  b=nuVtqyyq0maLYv+sXt+JXn1XLvCaPWtrMDQ9jx2qxQ7LuDu0XQW5N5I2
   e/FUvKLnpVhgFPuwBhHJkIpDsVJ2RDCsx+Def3+F0eGgQscD3tVz4uZF+
   fPU/QVCsDQzhX+qZhQ3nNIebRqfVmPEecSrON6kMOh6jixm1xgObMy8xI
   gMVPhe7zD/DL45sL+urNphREAl60rWnypU/E037IXdsHBTjJnQgonbs++
   Ho2K3yh3hR+iilkAO3bb5mROEN6rsYFkyrJ8itWcrAFpucKGvMr276apt
   PA1ZjxXBsy/+qME0WAxg2LgDcmP+7kx0meazzeOIfsY5DHda25CCy0u/i
   w==;
X-CSE-ConnectionGUID: Xtgp9P1qRq+BoJXnXOpXBg==
X-CSE-MsgGUID: N7wJihpUTiu6ru8hvZ1vTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21120473"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="21120473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:06:49 -0700
X-CSE-ConnectionGUID: G3HT7uJCRkig8r/WTzQTaw==
X-CSE-MsgGUID: ZSwa5DYSR1On/cSRA2reTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57290022"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.125.108.108])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:06:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
In-Reply-To: <20240730142316.3846259-1-Shyam-sundar.S-k@amd.com>
References: <20240730142316.3846259-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Fix to Update HPD Data When
 ALS is Disabled
Message-Id: <172311879905.2217.9045119915314057934.b4-ty@linux.intel.com>
Date: Thu, 08 Aug 2024 15:06:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 30 Jul 2024 19:53:16 +0530, Shyam Sundar S K wrote:

> If the Ambient Light Sensor (ALS) is disabled, the current code in the PMF
> driver does not query for Human Presence Detection (HPD) data in
> amd_pmf_get_sensor_info(). As a result, stale HPD data is used by PMF-TA
> to evaluate policy conditions, leading to unexpected behavior in the policy
> output actions.
> 
> To resolve this issue, modify the PMF driver to query HPD data
> independently of ALS.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Fix to Update HPD Data When ALS is Disabled
      commit: 78296429e20052b029211b0aca64aadc5052d581

--
 i.

