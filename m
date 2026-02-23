Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF73331354D;
	Mon, 23 Feb 2026 16:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864461; cv=none; b=sjBCd3rkIetwsjgFdH88e20PKMFaAZq11hcf0+IaTbvJzvoGNXligTyYuK0673Jzq1b5frU8rx+OQzRrWxUs+FV+6Iu13tXa6eJJlaUkDb2tz5WNOE9cDyZkIVfTfU0xW7sPCqV7tZInQn+yscmf7pNQoPk+ZF6ofjlfTvBm1cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864461; c=relaxed/simple;
	bh=F1yCd3XG9q2eowFDXS99tU5ZcLaWdJLQ+oUZcwOmMIE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cVqeI62y/Hpim+xxjna5uZnHtEVd+6TYT3qQh+g/ijU8jWpuUa0cC3TfwRfPRXOJFtz7O00mW8/NQvpa7L9lvGWk1g2p80Mw0lPOEiHyncFrEnhmgG6uaTvZFwKi03QaGCBx0ikrq8K1MCx62JF/yV5X8pL91DLrcOXjjK6wSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MY9dVo4B; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MY9dVo4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864461; x=1803400461;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=F1yCd3XG9q2eowFDXS99tU5ZcLaWdJLQ+oUZcwOmMIE=;
  b=MY9dVo4BGzQzHwDlP9fiB5kQ4xR0Kq6siZtDZeeO+bM55q2jRn8Bagxx
   Lducm0bQs/j2S77rET1Tucf8kpCapS5yTYECCawsYOq8EybHv0JEAiT3F
   saxKE/vFjXPvU1RHfCl4FUtC8HXc7PS1+0qMZQlxBvPwoXx2s7OJZFZ+u
   t4ZlwpYW4xqGIDWNIUsU0QVS2bw8g1BY0j0++YnZ8jvkJT1ihtbqC1MO2
   pV7MKXXgvO3qFCJRscOFiAf3BYG4Svc8mdl2U+5LhHNtg3f3OayI31932
   QwTHH0x2NeCyUJqMTDHlxZg+M8ZcD5RGlbfmO2v/X+JxxoVd0+MopoojS
   w==;
X-CSE-ConnectionGUID: XC1gj/GyTKmhbbwVIG+FbA==
X-CSE-MsgGUID: Y0oxQjBDSii7xaqIOSG5og==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95481707"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="95481707"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:21 -0800
X-CSE-ConnectionGUID: qkQSZvBRR+SmJw0hpbxgGw==
X-CSE-MsgGUID: eMqgTHy+QkWs2PFuAsgw8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215638091"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260211212659.16542-1-denis.benato@linux.dev>
References: <20260211212659.16542-1-denis.benato@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for G733QS
Message-Id: <177186445220.17917.17054664975802668328.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:34:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 11 Feb 2026 22:26:59 +0100, Denis Benato wrote:

> Add TDP data for laptop model G733QS.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: add support for G733QS
      commit: 37da69dbaa60a778ffa67a066b77d287d704c659

--
 i.

