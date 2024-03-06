Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AF7F7DF
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709726301; cv=none; b=nA6ZnQ+B210iC8OydyGhu/7ULM+/r5WH+QNemyBjg/WXnkhd/fRUJz6ztK0DBLOKzK17G3uEMqHD7zq/o9gDhwrtPSRnDOnljopeZ76p6OWw54i2ng70W5hof4vUCdBGoss8XSdqq8TMfy+GGTfmCuKXcMit52xSz2JbgUfUXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709726301; c=relaxed/simple;
	bh=e7ifdVJgiE82pid3MAdNGXaT/hMKuXFrvPe8DMUbS2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HAFMY2KE0FxSkNK5emestxvV8aNUhQ9yQ7kiV/fgkERNodr0ZIdOCiJ+OkNtAb9+sNnury+vtZPhrTsgb/u0xW4Pi8RW6FZYDNMdSU04k9IUe/YR2xO3gO2fnlYXrCYR6DN4ooagVRJsJ/uoTcPlpuW84R+kmuL5ZWrEhy3rT8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQykJv/z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQykJv/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709726300; x=1741262300;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=e7ifdVJgiE82pid3MAdNGXaT/hMKuXFrvPe8DMUbS2s=;
  b=YQykJv/z0DkjY8MF/439KBZLHfpzGoL3rMDkXOUQbfwML902qdzmq/lj
   fwwVlORoEj9OKnWIV6NS8z3EY6QURu/qKZDwz+o/S3P4bCdD3re5vlbuG
   Zn0J6tzdcYdxdtZpCZkqK/Ve9wfFEo4hTIpBiqdLMQ8p163b3eDuEzouO
   JNJLROyZteCEAe03WcRXXMqBarttC+y4zgKa6o4L/GJ6xRKA03SINYZG4
   Y2vnwCPCB1wzCcnlWLp2pXcB07Q0QZSSCJWS8MqNF+oNARUmrT7fp8QZA
   sIpPT9u3MCdmO4oCNmRVac9fnopn/0oeHkY3bOJXdMc70/k0TNmtyDPGW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4516300"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4516300"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 03:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9704725"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 03:58:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
In-Reply-To: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3 0/7] platform/x86/amd/pmf: Updates to amd-pmf driver
Message-Id: <170972629171.5314.2228611025059395200.b4-ty@linux.intel.com>
Date: Wed, 06 Mar 2024 13:58:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Wed, 06 Mar 2024 17:14:08 +0530, Shyam Sundar S K wrote:

> This patch series includes:
> -Add support to get sbios requests and static slider as per new APMF
> specification
> -Add support for the APTS (AMD Performance & Thermal State) method
> -Disable debugfs support for 1AH family series
> -Add support for heartbeat notify event to OEM BIOS
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/7] platform/x86/amd/pmf: Differentiate PMF ACPI versions
      commit: a8698c93816a5c54f5fc4813bae7a0704c223624
[2/7] platform/x86/amd/pmf: Disable debugfs support for querying power thermals
      commit: ebe6b56551aef62fd4a0fdb6d7bed2a134ec40d8
[3/7] platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
      commit: 899d87bdc5f679e4da77034a8cfdb4b10ca61321
[4/7] platform/x86/amd/pmf: Add support to notify sbios heart beat event
      commit: 6eacd474b8be46278fb9df89012e921c7a76fea3
[5/7] platform/x86/amd/pmf: Add support to get APTS index numbers for static slider
      commit: f1bfd1afaa45575be8f0068018176a756d74c65f
[6/7] platform/x86/amd/pmf: Add support to get sps default APTS index values
      commit: b25e64553ea6a1879a84d32ee9f3da904f1cf336
[7/7] platform/x86/amd/pmf: Update sps power thermals according to the platform-profiles
      commit: 844b79616b762ac8e0b6f05c5aaa9103ae2ebd83

--
 i.

