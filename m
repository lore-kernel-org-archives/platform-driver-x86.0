Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B974318BB3;
	Mon,  5 Oct 2026 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224666; cv=none; b=rV3w6EMXUf1bw3fmqs8MJsPoW9vaj6+YsOHxSfXmKYrlYe34JXiOKhJ7R8KbD/9lVFiM9mSNznoxqP1SlmT05rJS3NqS683kddJuTJU3Q1kOyY24WbB3WMUSA5W8gNt9iAb45V++oyyXsVnMNycwN4ounNs0ObS9Nem4RZxqLwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224666; c=relaxed/simple;
	bh=v1No7/7xP3oCnDjg3vRi26xoVNzYshHKSpKpiCOmrF0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oztiwU+uqyxQAkJTAihllwAsSksPJsr9JxFGEyBbaQTLoIlOWphSkbXgq32KVA9qkAJ7/3S7X+w/83kxWRHtYY+Pid+gh9Pdr23fdExqfE9TAZn7Mjmc8PjSvUDj/vMUq7dgoMywx9LNWrsVnqNmnAHPlU+pp4Kzah/d1O9XU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwsujXHE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwsujXHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224665; x=1822760665;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=v1No7/7xP3oCnDjg3vRi26xoVNzYshHKSpKpiCOmrF0=;
  b=FwsujXHE/RIyN0oscGxoVr+nhHZlBYiwUosQCwXvpCbYRk1PzDAKyXUM
   BrKxeITDSglD5kNVDI4uBHf61dHWGdBk/fOEjTYDceC0k9Dcwa89dlBKn
   Ys7w1dmn7IMUE7GVZtb6EFm4EcwjN4AH1NMsqi5hgIGD9+bE2Bbt8dc04
   72+I4nxgjq4Gjw2EQaSLw0yGCDo5qxwMIx/XhAkPdF+lN26pEqdPQ64Es
   e1cgtTU7ilmK3EleW7yUKzRReQV4bGoF/Xo4R9maAbJLwxrEem22isWo/
   1k7NdB1JEsJfda+gv9wr81dT2BQyJSV4yIwoCSWNhDwojTMXEOwdGIptW
   Q==;
X-CSE-ConnectionGUID: iOnlWXIQSLKJ4KzuYiq3aw==
X-CSE-MsgGUID: P3NnarliRx2vWBbi6DmrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91928456"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91928456"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:24 -0700
X-CSE-ConnectionGUID: onlipcN6SaScxnuS/pcflA==
X-CSE-MsgGUID: IZ9FJuOGR6KwKaRt0rCoyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276996806"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260919130829.3041568-1-peng.fan@oss.nxp.com>
References: <20260919130829.3041568-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] platform/x86: yogabook: use assign_bit()/change_bit()
 where applicable
Message-Id: <179122465469.34664.12803535950843817399.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:24:14 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 19 Sep 2026 21:08:28 +0800, Peng Fan (OSS) wrote:

> Convert open-coded if/else with set_bit/clear_bit to the assign_bit and
> change_bit APIs.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: yogabook: use assign_bit()/change_bit() where applicable
      commit: 2f666d27bc230a1908c7f4606f104f061300f2a7

--
 i.

