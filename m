Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB835FF4B;
	Mon, 12 Jan 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232040; cv=none; b=CUG+aeWU9UtrGs+j0FWgkrr96mwkNtzRjVZF4llf/zzMIm4rWFedloGH2qyiQgkTYaob8uONA588jhl90TGN/GMHB37JAZ4laFsxALA+TWx6gVj2c0U/xxo1sYu7IK5VamETSWPp7NO/7EviDQfP5SUXHKmYjeYFIthBIMsfr64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232040; c=relaxed/simple;
	bh=f3xO0slKAVaBiRTlD2qHC9T3jGFow6wm/0m9cbCdPm0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=avxOU9QZYSTvhBMtciMclPNdksbZexyQNNWJcMLn1KHpEYv75xt0yVIQn0s4rWZZQtkbfymsy8DP9RQpNkgmBXh0eIxNeAHqu8nPp6SapVJzASfWboWcd3UiFHSg1vV0yenIQafAYDDxiK9eRa38a/X9F1Ch2dxXEr0wNI0sufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UX6r9aQa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UX6r9aQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768232038; x=1799768038;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=f3xO0slKAVaBiRTlD2qHC9T3jGFow6wm/0m9cbCdPm0=;
  b=UX6r9aQaaY1Zcs2Yazs3n9Bd1fZRNziTuTA6izYga1IS6xfwz60kJMvW
   Dj+GlPtOjKCkq9HZTrLVuRvxJY8yrHQ9mcp93JjW4prjo7QHEGEeBtZig
   0fyWec9d+lV8+KOx+Lh141mJePqJwP4VMaP12qgCssh+gHahbudkLbcj9
   tR39D9PHw5SUjPanaqUFjMdhsSaZjWG4Ltls9l2j3NR/nK4Qy6HKHIPRT
   5bxrTgp2O457W9etAGtMaNoknbCPyswCfsrXV0haMyb7rfQigqX2iaHKV
   MWz9yG0BFWVKddiYSZuSJA5Nv0XGQ68m+t2dfOIgjGg9bX/zbBsAtnCpL
   Q==;
X-CSE-ConnectionGUID: 0hDdSG8tQ3229Mf+KSrpSw==
X-CSE-MsgGUID: USyV3ZRARnSTHZc5e8f1xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80147096"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80147096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:33:57 -0800
X-CSE-ConnectionGUID: MYrPfBHlS7Ow16ZvgHyi7w==
X-CSE-MsgGUID: //hswbcMTOiUuXeU/cqkuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208636240"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:33:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net, 
 linux-doc@vger.kernel.org
In-Reply-To: <20260109214619.7289-1-W_Armin@gmx.de>
References: <20260109214619.7289-1-W_Armin@gmx.de>
Subject: Re: [PATCH v3 0/9] platform/wmi: Introduce marshalling support
Message-Id: <176823202983.9723.14857677950268577030.b4-ty@linux.intel.com>
Date: Mon, 12 Jan 2026 17:33:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 09 Jan 2026 22:46:10 +0100, Armin Wolf wrote:

> The Windows WMI-ACPI driver likely uses wmilib [1] to interact with
> the WMI service in userspace. Said library uses plain byte buffers
> for exchanging data, so the WMI-ACPI driver has to convert between
> those byte buffers and ACPI objects returned by the ACPI firmware.
> 
> The format of the byte buffer is publicly documented [2], and after
> some reverse eingineering of the WMI-ACPI driver using a set of custom
> ACPI tables, the following conversion rules have been discovered:
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/9] platform/wmi: Introduce marshalling support
      commit: bfa284e9f5e77c9e7389116a403b1dc478f2d58e
[2/9] platform/wmi: Add kunit test for the marshalling code
      commit: 1e4746e93871168f50f237e9e316dc6c9a883719
[3/9] platform/wmi: Add helper functions for WMI string conversions
      commit: 3ae53ee45d5c958aae883173d1e4cafe15564cce
[4/9] platform/wmi: Add kunit test for the string conversion code
      commit: 3579df4cf0b5a3c1d50146c72b13bb4215d509b5
[5/9] platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
      commit: ca7861de6a37a52bf75fe41be51fd39162a9281d
[6/9] platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
      commit: 7f331e5f10ebb72d3bbc83470e4b409337024093
[7/9] platform/x86: xiaomi-wmi: Use new buffer-based WMI API
      commit: e9997669653bc0622f9ed8a3fe778cc989d1e254
[8/9] platform/x86: wmi-bmof: Use new buffer-based WMI API
      commit: 70d37a7fd341e5c0090385034feb8f6f93a56ae7
[9/9] platform/wmi: Update driver development guide
      commit: 0835f9737d4705a9f72de05fde09ba806dcbc862

--
 i.

