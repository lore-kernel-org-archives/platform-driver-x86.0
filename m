Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B0125FA0E;
	Tue,  6 Jan 2026 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767707199; cv=none; b=EhVghXLMwWzfTK7VAvILomfIupKtcxfk36B2EXdY6QWa+dylYX+W7a1qimIOAGeNPvLNe/wq7iJvyBKdcBBR5Pc+a1U0ZoglgkJevdOtybHNBeW1UF8MpYmAZXnagRV2s0jVQy5SnHuF676QC7w8JCFGEZsdNoNZstZMz74rK0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767707199; c=relaxed/simple;
	bh=hJQhoddBlzYv3nhR61h2XkrhfINkYhdJF2IKN6iuuDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dTlr88HUkthSCsyda5twO14rFBMYJIBVYiTZ2e3wrOgpkdls9oM7Svez0R64QeV3+WxMa4/ruv+tp9XhEZENwVsp+HW/eXamUtRZbPLzy2KPfCX/+9TfhlJnNvumT9zzw+ehX8glfxfmX/IFPnsKQBsKRWB1SoTRGRHNiVsB1s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHN97KoE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHN97KoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767707198; x=1799243198;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=hJQhoddBlzYv3nhR61h2XkrhfINkYhdJF2IKN6iuuDU=;
  b=fHN97KoE7Bepb4hyPRzbp14H9aYfluoVmkeWHAMhxG7XTxAoslKe0T7k
   fWZqzTaZR9EvP4QWccy91+EQ8etjTD75tNK5j5OE5MsU8nmWfyrS15W7E
   p1nQpwv9JAq68m065aBJK1AZxByTNa6c4CBwjTGQV7G8/DdHmnCbgKMKf
   6S20aAwZvYOqK14myixIL+bg2Wx9CYM+b4WMNBQekUE7juvj7FYBxFY1I
   7GZo7eLmiEtlWn24vEnI5a1tqHwSO1uBBu7zUogNF25qYivyJUItxwYWG
   g0uteUB5ERsODwWo1RW/UG35GeRFEsOxCHyi/QsxoLhnJgsvibYQjkIix
   Q==;
X-CSE-ConnectionGUID: EoeGdM2WRYi+u1oR/2aSxg==
X-CSE-MsgGUID: Cppc3ernSQidVDfHcdM+FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91726685"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="91726685"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 05:46:37 -0800
X-CSE-ConnectionGUID: 2E6ge+REQLuFggQPYSOlBw==
X-CSE-MsgGUID: MQZGnN4iQFeJkVMt8IJUGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207127885"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 05:46:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Philip <benjamin.philip495@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260101141657.54258-1-benjamin.philip495@gmail.com>
References: <20260101141657.54258-1-benjamin.philip495@gmail.com>
Subject: Re: [PATCH v2] platform/x86: yogabook: Clean up code style
Message-Id: <176770718833.2365.2834893725256676790.b4-ty@linux.intel.com>
Date: Tue, 06 Jan 2026 15:46:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 01 Jan 2026 19:46:57 +0530, Benjamin Philip wrote:

> This commit cleans up the following checks flagged by checkpatch in
> yogabook.c:
> 
> - CHECK: Prefer kernel type 'u8' over 'uint8_t'
> - CHECK: Comparison to NULL could be written "!data"
> - CHECK: line length of ... exceeds 100 columns
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: yogabook: Clean up code style
      commit: 751e2ebf29a74c0e46144cbb35e5be478bcd7668

--
 i.

