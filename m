Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01E3D34B2;
	Mon,  9 Mar 2026 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068282; cv=none; b=pK1Mrk19fCP/kTs79EmFNec0naR3eNNnjC8+cap1Hw+P341i1UvVcG1Oi7dFpU81QKWwgwT6igG+4R4vfmD5Lcrus1S5Bx7BaS46La27cuUdnopphQOEwGo5KECTKnh1IyvJfRpumJlZe2rw7hE4Kw3MwmJ3HATYMAlBhMu7Tog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068282; c=relaxed/simple;
	bh=5uYgTlPiCB0q9enqvVxpMUngCgO7OsOWuacB8SSrPtE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b17udkbdWXlxEOzLqN44S208HG/uWHI0F5Ixm4YfCfdyTeNZIlvYyS4KcK2ZxZ9wa1j0ugoa6j8nGsKTEWxKCRfdMXE+CowWF9FpYO3QjZiAfWVpXdGap7HbFZsjQyzQmj26bKHyaSaJg5Atbg1kqsjHMWnGJkwoyDNUMP4tyUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pp4wlmdb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pp4wlmdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773068282; x=1804604282;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5uYgTlPiCB0q9enqvVxpMUngCgO7OsOWuacB8SSrPtE=;
  b=Pp4wlmdbV5pgNJ8SyypDziXwQqKS7fktT8TXuriEla0J4BZ42b3rnkDb
   5bBz1KGup1uugFJGpc8ReAqubHXmoQm8aNDUT5nan8c4tIESuJbO0dBQs
   NidBQxtVRI50QWYNd3pj8J9GzDVym2tThahzA0LARcIzIpH09TnqQDmZ3
   Q2FB1Rkpi7CyRNtMVDcbzBSnxnUvi0EuXa/O9SJH/OQ2Bc61gbXaXo8Gf
   R1P1aQ1HcDP4jl/A06PJzyq3rGBWY/FiUdLacJ5lrGQyyyP9J8hp/2V8a
   VX8CiROC2NlkjLiOqUdVq+2+apjnrtaiiGS0vZnXA74KSdOcDfbVnoD7I
   Q==;
X-CSE-ConnectionGUID: lleJphyYS1q9iydsPrF8jw==
X-CSE-MsgGUID: D1kX1n1TQnK4MDPruy6G0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77697590"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="77697590"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 07:58:01 -0700
X-CSE-ConnectionGUID: HtXkRgL1R6KR7DsPGDfRnQ==
X-CSE-MsgGUID: fUzVACVRS8ewjUwlXMizFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="257698433"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.153])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 07:57:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Coby McKinney <coby@bytemap.space>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260202205214.18898-1-coby@bytemap.space>
References: <20260202205214.18898-1-coby@bytemap.space>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: use seq_puts() instead of
 seq_printf()
Message-Id: <177306827324.16654.14999952040167346547.b4-ty@linux.intel.com>
Date: Mon, 09 Mar 2026 16:57:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 02 Feb 2026 12:52:11 -0800, Coby McKinney wrote:

> checkpatch.pl reported warnings where seq_printf() was used for simple
> strings with no format specifiers.
> 
> Replace these instances with seq_puts() to avoid the overhead of runtime
> string parsing and to conform to kernel coding standards.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: use seq_puts() instead of seq_printf()
      commit: c2948247cd1a6f3e476df46a1bd903c79f3228dd

--
 i.

