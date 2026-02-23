Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F883148C9;
	Mon, 23 Feb 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864496; cv=none; b=gKBZRuj3r9x/7+cd+O7xhjJ/vHFKsA3PUHid98kpAhkUBiTbL+3q3o2UgJYpGewzpdzJjybyV9Kk8UhJzarrbOZvsW8h/HNyHg3by9N+D+6bKkQl8gtKc8yK7q4/AJzK86b1RnlrVrQVq43aX4lCeLlNY5YAsOsSEi0fdTeuq20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864496; c=relaxed/simple;
	bh=Dd4ILjpFF5yGEltH6vR7kNjeuhrSo2+XMUu8Vds8ezs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YU/EgqzVOOjsMPEJn11977gXa0H2ytJ7loqykH3sqxHLcb8dRRcz/56grY72vkAG8mMSppauHiEyjtlkY8UsolkKZNDJFN5b39GES80CirpAGBZb+QMXxGJv/haFhS8Pjz2GyiDofUiH1ZLk2wI5XD6D7/tE7gsLMLgdO25Yct8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAUth5fU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAUth5fU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864494; x=1803400494;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Dd4ILjpFF5yGEltH6vR7kNjeuhrSo2+XMUu8Vds8ezs=;
  b=iAUth5fU4yOko3fxZc1nh5pYC9LeI63b0Bgp+tqNvmCrPr15RuU/e2cu
   O69FoxayQWglhKTdetYFXH3SLt5z4BBWha1zc2GVywF3mhBR6FyWdxCVf
   D/WIwBM5TtIeV10jZlqSrILjlIt4hw2fuZNi7Q51Ty2FoyzrczgK4O/cf
   anO3lgZ1rT+hzNX1CHLz3HiS4ZTNbiUgYyHaHgKYmnQWF8aTg/dLKebtp
   1hnXAj/9AAOd1P5AJ1zac6r3cQ9nnB6VCzVGLKuSGpTl1yrlrls/2e6Fa
   3loC2AjQOHRwTI67CQ221vO2AX73h/kCMXdBg2AuiNsKJbxihG2CWLexh
   Q==;
X-CSE-ConnectionGUID: jntEQoJwT8enOI+e0eYw5A==
X-CSE-MsgGUID: WK+FcRXxTL6PVnCMPsUn6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72073954"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72073954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:53 -0800
X-CSE-ConnectionGUID: wjzdFDvgQHK8aN+8kmfKdw==
X-CSE-MsgGUID: G425xzCeQbGEZvfF2XBpJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220163280"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, stable@vger.kernel.org, 
 Olexa Bilaniuk <obilaniu@gmail.com>
In-Reply-To: <20260207-mute-keys-v2-1-c55e5471c9c1@gmail.com>
References: <20260207-mute-keys-v2-1-c55e5471c9c1@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-wmi: Add audio/mic mute key
 codes
Message-Id: <177186448386.17917.11463936555512509695.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:34:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 07 Feb 2026 12:16:34 -0500, Kurt Borja wrote:

> Add audio/mic mute key codes found in Alienware m18 r1 AMD.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-wmi: Add audio/mic mute key codes
      commit: 26a7601471f62b95d56a81c3a8ccb551b5a6630f

--
 i.

