Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243645;
	b=gtlnhUgNqQakGxudLLyLDNA7b6mAiEmsX2lz/wTBfgqF3w13N52R/q9JtFavretv25wH
	 oVBPqcvVfd828S2vO2BMk2f/evURMDjhpMCn7qT44Y7ejHMnbqFG3/y0Jtm8RgUnwR4bh
	 C4pKm/TKT6eVxOBU5tLfBcuclS5FBCCR5KQkCpgd9Tkb5+44U5wjKWPZnOggHK5iY5G2Z
	 fU4B8Qdzh/SCQJzLo2jp0F/+BjnFAfZNVw7IzmI0YNzfMhj5Cxul/eNIUOYrgFDi7p31Q
	 X8JaIW9B5NiiCoDTgSnI4JJhmq4hg6SSg0jYvyhIlBOxLANwpC56lmbSv5Vx8eI8Ymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243645;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=0jfehvg/SQUIsMGOBFg8cBHtl3KD7J7ZDgF0O1+Gvro=;
	b=2z7SstJFXK1F+jd62uPTLpfIJJJCHQNmwTI8TkWEtCFWU1lgcLvQbSQC83pBQCcTKXnx
	 s5I4ak925C4PabkRAWSX534RCvstflGQEPaIa/aA1yL4bxTFfQQpQJtkksLtIYxWBTndt
	 qwbzz7Xc2Itatnm4hi+EzDuP4UCZHUBx1eM0H2hUuOW0Q3kSd9hLpqPEA4qDSArmVYlQ3
	 QgPKgqnUQWcyK5u96Go1Rd2jkIxAisPfJeD1Ns/HKhL3yzYzV/EhVub3BjpoHwz5rcnnR
	 KFSCg9zPX9ctuhVx7dcyUm3dCWJvHHQrP8nXHCtLdaRLv4iBo7lj54Ki2PKiOvS5rqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZokzJtQi;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64B606A326;
	Mon,  9 Nov 2026 17:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC64B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZokzJtQi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794243644; x=1825779644;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RELCqR8SWRQgHHVHz5HBRXaRIjDsyqLfl9rqEYtL+/E=;
  b=ZokzJtQi/+SfWKFcIF4oMpHkcAvV7BEBqsuxGWCt8v6vtCcyTSCeY2DV
   xQPYoHOao01CqgHXBA2bxGE9Gi+RfS4xlzGm8H85g1Hk4CVlw+klK7z5p
   DRJTm/sLmXmTH2v33DU+16BLowqUUzGFluHo6M6XWild2igjMmdALECxI
   HWupKOsrPHzIMCLsPMhFNDrmotA619EuJKba8CiRUVT1GMi+/7vpSpe8j
   uwDL99sVrrgpLZlvD3d50e2RNpqEcsLLz1l2OrBGMsHHb3PX5XJ6MKMyr
   9xlIcNmcSCDxT7wDXRKpoTaL5zaMOX5m1lO7S6g7KkvDhkN9oNA6hTczT
   A==;
X-CSE-ConnectionGUID: 7FavGTdhSJ+LWS9/kUlF6Q==
X-CSE-MsgGUID: F5LXutyyQRC7o2uFzGZb1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2864386"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2864386"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:00:43 -0800
X-CSE-ConnectionGUID: vyz4g9SLS2ywp0N7C84nlA==
X-CSE-MsgGUID: 8EixqzNWQEyJDs6eyhuXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9771080"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:00:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Nov 2026 19:00:37 +0200 (EET)
To: Soka However <rorka900@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    ikepanhc@gmail.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: add no_rfkill quirk for
 IdeaPad Slim 3 16IRH10
In-Reply-To: <CADR1qY06VsPbztPW=E9eTNm1fhgwXvhnOWFYSO676S63gn6wVQ@mail.gmail.com>
Message-ID: <77489450-5857-b7b6-68f5-bfb8309498bc@linux.intel.com>
References: <CADR1qY06VsPbztPW=E9eTNm1fhgwXvhnOWFYSO676S63gn6wVQ@mail.gmail.com>
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

On Mon, 9 Nov 2026, Soka However wrote:

> Hi Hans, Mark, Ilpo,
> 
> On newer IdeaPad models such as the IdeaPad Slim 3 16IRH10 (83K2), the EC/ACPI
> firmware reports erratic rfkill radio states through VPCCMD_R_WIFI / VPCCMD_R_RF,
> causing periodic soft/hard blocks of the native Wi-Fi/Bluetooth interfaces (iwlwifi)
> without any user interaction or physical hardware switch.
> 
> This patch introduces a no_rfkill quirk and adds IdeaPad Slim 3 16IRH10 to skip
> registering defective ACPI rfkill devices. Tested and confirmed working on live
> hardware.
> 
> GitHub: https://github.com/qvkap/ideapad-slim3-rfkill-patch
> Raw Patch:https://raw.githubusercontent.com/qvkap/ideapad-slim3-rfkill-patch/master/0001-platf
> orm-x86-ideapad-laptop-add-no_rfkill-quirk-for-.patch
> 
> Signed-off-by: qvkap <qvkapp@gmail.com>

Hi,

Thanks for the patch.

We cannot apply patches that are Signed-off-by by nicknames or other 
pseudonyms. You should sign off your patches with your real name (no 
anonymous contributions, sorry).

Please see Documentation/process/submitting-patches.rst how to make a 
proper inline patch submission (formatting, other guidelines, and 
information also on what Signed-off-by tag implies).

Once you've resolved the problems, please send a v2.

-- 
 i.

