Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099388;
	b=ve6x6t9qn0P2lhxSDoAA8mWiwiykoPLWkpvcnrJDvve8D9BWven59nFr/+2JTkj4J/yv
	 tyV2hTWfoygjFsB4v2mgzaJWSlr1AYIPJiPKrnECgk8mpsYiAHhYAYQh//IkDKm/DpmWb
	 7KHm9K3tdb5zBzBK3dcxWO53iwxwO/QP4jSQHklFYXRvm1FtsG0YjqK8GdDXYdOp2nxBf
	 Hnk2gcgqHdCcmjM+6gspGS0AbfppHbht8JZU4fj6vSsJf57oKVNJ4mxkparT8L28WtS+J
	 gDViFBQF6rOXRHB8se174NDAE8S/miWGLxoTPfCsXofr7xKDMgBxtc5u8HozfYBLE1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099388;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=wit3ZfDWDd1ARRT5T1qBlyFNq2UYNM8nf8MNT0gLquA=;
	b=MY/+N2uvYcOVs2wOO+uF55sB9ePp7C59kQIcNM9ndrPkStaMbRDX3zPy2DKfkGJRu3Ek
	 eIHbYuMK7a1qJfRlan0SRQKXZ5JL2ka5sRBe+orXi9cF2D7BMTwNCOa0yBynTQTR2VNvk
	 dol2yl+cQUq3eRdJ/SnqTsXXZLBK62s51DN7Qdw1jJfh483jAlt5/05jQlRq/jlcu+fqU
	 IGMGvSBgTXEiz5FtfenUwiaQL6c9ZJzsLdZHANeJr0jGzvmz2SYSI14vOibgTcAtJC+3X
	 X0gUU/HKrYrV+L3+BctxvcHV7b4hq5BC5tSX11+lrV5EQGSGROxk/cyvAINLBGNIb4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Al2j80fS;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F155606A325;
	Thu, 19 Nov 2026 14:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F155606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Al2j80fS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795099388; x=1826635388;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=IfF6KE1Zm6bWgOiS6M6f9+R9Ye/eDy29rYAAkY+Hubw=;
  b=Al2j80fS+5Kj6BafdnzGngcVWj27yMAqM3und2/1phz5LCc6I5S1keM6
   z0498jdi5PIXBCSO71S6ANGbqcpxsKh3MYflo9HPsNW3m4DYDcjKW2nFv
   4M3XuH6Je21EFsQLKfzo7lnhC1rY8KDgK4eKvmXYDajuW3qaL9U9nR0qp
   TAmcuYeI5S5Lc3siSlIRBSXiE9uJKJiRTSnGDQRZ2h2GI/Or8kBZdusp4
   XHwmTSwE8M251mXl+HX649vRNanUBj6Bv17VST/1MFdvIeer8hUj0lZqB
   2YisCPMAyximJvBaAvW2EbMYZdqPa8VWDPUOsWZ40NXpunfosYIindgS7
   Q==;
X-CSE-ConnectionGUID: RZkrmBQ+RV27L8N0cNtwHg==
X-CSE-MsgGUID: VL9wKDGWQWuQ9Nbu7QmFCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4048841"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4048841"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:43:08 -0800
X-CSE-ConnectionGUID: OQveBIqTSnOt6rxrpQk13g==
X-CSE-MsgGUID: dDbe76LXQhaXb7bsh63d0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10536511"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:43:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Piotr Kubaj <piotr.kubaj@intel.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116210209.3737388-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261116210209.3737388-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1] platform/x86: ISST: Propagate def_ioctl errors to
 user space
Message-Id: <179509937806.9442.18086411242716104697.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:42:58 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 16 Nov 2026 13:02:09 -0800, Kuppuswamy Sathyanarayanan wrote:

> isst_if_def_ioctl() declares an inner "int ret" that shadows the outer
> "long ret". When the TPMI def_ioctl callback fails, its error is lost
> and user space always sees -ENOTTY.
> 
> Remove the inner variable. Return the callback result unless it is
> -ENOTTY.
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
[1/1] platform/x86: ISST: Propagate def_ioctl errors to user space
      commit: 74a0cee01b1ce34a09f6fc4531418b185c88d161

--
 i.

