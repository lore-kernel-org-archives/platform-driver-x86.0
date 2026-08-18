Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FFB37A485;
	Tue, 18 Aug 2026 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052023; cv=none; b=i3YBhnsUNX0Csc3+wfFXrEUrV6P6f6IAQiVgTMukUF4jOsu9Fx/vjKspBxZ8so9k4QJyJyGKr/yktBlvCIN1t9Xn50I1MxjRVm6BpGFV8JwBTGJkUAwBLvHs6IsbG93/kvWMsHuqfVhECAuQrh0EpePIMwL9kDTHJymAQFdz7DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052023; c=relaxed/simple;
	bh=04Z2ZlEGa3pmIh7aSIFZyLbxe797tKHLGiaeK/oPmsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H9iXyK+TAx/M4CDUzFi8bstjSTKDMy1FmXfOsCcYynSi+A4QMi3NPaLoIPc2XL/yNY9rcPbtqGQQTiRJXSA4mnyMOIQlqAXiOnCZYgqjgRrKM/pU+1D9YorXVYBTCT1GvBoUGQQ4I56FmgVd+OZb0ajuopifRkVj3hV4N/5Fz8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Me3cv2Bm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Me3cv2Bm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052022; x=1818588022;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=04Z2ZlEGa3pmIh7aSIFZyLbxe797tKHLGiaeK/oPmsM=;
  b=Me3cv2BmZFIfiUDSuda+W156k+X1N8jzqyaklaEaE9Pneesyjned5cM9
   aL/X2qFs+oFbr1gihLH6lHdSheAMk5f1w3JvmOIGgFo8vBG0yTO4h/a7y
   75BfVrBvD1ctxEMaeQ5fmgAJrxOrhbv3v5qurlHxCWm4FNFFH/f0U2wje
   aY0PqpkNI6HV+jvK774yhxpya4qIQBekAmrrcG/uW8J/SUZMM6Cishds3
   dcej298xN8ziSTYMFGb8h/ZTWWw1vHI0nF4R2fjEc9mS/f1BJxRilWeLE
   uQQQaC53sFzsqRRP1Sleivy+yibecQpAkFsT8ACfGsz1rtvx3Ah+Ua16d
   w==;
X-CSE-ConnectionGUID: /1/6IQfdSxem3MAXjRtP9A==
X-CSE-MsgGUID: IwMx5zTpSaWYOMvNQ8qe1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98131752"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98131752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:21 -0700
X-CSE-ConnectionGUID: 0W5+bft3SC6pSCu+bgcyCg==
X-CSE-MsgGUID: QSFU7Gu0SIS61Da7CcnH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="270420313"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Suryansh Singh <technosfan14@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260817145206.148600-1-technosfan14@gmail.com>
References: <20260817145206.148600-1-technosfan14@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN Transcend 16 8BB3
 support
Message-Id: <178705201430.11998.14621613486784394704.b4-ty@b4>
Date: Tue, 18 Aug 2026 14:20:14 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 17 Aug 2026 20:22:06 +0530, Suryansh Singh wrote:

> The HP OMEN Transcend 16 (board ID: 8BB3) uses the existing
> OMEN v1 WMI interface but does not use the standard EC thermal
> profile parameters.
> 
> Add the DMI board name to hp_wmi_feature_boards[] and map it to
> omen_v1_no_ec_board_params.
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
[1/1] platform/x86: hp-wmi: Add OMEN Transcend 16 8BB3 support
      commit: edbad1e0e8c1ef33688615e809bd32f2f1aff140

--
 i.

