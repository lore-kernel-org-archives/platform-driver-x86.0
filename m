Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B544C51C;
	Tue, 15 Sep 2026 23:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514504; cv=none; b=pnUfz8MgyxWShk/U2YG9ETMMgIxfdjbrWG4MdvoKucOzEqClz/Ad0ofNCG1PPz41U0D1oiMYDqZytj/945GDlxtRiutJ7oQBmFl70ShJ+5xZiuPb1DZdx9piLgIF/HH1gszGxkB274tcalo/04UrAp0jPMeaYtFJ/A915/ICJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514504; c=relaxed/simple;
	bh=B/is/CYllwk69ddDtZ6LQely3Y3YILjP3zleHMqOGY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uYgwxhpiA2j8IgQavlnuWzgYYodpxqRVRDE7CYCQ/OYNiXoiunrfyNjoEg/pQSquNDBCy82NAVQjhBCaUgBLokNOSwX5r7tcs+NdsgcBeJndcPOZPjyXcYVBxRg39wbA62ojBFXojQUMdY/sTL76AW9jOlkH7CO31ERWGqIgeqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3RBahNw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3RBahNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789514503; x=1821050503;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=B/is/CYllwk69ddDtZ6LQely3Y3YILjP3zleHMqOGY0=;
  b=b3RBahNwrogX/mzggRU8tyUP/sRj9+/R6qbCazHEtFDU3IaA5Ot2ofwT
   F3JcOFMcPhu/z6S1VQq7apKZpqjRrJhiDCbVTtsYu2WuJBoFUn2a6xUHh
   EHdDlpPMChC2nQzCaO3T2QRRvCI7KuVeYYBoXfQB2CZi3X6dQbdizxZ0v
   uwvhaMbkqzawckehJTouno9gp/c4AzEiQkzeV3+nOwiNDvIGsxa3fV4H0
   qoQxcw02ntSuHnPpzBOhEdl9hYsMhEc9CUP3QiA9JolKtHQ2Adbq7ZneO
   tzUHnO49MqpnYqnO1+3cJEA8qRc+//p08umDfnoDvWMz5GX7lpmWZwMNk
   A==;
X-CSE-ConnectionGUID: Y3sIlkNiQkaJnFPT4ONZzw==
X-CSE-MsgGUID: dnwFeoZeSEGZ0QDL9s2TdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92398105"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92398105"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:21:42 -0700
X-CSE-ConnectionGUID: SCxxOS7FRFqBkJvwNKaavQ==
X-CSE-MsgGUID: V22PyAauRuiler3CbujjJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1378491"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:21:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Marco Scardovi <scardracs@disroot.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260805183131.3075-1-scardracs@disroot.org>
References: <20260805183131.3075-1-scardracs@disroot.org>
Subject: Re: [PATCH 0/3] platform/x86: asus-armoury: Add dgpu_power_state
 and check in dgpu_disable
Message-Id: <178951449553.41627.13333729778713214304.b4-ty@b4>
Date: Wed, 16 Sep 2026 02:21:35 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 05 Aug 2026 20:28:05 +0200, Marco Scardovi wrote:

> This patch series adds support for WMI device ID 0x00120097
> (ASUS_WMI_DEVID_DGPU_POWER_STATE) to query the power state level of the
> discrete GPU (dGPU) on ASUS ROG laptops, and uses it to prevent disabling
> the dGPU while it is in active use.
> 
> --- Background & How it Works ---
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
[1/3] platform/x86: asus-wmi: Add ASUS_WMI_DEVID_DGPU_POWER_STATE define
      commit: b39c54c59e4e9afaac37d0370b776660ba86cbae
[2/3] platform/x86: asus-armoury: Add dgpu_power_state attribute
      commit: bf6e7e433e83924bf7e96514e7afb50b43723022
[3/3] platform/x86: asus-armoury: Prevent disabling dGPU when in use
      commit: b3f06a74fea6f1ddec192dfece8e52053d0b6c57

--
 i.

