Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0290428480;
	Thu, 30 Apr 2026 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557259; cv=none; b=cto06qFCda3csPK2Inct0bZ9iOFaNz/4lrBwJ1HCxxu9IVv5pgHaDgPpQM5SOsgGCyw6l15WaWtA/tc7XqLQwC6jPynOtKtmkr1rUT3AH/RjPYh3QHEuGq4F4hpAb8qPDLhjSe+S3qc8g+jHZo5paFwX0BiVI5bckQmqRGzzvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557259; c=relaxed/simple;
	bh=fAAktvmuczjclekPv0ZhoWl+glvu1+SMhvL/JWOVd3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gy9ULe1E7p2sgZJm7gGCBFG4JXS9vw/3L9BzeCJWi4dPnqnzywgSAo3Kval8PVrWAPylZcDDWwzH57LvvgCOSc3NmHDTOpMDFYwrgIOXxdbSc5V+p76b4rctYV22tf6C+6g1HIqiwu4QBn5hg0urV1mTi6NKVGYgUegkCACifmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRPLzKXo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRPLzKXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777557258; x=1809093258;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fAAktvmuczjclekPv0ZhoWl+glvu1+SMhvL/JWOVd3I=;
  b=cRPLzKXo2Cl0jgVFOke+iPHtClGU9MreViche7AwnWAGeZjuqEVi/ulF
   keUWgcQRRQBdf6pt4G2aqwkTa4OkkqpURhSfDXqsmlNYodgEhXjG9lKAM
   q6kfptfBvd2/kTdEHyJXyWqbUrAQrFunHlVGP28XwB4LFljuluBFP0Iaw
   T4+QtKtqpMQDESaBDRc5gFRxGDs5Ki8rPguM5W/w1tjOeG6rzFpm28oKm
   CQVkyBUEnilCdGGrH5hNY/rR1yRBj9lJbWI6BZ6ZJpT6/WPNY59aNPsJp
   DP7tf2pcLwDitztSzN3sYwXl219aCpb9aM0UOAeO4bXGRCUu3GEWq12gx
   g==;
X-CSE-ConnectionGUID: SBV2bgupTmmDSJ0keGqu+Q==
X-CSE-MsgGUID: S8/OGU58SSalkmsnDZDN6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89882545"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89882545"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:54:17 -0700
X-CSE-ConnectionGUID: nrI+bZ2LRIKqJWjPr90yOQ==
X-CSE-MsgGUID: g1SKSSK4TlecrOFyP6682A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233557151"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:54:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260429-invoke-fix-v1-1-ce938eb80cd3@gmail.com>
References: <20260429-invoke-fix-v1-1-ce938eb80cd3@gmail.com>
Subject: Re: [PATCH] platform/wmi: Fix unchecked min_size in
 wmidev_invoke_method()
Message-Id: <177755724904.2048.13738939007786127621.b4-ty@linux.intel.com>
Date: Thu, 30 Apr 2026 16:54:09 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 29 Apr 2026 08:20:56 -0500, Kurt Borja wrote:

> After calling wmidev_evaluate_method(), if the ACPI core does not return
> an out object, then wmidev_invoke_method() bypasses the min_size check
> and returns 0. Add a check for min_size if there is not an out object.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/wmi: Fix unchecked min_size in wmidev_invoke_method()
      commit: d3b7a868f1aeb6a43de880a3709ef3a0341f2c2a

--
 i.

