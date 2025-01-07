Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB6B190052;
	Tue,  7 Jan 2025 18:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736274991; cv=none; b=hGwfDrS1Yrwrakp1k30OUiJ9CI/cUvXR7LyY9u5HGsM96vID0B0jyjGIqsF1JQUdOJNJ66djCuzLVGOCVUJRaO+1i3aES4BNnU7yQVpqJQs4NXxfmHeCS9Y5e3rAB7z/3Zu/5W5a4aPla7xoxbKt7Ez2kguFAIMXBCfX0GkQvtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736274991; c=relaxed/simple;
	bh=Xr0+8bvsytyLRGareCRHkPu4kXDLQMFn/lzhFz1JECs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QNjlK2pFMdcasfpmdnSycIIl3CKDCIHpitvjYiRw21JXruygx4Gin2es5oDBWZmTzQoRnHb6k1wvqwPofmxSnhI4oPfE47FHlsimoM95zTz6cXoncJlFn2911ae1xEB+55fmwhch2/9VZzysP786mQxqCfutwpo+oQQSLXIBiYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAtDsuU/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAtDsuU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736274990; x=1767810990;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Xr0+8bvsytyLRGareCRHkPu4kXDLQMFn/lzhFz1JECs=;
  b=jAtDsuU/4Jvvrde5jW28m4Sf+UfyQgdSvIMwrT41U6JQziOimAYpRcHq
   MJhj8ftE9dvpDGGd0Gyvh9sfMArwmtlxBeFrRc3QbcxpZTvHcnajkf9Zt
   Z1nzmYql00yY9qwIsr+3HW9qwCKh6u2S27hI/a8cSL36lREEcabaDorIT
   8xyyg8A7jr4lMLzrxKV7cVpPMIBUqeDukeQcTL9ni18GV1xaPCaX5oRCf
   P7Frmk6Lb2nKLpBQ3jSP99RUwKZ4FZOdXY88RRrKRe8gGYhxnGXLakzVO
   o5Jbu49QDzl3t9xjHpJEUHtQnVnTVgeR2qPXkr04XMEgpn5WP1iBjOTr7
   g==;
X-CSE-ConnectionGUID: a/Ei3FNGRv+hqRpBox2F2g==
X-CSE-MsgGUID: mK0SKv82S621KPTVznDIIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47890710"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47890710"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:36:29 -0800
X-CSE-ConnectionGUID: vt2KJKzsSs+Fbpb4lzUmxQ==
X-CSE-MsgGUID: Zm7ysIoXQNCRO2G98ov2mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103704025"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:36:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Nitin Joshi <nitjoshi@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250107021507.4786-1-nitjoshi@gmail.com>
References: <20250107021507.4786-1-nitjoshi@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: replace strcpy with
 strscpy
Message-Id: <173627498145.9568.7439619497452812718.b4-ty@linux.intel.com>
Date: Tue, 07 Jan 2025 20:36:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 07 Jan 2025 11:15:07 +0900, Nitin Joshi wrote:

> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors.[1]
> 
> [1]: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad-acpi: replace strcpy with strscpy
      commit: c9a90d746c09e61b1acb829d93f8283e296563fd

--
 i.

