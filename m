Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FE47DD55;
	Tue, 18 Aug 2026 16:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071382; cv=none; b=UzTdIZplHt2srTByv+aomZxu+w2uXCcE62eQWo1QAUXZZhX/CCQJGTTe198Ya3I5Ltbv7wQg62+tWIriq5HDoCy+D8GP7JsdzXERJ+QsuZNujb+8/ocNOlsjkGVmoX70O7H9UtbgNld7dwlPz8s4PCpNuGezZg/0U9ArmKTgRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071382; c=relaxed/simple;
	bh=2DVVeil0oob/qPcEszEbYG7BhMN1xpaqBHtcE8QeBTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HzxOU3/j+QNnAF86T2mRoYfphSDoGOCwn/OBGFaMlbNOv7wkyRM66W7Hv+UiUJHcnMrgS4u7NBqIkZgQUt0Wk1k7/is56NV4YoQ8IIiPsfbns0l4PM1h6bfmb1rM5jtZ0V86NhDgHVNi2PL3wWAIS0XtsgxIxzfXRTcAizIdgT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKNg9jvb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKNg9jvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787071380; x=1818607380;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2DVVeil0oob/qPcEszEbYG7BhMN1xpaqBHtcE8QeBTM=;
  b=eKNg9jvbiavlKZzVSGmHCj1GR+jAoou54QbDm95mGCD/c2a4yu2O5LLT
   8DCXYvqsane/7fFtFnQnwQFWkmrYpigNa1GtDieXgHbLuVcEXHuXb7uSb
   D5v6BfoMWfdktze/I2+ORU6CLsaXE92HHQbAF1VkwUdwOlLsMX/hODYoC
   M5H60wIlqnzszarCl7aVJOq19eDNumR42Cljdovln43CT/zGWkLu7i6t0
   bk7m4Arte9CnqLyuqlJ/n26eTUf0ozRVeJivs8TCESEyMVLfkVPIxQGCL
   aVZaucSGrIepM6BrnPQ6hgs1Qx8Nwk5c0Tj9HGFE4H+XXCxozoh+kTfz4
   A==;
X-CSE-ConnectionGUID: VSkJw2Z9TO6LV0XCKVKLhA==
X-CSE-MsgGUID: k3VbtJz7T2K9bQJMXQasOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91382661"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91382661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:42:57 -0700
X-CSE-ConnectionGUID: +0YEPNOqR/Kx3zK7sxKJbg==
X-CSE-MsgGUID: ZjyqKoIoS3+CkEpUbQr7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="262642150"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:42:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: Mark Pearson <markpearson@lenovo.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818151635.37094-2-thorsten.blum@linux.dev>
References: <20260818151635.37094-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH v3] platform/x86: think-lmi: Fix current password
 length check
Message-Id: <178707136983.33276.2130972008625402447.b4-ty@b4>
Date: Tue, 18 Aug 2026 19:42:49 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 18 Aug 2026 17:16:35 +0200, Thorsten Blum wrote:

> current_password_store() checks the password length before removing the
> trailing newline, which can reject valid passwords that are exactly
> ->maxlen bytes long.
> 
> It also passes ->maxlen to strscpy(), which truncates passwords without
> a newline.
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
[1/1] platform/x86: think-lmi: Fix current password length check
      commit: 54745d563114b74f6fecebce68cd020d06c1772b

--
 i.

