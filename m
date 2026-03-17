Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66787165F1A
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752468; cv=none; b=hDnpsnpoiVa/lyYfQ777LUWUZdfXeEtq0zmPOHXAl3l4qGPOrG8dA86DegGq7ZvNEN6MPHxKchSmrWW6D4zvhr3oVOJWw97fIyEJBd/z2/bdw/yxSdZkHsdYBSFYQyy7nWHDTwr2sq0gEVSJz7RMiSTYaUa1pfj0GYelC9rQ7+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752468; c=relaxed/simple;
	bh=YbHf00OoQU4/ztl8gt5x8au/jtMb93Gt4qnTP78tDxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YSi2M0+ltCSr+DaZpBvH7v13nUrRz72qEPP3CUTtGUWf/56uLa5JNNdLisQsZIrsNGvfneUjIMk/d7/qiEZSQu52yxiXqAVCEsz0Fd1JfSLxw6a7T/jk7O8duLaNjPeS8UxiEjK6y5XRtFEpJ4HOLzxs/kcX/tba3UujJUmWPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNrtGt1o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNrtGt1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752467; x=1805288467;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=YbHf00OoQU4/ztl8gt5x8au/jtMb93Gt4qnTP78tDxk=;
  b=kNrtGt1onEUuy3n2KWAoZZsL8DYzgsd0C5LUXUIB1EMztrfcI3hC/bac
   4eKOjgTPW4XRn0r6MXtrhcmB+yKhepOcGpMPvSfTewqjLEzi/IJ4aEZdv
   BdJ6eWF0OTp4u6MTAWkmwli36CD8e6vVx+EL4+y645qAYkVU6joQbMA2Z
   IXZAuRdbAAkvN178jSY2T33YhCzljCucJ9r6TXqK8LjyvNu950gqdAZol
   jwF/9WM1m9xQmsJYWzNZFz5St72fIe1lgAUPcOKd/su+hm5QHt2ThrJof
   dGmI004hbKq5OBo8eAvtoaD61AxJnR5++2HCuhk6a2vJciiFqKQW8vJJu
   A==;
X-CSE-ConnectionGUID: uI6fA1TJQ5uFctRZUB3LOg==
X-CSE-MsgGUID: 7Qyli16eQHKHlTolbYUhGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100239280"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100239280"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:01:07 -0700
X-CSE-ConnectionGUID: sKSyY62TR7KS3Z7WWI049A==
X-CSE-MsgGUID: 6PQkXAeFSpSrKQf6KVNxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217962689"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:01:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, carlos.bilbao@kernel.org, 
 naveenkrishna.chatradhi@amd.com, platform-driver-x86@vger.kernel.org, 
 Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com
In-Reply-To: <20260310125307.700108-1-alok.a.tiwari@oracle.com>
References: <20260310125307.700108-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Fix typo in error message
Message-Id: <177375245947.9137.8466949773697776076.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:00:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Mar 2026 05:53:05 -0700, Alok Tiwari wrote:

> Fix a typo in the HSMP error message where "tmeout" should be "timeout".
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Fix typo in error message
      commit: 13dd41f7ae84cd3bf8ff7bf8e885dfc362f5d986

--
 i.

