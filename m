Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104154;
	b=QDPjzgykHHLPUpznyM+o9o22nuwsgl0UgXFfVl6w3ajLVvjHSWzBlPsTkFOO6eKxRXO/
	 uQwQ/5CfV5GubrVVQchMpT4U2o4dWmjA/EyoBHvdijbSgIA6D7svzCsEzQq9smWQeBZOC
	 +x5sEVXwj0WW4DCqaUPqnM9ed9hLrC1zVGhVZiAVbf0ZELA28h4bUgc/09gS7yDI98p2J
	 WS3iAg0YmiDEclsp5NamEOQbARIsNv+LFPuI+EvG7/qjlzTNeEpX1wdKHz20D40HVFkMv
	 Pj3XG2IFWGzt9WaYv8nyvLqZAJulLLRv2QK2ksibTVjJ+U9Ioym+tHsmsJ5PmZxx+KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104154;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=4kBlnx38HayQLLOsYmA225yX3DZ6vCZeit9Tm0so00A=;
	b=3Z5ErJdxog9MtsPN6LPSB5t0xYoJxJqYsAE2nb9KC3qaodspNdlxvujgLqwbtVhVLb3G
	 QqhEQpSrPzfe0l+AAD10gb7N5jM9Gu6EADjKpSPOuN/DGlisH2cxVCfGY5Ge3+jpAjLeW
	 A44XXzEd9GrIw9RaIHqnS8CCYVi98aK7EeFJQ6xr5JvwqZ+7fwR30dPTr74ExMfdUmtsd
	 prtCZiHOlKyTLjCPV8CNy/qK4J3L+HZPMOT4VhTd8Y5jtNcaVkPFWTmOMPwNYhAK7OfJI
	 akKjCtab3G9xNTAUlPNYrAaGlzy0PdCugOvxG9QGeFGUluJanc49QwFAiD/mBKsAbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fNtamPzJ;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635B606A320;
	Thu, 19 Nov 2026 16:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0635B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fNtamPzJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104155; x=1826640155;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=rgENA1whyJDknlmv//4GDqF7/HJlN7RPQieJHugexQE=;
  b=fNtamPzJ8ZhsfWVtKyZmWqzDYm7NSKitRdelnpdOQ2rtPhA2m8dHP3Xp
   71sPhMG47m0A4u67dApRq2mPGvvHT2RlwbDpFT3RCOCKKuo3ky6EoYPHd
   OXSht2O8TN0GDbSIR/AIeAE6ou+N8QM/9q3fAx1UV88d5wPK5dMv9RQz4
   GCJ+v5zdPzUl948j0oUANn0tPMjINHinj6ypi08JFklAXaCB//bkiou1+
   IofOtArUrXiXjmzSali6lPizdJ3Q5HLbz5PG8sZ32qiS9DdKVT0OuzhHp
   9dWjpq6+3rYMV3i2svPyUN3avdVgPQpJTXi2OYp/2w1Mt6qgVIJ7CI9Wa
   g==;
X-CSE-ConnectionGUID: IwLxVXyzTxmbF5LeXXU+/g==
X-CSE-MsgGUID: YJTuIdFLSGmJEQfeBeF82g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3846130"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3846130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:31 -0800
X-CSE-ConnectionGUID: mNDlgZUlT7K4qg+2sGTeTg==
X-CSE-MsgGUID: rxfTzvdFQ061zGdRlfQO8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10349297"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, ahmad baghereslami <ahmad.b1995@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030051839.1625859-1-ahmad.b1995@gmail.com>
References: <20261030051839.1625859-1-ahmad.b1995@gmail.com>
Subject: Re: [PATCH] platform/x86: wireless-hotkey: Drive the HP airplane
 mode LED
Message-Id: <179510414278.21358.7747659851125419190.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:02:22 +0200
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

On Fri, 30 Oct 2026 08:48:39 +0330, ahmad baghereslami wrote:

> HP laptops with the HPQ6001 wireless button have an airplane mode LED
> next to it (white with radios on, amber in airplane mode) that stays in
> whatever state the firmware left it on Linux. The HPQ6001 device has a
> WLED method for it, and HP's Windows Wireless Button Driver (2.1.9.1)
> calls it from the Wireless Radio LED output report (Generic Desktop
> usage 0xc7) of the radio management HID collection it exposes:
> WLED(1) with radios on, WLED(0) in airplane mode.
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
[1/1] platform/x86: wireless-hotkey: Drive the HP airplane mode LED
      commit: f230881dc57badee65f94fcbb09c28ed9dfbcd5f

--
 i.

