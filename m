Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8C02D97AA;
	Mon, 29 Dec 2025 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767009332; cv=none; b=qT/MW6r16UIQm6IfZQC5GBVLcimhB1p4+IRFYRF8XrHT4TJ6q+OpyMTftgKImm361Pz2W2Lddut1OXVO5NVb7wiGj7/ph/budHJp9Ozyh/ffA0c0FKLuev5G/rr46YrMKA18OE5G90V5E+5OlUHUnN9ELtjmiX71YuIAoXce52o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767009332; c=relaxed/simple;
	bh=2PwopTzZkwg5sItpxDTmAzuqcywDgZLLj4/goIQzbCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=INEAPhOam2tP5YIG/JEofBqGgKhc3At54qssmiRAzu5kqFaWVd5DkziAm+4a97YTjQDT/loAAjw9GO6zlUGQJvJYID32UWjQDoAdwSftLVE+ZXrScKhsz66Smum/aiPva7IgZkchJZVXi3uxEGIyrozGxaDT1NTQjxOZNpq5lkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDRhMqTe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDRhMqTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767009329; x=1798545329;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2PwopTzZkwg5sItpxDTmAzuqcywDgZLLj4/goIQzbCk=;
  b=eDRhMqTeO1tjcLYfzi6Cnng9MjCjrDFSFRDQJefD7VNW5MFYzjPH7BB5
   uPF7Fj7yqM9MCDWBT4SgGLpi4pcWcjRSfzwkSboqA5+u726xpq3yetNiz
   Fcv9EvhuzQIYIgMO+BPV3sHJVC3/s4E1KsMr8Loa3GgPawDkUeb9NQLuE
   5DJgEKWfIflbCmsOoqZgdGxMAFu1s807uUqM0yvqPXtCI/w2pmfDq5X3G
   e4w+w9Y9jl5GCiZrgB1W0dytrCkQjCTStYgoJug8K880qrmDsVLG6CH90
   itLWEUQWE+rB2occRGhaXPqdKtrKQ58rzitTb+TQUEBSCU06hMHd6qB8O
   A==;
X-CSE-ConnectionGUID: TARdrBtVTbGW1vw89ksW7Q==
X-CSE-MsgGUID: TJ5rlQgDSXqJVI6kv83omg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68779683"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="68779683"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 03:55:27 -0800
X-CSE-ConnectionGUID: ufiZ+AVgTMmAMG7FnHMF0w==
X-CSE-MsgGUID: hyB9rCGkRGaIhKbDZwzjXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="201822193"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 03:55:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: josh@joshuagrisham.com, dakkar@thenautilus.net, 
 Armin Wolf <W_Armin@gmx.de>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251228214217.35972-1-W_Armin@gmx.de>
References: <20251228214217.35972-1-W_Armin@gmx.de>
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Fix problematic
 pointer cast
Message-Id: <176700931995.7434.13437646656319029197.b4-ty@linux.intel.com>
Date: Mon, 29 Dec 2025 13:55:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 28 Dec 2025 22:41:31 +0100, Armin Wolf wrote:

> A user reported that reading the charge threshold on his device
> results in very strange values (like 78497792) being returned.
> The reason for this seems to be the fact that the driver casts
> the int pointer to an u8 pointer, leaving the last 3 bytes of
> the destination uninitialized. Fix this by using a temporary
> variable instead.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: samsung-galaxybook: Fix problematic pointer cast
      commit: d37cd54ebeac37a763fbf303ed25f8a6e98328ff

--
 i.

