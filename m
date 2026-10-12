Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563D4A387F
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820587; cv=none; b=huk47oCq+/pnQ6+3N01W1lOZpjMF+wKpNwkmrYXkBiEcyGeSgXEqD6VFsvYOmZ3bR2W1+mIwBdAbR9Unrk4keSHQkFe2xTx+XIX7vfDyQuwPP6QlaVedzi+Hu/bTdnZkj+l1WY8Mu+RvRxuH2hxuDMTdPiL/mir6iakagjVS7ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820587; c=relaxed/simple;
	bh=K/NMcZDnavM8jUT+cHyVIMYfT1V9IXxQn7LCiAJR1EM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bc91S4et6e0pNvAg3Q8RirLIe8HW7JuWqlBKewLZEughLOxtQfvkAM0UHtxKLSAZ0T2sKq56DEOQQ0HfB8O20YCFr0i4Kv4Daf7Kv5800wCzyfrdcnahXQOYaglvr33WaqObr6wUDQC4E5HCOjpD514ydmy2pbTmZY30hvR7wes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mh9v6CYn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mh9v6CYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820587; x=1823356587;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=K/NMcZDnavM8jUT+cHyVIMYfT1V9IXxQn7LCiAJR1EM=;
  b=mh9v6CYnq6ZIV5ZT6dGr//yiWw2qLU7lwt5KHkN18jd8INlrYIDlkbsj
   +WRQTe0Glw2nwLe37Cw/iSvumrBLznHT3Zsm4QRXoQ4WBLTQzShLcDOIT
   Jd7DYdmzFyB7vDGgwLdsQr1sSDbNLcm2yijD+IAivGGC3qCzKwtj2FI4i
   NP1HmwkskTdbFXh9Pv3G/AQiNBZf6zlvUeKsP5bOq/rO6mZ+JmUwCWocK
   J9EOIMWXugKw6Ny/nB8Wzq6g+fpMHcocm5QEbmy1L4hkBZZgII+nlCW94
   alE/PgxGpBxnuNpqB2UiWvJgBWI+KkwWgJ3URDkqiBpiSQywWJomtzpDa
   Q==;
X-CSE-ConnectionGUID: 1YKwAHszRjG2VaSPYKFUvg==
X-CSE-MsgGUID: l/ZNPnryQAaT2DMyeC5Cjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="413339"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="413339"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:56:26 -0700
X-CSE-ConnectionGUID: nHHyOoFjRAeY0efwoboLww==
X-CSE-MsgGUID: UxDMqLQ5Q6+YKfWoEIyH5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="851431"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:56:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Alex Hung <alexhung@gmail.com>, 
 Mattias Andersson <86.mattias@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
In-Reply-To: <20261005192915.25392-1-86.mattias@gmail.com>
References: <20261005192915.25392-1-86.mattias@gmail.com>
Subject: Re: [PATCH] platform/x86/intel/hid: Enable 5 button array on HP
 EliteBook x360 1030 G2
Message-Id: <179182057939.17897.5406204959662867550.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:56:19 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 05 Oct 2026 21:29:15 +0200, Mattias Andersson wrote:

> The HP EliteBook x360 1030 G2 is a 2-in-1 convertible with volume up and
> volume down buttons on the side of the chassis. These buttons are reported
> through the intel-hid 5 button array, but the array is not enabled by
> default on this model, so pressing them produces no input events at all.
> 
> Loading the driver with enable_5_button_array=1 makes both buttons work as
> KEY_VOLUMEUP and KEY_VOLUMEDOWN. Add the model to button_array_table so the
> array is enabled automatically.
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
[1/1] platform/x86/intel/hid: Enable 5 button array on HP EliteBook x360 1030 G2
      commit: 4782945e5a20b48e8ec6881b60de4f919b3a5a47

--
 i.

