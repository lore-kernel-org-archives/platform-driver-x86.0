Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52242472072;
	Mon,  5 Oct 2026 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224689; cv=none; b=ETc7AEsXaG6IIR3t6skC+EUBOvejntsn/yB/6pFtC2nE6UQ8i3pdZLHqOjbYSbD8FQMhB+26+43xznal3A6VMiX4IUFOG8lcfIJmtGS5uYEJKtP1Mxg/CGTFteXHhuG/Yp9urqCPxfSnWGMpF0c63lK0Xp2dW3Lc9/FbG9Wivc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224689; c=relaxed/simple;
	bh=jPiADK2vmgBMJUkiW3hWpE+hyFb8BI6Yz+MXU3doIDM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fYDh3N/U8PjlB3CpxNxLbsM2b2wgRxNL845G8G4IlsKvsuUNpGkT75zrWF8WaBsZBbJgLPWHxlORL0ig9qYqpk12+w48cFYp6tKKOkDvl9wmTjoB7kNlCuxzjk8OTjsVqbbF/wAfQJGp4UdItVQNpfDBfD/A5CONCCM0sBlkDRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+l1xlRj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+l1xlRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224688; x=1822760688;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jPiADK2vmgBMJUkiW3hWpE+hyFb8BI6Yz+MXU3doIDM=;
  b=Q+l1xlRj8Lp3kQdEcTU7yiejsDd7d18vX+6tr9E5hAEIe2c27+MS9P5g
   kcBXmT2qYmWFrYw4YsYxWxtTh6DUba3uHhvBm1LhND9couy8mCpueD0r9
   TmlMbKCO8oZrxjpAqlUmZkbSghBZ9WeFw/wpSJnG8XMPU4g4NiW2osLEC
   4/HxIWWTWFIzTRnJ6XZ/hS05Eg9o20C5a4ap10bO91c/xIrznpoTCAfKX
   o+XB7QSDDFAXb9zxk6RHg3hh+tYZwioD6BqKu/jkb2Xa4BF7j9yx/5b9e
   BykVtaOG67EE9We4oWWpn+Sh+z6Ckn9CYOPOHDAMpg+AH5dJ//VZ1SHG9
   Q==;
X-CSE-ConnectionGUID: dt/bAMOOQKSP1XM2ETbPOA==
X-CSE-MsgGUID: 2jHKGiXnTBO+f7rtP20i3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91039151"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91039151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:48 -0700
X-CSE-ConnectionGUID: 9WkRdMvZS+q20OeHe27WbA==
X-CSE-MsgGUID: V8jeHRf2RBq59UYH6pKa/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280628479"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Thorsten Blum <blum@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920103035.281573-2-blum@kernel.org>
References: <20260920103035.281573-2-blum@kernel.org>
Subject: Re: [PATCH] platform/x86: think-lmi: Use snprintf() in
 new_password_store()
Message-Id: <179122467912.34664.6543193112965168954.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:24:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 20 Sep 2026 12:30:36 +0200, Thorsten Blum wrote:

> While the current code works correctly, replace unbounded sprintf()
> calls with the safer snprintf() in new_password_store() to follow secure
> coding best practices.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: think-lmi: Use snprintf() in new_password_store()
      commit: ff29048d56ed5069c5dfcb192a5b0687d3f45869

--
 i.

