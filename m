Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64227327BF8;
	Fri, 28 Nov 2025 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330979; cv=none; b=ZsHjGoCbVUB6ZYqq/O5kM6Oi2neaILov4w/1Pz15j99MCdhDr1ulNcq3lTzocn4aHbOvS+CcB+YQZfhFaSuNlJiNKkWcu/llEaWqVsFdJrTAla9r0KdL7C/K0z3q4jlnTSYlZJMZOsvTc8NdOs76+G+i2jesY7Fh90u+xH8rWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330979; c=relaxed/simple;
	bh=FJOLFkYpbPF1LXRuZ9boD71zE7Z5VSlZC6d3ggp/Rjo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JPa7sCF+wsmQRYHkVjpqIKWw5GaM/FJdPC1ympYQRePlstQMAjs3wfSVOFvt5+E7ePB9uOBM1jUt7Y7Enx4+LLiIKuqjWcFgfyOdhPN9BaFwFR5tCM+pAMEhOyUntqo9ck+JR9YbZyLpBSvxLsE+dMIgHnJGYj24JxgZUBlVsZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoZwUeqf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoZwUeqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764330977; x=1795866977;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=FJOLFkYpbPF1LXRuZ9boD71zE7Z5VSlZC6d3ggp/Rjo=;
  b=ZoZwUeqfRBnHB8qVgN4D537H/3r5LYf6VusEx2R6eU2DFWVH9vW2BTbW
   o7jiUz7Kfok2P/MbkBfqsWBWxdUALG4Z/KmXFlkOve2ug8Di8Fvc+X3Tu
   jTa2YGoctGg5zPSkhdLOUKBKPDsusIAzgHeYmvmwaaBNTRv//yGiH1VOp
   EQ+5OgXkoICINr64GZDl0/jzN8AxkYqIg3M5oP05BiCywPWJ+8Bonwa8V
   LjIKih7oRqHqySQM8DnPddSZEmE8/yGLpESfanmdjfpNM/NhscGXFxQD5
   F09xx4oGZ0Ui7nfqkpUoClqoXiCEo5EkPGXOs9PVJo8MpZ6fFBMsqY48P
   Q==;
X-CSE-ConnectionGUID: lKh1dK+1Q7+iIGqWpzlWuQ==
X-CSE-MsgGUID: sP33ysq/QLK4DCMtPTQDwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77050869"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="77050869"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 03:56:16 -0800
X-CSE-ConnectionGUID: rmccmK+3TgOGlrhbR8POVA==
X-CSE-MsgGUID: MwPiGYZ2SR+4TNPAA5NbeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="224149553"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.229])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 03:56:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Alex Hung <alexhung@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
In-Reply-To: <20251127070407.656463-1-acelan.kao@canonical.com>
References: <20251127070407.656463-1-acelan.kao@canonical.com>
Subject: Re: [PATCH] platform/x86/intel/hid: Add Dell Pro Rugged 10/12
 tablet to VGBS DMI quirks
Message-Id: <176433097012.8003.17275938930573480658.b4-ty@linux.intel.com>
Date: Fri, 28 Nov 2025 13:56:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 27 Nov 2025 15:04:07 +0800, Chia-Lin Kao (AceLan) wrote:

> Dell Pro Rugged 10/12 tablets has a reliable VGBS method.
> If VGBS is not called on boot, the on-screen keyboard won't appear if the
> device is booted without a keyboard.
> 
> Call VGBS on boot on thess devices to get the initial state of
> SW_TABLET_MODE in a reliable way.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks
      commit: b169e1733cadb614e87f69d7a5ae1b186c50d313

--
 i.

