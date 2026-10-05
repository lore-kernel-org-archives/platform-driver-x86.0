Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C347DFA8;
	Mon,  5 Oct 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224712; cv=none; b=snAxS6m5zcixNHSEBADUID2cTDXgv/iUVJ7oTfI2j11kqMieUJs1TS4mwwWIHMFMS0w6ycyL5ShXHKiuptMVhLBhLC5SgV/GWIJKn/RQiPfk07ecuQS1naOY6HP9d5tOY+N9hxTUpQdMR5AG0hw/INrojGOVX503qWuLYAcZneQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224712; c=relaxed/simple;
	bh=gD3dNkqj83lwRg9ugh/QwrZ5jQPoPg1sgPigFXRg1K0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZyUxnj1ahDabisoAIbFrY8p+vU/ykQKHe6wRcTynX+DnnlgT+6Yh7kPJfSXBVHMnJ7sUDzyhuSaUVCaHSphdqFB9jRhfF2zRDXqUhYZrCKWXuImO1lhXosJe92EoiiMa1Y9WmsoKsHwcA4YvFcROaKSfN21zPI25S5l41ydqYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOqdtJba; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOqdtJba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224711; x=1822760711;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gD3dNkqj83lwRg9ugh/QwrZ5jQPoPg1sgPigFXRg1K0=;
  b=DOqdtJbaMZk74s9OAJyPA8fRQUsYaHZjqj1nhuMjV6DrkxKVl3dS3h8X
   pW4JLIpx3OKdcpK6IA4BK7NR4j0/gZHN6eHsWfHHiB0xUjQpRQ1IzwM58
   9QT5XTtnMmUQUqkLGaV4/n54B+Ku+BT0FEYyIRBEtMBLrKmND3VqDp9wR
   UmQhc75p9zcT2RxBF5Zt1mNwdkhZfnbjt6Sa/2mAk+Tl3pMA+l+R2kkY1
   HVNjzvAEnbeG+rlgrOnyIQUz1+7qe5Kk76fPDA+S5KeBr68y6xJbvHN3h
   78PvUkmbbwJcFzkAJPjIlIB9mlCXzkrJEik8XTMAEKl+ZuNhAWlJko+J2
   A==;
X-CSE-ConnectionGUID: Qd9Gt7x5QJ+gh6o9lhTjNw==
X-CSE-MsgGUID: EcjDftE7SZimX27uoYCXow==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91928539"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91928539"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:10 -0700
X-CSE-ConnectionGUID: C+xuqTbqQz2/Zi7ZojGusw==
X-CSE-MsgGUID: jNteDagxQHWr9vSf7++fhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276996993"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260922193809.4801-1-W_Armin@gmx.de>
References: <20260922193809.4801-1-W_Armin@gmx.de>
Subject: Re: [PATCH] platform/x86: dell-wmi-aio: Use named defines for
 event types
Message-Id: <179122470370.34664.3354597183467215793.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:25:03 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 22 Sep 2026 21:38:04 +0200, Armin Wolf wrote:

> There exist two types of events recognized by this driver:
> single hotkey events (0x0000) and sequences of hotkey events (0x000F).
> Until now both literals are used without a named define, making it
> harder to understand their meaning.
> 
> Fix this by using named defines for both event types.
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
[1/1] platform/x86: dell-wmi-aio: Use named defines for event types
      commit: 6b46240b96b2ebb20af5da9f27a3ffdfbe94a90d

--
 i.

