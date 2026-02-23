Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B2313539;
	Mon, 23 Feb 2026 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864421; cv=none; b=UDMW/NscTiwZ43rjyZiJsVqI9nlZNh3lI3gIeE9NvdtksmXfMuJ4FYELxULo5Y5gPTKYlvUw82xpTXOn4rW8fRetyAArpzR58L9Po6sb7BpE8nVFG2gizgpjDltM559ka/HsxoBrRASdm+pn3ttKFEJtLKOURH1iDSG3KeqMgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864421; c=relaxed/simple;
	bh=0S3qkxhToXLVI4rWSRVgSliROJcSmIRtmsCgYAB/WfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hGuK0JdR6VZsJuR4MRKXVyUshSm8UMWeVSl6ExRQqinWuJDd13A4q+drLf2lt/wg3SClKr1wimiXTrkZwscr6o3+WC6C4Eex65tzgiILrcaUplOxCe7qgJsDL04qLMSnWmwgtYRqaaKMD++riwW2Sv5DJnHoq4T/Bjvb8p2o/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TD5b3tCg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TD5b3tCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864420; x=1803400420;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=0S3qkxhToXLVI4rWSRVgSliROJcSmIRtmsCgYAB/WfU=;
  b=TD5b3tCglNPPGcKLb2g0MouMX5QG/ONg3XHM2AzGYVrm3xbbHBM3JaYL
   Ygj34rWS8oF23whBFwo39oWozr/Ck+jY0xHV2xtnt04l8yQhJNW38jbbS
   tH8wdq/4ZvYze7fFZvbjRq81Y40myfDv6Y8+3VAcyuz7Iz091jBlMGeId
   Zuiw+o3jiTML+dnPXCmqQ+gNvAiSAoMrLRiVzp3B91JZwUGcrR1aqglfH
   Dgl5Fns3KDCBl2LthDP63GOdkNT2EDukNFsMGUIW+9LEG00Uqgan/luQB
   ZYQP2OehdBol7rr20B+dQZbZEEWd3Pg1APt9jR1BlM1ZmQXHNkB8lSQRI
   g==;
X-CSE-ConnectionGUID: 0jMjW8yBTLabWzKcVTVr1g==
X-CSE-MsgGUID: 7rAMF1rhQFajw6NV2JJ+zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75473100"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="75473100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:33:39 -0800
X-CSE-ConnectionGUID: 2uuXYOy+SOSZ3n/lOqefWw==
X-CSE-MsgGUID: VM2TTZNRQdWekHIUtrMNnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="246205082"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:33:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 varadpisale.work@gmail.com
In-Reply-To: <20260218050235.94687-1-krishna.chomal108@gmail.com>
References: <20260218050235.94687-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Omen 16-xd0xxx fan and
 thermal support
Message-Id: <177186441134.17917.7317200179348523595.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:33:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 18 Feb 2026 10:32:35 +0530, Krishna Chomal wrote:

> The HP Omen 16-xd0xxx (board ID: 8BCD) has the same WMI interface as
> other Victus S boards, but requires quirks for correctly switching
> thermal profile (similar to HP Omen 16-wf1xxx, board ID: 8C78).
> 
> Add the DMI board name to victus_s_thermal_profile_boards[] table and
> map it to omen_v1_thermal_params.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add Omen 16-xd0xxx fan and thermal support
      commit: 3c99a545b372c77b5d39715968a141f523eccbf2

--
 i.

