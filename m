Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280286;
	b=nDwxQl1DXMKLwWJu773zetjC1fSepIzlI7zHHY50F8L9rF0Qg6O5x+PDp+nsp6FpFUps
	 iU2xg4OVBxilvJ1inqc7DthaOAXLGq78dCZKmYhyUnpw5Ew85yE8KtiYUl4ng+I4CsfEd
	 JuAvQpXq7qK6hZAbhU+RZjYeuQSkJztf5KtKDFY2wWxaZeMvhcAiAVkJvfRX//0d39Mu0
	 hIolMiZ1TTRrftazATK++vCN9Ne6kNxT116BMurtvZ90DolJYjaymnHaxSVDqslEFClbs
	 QszZKfVlwp31gyAsfvqPETE1taAWP1t/EjynWtS6uUC4PsZqKCsjUuzfA3/1JF2QudQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280286;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=2W3wBpxdgi4Pb7T8Mg/H5u+li2wKoy9Aigvg0RGjIBE=;
	b=z3enkao/6vAJmi3oPwadAdSu2qvQpSGivyxFIUXSyD+5qxwU2thULcBZrGiR5rP5QYUj
	 WROlUAkZ+5Zz4I5GnbLkAeAdmnEJu6sDRv7S0jQxI43hlIJc9gBcwvYKooNf9ME9sp35D
	 E+j08IXBFLNClChlnfw2XmZjE4sO5bWa6w7Gd/DZoAWV0T+VbXrShoFRHrBZjPaCrwHp/
	 gDtoR/wL5HV+gf+dKExgypKS5stvYbWuiBAsPAzldnltNrux2i3reTSGqp37vffym7FK6
	 7OKrjRtFl51mIvniMZFG3lhx9VJqPoGXoQVmmOCgG1TpuykodvlaX3dXuQ/uOD5TKXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ApwHMdT8;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FDD606A31A;
	Thu, 29 Oct 2026 13:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ApwHMdT8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793280286; x=1824816286;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=vX9KZR33as97y4LXrN+BGQYkJef78RSeVeGWV9GtZ4U=;
  b=ApwHMdT8kmYMzmIePQzG12BIlkA8TsGwCgMt4Qfsv4sRcu9VnnJcGvG4
   /wP8j3KkWJgT3/qQFP339lLGxnqhtrHtL7hXe3b/IOcTT4o9nShTkuuk7
   nb/8IPD3VmuhzPogtCHSB/MSQ/ZPLdiRLDGdDDpaoXXoWWAoL41h5N/HW
   iAWSqIv2YKy2L1A+aRyXxsJGF4mP+RCIjW4Yq9gtrftTiV9E3qI+4NXMM
   88Ogh5LLFc5TZYWHE92YMVrCyvnG10mP+lS1Drb9G3iSDv8BbEDndEcbe
   LCxLiv8YtjxiwAM8Ph7hT6qVb97w3wS7bdJN51K9aOjrUqqeg4SF6Tb/Y
   w==;
X-CSE-ConnectionGUID: 6Lvpx3wdR0qo8GVBwiM48w==
X-CSE-MsgGUID: 1/5bDhB6SzKODiulNkYEwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900195"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900195"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:24:45 -0700
X-CSE-ConnectionGUID: 3akHLPq+RCOtawsk9BjVQQ==
X-CSE-MsgGUID: Vp7/zCFdQE+FK06vsG2MFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5691266"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.149])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:24:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Haiyue Wang <haiyuewa@163.com>
Cc: Hans de Goede <hansg@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261029021330.460192-1-haiyuewa@163.com>
References: <20261029021330.460192-1-haiyuewa@163.com>
Subject: Re: [PATCH v1] platform: arm64: drop the vacuous THERMAL
 dependency from EC_ASUS_GLYMUR
Message-Id: <179328027708.4477.175594783913674903.b4-ty@b4>
Date: Thu, 29 Oct 2026 15:24:37 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 29 Oct 2026 10:12:30 +0800, Haiyue Wang wrote:

> 'depends on THERMAL || THERMAL=n' is always true and is semantically a
> no-op, but it couples NEW_LEDS, which is selected here, to THERMAL and
> closes a Kconfig dependency loop. The C tools stay silent because they
> fold the always-true expression to 'y' before running dependency loop
> detection; kconfiglib, used by the Yocto kernel config audit, does not
> fold and rejects the config at parse time.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform: arm64: drop the vacuous THERMAL dependency from EC_ASUS_GLYMUR
      commit: 6cea839b2de04818e1b638b68993a1b94eb17081

--
 i.

