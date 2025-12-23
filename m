Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE322D7B1
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766490795; cv=none; b=uSvFjteuH7UCFUVFL40/W5qc3+9MP7BXXtdCz1IVf1nylqzB6XR6Pon6kRoryHguv99LJbb4kMYifcusjhp2fLso4Rc3yTtSKi9I8I1WrZ2GjkFr98jJhaoJhXZ41jg/nMeHb5uGwCtCDRUJV7/BEq5+OTsUa6FpXiRJyNR656s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766490795; c=relaxed/simple;
	bh=p967MLkOQDXnG3kR8I6J8Zxgh95tcbmxjxNMVF0g58A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M7/TP/cZrMKjzSXFUYzg4z78QkrHyC2Z+D900x41GgVcaRHwu29IqSPvEkpM8rxrtf2y0AEziAWrpLtwxttyi4mVc79AZXsT0jVFY49GN2kfnoDhVYLvk8Jj06wFeReBGk8sx7MxvY2bN+iOJrTXgveogFx3pfu6w19xCNxQcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJq76RSs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJq76RSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766490794; x=1798026794;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=p967MLkOQDXnG3kR8I6J8Zxgh95tcbmxjxNMVF0g58A=;
  b=UJq76RSs42OKY7zEdWBj8sgl8PwsRwdJ2cmsF4YO3wCFYxWnMH/LTX7Q
   yC1RCS5tRw5AFp2sN9Je278Ddqr8QZ4WzRS7KSwBP28GOXcI0UjfIKRDy
   uAEndAJ5u/EdDPbj6AYK9oKc1mU8sNiX3ucktuhglcFZQtNQCDQKa3Mg1
   zWhRRmDiNdLjBYKk2vswJJLltHAEGjdl7EheGH7ZRXnQMVb2ZTM+i2q4f
   2OjaWOVNR5Q4DN50HiKPh3Zcv5kKPZmXSUDlNmC0p38gEvXAKARsmDfct
   qOoDGcSP4CjbvAB19xk9apFMGpEEzH02eHbWmxq8V8WXTz2ETc2vO/RO1
   Q==;
X-CSE-ConnectionGUID: QYbimjz0SOCI8FGSs9GaVQ==
X-CSE-MsgGUID: DqSVc5c1QVOmsPZL5iKnZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72199426"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="72199426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 03:53:13 -0800
X-CSE-ConnectionGUID: 1tinOOccQEawxFtpUrzW7Q==
X-CSE-MsgGUID: O1S72ZTQQL6FHn3XKhffwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199678059"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 03:53:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: david.e.box@linux.intel.com, hansg@kernel.org, 
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20251218074833.2948801-1-kaushlendra.kumar@intel.com>
References: <20251218074833.2948801-1-kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] platform/x86: intel/pmt: Replace sprintf() with
 sysfs_emit()
Message-Id: <176649078647.7342.2324487217070110075.b4-ty@linux.intel.com>
Date: Tue, 23 Dec 2025 13:53:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 18 Dec 2025 13:18:33 +0530, Kaushlendra Kumar wrote:

> Replace sprintf() calls with sysfs_emit() in guid_show(), size_show(),
> and offset_show() sysfs attribute handlers. The sysfs_emit() function
> provides automatic buffer bounds checking and is the preferred method
> for formatting sysfs output per Documentation/filesystems/sysfs.rst.
> 
> This improves safety by preventing potential buffer overflows and aligns
> with current kernel coding standards for sysfs attribute implementation.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel/pmt: Replace sprintf() with sysfs_emit()
      commit: dd0a2d47cfc4c5ffb3e866c94a80c03ff5ecdd70

--
 i.

