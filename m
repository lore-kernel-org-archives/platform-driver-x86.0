Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBEB46AEFA;
	Tue, 18 Aug 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052037; cv=none; b=ASpNdSlJt1lgAo3+pU9YzsdUlMJjLAtBhM+igBQZ65bD7j4vcf/PryUnPQ7za+on8bv6fIbfK3VhdHxRVzB2HSr1lkmYDipP2VrMx5O2EFFibTAP1OT5XWqBj5SdaU2GM4od3/lhu7emA1GLkWaM2KwCSnGGXEQfzpwbQTcaOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052037; c=relaxed/simple;
	bh=GtwY1955CpF+JiET8Cw4Ouy9RFfsPz3holJXCFrpVJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gV/cLTRQCbX4jERvXQ3wkhWZAvyN3+2TNcaf7yE2xjM7Q34m0dxoS6bEIRXOIvHHz6wPKWz4g22IwyQr0BEG/KSc9D3mh1Ec9invJGUvQPQjnK1XwMBFwkFt3iyIZUb5aShMk5jco9eimbMsjoWOI27tasdkU46bWoJSAtXkjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D74b6gtD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D74b6gtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052035; x=1818588035;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=GtwY1955CpF+JiET8Cw4Ouy9RFfsPz3holJXCFrpVJw=;
  b=D74b6gtDHvT/pluguCZJ37vJE4PLJntRSg2KfnTrlG3V1p2cJ39NzcnO
   Oy1Ju2b407oySdyPReJ+IXqmttnbOobMOoBHsOf0m7yOlGLuuK3m+QHHw
   MKT8JdGyMKLhGr9Cu6UlCnFd7Kh9JUZM5Z59c6aMC2DIvLhRXOXvQBBxU
   SlVDQq3NA9fWVw0u/OZPVIiN1tZLLN5YbLn49DRSfGdOP5yZlwbAi/yXn
   U7kJTs/LeQbfD+xjwJ3wfOR2XVE2GjoXZLZVL8GZMcPPKlf8BqBGwFhUu
   wMfrcldk1zVs6DWeibdXs2AqrHuXDYKEmkSSmFBfdOExmDaFc+KGszSFg
   A==;
X-CSE-ConnectionGUID: 3JrhD3D4SEubHUJBLajiwQ==
X-CSE-MsgGUID: 8sJWUBd/SEm2JVBTaoN2yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98131773"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98131773"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:34 -0700
X-CSE-ConnectionGUID: 5bwMFQqtQuu2i/oF/NMMUg==
X-CSE-MsgGUID: 8pSZjLnHRlGF2J6xDBPpjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="270420376"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Suryansh Singh <technosfan14@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818090828.27049-1-technosfan14@gmail.com>
References: <20260818090828.27049-1-technosfan14@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D88 thermal
 profile support
Message-Id: <178705202853.11998.8995783190600665594.b4-ty@b4>
Date: Tue, 18 Aug 2026 14:20:28 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 18 Aug 2026 14:38:28 +0530, Suryansh Singh wrote:

> The HP OMEN 16 (board ID: 8D88) supports the existing
> OMEN thermal profile handling.
> 
> Add the DMI board name to hp_wmi_feature_boards[] so that
> the existing thermal profile support is enabled for this board.
> 
> This enables the existing fan control and platform profile
> handling for 8D88.
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
[1/1] platform/x86: hp-wmi: Add OMEN board 8D88 thermal profile support
      commit: 5848eb9130ed0b3934f059fa06a53113637a43a4

--
 i.

