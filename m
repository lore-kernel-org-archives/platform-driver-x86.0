Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104234;
	b=cV9SulU4lIf5GksALYaxAb9xCrYbaLwMnStAbD6MJtivIbLWptYR9O47pJzpGia4/Whz
	 o2AotWOaUcvIvBmNILAPwRqiDNDWLNDB3E0nKuzGs0EQ/sSCsCrPksE+QmYjwY9YQZzOV
	 mK0hWqzvLN4Br+pfHqR9hqMKlWRR3eHnDdgXAIwWho5rKgp8jxCu78KMmbzyhJaS3KTE0
	 k981aItgQr0TuD69W5fv6GWmpThAB37nvXL+njH/LXFiAuf53NssuWKEPR1R1n7LraVgJ
	 7iyyN/pllo9ZYbJE94rIhB5qrt8XDNB2Fskd4yxOQOcZ2VydfP8GfSkwqJqo9NYj/og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104234;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=MM4OIZbSDJpL7LWqdwfKQVWkT2lKWSua212NT05gxP8=;
	b=vbRhZDzDnlSo/Ps4XyGmTzr5QJCrgA1EBCujhcNtjpjrlQnJz45DYqlPiH3HPQw4/DKB
	 1WIezB1FoH5TvcSr4GHPOFDrd0Im+pMr5io99RFdL9iM5Uf1j5AbOIGSbwp4Tvt2SgjTe
	 NafkrkILjnuxho+nHmOpwzgBSfshwulA00SCT8uKcV+nVFTWfbuIlumwunM39TOMI4j5n
	 R9Kuwydhku7vb1qBw9pNxPBgWl3RAEe7/n1IHBLUmNKQHAvZsPl5OGbq1twJIzXWUIBB2
	 8gjwpPUK7s2oOLyygdUSgPLEfGtmcJgqd+MYSlii08NFTQxaPZNs/lmc+CAx+haOL1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EksmKq8v;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065C606A320;
	Thu, 19 Nov 2026 16:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4065C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EksmKq8v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104235; x=1826640235;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MBfwkOiI9DNXfSYf671pVAPZ8l6G5HggdtrlHbGFH+M=;
  b=EksmKq8vANCNCi/q26xLb4SyRkhym0N7ctxdpcL+ST2AKyfuOaUDgEJR
   pbNGz4xhRflTXsoddgofgg6WfXVGpHmjtaks70OZ/whjJ3xk9fh0TQUpv
   F5stQtAfZ8LLlsePqvAowWyvcMEDiv1DMaFadDidharR8zk37pcrRJiMJ
   9Fb1kK3+zxsR1QXSSHg5DwgVWtZQGnnoiJXp6iHnfJRboXaVubyzqBHkx
   h8YcVh4y/lWA5srkWCI3/e0UQwqmZT+xww51zh4CUfi5rMrdCO95i+H7Y
   3YxYhcNpMEkWpqfuVeuonOAp2U7zTo/51h/dhpJ46FJyBD/LPv9WY7zCH
   w==;
X-CSE-ConnectionGUID: mGR8bnWTS+aoBWLqQBv7yQ==
X-CSE-MsgGUID: ZP6DknvSQuamFCDxzywh3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3989059"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3989059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:03:33 -0800
X-CSE-ConnectionGUID: aNCJSBv0RkeZ8d8tvHvLlw==
X-CSE-MsgGUID: EcqXsKNxT8yO1SlyFc58xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10495977"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:03:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: eric.piel@tremplin-utc.net, hansg@kernel.org, 
 Pavel Skripkin <paskripkin@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261113143835.143209-1-paskripkin@gmail.com>
References: <20261113143835.143209-1-paskripkin@gmail.com>
Subject: Re: [PATCH] hp_accel: add support for HP Pavilion Gaming Laptop
Message-Id: <179510420401.21358.13813766742980884681.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:03:24 +0200
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

On Fri, 13 Nov 2026 17:38:35 +0300, Pavel Skripkin wrote:

> Accelerometer in that laptop uses inverted X axes.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] hp_accel: add support for HP Pavilion Gaming Laptop
      commit: 518e9d2eeaa5a8568951269a47be2182f4674efa

--
 i.

