Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD521504F
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938175; cv=none; b=ru1CQCxUnm6vZiNkRx+EdFzqfLUTppji/UjM2Pf4YS+C7HVPbKOMBcaRlO0O9xbI7A7niXc2GjJAjtaywrCFG+2peTB6+qFzrcC7iSUGg4EH/fkdthsZJABELEqWUKtIdXYANtP6MANesQ3QHKEzh+IwCGaqp+UJZPhjnYbUxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938175; c=relaxed/simple;
	bh=GYcmYNKCRxxrcu68iElSSCBL2MqbUFaQhw6E0UrDKhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k4Q8G2Ytxd5PbQoZnJQW/9atey88AlHN+8gGtHHU9LD1p6CWNcaiTdoL/x8rICvt874ABkP8TpUj8nsuElUckgZawKEnnySyIxiea+JPnAS0FY0+MHTpcnOh56DNKHorxmjc8/dPc7o9HZ66XV61tkGt1S9HUxU75Ay+fVb8/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRY0LhP4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRY0LhP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745938174; x=1777474174;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=GYcmYNKCRxxrcu68iElSSCBL2MqbUFaQhw6E0UrDKhY=;
  b=SRY0LhP4gmjtpHZooG0uyZN3+O4hYQ4tmWjRd36aRk4Lcn3LwFlH3neS
   Ed/jGXCnKy/pPkzXwLM40PECkhLGl5YknGS9yPGse9/gsJXtE6htnQnWI
   QEHrLFAdS0gXY61GpREe1yYeBt4VHAbXRzMV49Yu2j56xdNXNKCfzC5NO
   nJQHfd5apiX8qgglYddFC3YIOBGEfcKsl8q9K97p59emn7V6pLr3iGb9V
   E679CvF9DkLY9o6gALO5eT5DSviF5H+n1MpQec2WgH+mDbFWFBUgWAo7O
   llFZWKvBNGVQVPsGG6fjwvy1KcRNGn3t1P1Pg1j6dS+1rln+RTuyVNZTq
   g==;
X-CSE-ConnectionGUID: 67aB6fPoSLaEmM16ANFWCw==
X-CSE-MsgGUID: z6mH5HeERdutMM6QywcXVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47450759"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47450759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:49:33 -0700
X-CSE-ConnectionGUID: 0dIqcnoWS8WWN70rMneryQ==
X-CSE-MsgGUID: a7ja2PymQGeMQul5CIl8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="134830930"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:49:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mario.limonciello@amd.com, hdegoede@redhat.com, Patil.Reddy@amd.com, 
 Shyam-sundar.S-k@amd.com, Mario Limonciello <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250423132002.3984997-1-superm1@kernel.org>
References: <20250423132002.3984997-1-superm1@kernel.org>
Subject: Re: [PATCH v2 0/2] Handle bad policies for AMD-PMF better
Message-Id: <174593816602.3806.14335027293552915109.b4-ty@linux.intel.com>
Date: Tue, 29 Apr 2025 17:49:26 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 23 Apr 2025 08:18:43 -0500, Mario Limonciello wrote:

> There are assumptions in AMD-PMF code regarding policies being
> valid both from firmware and from sideloading.  This series adds an
> extra test to ensure policies aren't empty and also handles a memory
> leak in the cleanup path for the sideloaded policies.
> 
> v2:
>  * call memchr_inv from helper
>  * Split out cleanup error to it's own patch
> Mario Limonciello (2):
>   drivers/platform/x86/amd: pmf: Check for invalid sideloaded Smart PC
>     Policies
>   drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] drivers/platform/x86/amd: pmf: Check for invalid sideloaded Smart PC Policies
      commit: 690d722e02819ef978f90cd7553973eba1007e6c
[2/2] drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies
      commit: 8e81b9cd6e95188d12c9cc25d40b61dd5ea05ace

--
 i.

