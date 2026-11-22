Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376064;
	b=lL9HUl5jAKYBggKq57TUXp0oLBRUBUPAYZHi4q9SUYWwU0WsqINUO2PZZearo8sUwaGY
	 4F2VBRC2Il4UJeKE+fUWCVZ1T1Wi0IOW6fx1Ld4yLeeyteYUixL5Aop2BPpVunHfz9qWF
	 TZuL4xlHW3b87Jg2s3fT5ZqM+qj0ThyYOfXY1Pq9yo0br/hPUBs4xNLw7Nk4luQjlVkZB
	 0s6Q0oNoATQ2Ez7unxWVZZlfCN/yIH/4Mq+yViCiwanJTNKcd9DRi3XYcAfh2CuHiHkVD
	 lvrLkvU88kVeicht4Jn4LR/JkGfxYAPLwPBpCrccxYG3vHnWWBCblIKXJUr4ptKB6hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376064;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGUuGOQnjR3rfIadjBjNpVzEj/lo15ufRHraqrJBqvo=;
	b=x99BtZxQG6LWK02PEHuk2iFLdxVW4ecJBEkF0wJCBE8/jt89GBEvySUOFD0xoyqghgXk
	 bDn30zYXNrTy9jcyaPCYPX+kV/vlSpWo9WbJPB40NLqmF32nemgNyi/6HzIQuaYkM1Ofl
	 ojVmbC0pb2OgOMoD33RWJN1WTzeVSCPQ7EKglh6plMBuC7bSVNYB6CtQ34aJURXw00cLH
	 huc2dFwMy1cDBQC9+8ZSupAdZqtiJhMOZyB4ZhLPsPCk3qrrEr5lHFErs7M1Eq2d9L9FW
	 as2rgbYokmfnN31Ht2Vr6HsbmWFyjA2526RjOAi7ihZOg5ilhen3qoL5r+fiz+tTSVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lD9s+QnC;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586C606A68C;
	Sun, 22 Nov 2026 19:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A586C606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lD9s+QnC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376063; x=1826912063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7vI5DusgjmMbcxjb2F44Of9/jzy9vzRwrfnvmHO2wSg=;
  b=lD9s+QnCHgspHvjXPn0O+mLkkrUij5Nm9AyqmCBnA8TDy7CY3VbHcQwx
   jB0/xL2aAA9UY3wXEXXcs7QBwf2UzN3srMyI4CarmvOAHIXKJ8DiSEjA7
   rEdk1nsteORke6Ojoma8Vdyg5vYvHvLAJE2drkTTGXKfV3c18FoaFFFgH
   VzSZ5Vy+yqNrxunHnJ4jb8pzHGqOp/fq7z9RkjnDZU1zFLg5FCjP2aIo+
   MMwtwYEBCkofkTDD8vmBb1jf26cTejOzxgySsTAykrTXexMm/HYCcgHC6
   kOw8h5Cq4Mg37QxO0m4yh278yiuqC4GxZ/iU22lnQQOCSkyYzkNP/vAi/
   A==;
X-CSE-ConnectionGUID: pdsTMaQJQtSsfwe+OhFzQg==
X-CSE-MsgGUID: 2R+mZIevQkS48FsvUzzWag==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217527"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:23 -0800
X-CSE-ConnectionGUID: 11PmWD0uS72idJWn3JbXmg==
X-CSE-MsgGUID: F7kQqovbTLe6mEIhv/JCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109809"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:24 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/12] tools/arch/x86/pmtctl: Add MAINTAINERS entry
Date: Sun, 22 Nov 2026 11:34:07 -0800
Message-ID: <1260e5fdfeb2a6326ac1ba4fb9ab942fa3ff3002.1795374925.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795374925.git.david.e.box@linux.intel.com>
References: <cover.1795374925.git.david.e.box@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add tools/arch/x86/pmtctl/ to the INTEL PMT DRIVERS entry, so that
patches to the tool reach the maintainer of the drivers it uses.

Also list platform-driver-x86@vger.kernel.org in the entry. The PMT
driver files already reach the list through X86 PLATFORM DRIVERS, but
tools/ is not covered by it, so without this the tool's patches would
not be sent to the list where the drivers are reviewed.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces v1 01, moved last so the path exists. The section is now
    INTEL PMT DRIVERS.
  - Also lists platform-driver-x86, which tools/ otherwise doesn't
    reach.

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd31e734669e..7d70fb0ef0d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13716,10 +13716,12 @@ F:	include/linux/mfd/intel_soc_pmic*
=20
 INTEL PMT DRIVERS
 M:	David E. Box <david.e.box@linux.intel.com>
+L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	Documentation/ABI/testing/sysfs-class-intel_pmt
 F:	Documentation/ABI/testing/sysfs-class-intel_pmt-features
 F:	drivers/platform/x86/intel/pmt/
+F:	tools/arch/x86/pmtctl/
=20
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
 M:	Stanislav Yakovlev <stas.yakovlev@gmail.com>
--=20
2.53.0

