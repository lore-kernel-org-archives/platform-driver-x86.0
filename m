Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458057;
	b=qWANtGJ7pjH/pEdjd+VgpoCSjiY0IKZAXCvwdxYk/OE+n9y8vowkAB+g2wclWMrrXA/L
	 pSq9vx6s7/IgcUbRF4PLo036ytny60Gp18/eeHWGNKuA/eLyBoNXvSLhtLW+FTdpnwwuo
	 ArqzHUo+zQrLNQPd9DsfJaNCnv442urgXmB0KAy3XvEqiRw6VjtM9/q/dniyBaPeM9tje
	 lmxxX56hBMtzhFaZLHchN6GFnDlaUtu9IWrxTc4dqaNeITRMg/QXl62CeZwy505ELQ3UY
	 0zA5nJiQ7vfSF5rMbZVQaAULyDXuuc/+lBG5u+27oPXI6GUYay6L5oR6IwRYpWM9ZWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458057;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=k4bOYqJOHi7WIVCNdiPDq6ShCxfSH7hRqbu+HwEHgxY=;
	b=nSQipgGBa8B3nmPDIn0h6MNEj8rkUdS4tVYsruYLedXLmUyGrYyf6trXIy8NcnVMuSmy
	 /nfxfZ6hdQk9PhJwQQofG06JDxrDZoUrFjNdaAWba+rZ2MzFSReoVPpp0GrZ9NlmASalk
	 kYV81b3yVHbVytpiL5XAt53PoVnuNinauuaP+o1yzExKXOJjD7VlBmpEe5PGgtzgI+1re
	 /lW2V+Sp9AMkaHqcxztM8jYdMiCH8UwfVmR5uD7FjSZwC+vb9rOf6ipbe9OL7rFvUaD6n
	 pXySm1F9e0noMmCZW0mNkQPsE2DwKHQWQAiTn6nuhCJd4o6FTu+33tWy4IrzraP7BjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QeY/TZzK";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B589606A321
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 18:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B589606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QeY/TZzK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458057; x=1826994057;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CSimBVZgBGX2/KAU/Yn9HAkrUh1gQe3zD5f3CswUxOQ=;
  b=QeY/TZzK3g2RWbIzEtZo7Sd7VxAwXaq85VtS8YkmJBFFM3eFzTzJwkF8
   +NgxoSrEacIKOKvnPWW/DlBijFg/ZtACTOjQACZNkwO3LgnpNCbg3yFSx
   jhD3VB0rpGjWKkZn43qzd1KI6jtYo25+0eJZlhxaRZLrwEE2n7AmkXM4u
   IvOvdNrZctafau9notbtOEm7pPycvT2RS3tOABfqtOIMP9iyUhJ7GrOSU
   StFjaNYcGs4rcwz4IPvLnSnl0Rmf66ZGoaSYITVpWdi7CmPgRokuX3iON
   ylsLOnTRi53NMwd1vWepyrfAhoRi1jYiwRmebar+ZrTqxCvEdc4yD/yjx
   Q==;
X-CSE-ConnectionGUID: RAhAknxhROuLTnH48z9yOA==
X-CSE-MsgGUID: VcSdlA7lTP2FbB5YH8nXKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4313749"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4313749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:57 -0800
X-CSE-ConnectionGUID: vNgRYpCySYq3gj65gJAEmQ==
X-CSE-MsgGUID: ULtAqhDUQquePCiUOpglQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11738434"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com, Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261106055504.2314590-1-Shyam-sundar.S-k@amd.com>
References: <20261106055504.2314590-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v4] platform/x86/amd/pmf: Fix ACPI buffer validation in
 APTS path
Message-Id: <179545804933.12968.5012644045265465378.b4-ty@b4>
Date: Mon, 23 Nov 2026 20:20:49 +0200
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

On Fri, 06 Nov 2026 11:25:04 +0530, Shyam Sundar S K wrote:

> apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
> without checking it is non-NULL and at least 2 bytes long, so a short or
> NULL firmware buffer can cause an out-of-bounds read.
> 
> Add a common helper, amd_pmf_if_verify_buffer(), that validates the
> buffer (type, NULL or short pointer, header and output size) and returns
> the size on success. Call it from both apts_if_call_store_buffer() and
> apmf_if_call_store_buffer().
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
[1/1] platform/x86/amd/pmf: Fix ACPI buffer validation in APTS path
      commit: 51d22791b6a7787c960f3ceca3d011bd9bc0524d

--
 i.

