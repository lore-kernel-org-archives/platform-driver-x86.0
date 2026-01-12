Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D250335FF7E;
	Mon, 12 Jan 2026 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232053; cv=none; b=OGYZdTF8ZHEU5Lnu0HqkNMoDBBxGa4EXhvqqmD3Imw8IlGSvBJEqbjepcaWZlFeHYUpcGBCxI+JHI7ExnOxhWJnk9DYxIUdtWkaoA7rRAAkF551FvTk/NcM99NKq8PcA9qcmD2Vh047oSgMBV0bYyEqhpsJfA/pQfa6xs2IhDbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232053; c=relaxed/simple;
	bh=g/OOZdLN1u0hTmPhSfZKC9lF3HuaWPxWnhtbGzZGyhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H2G9M86KiCv7hGgtMKWoI5rCP9f8UOxEZzT0GKS+nWsN9Szwfpvn9ctArtC0rrXsRpfJeCKzYR80cFyz7ewZFeHg7SjZ0g1pT3XyUgb0nPKVc/Y+/NDxMl+5ENozYuNlY6Vg5i5LLEomBWOaRxnew9bPupZh368UyCsZKx/d65k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsYTOb77; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsYTOb77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768232051; x=1799768051;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=g/OOZdLN1u0hTmPhSfZKC9lF3HuaWPxWnhtbGzZGyhM=;
  b=MsYTOb77HL3P5ETHwJp4Uk7uEBMNMLQnf5djMs68SxIrIpLHEv2dEIPr
   D31BidrLregXBH85ZbPvvn6Q+NViyi9Pvs+RorNf85xZ5PyeP2K22bmBB
   LCkaWLWoKIW5BDPOgy4PtOj0hDqSs+ykvcbqp3tXCS5tWKi1TvxNivDaV
   ZebfVCL2Fzk+kTPG6cDjX9+r0azedgkBBDxVe/NwAI1s0rnqWEoZUH3Ej
   /kHLPEW8F4F9LFCtTa9owUlH365KlBs7jcoDPdb09ENas6Ikxs0C/6m9+
   qFlyN59T6MkcEOyGVIzrV2deL9ZhU/9eoc5AQT1iL+XYUmI6keL2CvKMr
   w==;
X-CSE-ConnectionGUID: P5JJMvB5RuSx2Ty/zc1ewA==
X-CSE-MsgGUID: OPClXiZfRjKXfkqwVykMiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80147113"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80147113"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:11 -0800
X-CSE-ConnectionGUID: d22aQNs1RbOQvJKe1jOzpw==
X-CSE-MsgGUID: uORkMr8bRByXDp9a9rIfsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208636346"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260107060729.1634420-1-srinivas.pandruvada@linux.intel.com>
References: <20260107060729.1634420-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: ISST: Check for admin capability for
 write commands
Message-Id: <176823204446.9723.16853061782379668148.b4-ty@linux.intel.com>
Date: Mon, 12 Jan 2026 17:34:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 06 Jan 2026 22:07:29 -0800, Srinivas Pandruvada wrote:

> In some SST deployments, administrators want to allow reading SST
> capabilities for non-root users. This can be achieved by changing file
> permissions for "/dev/isst_interface", but they still want to prevent
> any changes to the SST configuration by non-root users.
> 
> This capability was available before for non-TPMI SST. Extend the same
> capability for TPMI SST by adding a check for CAP_SYS_ADMIN for all
> write commands.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ISST: Check for admin capability for write commands
      commit: 3efbe492ed326acdeeadaa03ee9ed30fbe0894cf

--
 i.

