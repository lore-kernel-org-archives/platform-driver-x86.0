Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7B275B1F
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758013610; cv=none; b=AGJRVUqH9RwfIXkl8z+cMveyk3+NqLn/zgRer3+FoIAa8m1vMIt2vL1ICN6Y5DF3GLNArl5KLtG8HVvHoUxKXSy3nVExT0m7hKa9HtrAKdZgiQtSqVTNBzHPUH3J00xiyMxHKjFirawQR4D24ZqwFZMVIP1RBiU5MIEC+EbxiAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758013610; c=relaxed/simple;
	bh=tcnD1cm1GiP2420dExR+nIug2/gAHXtTMmtDF3U1wo0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tZmj4hBMnai9EiyhL83yI3XmsSxYT4k2Xf4kiPX4y4QJGBEpX8KzDuiqaNwJrPYKPR50wqeiPb11l+aJoqv+oZHYeyDNw8HtO4z1fjQfwrbNMJHqw4DnhBlRHUla7sadNre79gfg4NAGvfqj195Q16/19S/tlsWcOBsnahKi8hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCqyO/cb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCqyO/cb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758013608; x=1789549608;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=tcnD1cm1GiP2420dExR+nIug2/gAHXtTMmtDF3U1wo0=;
  b=LCqyO/cb/75D5iCHzkBnirU1y0dsC7G7flTCpBLrZ62tBAhjH2Q1K8aT
   zvZncqu6ArfA2zTdeQgXiim1lLVkdUf0+JuM/kU1i9qa95VYI7UnuBLvg
   gXfkCSxzuESwWmK0uVsOBSfCkAOATFr51AR+ypT8Kd9KDfThE9if2x7I/
   HIMbX29k96rkea13fGbGzv9cmpZUteu4m9T+qs52HO1sE2Fy73T4e8NVV
   fCNaiUKrKzFOVul4jcHxbd+zZMy2b5kemsY4SA8KVQy1+mq+/I2cXWKIo
   1CID1eOvvkv/aehhW2I33wlpVhx593D7+SizRlRpYThFwi+/CV6RTV7kt
   Q==;
X-CSE-ConnectionGUID: M3eNKbtRSkyDtSapFMRdug==
X-CSE-MsgGUID: qtFgykI/QNOGSCU2ZSY7MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85723045"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="85723045"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 02:06:48 -0700
X-CSE-ConnectionGUID: hi7MXbO8TNK0IbHh99oHbg==
X-CSE-MsgGUID: qlI57j06RiyHmLJZaQqSaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="174820317"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.195])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 02:06:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
In-Reply-To: <20250915090546.2759130-1-Shyam-sundar.S-k@amd.com>
References: <20250915090546.2759130-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] platform/x86/amd/pmf: Support new ACPI ID AMDI0108
Message-Id: <175801360046.1864.2942675112943158085.b4-ty@linux.intel.com>
Date: Tue, 16 Sep 2025 12:06:40 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 15 Sep 2025 14:35:46 +0530, Shyam Sundar S K wrote:

> Include the ACPI ID AMDI0108, which is used on upcoming AMD platforms, in
> the PMF driver's list of supported devices.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Support new ACPI ID AMDI0108
      commit: 1b09d08866277677d11726116f5e786d5ba00173

--
 i.

