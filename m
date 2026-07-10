Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F98374E6D;
	Fri, 10 Jul 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706056; cv=none; b=PfNrmT+uLvyngV/A+tt7+bkR5CfdURGk4baLMfz2iCwUfGc/ChtTwTUvDQaLgX2Ktat4/3oXYi3VrrXKhIZBMxPh46Tte/DqfTxjPhYJiNAPQ7MO0rNAP3B9eMrjuNhqd7DIvBEUulc0MI1mgny42buWVtyeRIsralhNLwW5tSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706056; c=relaxed/simple;
	bh=gfGc6A1mAQjMlXASO72hda/a4jjjEHlDyS2iq8FA1Pc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ElH8h2n56ox6tkvQrEzSfQS7xcDcJyLC5s1tExa+JSQz4MqnXjrSWIPHBJQRYcLnjKK4i/iX1DB7JqYl0SWrpEZeda01ywMf8mrst9phtju/sjp0IT/VMtmsjWvrwDGEpGIhK0wWs4bAoNcSDJ/kEoxRHomIgEAnKMxaYAksqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BirB5zA4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BirB5zA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783706055; x=1815242055;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gfGc6A1mAQjMlXASO72hda/a4jjjEHlDyS2iq8FA1Pc=;
  b=BirB5zA4NhfdSuHHK1P1DxALV8zq4yRcE/hzxs8kcxaAFY+FW0QxMJ2m
   3MX3A3dOosoEDvAeca4VOl3Ex96gIqDC/i+how17ViyCQquqcWbOmEskn
   uULQy1y1K0e6ISWc0X6efUA+dcgh6UANkMkzP56RrkA5e4AzP6RAlnIUb
   qU8Ar5UOXqFBDtwnV5XpF3CRJnt8xySIVDvww9ec560FPdA+dt5e5zOcV
   9m3ZjTv0093ajUvQ5qhqXx7hhb7DLk9eBqWM0Y9ZQUPVRSU5OXvcWKLc9
   kJ+/4J3xCV/6hZT0eHDQ69XxpsDOnWFH952Fc0qO8rPR0GXwuwFtqvEB4
   Q==;
X-CSE-ConnectionGUID: fHV8gBVuTX66g57Y4XRDYQ==
X-CSE-MsgGUID: t6jtDVhKRr2iwvyBNenzvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84601115"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84601115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:54:14 -0700
X-CSE-ConnectionGUID: V//basyqTeeGNgdlM/sYYQ==
X-CSE-MsgGUID: QdUCN//9Q9attBmOvtO+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279353352"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:54:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: david.e.box@linux.intel.com, 
 Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CAMuQ4bUtJtYNTguKoiXngROJw0QQQcrvW3=3_B0-hpMQOFqvCQ@mail.gmail.com>
References: <CAMuQ4bUtJtYNTguKoiXngROJw0QQQcrvW3=3_B0-hpMQOFqvCQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86/intel/vsec: free ACPI discovery data
 on early errors
Message-Id: <178370604776.33235.10032366015418950376.b4-ty@b4>
Date: Fri, 10 Jul 2026 20:54:07 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 06 Jul 2026 09:13:39 -0400, Yousef Alhouseen wrote:

> intel_vsec_add_dev() may attach an ACPI discovery table copy to the
> intel_vsec_device before passing ownership to intel_vsec_add_aux(). The
> normal auxiliary-device release path frees that copy, but the earliest
> intel_vsec_add_aux() failures free only the outer structure directly.
> 
> Route those direct frees through a common helper so acpi_disc is
> released consistently on the parent, xarray, and ID allocation failure
> paths.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/vsec: free ACPI discovery data on early errors
      commit: 09b2ae290a241ce1f5f738fb65c35f449dcf663d

--
 i.

