Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598DF25EFB9
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jun 2025 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856620; cv=none; b=GVX139vJqXc2j86Q5aKWQnbVkC0ZDLRF1ngsXmm5puRl9JKg0m81SGLb10iuu+Qm5pMl4UZtsLe6T1UFRArInUVgJSR3vib+4yGbgQz2veHB4Pt0O0uP+R3j8Dtbgm7ooRuo8I8z36TQa+83oRJXfaCdlTfmaE16FlcK9W3pzBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856620; c=relaxed/simple;
	bh=10Nht8ZAAvadiA8bcFeX6ZYmcdAKqP3eA2f8Jloc0uQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GA/JXdFoTnoDI7g4uiBteZltLp2vdMhdYcvtUTW4sp8DH5INCc4rAxtrLB1xiK2DUeteV5L67JFnW1LM9qJV8MQWeOwBxztltS/mqAbJg4llpAC2+QGc7k9uEudPkLyj52xLxbPGsyP6GALoYGiecqXkZuctWpUaigpiaAdcbrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IH4Xoxns; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IH4Xoxns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750856619; x=1782392619;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=10Nht8ZAAvadiA8bcFeX6ZYmcdAKqP3eA2f8Jloc0uQ=;
  b=IH4Xoxns8v3h4nTXt3XZP/FUDTZnn9fXvH7CvbGTYLXd8rIFfbjw6Y90
   zmOmCYPyX/jtnZKv98WgP7higPaelJIK1FnRQTAZ3HGwTJuEO3saUb+TO
   kuIlS8WMtyMkNSVPPnf0IG0aI0EOCp04yNaLnx7yAl/gebO+AETqUol1g
   2tirXGXjK5B1ibryA6ddPCDJ7Uq57TF5Abyz/3kzJcOsnaiwLnWkDJdv+
   LvH0WaF6pXuBxEBmffC8SmvCi34rZIBEF9J7XV+1i3WLdFAYCMFb41XNB
   Dbdx/5FbDEulcRNmAvvjGTkLk+fr3yHTRETsEl4PtLfsrJwdGTnHnyeCu
   g==;
X-CSE-ConnectionGUID: F0w+WQ2OSdOKOwmLpsGGHg==
X-CSE-MsgGUID: nJNvotc3Q7uT+A6us2vgdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64185280"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64185280"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:03:39 -0700
X-CSE-ConnectionGUID: pnPIk1IaSfG68eBhhemfxA==
X-CSE-MsgGUID: nArvMAYwTgWf6JAqIn7pVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151633819"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:03:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: corentin.chary@gmail.com, luke@ljones.dev, 
 Rahul Chandra <rahul@chandra.net>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250624073301.602070-1-rahul@chandra.net>
References: <20250624073301.602070-1-rahul@chandra.net>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS
 Zenbook Duo UX8406CA
Message-Id: <175085661190.8098.7867768138992871777.b4-ty@linux.intel.com>
Date: Wed, 25 Jun 2025 16:03:31 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 24 Jun 2025 03:33:01 -0400, Rahul Chandra wrote:

> Add a DMI quirk entry for the ASUS Zenbook Duo UX8406CA 2025 model to use
> the existing zenbook duo keyboard quirk.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8406CA
      commit: 7dc6b2d3b5503bcafebbeaf9818112bf367107b4

--
 i.

