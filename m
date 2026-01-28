Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D99352931;
	Wed, 28 Jan 2026 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605590; cv=none; b=i4dnaTqmXJNBJicGQ+4Ea1Ib9jWJcAQM/fBK5U9zGmWt82Nr4niCgkPEBvACSfeNvOAfU1WXebQP15mHVYiegAkBx+hmeFGH3GzZ0VbWr+R7F6mtndpA1Hlto3qtS+yN0el4icEl4Os4ovmP3Yt+9YgK2LmTRm8sU3pRhrtptQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605590; c=relaxed/simple;
	bh=BJJ/mNr1VTU+GhnNriM5dctd2XkPt1vePrbst11pcKM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i2BmV9ieG2uSxbZVqZuYG6YfgwBHH4aUXlvlvFMSw54Y3W8+2K5tkotz0BKD3w33qCcROiEVHAZ8ycuCwNPckEZYJaYOvCpv78FEbojrslTiu7KShN3Mq2yzkUQxW1sYZ3jfk10IbIW7BnvHWWNhaef3oTQ+4qkDWqSNRAlkMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMkCfj8L; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMkCfj8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769605589; x=1801141589;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=BJJ/mNr1VTU+GhnNriM5dctd2XkPt1vePrbst11pcKM=;
  b=kMkCfj8LzSHHZW71lEEWpouVNg4ANvLki8PZ+SFOaPmSQ0tSZtr7pf98
   o0fDYgDnxSbuzM3b5ShSFLf/22q6dX1HF/Cd5gQNiU7AkmFPXXwHjgGFf
   32oQJrcxCOBlHH9SmZhpRm6UnhE3XilQ9/nAEG8qJyoUMaImheMTSkzzG
   V8r/zI9u7hp7fkoPw2zjcDGWKm6ime0pMl4f3t9SBh7SrcdicrlvNXmmd
   kgOEV4JbDzuRFpkNsndB5XOMxInRE8mZxC3176mQauxZZ1JJmBheUjhuL
   hEfLMh4i6TxH+74BBdzPZRMztAKsHeV2BUNzuzeMyqPtYFvzqrTlCNTLA
   Q==;
X-CSE-ConnectionGUID: +VQMubrxS4KALl3l4VjttA==
X-CSE-MsgGUID: aXwxISW8QpyYy8KxCuMvrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82183146"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82183146"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:06:29 -0800
X-CSE-ConnectionGUID: RsErw6xLSue7Pbi8JgWZQA==
X-CSE-MsgGUID: lHAczLMQTgCdKP4QFxrCow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208278235"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:06:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260113182604.115211-1-krishna.chomal108@gmail.com>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
 <20260113182604.115211-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH v5 0/2] Fix Omen 16-wf1xxx thermal profile and add EC
 readback
Message-Id: <176960558045.3650.7825713719598813557.b4-ty@linux.intel.com>
Date: Wed, 28 Jan 2026 15:06:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 13 Jan 2026 23:56:02 +0530, Krishna Chomal wrote:

> This series fixes incorrect thermal profile parameters sent for HP Omen
> 16-wf1xxx and implements hardware readback support for Victus S thermal
> profiles.
> 
> The first patch refactors the DMI handling for Victus S boards. By
> moving from simple string list to DMI system id table with driver_data,
> we can now map each board to its correct thermal parameters.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile
      commit: eeeb4c9874bb7ad11d322156443b1d3ebfaaa1cf

--
 i.

