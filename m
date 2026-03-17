Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C33CA485
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752460; cv=none; b=bekTUpOL84VFLeeo4slxVTzQ4e8N4GB8NLPzZKcs9Uz6KhHAR01Bcgb/wwFRO5vOkdWnVfsW36Oo0XE3oZhckHjImvHatTeCS7ycg4DlFpODj+7U7jjwfQ6pa10Qyv4UHpfIOkTthjHLnKBK6PtCmXKw2LvX9/BcCX4gxj7431A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752460; c=relaxed/simple;
	bh=uG6ddNGZMWTQp0pUIP7AZ5fpOB06CuO9U9RsV+D1Ytw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lWwJK3Kqvc9Wn972kCFvralHmk96Uf3dH/ge/6zI3DbxhEYTEnMHakIGTUMb6ND+YjlhfBjYhoMyi/DvXcKzY7pOdm2xxGGqwdURDMMnzBJwY20YCBdyON2oq7V51KpMJffMQx984yR7LHQYgSFMA8ed7sPjs1sNjLr/Fy8fslM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvVS3caR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvVS3caR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752459; x=1805288459;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=uG6ddNGZMWTQp0pUIP7AZ5fpOB06CuO9U9RsV+D1Ytw=;
  b=MvVS3caRHCNdkYxGXjinI5GHQgjCEz8okP9HwPWB51Me6LrOhjOfg+rL
   Rsdy+p9+tvEbCSQXi63TARyIAIZ/p2jJLEGVwRqa0VxW769wjBUdJI9jz
   4LL7UrDmAHMVz+2IyhR1HbR3RW5Oek0ck3CaWgKL5MPJut5hScjuuyCEi
   mGu3oO5gkQGB88uUGkk+QaLlpGnVFAmpjMjby/8HcXBo79I8ij7K7ML/Z
   QL9JJYspgr5lNvgDjYbF4vIMqIg5O8fXIdglmJUT59+tiJEtovPC3RhBv
   nY20MR+9UxXW0c9Id5PZIt6gt0QyowA0xa0rj9J1l8cBVSqZVRDiqG0Iu
   g==;
X-CSE-ConnectionGUID: aZonOdNcQPGNBI2vtDB35A==
X-CSE-MsgGUID: A+33p6xCRbeOREX1nW4RVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100239248"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100239248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:59 -0700
X-CSE-ConnectionGUID: ee5Tj9VUQOqTtaC1Z5m8/A==
X-CSE-MsgGUID: Q6zH3LUcR4uYt1y3XMD7jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217962651"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: lkundrak@v3.sk, rdunlap@infradead.org, hansg@kernel.org, 
 carlos.bilbao@kernel.org, naveenkrishna.chatradhi@amd.com, 
 platform-driver-x86@vger.kernel.org, Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com
In-Reply-To: <20260310130138.700687-1-alok.a.tiwari@oracle.com>
References: <20260310130138.700687-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH v2] platform/olpc: olpc-xo175-ec: Fix overflow error
 message to print inlen
Message-Id: <177375245077.9137.17497940644230340521.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:00:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Mar 2026 06:01:35 -0700, Alok Tiwari wrote:

> The command length check validates inlen (> 5), but the error message
> incorrectly printed resp_len. Print inlen so the log reflects the
> actual command length.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/olpc: olpc-xo175-ec: Fix overflow error message to print inlen
      commit: 861bc9d2c593e270a78e09d7e006c17da9273d96

--
 i.

