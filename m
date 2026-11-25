Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649303;
	b=IB9qeWK3lk86k3c+VXoVBNkqxuzNHx7755wE/OeqLBLwn6Sb5DYZeWOZ/PJH5phpjEUA
	 sN3gIg0t+qm2v7+TPxbpZZm/itv4CWmsUe/fjhZXo3zuJ/3nIP24J1LTNDcThohHAoIaD
	 6LDGu8e7ZpPhCLgOG/JERv645IHrk3Gy9RMaSEnuZ6pDyCCinyb49SCZPhxySTtBl5DlT
	 pQxx6Ecyki50/HBR2KITrhdO/rf/xJ/vsYJ9Fsj4qB+xj5RTbj1Zelhuk+5vPyuOBbcYT
	 cDwrlx2M6YxkeAlQeygznQNQNli8P45MTQvauHvNQnGLj1MoQ2EJ0XX7oTCk7ihoRhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649303;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=WEzyNmdo9KVVo6P7hVY3A3Nk1m2HIc3texOdrqPC9h0=;
	b=zvWxmVvDs+4g39FMARXkVo8QEZsS+YgdhyRzcdernE+plUWTOCVNJn6t5PRIsQWe2G/Z
	 byrc5wvHahSKxXKvSAfHnJKoyurmkwbjCYAJZ1OHQhgKvka6bWWp2uyIho6zVjW4LJLCU
	 CdEMPQ0awMAfdlHWsOzBAh9y8Vsku96Mh85imosr0wnhx4w9g+2L1WzxgSB1B4LZciWwP
	 GnuXBOssB9urC8z/ZwptcjWlSqic+DQMXrhZFGtWdZYKRBN2Fb9reiNpmYg7OfCILRa1+
	 2pvnlXf/ll6bLj36vNFKEayUMQIou3vsPyolaXzIjFqPcjIdjrVcGLG/slCmPXO/rJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ivcniLXM;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9D606A331
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AC9D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ivcniLXM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795649304; x=1827185304;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=rpbWtkHJ/KqR5a1bZORP0S+f3x4andCkmbluOJIZzxs=;
  b=ivcniLXMu/zGBSCqSGr34ArYEsU8n5wuKCtt0yHGlOai9RQdjCoA2yjN
   HnRoNOnszTTOpQ8Cqlvv2q8u3ggOCebJlmuOwi57fExDbLACRH3voQpTy
   W/sm4/goLiBzvLfwVlbJewrSW5QiyF7kyJuiGx0f34bWIXLYKdpj930kK
   jX4KMVGIsaPoHPp9K8fZIoyaqrompzx2EHv3WlXdizaLIiMX7tcp1znej
   oiqN1pm4CEK1TRWhZJnNrbyPLr8LSfGJrrIijE2NhDcrEYTabGoUjawNs
   BKSnb60Zj/avm/13HGMc7e1GcFgx+1ViGm9ZjqKIPGosD8KSGZnpG9E9t
   w==;
X-CSE-ConnectionGUID: uwmYaiV0Q4aS3ToxY5eVJw==
X-CSE-MsgGUID: h5ZlumenS2yuBmeuMwISPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4539588"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4539588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:28:23 -0800
X-CSE-ConnectionGUID: ggjWknxOTTip5wsf0v/mHQ==
X-CSE-MsgGUID: 4W55myQJRfaW/daHOHF1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11869144"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:28:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Jeff Hagadorn <jeff@aletheia.io>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20261118052557.143089-1-jeff@aletheia.io>
References: <20261118052557.143089-1-jeff@aletheia.io>
Subject: Re: [PATCH] platform/x86: oxpec: Use the APEX charge registers on
 X2 Mini Pro
Message-Id: <179564929546.9828.13919431875495486305.b4-ty@b4>
Date: Thu, 26 Nov 2026 01:28:15 +0200
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

On Tue, 17 Nov 2026 21:25:57 -0800, Jeff Hagadorn wrote:

> The OneXPlayer X2 Mini Pro was added as oxp_fly because it ships the
> same system board as the OneXPlayer APEX, which was oxp_fly at the time.
> Commit 0ccdf9a1381c ("platform/x86: oxpec: Fix Apex charge limit
> control") then gave the APEX its own board type, because its EC keeps
> the charge limit and charge bypass at 0xE5/0xE6 rather than 0xA3/0xA4.
> The X2 Mini Pro's EC does the same: values written to 0xA3/0xA4 read
> back, but have no effect on charging, so the charge limit and
> charge_behaviour are not enforced.
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
[1/1] platform/x86: oxpec: Use the APEX charge registers on X2 Mini Pro
      commit: d30cf7b16234df677c264b19edc8278a518b7a09

--
 i.

