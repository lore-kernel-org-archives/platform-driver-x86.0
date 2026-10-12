Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83244A6885;
	Mon, 12 Oct 2026 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820571; cv=none; b=GN/uH6f7z8jVoST+yNOB8gaKaroPjkAmbbv1hKTNdFZsspAOmn4mK0lBsRmJHvyhhJPJ2q8c5A5eeOdaaXCmUu+2PUUkP9yNGh3Vu8TXYmzn0pioKbvoIh2xwK8nzvHYZ6mvWIwBPlOrXEDU/RMm73CLN4q7BCEXgxZkq07GJX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820571; c=relaxed/simple;
	bh=F8TxNbzPoPpeOKAIMlDONgvTVGQu2v1xJvBOhBytrPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s89LGIurxcj9mvhoPmquUATKslGQzunkSs+X3b1u9rs/HXk2arSi0sFOvJMUeWo9kuoFF8mIVtyrtK0clCpcQna8VtVNQlfTcZOb7lAtmFINGMIEv5yPEEF46XIYHm0OgVlw8oY4gbFb6ZuyJrDpCilk/UzOgqBih5ZyVE7qUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlrli8/w; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlrli8/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820570; x=1823356570;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=F8TxNbzPoPpeOKAIMlDONgvTVGQu2v1xJvBOhBytrPA=;
  b=dlrli8/wvbhatkTRWXqIkzTp+MOhqYSajVHTY+SEd5mmMK3cr+6KcUrD
   KUg6vrEm9PeI0Oqhx/C0qWNMGZMoc/AaXsWghWHAE3EBtkOr2E6O4bblx
   ZGkk6fs2nc0uJtGDtwVc1ObbRQacJL4CMT5IM5TP8miw6op0S5Vdud+A/
   TZ2/mmRW1GSK9/BlhNrv5ThixfT862D0YGgBOKwuzBVhoOf+T5OLiwyHK
   pHGmCf/fmUaamcCRghcFIzgf9y3vkkalJrMNpN6VldU5HIpbYQMn0JKfg
   3T9PkWLmENw80KdPVVIf87LZr15SJHf2Hv4d7eRqyoCNwrzAM1f5PcuXo
   g==;
X-CSE-ConnectionGUID: nnPSzgJVRuqZ2M4SG/DlQA==
X-CSE-MsgGUID: FOOHPNTaQTOMK6SLdeBaUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="625462"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="625462"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:56:09 -0700
X-CSE-ConnectionGUID: ebtEE5rbREmyhX9hYdD/XQ==
X-CSE-MsgGUID: voR0x8qcQeW2r36sxaKJHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="970372"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:56:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?utf-8?q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Qiling Zhu <kmatzkaczor244@gmail.com>, 
 Oleksii Kryvenko <diver.ua@gmail.com>, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261010031827.3306077-1-dmitry.torokhov@gmail.com>
References: <20261010031827.3306077-1-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: fix deadlock in hotkey
 input open/close
Message-Id: <179182055606.17897.2748712319508628576.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:55:56 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 09 Oct 2026 20:18:24 -0700, Dmitry Torokhov wrote:

> Commit d6479c25ecef ("platform/x86: thinkpad_acpi: Use
> input_device_enabled()") changed hotkey_poll_setup() to acquire
> tpacpi_inputdev->mutex and call input_device_enabled(tpacpi_inputdev).
> 
> However, the input core already holds dev->mutex when invoking a
> device's open() and close() callbacks. Because hotkey_inputdev_open()
> and hotkey_inputdev_close() call into hotkey_poll_setup(), attempting to
> acquire tpacpi_inputdev->mutex again results in an immediate
> self-deadlock.
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
[1/1] platform/x86: thinkpad_acpi: fix deadlock in hotkey input open/close
      commit: 16a7b5e0e4e3ba9997658b218559fff7ac1ccfb3

--
 i.

