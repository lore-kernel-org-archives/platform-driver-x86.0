Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3883E008C;
	Thu, 28 May 2026 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970278; cv=none; b=oC3UkeIsShiq1kZOCRFxkOzy3poUeR9NcAqqyqKALGq3xKGW47DKjNB567M5UHhHzZIK3QDkH18wNE2NjhgocpjngBvRpXQ5qwQsAOCy3e7xy9rCvQg1E/lhXntQ7yFRqFjVUOuD/6ahtVFt+u3TuZ8IlMh1REklJ8QDGEGaAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970278; c=relaxed/simple;
	bh=3aY4ORsOVNrJ2+xXHK11wsoLEqRfwTC2oqc5VvFVmN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oQJPTuysgBZHCBQ47mNBCpr+W5tEtm6134sBx+JF/7YbAykgDQ35yuCJZjaO+yHo1B/QvkQEN3ONt9Nbrnj0WiDO3HDTxCvJ/cWS5NfdrkfOXdjv3czq2oGhnEgQxrYcTEuRIaZZDE3sv1N5Ivf/oQimhy0HWWAB/c6nm+GGgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+Pr/dik; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+Pr/dik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779970276; x=1811506276;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=3aY4ORsOVNrJ2+xXHK11wsoLEqRfwTC2oqc5VvFVmN8=;
  b=g+Pr/dikrkCjK2TOrszD5IlPDgdfY0s16XKhBt7CbT4a4p35ipU6PDcF
   8YD4VLOPDxaDxupDE5IqWMkulZ02Pprtr+mi46ffye2IHMViIv1PPcvAl
   zLHbSML8gsEjFkRc7Ziw17HK0RAXnPMa0kgSZ4eHjWchp0LkuAvllu8tQ
   iqjhcnkMrZsNqebXyYj91QyUzrXXK+8+uuowdmhfMSi5gq2HfxATKoIvf
   aiu9VRUPt4ScJDitHE5Q90tvgBmpsUe/Gu4MbVrj2h+cQ8u7I+nihODTh
   94fsJpopKfj4a/u0Xv0eRr0AdP5d+Dtgta0uXPmbXM+mmxMnwOkt9T6QE
   Q==;
X-CSE-ConnectionGUID: LDeTDlbdTsy8eI9Uf/StWg==
X-CSE-MsgGUID: iAB1fH4WR6OSDO3lWlN57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80925215"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80925215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:11:15 -0700
X-CSE-ConnectionGUID: tZmBc9kLS6eHPyy7HuOWRQ==
X-CSE-MsgGUID: tYqxSB46QwS4XDtpXO1WAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239522177"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:11:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Pengyu Luo <mitltlatltl@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260519144341.1589034-2-u.kleine-koenig@baylibre.com>
References: <20260519144341.1589034-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] platform: arm64 Use named initializers for struct
 i2c_device_id
Message-Id: <177997026863.9687.18087862956657914467.b4-ty@linux.intel.com>
Date: Thu, 28 May 2026 15:11:08 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 19 May 2026 16:43:41 +0200, Uwe Kleine-König (The Capable Hub) wrote:

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform: arm64 Use named initializers for struct i2c_device_id
      commit: fbab18baaf9a3fe45c6fd75dab7f5b7f6992356f

--
 i.

