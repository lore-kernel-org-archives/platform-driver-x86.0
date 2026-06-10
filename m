Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C23D88EC;
	Wed, 10 Jun 2026 11:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091651; cv=none; b=jC4K23CWvavLUyIvVGcte2NAtMqnks+R4N+0bU10dLEf9iK7ISvsXewFFNtu0HQQtOsYZCz4aY7oir7p/pITRXvrUk8PLLsSHP/smhSubOdeTS/12316lrNPqRTREaCudbl5eNLfuGDwtb84m/gAbxBwT5+D5yvraJKdVnVHL7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091651; c=relaxed/simple;
	bh=nON2amlrHD86RGA5c19Ul9Z+Uc47aFoQOmfIBS+lu4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OS4M9L/UPbYEB6HUhjpnY8idHzREbACd6ta2E+ybjKxFtCMNYC8+bwSmkxd5LW/p58m3GKZszxO4oVcUL2c1t1PkRAhtsQQJkxDTS9o1f372oe0qioSNh+arzNzmvS7nZUxDoY2ym7AHViFP+HLqtyjMlkY7qi3dcgfBFccbJGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TK9dq7Me; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TK9dq7Me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781091649; x=1812627649;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nON2amlrHD86RGA5c19Ul9Z+Uc47aFoQOmfIBS+lu4o=;
  b=TK9dq7Me2sw3SbW320px18PJmNMD5qI/RcyeKBO7do3p5EInXZnT1bTR
   Tal6cabGqjfKFNhP6SkqrBW2cud6tUkliJDgelkubzrQgalvSidFII57h
   3+KYwf97H+fUwucTFebOBJXrv/uTpoCXlTGEjpaORHFUR3ZtUfPK81WEM
   vJE7nPwRK7szD3LETfmWZE1Uhw3sVWqQrLXmAZlI9mWfCGhMCSN1eMDHd
   RYfTVSVaq2ablCfL1Q7ZU7PwexYmuJ6G/THBsQTTvTXEB54A2B4Dijr4l
   JBGiNNj4oGaW6K5AWBDkbrljXMF9XVz2deEYn9k8EanJvjY8qcJsA8PCm
   A==;
X-CSE-ConnectionGUID: yB8/IE7RQR+gsYkWxTipYg==
X-CSE-MsgGUID: 77SXoojCRC+6u6RfOSmOkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81924243"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81924243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:40:48 -0700
X-CSE-ConnectionGUID: mm3UskGiTjWwzZ+W9mhW5Q==
X-CSE-MsgGUID: qkRc5Y2BT4yjVfoQSUQs0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243684997"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:40:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Alex Hung <alexhung@gmail.com>, 
 Nikolay Metchev <nikolaymetchev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260609213309.445019-1-nikolaymetchev@gmail.com>
References: <20260609213309.445019-1-nikolaymetchev@gmail.com>
Subject: Re: [PATCH v2] platform/x86: intel-hid: Add HP ProBook x360 440 G1
 to button_array_table
Message-Id: <178109164158.12333.17664383272837286649.b4-ty@b4>
Date: Wed, 10 Jun 2026 14:40:41 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 09 Jun 2026 22:33:09 +0100, Nikolay Metchev wrote:

> The volume rocker buttons on the HP ProBook x360 440 G1 convertible emit
> events 0xc4-0xc7 via the intel-hid ACPI device (INT33D5). These codes are
> only present in intel_array_keymap, which is used when the "5 button
> array" input device exists. On this machine button_array_present()
> returns false because the firmware does not advertise the array through
> the HEBC method, so notify_handler() routes the events to a NULL
> priv->array and they are dropped as "unknown event 0xc4". As a result
> the side volume keys do nothing.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel-hid: Add HP ProBook x360 440 G1 to button_array_table
      commit: c39023ca9a447f09c072080efc84d6874c2275c9

--
 i.

