Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296E42561F
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712591059; cv=none; b=LLUc0didaTHyeQhZB0dMo5xfQQWQY1OH2mcwILItlnLW8CyU41pSwaqqV0kwPSdxLFr2lwpzdwjU0iG888llk1RGdani1HUIwcuezpQztUGLT4v2j9dRSqZcc+MISx8vx5iJZ89zKyiEkK/KelczDsVhEQZmZeMx/fzMBQdOKrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712591059; c=relaxed/simple;
	bh=IvfYhsPkX9eo/0y4HgqUk8d3IF+mLQtdItA6qYojAw4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rvuPqGczTidQccrZKjEe5GIPoqoSPCnwXyiDAVQJarQLLDIK/ACMRm3Hr1+ffjv/fPGH2EbwUUgR8NAqEMp/YSdfe4w+5epwcBDiI21wizw81RHNuo3aZpg6iNM4PPjySdWDctQQ1/q/vveGKRCBK/2PM8f28s9CvSUQY4EvoTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRJPRlXh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRJPRlXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712591058; x=1744127058;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IvfYhsPkX9eo/0y4HgqUk8d3IF+mLQtdItA6qYojAw4=;
  b=gRJPRlXhEIigzHnXUyIGMruSSeKe3k9XVXzDGUYpPm5zubtjVwO9MjaY
   yTNcJpwOler25aVIpXpvNiYdF68hpXW3o7aTzkh9GcLa43USfidM8U0jU
   iN2d01WQRsNOYKzBs0+HK4GUds55OjigmFJdRk80DeWj4iIM63zcJB8Ch
   C6CHy/s3y/lcXmTc0jQ/E6DG+1T+G34uCukIcQkypavSL+meYVjHagzWJ
   RXxXyTWLbYlm73NRbkYLqqNb57J6GWyc6sEVFeaOMOvJC8hkJy7yvET7G
   2VL0XlU7iFZFef+DXNPbFb3+F56x3ByVrn9YpvauWJyBKkLgavuHO1+N6
   Q==;
X-CSE-ConnectionGUID: +2+aaPwcQiiRJEWaW/RVxg==
X-CSE-MsgGUID: j4u3Bc8ASE2RgYih3NxijQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7742036"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7742036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:44:18 -0700
X-CSE-ConnectionGUID: f8pOfed5TpWp6tg5jlyoJA==
X-CSE-MsgGUID: 5UpuuLpnTiKYZSkaeilTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="20487133"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:44:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Apr 2024 18:44:11 +0300 (EEST)
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
cc: Gwendal Grignou <gwendal@chromium.org>, hdegoede@redhat.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: intel-vbtn: Use acpi_has_method to
 check for switch
In-Reply-To: <030a3bb8-6246-4289-b188-65ad3fc72d62@linux.intel.com>
Message-ID: <24fa2a92-78bd-f563-d848-2b9b557dade5@linux.intel.com>
References: <20240329143206.2977734-1-gwendal@chromium.org> <20240329143206.2977734-2-gwendal@chromium.org> <030a3bb8-6246-4289-b188-65ad3fc72d62@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Mar 2024, Kuppuswamy Sathyanarayanan wrote:
> On 3/29/24 7:32 AM, Gwendal Grignou wrote:
> > To mimic how we check if the device has virtual buttons,
> > acpi_has_method(..."VBDL"), use the same method for checking virtual
> > switch presence.
> 
> if possible don't use words like we/I in the commit log.
> 
> Other wise, it looks fine.
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> >
> > Signed-off-by: Gwendal Grignou <gwendal@chromium.org>

Thanks all.

I've applied these into review-ilpo branch. I edited the commit message 
to get rid of "we" while applying.

-- 
 i.

