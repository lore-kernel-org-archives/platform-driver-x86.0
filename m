Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C32156FF;
	Thu, 12 Dec 2024 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734014855; cv=none; b=evRFK0LLYe6ddj0ZO9Adeo9yJVsB2WW/BMwcSG6c1vanY5DDMcUpQ2ZdBuzs37l7SoVLTHyrp22oyt9dXrXfDWPCbxGvi5OegM5o5oAZB2MOiitJN1sCdwhcQo0dY1BGYTvUfGt9DtifyPwmlBO5McQ1xiPYR3fVUG6+afH+u7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734014855; c=relaxed/simple;
	bh=8voch83YOKRe1DBsc4uEwDmaegBXiMSLm+QsPYhgvZg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e/WFe16E61jajXbUi39a5yWoq4LRFSdlnMTRFvZr2PUwgksHE27AJhj3jyRTUAHYJI8FjtHjZElONLeqzy3U7X3xM1mAT15mvxJviDa32Qo4OXd85JLkFhTBcwpUaJasGdtgjA5TLTq5E2ECFuiE//dxj+7orCAgnRQfmppqLhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBpHzO9f; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBpHzO9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734014853; x=1765550853;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=8voch83YOKRe1DBsc4uEwDmaegBXiMSLm+QsPYhgvZg=;
  b=OBpHzO9f3K4KS3cL4Rb32Jb8p6PjxjgvlUiVhxC2z+ZDUmXDjon4L8O+
   35Vgcgw8MMkrliiB6Tl6dUSWvAJ132s8T2DkqSNzUT0g0K+6LTZrjgEsA
   kN1+SwSfov91PwjBOSverxsBlZ+ZbSJMiQDjSyO7bMkwzEepRClFY/N0C
   nLjCrQjbVBrr0JPqLC48od8ph9v051OAeX1a+I/KzJMvLKLUcwK3oSk1u
   9rQ1BjcS6vA7A3DDaXvIsEBoDD+6Lw6azRJzqV3MjK51+wS5NZuuukeyn
   qIur7yKaW1L6TEWf8CyiyKH/JvO4kBjPPbG/utow4hJduWB8JDYQj+DBA
   Q==;
X-CSE-ConnectionGUID: jiSubBsWQMO3avLnP6RI7w==
X-CSE-MsgGUID: eWuRbhqiRO2k51bV8IQN6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="51961700"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="51961700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:47:33 -0800
X-CSE-ConnectionGUID: IuNJ5NvQSgGg737cAQxXxA==
X-CSE-MsgGUID: ++an/gEqRh+gGeQcMb8K1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="127052091"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.137])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:47:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20241210140115.1375-1-ilpo.jarvinen@linux.intel.com>
References: <20241210140115.1375-1-ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 1/1] platform/x86/intel/tpmi/plr: Make char[] longer to
 silence warning
Message-Id: <173401484734.7675.1325094821031261568.b4-ty@linux.intel.com>
Date: Thu, 12 Dec 2024 16:47:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 10 Dec 2024 16:01:14 +0200, Ilpo Järvinen wrote:

> W=1 build triggers this warning:
> 
> drivers/platform/x86/intel/plr_tpmi.c:315:55: error: ‘snprintf’ output
> may be truncated before the last format character
> [-Werror=format-truncation=]
>   315 |                 snprintf(name, sizeof(name), "domain%d", i);
>       |                                                       ^
> drivers/platform/x86/intel/plr_tpmi.c:315:17: note: ‘snprintf’ output
> between 8 and 17 bytes into a destination of size 16
>   315 |                 snprintf(name, sizeof(name), "domain%d", i);
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/tpmi/plr: Make char[] longer to silence warning
      commit: 45ec7a0a788372ae3d83c1142ddde52ae09606e5

--
 i.

