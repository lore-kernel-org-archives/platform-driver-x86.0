Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573187;
	b=mvGufNLIbXuMQFxyFmioY6eaYexCXZIWMhIeWijkUpgMv98frhFfintIGpvcuoV8w/r3
	 +uZchQ+tfyIU4RdGzBBQVhJAEjtHnD7JhCsZqeopdt2hEOX4aGvDoafK3l1Eshu08h383
	 TzGuJaJhIJZOrwwCPLHZ4eETt+NDocRhLbbwOgdqqlZBBOt8EgaDnaidaCGhNrB+AVhsV
	 pYxQQdbQxRITAp1Z/YoR2KQQ3exko9NVu+r0aEK8VJAGUwavgjsP+iz2ilEmLCm7aAHIa
	 VGNhQTWIPi4lW7cib2K1UL4VAtYJiBnfjcCxQa+GMo6JuXrUG09Y1tVH6k7TzuJdjBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573187;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=Wji8Oe/4qo26nihzKVtQKTbAstBmllh1W8cULRCrsI8=;
	b=sndXfHIpPMzxiXhQ3F3vKxYoYvt5TMMMB4TSKKh+wPw8syObBMBihZFdzMS+l9GSRxx+
	 7WrQuNSRm1uid6+WQLB9YEyvwGKnlw4ckPRzSK8X4iuQ7TeNAqBeL+F3ROmoWMuHVIRJd
	 Sy4BEncICe1fjReqf5isaQbhz7uGaGaS7SqRnWIa0qsfk05VfNKHzv6H+UM78xN6gL06K
	 BAA3F7A3Mv+D51kRtUkFuTJW3j6tmWMtKwfFF+loob59VInhKXR8ix+tsVo9/t1KAWNHZ
	 a/AxisEiP/LiDXvSnJsGPoKPoAoKZbhnFski76TkgBMK8qCOGeoB+0/Ye5Vs0q+k5xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vh4UcGMs;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC0606A329;
	Wed, 21 Oct 2026 08:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DC0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vh4UcGMs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792573187; x=1824109187;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/KpUOxQSlDtjJN9/tdrqBZhfXwdRCIYdkcDhmQmPI6U=;
  b=Vh4UcGMssaHn6WCwE+/HnUOS4Wwkiys0OuVX/2Kl3Xrt/RgIEiS0EnC9
   +5Qs3MUhajKJ3K+XZQ8svSijLSI0FqMmc55eSOSVLDR4vynirl4w5FOQA
   pajHyTx5PqASrFbewZZFRJgAJzfB/uDsDYWGuaTZsSLXee+bO+zIpJWHv
   QzwsCgRIEBzwqOBuXBxEEeOB8fSglr8PvDERlHcrqgOzcVU2wfsHAQKFn
   mcqSZyDl4WjqdJcjuy/GsMpPrdlDkCo4e4h1en+Q5bwD3XzdTASeV4Ak2
   p4C0hpNTqVDQkBWJl4Lb/fLcvsDhgS9yiuJ+OqmyDNsX7U2cLvjK3tU2X
   g==;
X-CSE-ConnectionGUID: nXlXYQH1Twag2L6aUSJGCA==
X-CSE-MsgGUID: XCE7annsQ2Kepp37wVSrVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1285274"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1285274"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 01:59:44 -0700
X-CSE-ConnectionGUID: JjIoe+Q9S+q/tbCnRDF7jw==
X-CSE-MsgGUID: jmiISx5GRPSv2QAR0I109g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2928330"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 01:59:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 11:59:36 +0300 (EEST)
To: TuteMthCD <matias.civadda2342001@gmail.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    qby140326@gmail.com, ilya.gladyshev@linux.dev, 
    Hans de Goede <hansg@kernel.org>, chris@miget.com
Subject: Re: [PATCH v3 0/2] platform/x86: bitland-mifs-wmi: Fix TM2107 profile
 handling
In-Reply-To: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
Message-ID: <5aaa99c0-b101-1c78-de31-bcffe071c452@linux.intel.com>
References: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Oct 2026, TuteMthCD wrote:

> This series fixes platform profile handling on the TIMI Redmi Book Pro 14
> 2022 (TM2107), using the quirks infrastructure from Mingyou Chen's v12
> series:
> 
> https://lore.kernel.org/all/20261012133648.132363-1-qby140326@gmail.com/
> 
> Both patches apply on top of all six patches of that series. The first
> fixes the response payload copy size, as pointed out by Chris. The second
> adds the TM2107 profile mapping and response-layout quirks.
> 
> Changes in v3:
> - Rebase onto Mingyou Chen's complete v12 series.
> - Reuse the existing quirks infrastructure instead of introducing
>   separate response handling and profile tables.
> - Add the payload copy fix as a separate patch.
> 
> Tested profile switching on physical TM2107 hardware.
> 
> This is my first submission using a dependent patch series.
> Please let me know if I missed anything.
>
> TuteMthCD (2):

The patch series seems to be formed okay.

HOWEVER, there's still the problem that you don't use your real name for 
signing off the patches so I cannot apply them as is. Effectively, you 
should use the name you use for signing paper documents/contracts/etc.
Documentation/process/submitting-patches.rst explains what it means when 
you sign off a patch.

>   platform/x86: bitland-mifs-wmi: Fix response payload copy size
>   platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling
> 
>  drivers/platform/x86/bitland-mifs-wmi.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

-- 
 i.

