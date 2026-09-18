Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B7851DB04;
	Fri, 18 Sep 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755874; cv=none; b=GtD3oTBMn+cK007V0mueZngODBqfqnyzgoC+rQVFN09krrOpDooHxIWJGFHdxsVDGGBR7W/c8kqy7R794FrNfOFkGDTR5cJUGJYSZX+A/T3vvcsM3plvEKz7t4kjFw0ntqGXZDtuy/5He6yeEOC154gt2Xs+L1lye13ccKKXxO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755874; c=relaxed/simple;
	bh=//WN+IbkX7KKD88D9WqiYqiUlAcFcXRkc9uGm/fbjJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GAwDQwVsNeTxmL/nCKd9IgrzWbRohW8nelPvqlDoiSWiYbnC19NrPN1N0MqyeMP/ekoJiGcX4jTMBRf0Gnr2W3WGDjiifc1905GHHwRM+hS/kyScepj5qmnRRtx25t/IITMgF/5SgL+nYRriruRokoxV9ioEmGnK3uqGLamo+G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boZCjK5x; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boZCjK5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755872; x=1821291872;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=//WN+IbkX7KKD88D9WqiYqiUlAcFcXRkc9uGm/fbjJc=;
  b=boZCjK5xVH+TLqPpxz0rtXSknTMZnV4iXBydNncLqhw4O29JJCtvhEHs
   PMD4OdCqzcJXPA02ZWvmIPq5ABnzzm5maRHDx6iaraNro5L1AlIwHY9ML
   eHOBUnjL/3FzogicSapbA0bVXfe6lY01ZTYWPEHSCkQP4SPqIZS8Kngwu
   /hMuspt3xGPzBB6+HlJu6wA/atSB+tDORhuj0dO+7eyd24zhahNXwAzsX
   C6w0lPug0rfS+XDGsiHfpZd0MDwbDvk7d5iWj+hwi2Mjd32eLvJrQ6FGg
   h6Qv8V6MjlCJIn9A9llY7jRouAhO6+9TgAQm8Wy8ectU/s/C7yrmaHQDe
   A==;
X-CSE-ConnectionGUID: 7irykqSwSsuE5wCAogsErA==
X-CSE-MsgGUID: eTWtRttCTX+2NGRljNq3Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100947351"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100947351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:31 -0700
X-CSE-ConnectionGUID: aFfDXTcdSEa4CXL58MYwoQ==
X-CSE-MsgGUID: 6Z9RQ8WHQ/KJagDwJzI3TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271860302"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Ruzal Daminov <daminovruzal7@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819083836.1410-1-daminovruzal7@gmail.com>
References: <20260819083836.1410-1-daminovruzal7@gmail.com>
Subject: Re: [PATCH v2] platform/x86: huawei-wmi: add camera toggle keycode
Message-Id: <178975585769.29716.3571555329167163937.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:24:17 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 19 Aug 2026 11:38:36 +0300, Ruzal Daminov wrote:

> Honor MagicBook laptops emit WMI event code 0x288 when pressing the
> camera e-shutter / privacy toggle key (Fn+F8 on Honor).
> 
> Add the missing 0x288 keycode to huawei_wmi_keymap[] in correct numerical
> order and map it to KEY_CAMERA_ACCESS_TOGGLE.
> 
> Tested on Honor MagicBook X14 Plus (FMI-76, AMD Ryzen 8845HS).
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: huawei-wmi: add camera toggle keycode
      commit: 885b55bcd2336c578821b0788aac95c4679d68e3

--
 i.

