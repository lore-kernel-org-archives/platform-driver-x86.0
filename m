Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D347887A;
	Tue, 18 Aug 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062104; cv=none; b=JLTpY0S9LbZth+aXAG6quXnSR6jcU+t5glLaN/+niCMBuqpUzrvLaVhGYkh29R0VSk75ROAymCkszcVRQIsKWr6HAfgeFJio+i2WPuoLLk/WueCVDn/bnlK3ni2d2APqPLIDcm3BmgSeVBQSLu+pGK1BnodpeNJsTziGQkg88Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062104; c=relaxed/simple;
	bh=Tn8UubTL8rEJ5YowuBgFNtmXR2ewrpcEYSWJmEk4HHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ls8DJGtAkkMnmRh06I4ziFwQMshc489CE+c7Q9r6PYOCtY3Vssq884yxvQREq5Y2YC2Co5RIZTAxuqoHv78QKfb/e+AIhek6QHW4NGvla+eCar3S0uEwoJmVxqxL6A8lW4MB6g1AFsuWOpZFnhkROKV5uk207QB5Fe3e9wONDP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFEborFP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFEborFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062103; x=1818598103;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Tn8UubTL8rEJ5YowuBgFNtmXR2ewrpcEYSWJmEk4HHE=;
  b=kFEborFPJ4yNSkzTFgIF5O2ZpAVn1SKIin97KiBEze+lofr3+m3ynb54
   A1fMy0WmuIvb4jKyoiLrjCj1p3wFFC6UQqYB7RsN5bpjK7iUb4mycC4gQ
   F+K65QAGk8DKvNCi5X6c68hFK8dldLs+n15UOWao+bOVoXkL+eQDyPUiJ
   Zi1c3kUPK4dtNvy/R+nKEQhWsLK+phEmsw7n/B/p7Won+9TEjvPT+6c5h
   dA5josnBMbJSjIySBKBC374zLZADTBOCUhMQwFTPYbyAroGfw6XR4I4ho
   LEH1WJFmeKEHOtRBASSJ7PBQFbwhMVkcWjusRTkLbwHc1I2fa8ij1qXnN
   Q==;
X-CSE-ConnectionGUID: ocKRnQknTw6y7PHyFgMucQ==
X-CSE-MsgGUID: VUkDZo5PQGejOcC0ZhIrbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105089179"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105089179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:08:22 -0700
X-CSE-ConnectionGUID: zHjFFlrBSBaoO4gAWYp7lA==
X-CSE-MsgGUID: wqQirejzQB2SMfDTThbt9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267214063"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:08:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: teackot@gmail.com, hansg@kernel.org, 
 Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260807180553.869371-1-aroslavdudkov622@gmail.com>
References: <20260807180553.869371-1-aroslavdudkov622@gmail.com>
Subject: Re: [PATCH] platform/x86: msi-ec: Add MSI Katana GF76 11UEK EC
 firmware
Message-Id: <178706209613.20251.7048425180181532039.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:08:16 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 07 Aug 2026 18:05:53 +0000, Yaroslav Dudkov wrote:

> Add the firmware string '17L1EMS1.107' to the ALLOWED_FW_13 array.
> This enables Embedded Controller support, including battery charge
> thresholds, for the MSI Katana GF76 11UEK (MS-17L1) laptop.
> 
> Tested on MSI Katana GF76 11UEK with EC firmware 17L1EMS1.107 and
> BIOS E17L1IMS.312.
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
[1/1] platform/x86: msi-ec: Add MSI Katana GF76 11UEK EC firmware
      commit: ef2c7d3b75d9270979f9a3fb32edee811c383fbc

--
 i.

