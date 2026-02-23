Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529E314A77;
	Mon, 23 Feb 2026 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864477; cv=none; b=G606UyB92+rPLhovhahdh4vCyNNtmLJtfaEGz5EHtCET+s7I5eN1SPvKltx7nrap+RO/fIx9LK9wmwVJkYHmSaOJcmifUGFvRCFd81kLPIBxZzdxR+cRQa8DlxoJMfYrp21sNKPi/biA7fTdl0i9ojUSeE/xMtOQgMmXCTl9YQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864477; c=relaxed/simple;
	bh=Jw2KLOw/vj/DxdAfmRTx29xR2rGcmmmmXMA36Hm4bZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jHfGYa0guaM7cBYVGBM49oskIDUK70ufrkI6Uxw5rqken0zMHAZho/pJQXiZN6Ijk28qZRIJGbrG9p6zDqFHDIcVSdD8v/W3CNkQOxa+AfpWfRwYU2n9sIQ5F6cE4nScoOIolqZWqs9OzkuvSV8GRcPzD9b6BXgxCe31Iaqqbzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLHSP9jp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLHSP9jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864477; x=1803400477;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Jw2KLOw/vj/DxdAfmRTx29xR2rGcmmmmXMA36Hm4bZE=;
  b=jLHSP9jpuvtEQ5oKH80zCp2xhx5tVJiCR1373EXtGmFV37C5sCVoO/E+
   EVKsJvGdiL6OPPrXT00pWHJwO8cSXl3GfWpupJxq0y0E+cmi2U3tBW4tm
   RxgJ2w8aun7tXK3B5bXvM0iuHD+DAFs1T6ST76siKFIPLgBDWa+5ezL2k
   YltSmp77KIpmFGhZlSe07FXJlEo1s6A2se0hapTc+Heh/PzmkobILKfMN
   EhAjSGD1dQ3hZhBwieAke8bzy2WdgQAUVIe3NU1zgQzlIs04slsMCFge0
   UqZbhsV1+nkchLrcMgrzToV5jM7YJrhaGrOfkV6vSLsZXDdiiMAYHUVqR
   g==;
X-CSE-ConnectionGUID: S/Db5rQCRSWuFhlbYmG/Gg==
X-CSE-MsgGUID: /nYua9nlToaZZ8zatjsncw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95481737"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="95481737"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:37 -0800
X-CSE-ConnectionGUID: p9gTgAaLRe2nMGRnG09bxw==
X-CSE-MsgGUID: EcdasgxaT/y0mgT9Q1Id5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215638207"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: alexhung@gmail.com, Leif Skunberg <diamondback@cohunt.app>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260210085625.34380-1-diamondback@cohunt.app>
References: <20260210085625.34380-1-diamondback@cohunt.app>
Subject: Re: [PATCH] platform/x86: intel-hid: Enable 5-button array on
 ThinkPad X1 Fold 16 Gen 1
Message-Id: <177186446798.17917.519507360722219038.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:34:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Feb 2026 09:56:25 +0100, Leif Skunberg wrote:

> The Lenovo ThinkPad X1 Fold 16 Gen 1 has physical volume up/down
> buttons that are handled through the intel-hid 5-button array
> interface. The firmware does not advertise 5-button array support via
> HEBC, so the driver relies on a DMI allowlist to enable it.
> 
> Add the ThinkPad X1 Fold 16 Gen 1 to the button_array_table so the
> volume buttons work out of the box.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel-hid: Enable 5-button array on ThinkPad X1 Fold 16 Gen 1
      commit: b38d478dad79e61e8a65931021bdfd7a71741212

--
 i.

