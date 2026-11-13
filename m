Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585687;
	b=BfgK+p9245TPA4zn1y46EC1gujvZDJP1Njuj+sYTOMAt3js/pJBtnibyh3OmrnGe5FGS
	 8w++fKLM0a9WiVGzMykFLnjRm5cw52k1mIKbbH8S6NmzmfY8DXkXd5wy9L9j5mLPn+eP/
	 mVOPzebntWhRc8nZoYxXcFyz4PmRKvtgV0KTSYD531EL4zZBoOPbeVfP66/qtA+0LWCvX
	 H6RZSIgsus19lsc19f5gVNuJCcKP9YP0bZbaK2dWhN1dJp2j9vtoFppUGG3DDCWVqOxz2
	 HCTt1QUp9vT9XTdGMHKuzIk89WpJiTTEDNiAMvNHiMq/c8Rw6HLMnNbnREfDeJAiMRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585687;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=ivxC45KXPoO78eDvRTDJYYB89s2eui9/ls/AmGI43bg=;
	b=NJ7HFY22hGt4/IXb32g7sdWFeNNCANymb37YM8or6ntm9j20jJ071iVFZAp06ksVLQ9z
	 kez1J8lPjYZ+dBI//crfoyjfGM/vmkWImTbJzG8sTIcz7PtcQrP5d2+PxjJI4U7Df9+rl
	 djpxn7azqMMtX6LeV3KJtYJgA5DG1oOWLsz35mXAggt0dtIBmIKxYfk4FaGHDtAp2iYEk
	 GUPozXctD6p+RSrOJxzSO/rZAcs9vL9dMKkDoLYPZy6q2Tp1BuQOthE4sW937L2/6N5wA
	 8XIeiOY3HNitO/1OKykSdmbELlzWSna4KDScA9tbXSrF2CWqkd1HjGOCodNivWTLzmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EKJ+6CDP;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E0606A8B1
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 16:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 422E0606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EKJ+6CDP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794585688; x=1826121688;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=P9SrzR5qsLhm/9oPkmHzAN7Hdu9SVthN2YS5sVXq3Wc=;
  b=EKJ+6CDP9IoSnG4oixwGHq/TXqqheIQAiZsL1KojUS5+1iyl3aih7biL
   AmpsICjOC78KxbMBlKogDIbjRhOs1HgIscsL/LzlGtEvUY4ISv/NhZ50n
   eFdaEajBYIvwwgjk8rT2ohv31ca6VPwC2d//2EsQXdOJnzLRFy9ZQuupd
   63LMwJZBA5/vTf4vjoVHFip9Xe/fhvCfC5eSKct6SZv7/PyD0RzVXU/Aj
   EfpPuDUeNoPtzV4/oy1s2JhD+V8SErmo+EvHA8fSfdLS0cpJXpue2xwZ0
   kFJreQI5kNFo1b2K/jsFg4B8kEKWtI3XTKCs/hjCgiGQChGTVqqmGTzoD
   g==;
X-CSE-ConnectionGUID: 1WA5fUDFSpSijXsP5BAHdQ==
X-CSE-MsgGUID: 0QVK7inOSruxtqcuCHxDxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3383920"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3383920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:01:27 -0800
X-CSE-ConnectionGUID: Id0NMcgwSw2df4XvhvW1qw==
X-CSE-MsgGUID: W1qDMEIGQey8iNU9agt6Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9381651"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:01:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20261111122102.1298285-1-mika.westerberg@linux.intel.com>
References: <20261111122102.1298285-1-mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update Intel SCU driver maintainer
Message-Id: <179458567149.7950.16787060701210368407.b4-ty@b4>
Date: Fri, 13 Nov 2026 18:01:11 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 11 Nov 2026 13:21:02 +0100, Mika Westerberg wrote:

> My @linux.intel.com address will bounce soon so remove me as maintainer.
> Ilpo kindly agreed to take over this driver.


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] MAINTAINERS: Update Intel SCU driver maintainer
      commit: 0e48b9dfd662c73bcba955dc789e5a0eb5fb455e

--
 i.

