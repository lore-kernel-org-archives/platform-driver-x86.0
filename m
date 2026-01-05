Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32A628727B;
	Mon,  5 Jan 2026 15:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626931; cv=none; b=BkEOEUPyo1zQCjCNgAgyJTshe1/oV1QIGobxAE0DPg6HQ2AeAhN+j7Zqzoc+lEG4KdcZ9lbdngtUrK9AOKQUoKIfr8Quw70U6zLNWCTEIpk5aTWaEYz6jcc+7c5wHVqxsNgaxB1ea4X774uaSR9buUsUapQ/aXlBZiocLy7c7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626931; c=relaxed/simple;
	bh=kjXp2bBHHwPDza6OzZ7fu5kUV5fceQmiW5VT/ZU3FCI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=umHeink4HmnbGe4p+w1Umxidj8XXlTncaosEjp8lYR15UmMZoXYMimqVF7oqSuK1HQfVIlCsEENHJYuJaB86ih3119qf3PMrkXUZ03EJerFGVIkB9/XRwL/iLzb3bdp/HmNmqk4Hp+8peP+ltcSaDADqKxKEFtrqLlr6Szx+Lpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFgtxALY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFgtxALY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767626930; x=1799162930;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=kjXp2bBHHwPDza6OzZ7fu5kUV5fceQmiW5VT/ZU3FCI=;
  b=PFgtxALYMZu//Qf8MPq85xOlK0r+CWQMNaHR0cFIkFbe29JLZQbDcItt
   OiuQAqGovzqVzvM6PbRQBHO9cDhMf3dzVuD7dkiZfeI5lO+HNNFm1dEjp
   qG/HTBfl/9qi1/6bT1M2oj/j/Oej5xvzM4NzoyC+pIlbSTCHDfdeOYIwC
   JWFPt/anJBDNPs7yVRaLMbEIuiVf8Y6FAKGn7bJtpToyAExtfVQ3wEV3a
   2YlFA1bOFXtz5aHu4SS+ArNlc97MoIeAGpFa6MOytHrVgK50BWGzdfR1n
   7Nx6d9IuzsSziip99g3B8VsQtPY7Ysvw61K4NWq8gH1XlHZ+WMwErSAZZ
   g==;
X-CSE-ConnectionGUID: 51c+p4S3Q3Wq6NoWP2Qwjg==
X-CSE-MsgGUID: 6TUG01VxT0iVVAxuGVIcoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56553659"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="56553659"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:28:48 -0800
X-CSE-ConnectionGUID: +bEbRD1ERmSyWTQzq61TxQ==
X-CSE-MsgGUID: jncaL1ChTgKwbsb8Khqoyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="201535334"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:28:45 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Kurt Borja <kuurtb@gmail.com>, Akiyoshi Kurita <weibu@redadmin.org>
Cc: Jonathan Corbet <corbet@lwn.net>, platform-driver-x86@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251230213431.656106-1-weibu@redadmin.org>
References: <20251230213431.656106-1-weibu@redadmin.org>
Subject: Re: [PATCH v2] docs: alienware-wmi: fix typo
Message-Id: <176762691984.2517.13225903026711863422.b4-ty@linux.intel.com>
Date: Mon, 05 Jan 2026 17:28:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 31 Dec 2025 06:34:31 +0900, Akiyoshi Kurita wrote:

> Fix a typo in the manual fan control description ("aproximate" -> "approximate").
> No functional change.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] docs: alienware-wmi: fix typo
      commit: efbc288d15ca85fecbe6c19d1e55249138d68ca9

--
 i.

