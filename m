Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C6935F8AA;
	Mon, 12 Jan 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232060; cv=none; b=XHkEtV538G/oM5D7NznVEFiKwYTEIQnNK1uNDFZlPJ7y3l6J0LRKekyQJTiFFSzsL4ssb30qcVCNsf4afV5pjx+AvO+8ZtUZQAwYyuY7/DXkmWwJPAiWMux0mnOYU6hWjzlUSj3Z4y/E4C3S9EWmSat+pesOGGj0Z81pbyU+PKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232060; c=relaxed/simple;
	bh=EVlCqEGFDT+jt4JJ8bIsiUiUlcEaGcW/oAgwrx2LAI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T6HpxkKEtxLK5Mb4TaWIQvFaTqKlZQT4R6rjx9ejnNS1//6g3h6VeWi3L/OSYkdLR4mLvQeFW6pV/QpOIQLQ1Ue+1no+eLLgMx1z+m0Yj33BiX+Iy914GKPfs2EPfxqStim0s+/wnYnzrXeg5GSQ6NAArP63BVhuzwePBFDkrOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFCntYw0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFCntYw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768232059; x=1799768059;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EVlCqEGFDT+jt4JJ8bIsiUiUlcEaGcW/oAgwrx2LAI4=;
  b=AFCntYw03T85qEnxsirNWlwlLKxTgoN41d4LcuwJ3y6sFypNF7DgdOK/
   ABN6JuZAT8b3Rwg2oJ9ahGQb+64XVUDAZot7ODGyRTKbM+wppkKd5tl3x
   17f45bmB1NCossDGnPmU0ZpkExUDqDe1qNGPxJ+9Ree+ob9PFFLwfRx0Z
   kzY0qrH9ZqkglbRwCvdAvMPS7TB/xtyOfHYQni9t+xF8Khqed2pGrGFCk
   pxxNA3pbQanVwUE9cn1Q/3F7pNpewuGf761Hl75oAgVcV0TzeRJVKKXUm
   ygQcpRu9g9JmTwSI+JEj9wh7XBKzo+nkxhTFREW0/POmUmfYPrDMrfIg6
   Q==;
X-CSE-ConnectionGUID: 7Qa6G6hbTrexvgDmPMW3ng==
X-CSE-MsgGUID: eEOaClsRSN+8nf884qcY3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80147118"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80147118"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:19 -0800
X-CSE-ConnectionGUID: RXPKclCeRACg3xD1KExIDQ==
X-CSE-MsgGUID: J2uImRc+Qo+FLmSOkPEMgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208636351"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260107061649.1634737-1-srinivas.pandruvada@linux.intel.com>
References: <20260107061649.1634737-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: ISST: Optimize suspend/resume
 callbacks
Message-Id: <176823205135.9723.8244225730976886683.b4-ty@linux.intel.com>
Date: Mon, 12 Jan 2026 17:34:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 06 Jan 2026 22:16:49 -0800, Srinivas Pandruvada wrote:

> If SST-CP or SST-PP is not supported then don't store configuration
> during suspend callback and restore during resume callback.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ISST: Optimize suspend/resume callbacks
      commit: b1ac196265dd90f8bec71ea42f0b7831d80c9167

--
 i.

