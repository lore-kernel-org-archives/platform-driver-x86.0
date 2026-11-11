Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400541;
	b=mHsBGIv85RkwscwvgbYc3hIV55mlrdFI3ZuSQtqrM6UG0F8iK5EzWz8Fz3L+TBrsG89a
	 hhpPc0UJ0TizRCdkVryTAe6WL7LOeTXn2Pkw43P/e+ECb18AfksT8gf/Wp8F39Vr8JICC
	 1gx/+bZi1gCaTf4Ur9tqTsGYRiELERksAkL3fkRu9eiXj1waS5vkJD4C5GQeQtlsDpPYm
	 fPZjwkI5h4INNRic7d8IF2LtlLK3fK8YnRTspXl282E3SvovqnS5d0m5rtsPpkvMIQSC7
	 pt/bip9NxLc8WW8hequx07bAhtHscMBXD/VPH6Py9P6P3ZYLL6knkytFc7SO3IIxbZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400541;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=9FsJvyNPXZN+jXdXZZI8WCV8y3dL6EB8mV2FypAK0Gg=;
	b=E5s3BdWx5cyDiGR4nQD0qFm9tzef9tX6vMnPSNwpT59/wpIZ2DHZdzR2ABJkLvlACVcT
	 k9rAyBb2n5sOIjlG6Dwd0aBmW270W52QIwXLzL3rNVvK2lcagDLEefhWJtk1pselGQneJ
	 ZYNhla33jpJt/y2YDlulRuU8sxqKfjerPiBLYhUfvtWMy2XxUWWT6fqLzPkOGvjDWIb3+
	 vFQWPYsx5r6QQDmNxRQ9JKUFd9mR9IOPQVoYFVBz5xDUIO9xH4n3Rci4f23LnlsPX59Xm
	 LOA0ABj5fzN9twOBLCN6MmXVumSK0vMOq6OzYRrF73n4pu9noEtojAgzmQ6SxROxKwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GkjZo+Fx;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C226606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 12:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C226606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GkjZo+Fx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794400542; x=1825936542;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wDY0WAu133AnKYGks/70j1x+xnqhnawle6JT2+oWizk=;
  b=GkjZo+FxuWXCrilTUXSFj51pj4KkYkLS+jjdjH4QK7jJ9x+7yAJFt9l1
   f0kOS+rwrQg+lDyDQzACAMCeY6rVzdsZT8sz92KKQs3PS2BtqrBtyXYFf
   lcAJrSUXvnJ7EX+vzfZiDeFv3w2vtWUDmYGSmB++MCA7FW9STmpdGWztw
   KKA4Oi4t3UuFU+UQxJbntFdzB1KyyFUU3Wy7MXCJMeMEwzSYG7PHx0uq2
   eV6vaZv8V2VK4GKASRgHkMFZhxacAq2EjpZYNRklfLYDJQ3elU2nW7Lzl
   Hlib21csdZY9i+fNYJmNHoXugn4LFAzUWv7mE1hw1OiZN5Mf0ima+kzr0
   A==;
X-CSE-ConnectionGUID: xxWZabfwQByyi9KlZ1qfMA==
X-CSE-MsgGUID: w3i1mpf8Rcy4kpiYT1/4ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3176344"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3176344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:35:42 -0800
X-CSE-ConnectionGUID: aPU+L8e/Q1meA9xO86gQTA==
X-CSE-MsgGUID: a0Gl6DjwTaOt4pxjG7ckJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8573492"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:35:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Nov 2026 14:35:36 +0200 (EET)
To: Saransh Halwai <saransh2304@gmail.com>
cc: admin@aquinas.su, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v11] platform/x86: hp-wmi: Add multicolor LED support
 for HP keyboard backlight
In-Reply-To: <20261110210316.62037-1-saransh2304@gmail.com>
Message-ID: <ff622077-ca44-fcb4-3f2d-c82c819f51ca@linux.intel.com>
References:  <20261110210316.62037-1-saransh2304@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Nov 2026, saransh2304@gmail.com wrote:

> From: Saransh Halwai <saransh2304@gmail.com>
> 
> Hi Ilpo,
> 
> I noticed that this patch was withdrawn from review-ilpo-next due to a
> reported configuration issue.
> 
> Could you point me to the original report or the failing configuration?
> I'd be interested in investigating it.
> 
> I've tested v11 on an HP Omen 16-wf0xxx running Linux 7.4.0-rc2.
> All four RGB zones were detected, and changing the WASD zone's color
> worked correctly.

While it's quite far back by now so I might not remember all the details 
anymore. But I think LKP found a case where build fails, the problem was 
not in that the actual colors wouldn't have functioned (so more a 
procedural problem than a technical problem with the implementation).

It's probably in one of review-ilpo-next or for-next LKP build reports if 
you want to hunt it down but it seems the original submitter is on it 
already so it might not be worth the effort to track that down.

-- 
 i.

