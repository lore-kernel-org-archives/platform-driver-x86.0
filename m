Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6205477E2A;
	Tue, 18 Aug 2026 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062057; cv=none; b=k5BgkeiffloXw7jZ7kn2AWhgZPdIzEkuvaYkCtgMVezUPvj486wpSVwIPc5t+vcah+bsCTRqehqUkJp3b4tHNvZoEpnk1lAsRU5tZjzsXp4TJORw2CAO4wVgwNUhKu08rYDupli4kESrFzxLfd7XSUAX9MOsgwfbiYHtq1twX/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062057; c=relaxed/simple;
	bh=wmDT4703o1WoK+HQmmsNDNu6u1xE4Z9tYx0EGzvWXls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oXHyY5GUI/pfvnM4eyGzV4GRj0Uy90OMeLEixHczR8ykipuUkQtNdS69TY7Tel9+2XliXx+WY93YrpcQWefBCMVaP2FfRVXJ/GwDIM70wA3+GtIHXJHFYUBtUGuw8YqL4bZmuxMr3QTocbtc0WLPvVHDKYmzcYcOhVHzEcELI5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuPY6C0E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuPY6C0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062055; x=1818598055;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=wmDT4703o1WoK+HQmmsNDNu6u1xE4Z9tYx0EGzvWXls=;
  b=UuPY6C0E9zVACyoV9BsiLIMTp8b74rrJd/D5E//WWv54e/cdcQPbdHY+
   mxRUBfv00Ud7u4GgPeTdmHGSkaiTHtTxTIwa1pS2OxzM9dJWHgxkdV5WX
   EBVlDR02EBmw+Xp2FQasiYSuGUXQZKJkHLRLe/r7SxTb3XNxaXX4IpEjj
   FTWF7UzBAlSmvE912JaFU1TSahjWXiaZyoDFBv6C176+IHuoEabyjfgVK
   a21Sm5SlXwaNFaZxp/jE6B6K8nEp+Ok8hyRdav9UDLqJQRpxrPqLUt8A6
   gZBJLZF+J3QaG9PUEjCc5SwRzztLkRt/xjm+U9bhnrihHkiY5wcy4T8vz
   Q==;
X-CSE-ConnectionGUID: tUREJwBIQfyzkbqjZjwUmg==
X-CSE-MsgGUID: RojeBK/GQjeSGjXPqftj/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75084294"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75084294"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:07:34 -0700
X-CSE-ConnectionGUID: sJ4GqLzWRHe1Kbiw+pyZmg==
X-CSE-MsgGUID: 1Wws/ovdQgSPlAnTUHuFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="290038696"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:07:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: naveenkrishna.chatradhi@amd.com, hansg@kernel.org, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: carlos.bilbao@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260812090012.140193-1-hemanth.selam@gmail.com>
References: <20260812090012.140193-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Reject negative power cap
 writes in hwmon
Message-Id: <178706204807.20251.16875337522412398969.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:07:28 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 12 Aug 2026 14:30:12 +0530, Hemanth Selam wrote:

> hsmp_hwmon_write() takes the user-supplied hwmon value as a signed long
> and assigns "val / MICROWATT_PER_MILLIWATT" to msg.args[0], which is a
> __u32.  MICROWATT_PER_MILLIWATT is an unsigned long, so a negative write
> to power1_cap (e.g. "echo -1 > power1_cap") is first converted to a huge
> unsigned value by the division and then stored into the u32 argument.
> 
> As a result a nonsensical, multi-gigawatt socket power limit is sent to
> the SMU via HSMP_SET_SOCKET_POWER_LIMIT instead of the write being
> rejected.
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
[1/1] platform/x86/amd/hsmp: Reject negative power cap writes in hwmon
      commit: e7dcde6b063703a24deeb64689464b2763fe05b1

--
 i.

