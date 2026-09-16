Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BADD4B1473;
	Wed, 16 Sep 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556436; cv=none; b=g8Tv7njIRUMxerm+PAOzI5pzFkQ4Ia5phABrLTXUl30GRHkYE767GOEwT4UvaOPbRAngcoRoxKuzU0VvWtCDuxik2pBHr4Bz5DuvounVUkb4C+ifkkH+wsuvgeXy+gjdJ686oVn7YraLGY072rsnouEuzkB5zLtbx1KLsQ62Zd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556436; c=relaxed/simple;
	bh=6N5+ShJQM8PgfOiqt/RDqQ1DyCFuCrvyfgjBj/+scSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bEuySxJ1GN1b4CAklJ05yGYh9IZ5He/cMNzvxZBONuo5jKS/WwwXhA2heGcOd+kGWrfREXAkWnnOMNBaxX2A65kwy1v9Zjsr8jHWrp0Q06rafJ+1xm+JUCbfnL04plA3cNp+pPKhqz/6kgQHqQOrlazj/rLc2aQtAdgr53T+d8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0DWWLOS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0DWWLOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789556427; x=1821092427;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=6N5+ShJQM8PgfOiqt/RDqQ1DyCFuCrvyfgjBj/+scSs=;
  b=I0DWWLOSmKx9tgcSu9aZUJWJOCDT4Lob7KfBblGjEOrNbWjrOMq14CZt
   gDuP2PESo5nMUiuTtv2v6VpEkB+e8EkYUURqxxyOofOxwy5vzi/CzIuLN
   o/Yk4kssiANC5yYx/I+f4i6gUuXlJtCwDR5iqfkAH9sY1T+7L5lXftb5+
   8SKXILS9CMif265B5ulhRSy0uYBjJnXNRB0Ma6N/WgWC8xWd151WAD3BV
   3OKkM5OByrdz/kPmP00LlfjIen8re4KiKEJ3+rVCoEVHQrl02a8SUYfzq
   wfL4DmTYElZVaEfpaRAcDbDbZutaQ9Wt1E6krRjTQRHAtNhprbpXy5N+A
   Q==;
X-CSE-ConnectionGUID: kjtQmXJhRZad6zPeq1W81w==
X-CSE-MsgGUID: FzfYk8BxTkacYGIDltYBZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100595071"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100595071"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:00:23 -0700
X-CSE-ConnectionGUID: dqfldLPCQrSNoS/jTLxYAA==
X-CSE-MsgGUID: bi6br9T8RAiu6HelzPI+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277433159"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.187])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:00:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Asai Neko <sugar@sne.moe>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
References: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
Subject: Re: [PATCH] platform/x86: asus-wmi: don't warn when LPS0 is
 unavailable
Message-Id: <178955641650.2305.5755139634632613796.b4-ty@b4>
Date: Wed, 16 Sep 2026 14:00:16 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 16 Sep 2026 00:32:56 +0800, Asai Neko wrote:

> asus-wmi attempts to register its LPS0 suspend-to-idle callback during
> probe. acpi_register_lps0_dev() returns -ENODEV when the LPS0 interface
> is unavailable or explicitly disabled, but the driver treats this
> expected condition as a registration failure and prints:
> 
>   failed to register LPS0 sleep handler in asus-wmi
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
[1/1] platform/x86: asus-wmi: don't warn when LPS0 is unavailable
      commit: cb5145bf878b3dcdb20f1ff4afe04009c8fa831a

--
 i.

