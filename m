Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD549E15A;
	Tue, 15 Sep 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471965; cv=none; b=BYQygz4OUumX/7af+oPLjqKYy8y7azB6RncVIHLak02todA855wK6RMeWYgxPcr3e+QX11Yj54whQv/7zR7fdjfy5+hUp2/xAMvN77JvhtwkEINlTUUS8UvFv5Mmb+Migqk5bvjoHxQ3EqUIaw/+8RYk0S2egca4L7DkAbX6FP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471965; c=relaxed/simple;
	bh=46PSGLsFjyq6P8TWD1JF9OTZGgANQydgBgpk3rYB11Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dpj97mpt06HvacebF33csvm+3JM55rCd+jtYYivydsHezedu7Hi+td1OGVlutMg/3p0MEl4ONQ3Wlu4XhfpF4zdDBs4bNx6q3Bv9PLtluhd92pP3mZ4R0dQJXV93cQ5N9NWvSLKf168L1AXFw3Xa/OsVOol5S+dfrkrLHFmzScI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCxsldHs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCxsldHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789471964; x=1821007964;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=46PSGLsFjyq6P8TWD1JF9OTZGgANQydgBgpk3rYB11Y=;
  b=VCxsldHs6NXbqgFFHpVJDIiXpRMSiv6DOSy5/z5tlWJ0V+dqXmKTQWTF
   GfRvAIPogpA6Zfy0arFd4Vu6wtu1lICpl1e59vg4mt9/Fu3v2YI5ywC+5
   +W7njs7R60kmsMSEWlVHudxH2K7NXAntpK2KrXuDD48/aTeEFkvD3/Jvs
   zNGdSL5ZNbSsvXCUU/VB+FtiqT6zA0/figlm2ZWMk2F1f5axOMhZibEbd
   mrSW2gpjXUem4AYob0NWmlgiMcK0sOVHxXd/K4WiaHc/dqiUhTVBGwKLJ
   xlP3vU7biHsoptKbSUyXjuejl9CDkX+TXE8usLBHM1hX028eQUx0e+oDk
   g==;
X-CSE-ConnectionGUID: ZaYDsfU9TWyxwLTYlcsfzg==
X-CSE-MsgGUID: CmZ1MkQuR/WtMXU7pM+Ilg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100428329"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100428329"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:32:42 -0700
X-CSE-ConnectionGUID: ef7rdoBuRSqG2Vv3P6VFAA==
X-CSE-MsgGUID: XwGAZ87XSZ6GcpE5eCtmeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1380348"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:32:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, Nitin Joshi <nitjoshi@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org
In-Reply-To: <anK1j7hbMyFHGBUS@google.com>
References: <anK1j7hbMyFHGBUS@google.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use
 input_device_enabled()
Message-Id: <178947195441.31094.9793704324340226838.b4-ty@b4>
Date: Tue, 15 Sep 2026 14:32:34 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 04 Aug 2026 21:03:36 -0700, Dmitry Torokhov wrote:

> Use the new helper. Inspecting input device's 'users' member needs to be
> done under device's mutex, so add appropriate invocations.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Use input_device_enabled()
      commit: be0048786d53375fa4eace15cfdf65593956a1a2

--
 i.

