Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93F32C947
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024027; cv=none; b=KDcpJr5HgxjheopWaeD00fO/podpe8YOjkeahs7zI7/x2/ct+5fY1BzBXivtgDvpPP2V6akQ9wQMvHw/2lfUbq5ZWCGXvBST+lc8RbddSeytEEfKr3OhYG30g5n7F+NixwJqA4pcs+yVQzz4/xk1gjCuSihXRgsipiIONrGXz3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024027; c=relaxed/simple;
	bh=i+G0fpK5kh5F2d+gcOfY6BfsZ+SkpNlEFk86yoKHLwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l7qlrDwf+bk4RD1V1sfpV4ZfQcdTbbRZsYfMjmbamX1gD+k44ieTaSQTXAEquKsGsV957bWNbBSYLTKvWbgs7HoJKEr0+Jb6WO7PRYBbWvSYTH2ub6/QvznaZtPWaJ5dQxB9aPBPwZb9/QAVKQ6FYe5UklxOSYwHJWZKg0Ek0YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SB6haTS7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SB6haTS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767024026; x=1798560026;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=i+G0fpK5kh5F2d+gcOfY6BfsZ+SkpNlEFk86yoKHLwY=;
  b=SB6haTS748G5XcERXFy14aNEuvyHg9MjnqJ8uSiyf7c+6lnvZNQgVUHB
   hbn0BavRrNfk5Ec+i8qQTUbImXjDFfm5UAnZSlyAcTrl2ZdEojInOurA4
   8DYqqia/8RMOU9GrA2pvP7KAdT0ZO5qw4cMz37Os5VrruIDzxxA8wue53
   ybAi8NIBxOh0oSvHfwvqAVRyL/FNAVK/WVC6j+3HavFbY3Xx6SZ1FG9MI
   eC1qA9OEc1lsoK4vKYq9ciNJ5SC6NUzJpMu4M6UDJxBJbCI1KwSxOHkso
   KFC3jdiN4cAEzjJXXSkTASi2RYDob1gsg9rqPa6DXhUE7Y2lJ1tUy08Rv
   Q==;
X-CSE-ConnectionGUID: RUfNGHpPRK2aAcfHQwjjdw==
X-CSE-MsgGUID: UsFsX9JfQg+LhOdNoWiCfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79749782"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="79749782"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 08:00:25 -0800
X-CSE-ConnectionGUID: Xd5tV6lNT4Kpsps0fJreDA==
X-CSE-MsgGUID: ZWG89vTDQUiDlZt9eQIbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="205845127"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 08:00:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: david.e.box@linux.intel.com, hansg@kernel.org, 
 platform-driver-x86@vger.kernel.org, Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com
In-Reply-To: <20251224095133.115678-1-alok.a.tiwari@oracle.com>
References: <20251224095133.115678-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] platform/x86/intel/pmt/discovery: use valid device
 pointer in dev_err_probe
Message-Id: <176702401825.34195.1628193549629188511.b4-ty@linux.intel.com>
Date: Mon, 29 Dec 2025 18:00:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 24 Dec 2025 01:51:09 -0800, Alok Tiwari wrote:

> The PMT feature probe creates a child device with device_create().
> If device creation fail, the code pass priv->dev (which is an ERR_PTR)
> to dev_err_probe(), which is not a valid device pointer.
> 
> This patch change the dev_err_probe() call to use the parent auxiliary
> device (&auxdev->dev) and update the error message to reference the
> parent device name. It ensure correct error reporting and avoid
> passing an invalid device pointer.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/pmt/discovery: use valid device pointer in dev_err_probe
      commit: 66e245db16f0175af656cd812b6dc1a5e1f7b80a

--
 i.

