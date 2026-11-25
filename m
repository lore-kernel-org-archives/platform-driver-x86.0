Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649261;
	b=BzBZcIYmdlyJI2u9iAS0MeCE3C3GFqkD1/1q7ZKMW4rYBsZvpVpyzfXUde7xTXWsyphr
	 SR6+QjB4OrD97lMX1uj91RUEEBegpEzqt6Uu2RF7CtPFTjPpzBFmv/zVS7Gc+eWJirQ5a
	 73j7oq06tPPwhGhdqYSAF4cB6TY+1fjBg5pWrAlk4uo3QessYTXyBQSuha5kI1Aq13yYd
	 1602knMAJvqxFA9x9+kFPdrX+pIuIldHichZbW4r3g4DYh0mWtnFzpT/N934tKlcs0svG
	 GxcAtAPR3xGJSpBewdrEAzeVbaaBy1l/mdHG/j3NFYdVg2YsSFVxLYZ0xueMvMwS7jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649261;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=B4FdeZp3dbdZYETSC5IaHd/pwl354K+xUDc2fBshgRU=;
	b=Lces44bYFZu7YyZ+8EtvLr4ABOjJF8sE0CheKpKGEX57QN1aykcryEfJUR59v7nfLDlN
	 OdUsQgIn/bGKq4RwrGpyNbnpjD4kBt/YGhM10DkenKOa3J/GhgM1qdckilSiL4S15M8sB
	 K2PT6fpu+D2E5x8y9+8Wkv3T9EuoKc0KLyNmLzy+O+Zhq7WzWYpxw8Rj/+vcUbR6scubW
	 jWEbtKI2ZuTljDNlom6iK4s+ISlf2LBdlEUMZCmxIftJJouJ9Y4nb0E85uDZP763WiyBz
	 H6GsWbZk1ojjPiU3ShJeApZdiSIdMuzddGOHby65d/DcgJWVf1H/hawWjTpDZPcNk4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B3j1Kscu;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4469606A321;
	Wed, 25 Nov 2026 23:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4469606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B3j1Kscu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795649260; x=1827185260;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=rBRoB8ImHOqg7KzHlh1YAEAf/0D4nJ4KriRuJOWN7Xw=;
  b=B3j1Kscu+ZSH8MLDasCpmeFG3xg0kgB3N6nT9NFfTCvph9EuXQWwSnbe
   AbYqAHuheerDkPkNah1lGOPW217ZTxT0pkdruqS2sJm5z1n44kcvJpZBh
   NVqs5skHsSeIrcWLKgibFo74O+NQnNgbsAHllmprdSlGbwPlsB1hsfF6Z
   gOPxa+StsV3gkyGT1qwWputz8zjvFMrsNiCpR5czwYwSRtIiAMxBNeoJJ
   o1GAXPMDDaKHRBtdsDxS1of2FlTEkZxNmWQ+xBw17jD6a0IBrS7RGMqdc
   JHUfrurZ4w+yaoi5L/vn9gCClkEKn9OT6Dj8GmgCc31wB+7I8NAA19YFg
   g==;
X-CSE-ConnectionGUID: eVPBfoAHRcOMKWa9gkdB7A==
X-CSE-MsgGUID: 00JYK1DlTSqz7TUUsqMbsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4429732"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4429732"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:27:39 -0800
X-CSE-ConnectionGUID: WHTMfsPGQTuYyeqx6WBHlA==
X-CSE-MsgGUID: b1K/7LcQQ/ijx9fLyQeBQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12002401"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:27:36 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jlee@suse.com, Mulky Fauzan <qapkyy3@gmail.com>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261123155520.121595-1-qapkyy3@gmail.com>
References: <20261123155520.121595-1-qapkyy3@gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: Add support for Acer Nitro
 ANV16-71
Message-Id: <179564925162.9828.11274906574803839292.b4-ty@b4>
Date: Thu, 26 Nov 2026 01:27:31 +0200
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

On Mon, 23 Nov 2026 22:55:20 +0700, Mulky Fauzan wrote:

> Add a DMI quirk for the Acer Nitro ANV16-71.
> 
> The existing acer-wmi driver supports hardware monitoring, fan
> control and platform profile management on this laptop.
> 
> Enable CPU and GPU fan monitoring, PWM control, hardware
> monitoring and platform profile support for this model.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: acer-wmi: Add support for Acer Nitro ANV16-71
      commit: c4e781b590a13f8a80ff83039923dbb6274118bd

--
 i.

