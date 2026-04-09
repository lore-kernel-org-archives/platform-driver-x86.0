Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFB03BE163;
	Thu,  9 Apr 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742098; cv=none; b=HNtlytSAlpbEirR86tOh6FXwMHtbEQS2bEZqUIR3kqGBUmIIIrFj3j1FezUHU/1tDrN38rXfC140UbYCtnhEEzyNtT8KsfTQfFC6/iuKiug3rJP7sfPSRoziXfepfIuVFccRs8qMI0tec0nI4I0ta4cMud5hm0F5HgEzFduO/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742098; c=relaxed/simple;
	bh=coLuzzU0sTEa3kepes1qHmGXcg974uivXLf/1lY8aNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D1dJdAy8gs5cHpAFaHj2uc3ZjsdS2VZFFW8THMyOtkq8yk4X7tc5UcTe7p5GCyHfKFqqeIGJoi/Q2MpjPg+nzomQZVoalDBIgNSPb8dJRmmaug9K/W6qtRolh+MUzrlHXz41kj1bIszQJhExS3/PR2EcvFl6Tl/YPhy3CXylipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoXnCDIK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoXnCDIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775742097; x=1807278097;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=coLuzzU0sTEa3kepes1qHmGXcg974uivXLf/1lY8aNA=;
  b=aoXnCDIKy+qoqdi8HINkMlLp1XQ2VimqkC/qkS5hKfrVAQCXl+cS4oL7
   ar/LX2O0PozByULMFEcI0lQdP3FomFBMeEVIOi9V+LtbuvqtPm3ZjjwPr
   QNuEF+slDDoaM3lr0/7l3Sf6EqHmWqyYvsTnTzqyLBFcc7pV2/2yyx+Hh
   8wbQETx2cyUeIwO21KuQmOr2ucg46gNq7KaIM00vN3j3ob+7+50Jq7+4D
   d1I7e1iR+yG8y/OF8r69AzD0ac6Xw1YtklxNxA9kKSoJT8ss71d1pn4az
   0HSF8eN6NQTbPltvNmjwi0sX4KFPWtqs3YuQU3XtvndhHGvRNR1jfUqTN
   A==;
X-CSE-ConnectionGUID: nnJD4eFESKqENtpPdOL/OQ==
X-CSE-MsgGUID: ohVvicUPTXGwgxBvHPJWzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76708236"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76708236"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:37 -0700
X-CSE-ConnectionGUID: apZPwugyRh+bmoVFlox7IA==
X-CSE-MsgGUID: FrzIqDHiSU2C6eQW8rhuRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="233756920"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: "Divya.Bharathi" <divya.bharathi@dell.com>, 
 Mario Limonciello <mario.limonciello@dell.com>, Dell.Client.Kernel@dell.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260408084501.1-dell-wmi-sysman-v2-pengpeng@iscas.ac.cn>
References: <20260329030948.32467-1-pengpeng@iscas.ac.cn>
 <20260408084501.1-dell-wmi-sysman-v2-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: bound enumeration
 string aggregation
Message-Id: <177574208989.8529.6766457149139541924.b4-ty@linux.intel.com>
Date: Thu, 09 Apr 2026 16:41:29 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 08 Apr 2026 08:38:21 +0800, Pengpeng Hou wrote:

> populate_enum_data() aggregates firmware-provided value-modifier
> and possible-value strings into fixed 512-byte struct members.
> The current code bounds each individual source string but then
> appends every string and separator with raw strcat() and no
> remaining-space check.
> 
> Switch the aggregation loops to a bounded append helper and
> reject enumeration packages whose combined strings do not fit
> in the destination buffers.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-wmi-sysman: bound enumeration string aggregation
      commit: 3c34471c26abc52a37f5ad90949e2e4b8027eb14

--
 i.

