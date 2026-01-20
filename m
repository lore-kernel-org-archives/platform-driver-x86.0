Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAAD45BD6E;
	Tue, 20 Jan 2026 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920312; cv=none; b=bIBzznXLRnwuU0VaDDz+nWgcY6+2Dyz64wp3UDon/SJM+dgZWHSycNDnPib0MyMy1A0q+zAfR5wnQDY1bavFw4WS5z6P9hLDWjTDIscqUrK2Pdt8uupynz+A80kBrP5Rz07aNPTr2Mh2gjqfp+WgnOphaMB2I3kbjC1SJTfFtXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920312; c=relaxed/simple;
	bh=KQREYVz7L+nRv7TuspyCDs8ESUN5d6lYEJobIShQo4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gpPDPsefy90X94VV/qLH5EuRbM90WRXiUQUcMiD1PE56lAabx1Y8E4PzMjk5XGgGpgVont/Q8vuhVflFZbiGFvGJpqLNo2M+MDjkKcGVQR6KxbfSLygU2LYmX4naVUxIZsmOa+YIBw+HMw9vRLKgx69+H1ZHAT9v8KzvTvXw3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DG3Y485N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DG3Y485N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768920311; x=1800456311;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=KQREYVz7L+nRv7TuspyCDs8ESUN5d6lYEJobIShQo4A=;
  b=DG3Y485NodMg+H0yXqSXWRzd8KzX3DixD3xB+yIlufsysO14TKAbrkjY
   Xg7wwAnDISXJ+0aNNIwz/olY4p7oWSBjApA9cbfvcM0A9Qk0Q9qF0kxr5
   BB5APQQl7Bk808pS3zRI3vo/hDsso681qguMiruhedOpqNBSWjmmltDQO
   Td/vXNY8O58yehRKNpOLLJGQlmkijsLM1d8Ux96+YCFmVFPbBP78nTPe1
   REaBFEyI5vED2XMRqkBSduoUcjEieuFN2eSq7MzC1n0vyfr43OulYEsuH
   uuNNzXlT+zrm15np9QXDqsERctJ0vYR1+YXc26YtyfQ4vno5MybbpTXA7
   w==;
X-CSE-ConnectionGUID: YzbZyMQNTzOZrVdkT5uDPQ==
X-CSE-MsgGUID: whcCvET9QuihNmHSvFa4Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="57688639"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="57688639"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:45:10 -0800
X-CSE-ConnectionGUID: NX9G3JkWRMurckxLuJwGag==
X-CSE-MsgGUID: 0J4x4S4PQtqTdiB8hB8BCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210989903"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:45:07 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net, 
 linux-doc@vger.kernel.org
In-Reply-To: <20260116204116.4030-1-W_Armin@gmx.de>
References: <20260116204116.4030-1-W_Armin@gmx.de>
Subject: Re: [PATCH v4 0/9] [PATCH v3 0/9] platform/wmi: Introduce
 marshalling support
Message-Id: <176892030133.15020.7666397577705687464.b4-ty@linux.intel.com>
Date: Tue, 20 Jan 2026 16:45:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 16 Jan 2026 21:41:07 +0100, Armin Wolf wrote:

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
      commit: 015b70a6ae697f5dac3562e4ab45ee275d98860b
[2/9] platform/wmi: Add kunit test for the marshalling code
      commit: 29dfba69c3ddb7945cd772042c6a9ce770c1ba22
[3/9] platform/wmi: Add helper functions for WMI string conversions
      commit: b990a06f7ec6dc3ceecd8015c3b421690f267122
[4/9] platform/wmi: Add kunit test for the string conversion code
      commit: 0e1a8143e79713eef7e027737fed259aa58866e7
[5/9] platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
      commit: 534f685d8a952371148e1374576f8ede2919ec1d
[6/9] platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
      commit: e210986f52b657301d009e23344e3effec12bbeb
[7/9] platform/x86: xiaomi-wmi: Use new buffer-based WMI API
      commit: bb7527c63f8567d69a22a818aa5999be47c5d479
[8/9] platform/x86: wmi-bmof: Use new buffer-based WMI API
      commit: 926a266575a21e96c4c0b9c16b1da1f7fda5a519
[9/9] platform/wmi: Update driver development guide
      commit: 2177a02246ffef9ed4a01af2942119e601312965

--
 i.

