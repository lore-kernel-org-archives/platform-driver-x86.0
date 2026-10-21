Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577231;
	b=l3Oo+gIAf6O0usezzgYJ89aBZ/a0Pb/eUAV0FZN93nOfu3cw5LJf6W6SoWgX2Z/esYFd
	 26o4erNQ61oGzGQA33WKqxmlExex0xUeVbcol5xWy2IHnpawppRt2mZmRCPOJT3WnbcGU
	 s6DLim7TDakblqR+HHsRBN0Qz1zp82gy/wv9T4BB1PsRWC8W/JP1Z81iBmuSvxIxS6V7Q
	 zVhgzrpyZCzlxXIly46JmH9RL6RR+UTkFiCfgUv6p5OZrEaWA2tFxOmtNmd6iDewNwPZK
	 4fZ9tlcO2TU7IGyUTf4Ay0/UaLzXDMx+Zo1qIHNFI/54RkiVHufv0qYAF2LiBgBulWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577231;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mEJ3pk62LVtLFU+F5e45dr9I9xpyOA4SbbmXKOhcf7Q=;
	b=JzaQoaERrhiB3C4Wjao6Eyj3YwCAD524H5p7VmpT9bVos3+FHUUnCP1Yv92DKd0pBez3
	 +7NKzjGSNrreCNmm3rOBsO1+9DsIGKALT3G9es+Memq1LXhc9fP/ocK8iciEWBm38A9s/
	 WLYtVv9K4/7GHLlqDA3XnA8tPRowUu+WUJ5xOs+UTLBSo/EJ9A4FXDBdwNo3j6kNh66wH
	 J6xLX5NwSQN9m4RseaxVu8Wl/nScY7vIKfP+sbPdCummQwRkqPV1Y6TvEgHHETLB8oya8
	 e2JZmFM3hDmZE9fQe6d9d+LUZQx959TxzHrvLwHKgwQrthDHLWbVyMLz0BBH/4Sic3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzTIKNjW;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BD6606A31A;
	Wed, 21 Oct 2026 10:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzTIKNjW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792577231; x=1824113231;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=cbEw5VIacdJ4O3husrSIDdQvxT+tWhN4KhoaS0zG+Fs=;
  b=IzTIKNjWX2FPsP36DT1DeS8PO+wlSnJ5Q+JVU44unG4vCbVzigB/ua22
   HCFJVQo5ZMdX1aRLf4bdvxywcRLezmEzeuOx32AI6y8BE9RnjiN9wNFUb
   WRtTiSTakKPBFftmfsPkEX8YZb3pH/flCv9cXo/n4HvplDUbIx/3Sjfev
   W7eEE6qPEYYHH520ga+woLUtte5+A3LkA9NIcmYDoTGd5XhSpbFGBeqZe
   1N1fuUFh2bTMCo9PsE0M1W7gprQRzII7JjteKVxICnee0OQNHcilGcN6z
   2FQUYPgx7KDFdQyfninwLdggmD+gxYC1JN4t7YWwS2/wvWPT1hrtJF96V
   w==;
X-CSE-ConnectionGUID: SER7WieZSgOD1mtQijwhQA==
X-CSE-MsgGUID: doF9Dnk1QKeWldZZzzxjgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1313829"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1313829"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 03:07:10 -0700
X-CSE-ConnectionGUID: X2LMLRtGRlWzDXQt1QP+2g==
X-CSE-MsgGUID: yThFm2prR4SdsMpEIvBQvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="4888905"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 03:07:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Hans de Goede <hansg@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261021070948.19916-2-scardracs@disroot.org>
References: <20261021070948.19916-2-scardracs@disroot.org>
Subject: Re: [PATCH v4 1/7] platform/x86: asus-armoury: add power limits
 quirk for G713QR
Message-Id: <179257722187.10359.2409318117787789413.b4-ty@b4>
Date: Wed, 21 Oct 2026 13:07:01 +0300
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

On Wed, 21 Oct 2026 09:08:13 +0200, Marco Scardovi wrote:

> Add a power limits quirk entry for the ASUS G713QR laptop. The limits
> are extracted from the device's ThrottleGear XML configuration.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/7] platform/x86: asus-armoury: add power limits quirk for G713QR
      commit: 1d1efe639126366408c36adb72e063559bda9daa
[2/7] platform/x86: asus-armoury: add power limits quirk for FA608PM
      commit: 43e909d10d5d5704efcd51d2b5c4659655efe8ab
[3/7] platform/x86: asus-armoury: add power limits quirk for FA608UH
      commit: 8b2403c1a187fdf7170467822ac5d1deb8499ffa
[4/7] platform/x86: asus-armoury: add power limits quirk for FA608UP
      commit: 38146854b074a5f3f9b2bec6f6381f0c10b59840
[5/7] platform/x86: asus-armoury: add power limits quirk for GA402NV
      commit: a2cc819aac6877258a8222ae40a3b349d844e2a9
[6/7] platform/x86: asus-armoury: add power limits quirk for G533QS
      commit: eb588e8506d0a8736d9176cccdf6b42af3a12c99
[7/7] platform/x86: asus-armoury: add power limits quirk for GU605CM
      commit: 61be8edd585af9390b3f967ac0d3e07b7dbbbfe1

--
 i.

