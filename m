Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D8190052;
	Tue,  7 Jan 2025 18:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736274983; cv=none; b=pmdUcXFmw4iT481zUTIVWYhEkvq9CaguTKT823wqE8SBNfrc/kAewe/kpguuzxiPbmpfddPJwP+eXZjPDfs8exsJAD0Z31qCBZYvi2oQ1yLGrilitob/SoTfUFag+k1AcdAY2LREEnBN0mMSnEB/mSdVs+v0hHqoYsfui+VmjV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736274983; c=relaxed/simple;
	bh=21JKRrgRx6HLKeWpp/NVvDWRXNGed6IRDY4MrvvZwDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MP/H9yF1v40Xk1UnqHHR/Yb4S8dxGQoddpAYmYstNkuNW4e6OCCIJ3e2mbxfFEUYWB7HTfDLryArMWFFSrHAOTxq03Y74L1XDSdFjQdpYTvZqrGH9eYfwu3JKNL2d40M/TcSuP7jbjzMJleI1cmBP5G9ternk6lhMtE21NOIypc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8kSP8fI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8kSP8fI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736274982; x=1767810982;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=21JKRrgRx6HLKeWpp/NVvDWRXNGed6IRDY4MrvvZwDE=;
  b=h8kSP8fIEbLXTeiTBhRP0HC3MMPxkCTmveo1eZHrM2U2WtAvM3adDpEd
   jzmqL8gy+Nd1YvQMnJSszp7p8namjFbJq1Od9gG+95JY4skXC5y0NcALO
   MgPlWGlU3M4H/uszHUyAW9BpI2fHxtWr7sQV5aOZ3aH/G0vkz8heaGHp8
   LHBfUYOqDcVwCWfIsAswIrUi7DRjNDrO8ADW+CvUnahrE0WXto2JXXD5b
   xaOfR4jMXj0pqWT5VQTYCrmMgUhf2aBaFQNb27JVioP29y5XYbXYm+kjW
   ASbXPc6L78wxsBVeSz466O+7wv0+t5UjWXhTlH4EmZ91NPlO31p2CJ8gJ
   Q==;
X-CSE-ConnectionGUID: BEs1sWd/SuCdFyeYXUMoiA==
X-CSE-MsgGUID: 7xnaqSDdQACI0irlck97/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47890681"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47890681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:36:21 -0800
X-CSE-ConnectionGUID: pj6y1kfERTelEBam1d02Rw==
X-CSE-MsgGUID: HxLBDsJEQGaUcz5jrWM4Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103704002"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:36:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
 Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250101092730.87160-1-hridesh699@gmail.com>
References: <20250101092730.87160-1-hridesh699@gmail.com>
Subject: Re: [PATCH] docs: platform/x86: wmi: mention tool for invoking WMI
 methods
Message-Id: <173627497303.9568.676713076057061573.b4-ty@linux.intel.com>
Date: Tue, 07 Jan 2025 20:36:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 01 Jan 2025 14:57:29 +0530, Hridesh MG wrote:

> Add a reference to WMIExplorer, a tool useful for inspecting and
> invoking WMI methods on Windows. This can assist developers in testing
> and understanding WMI device functionality when porting drivers to
> Linux.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] docs: platform/x86: wmi: mention tool for invoking WMI methods
      commit: 0d64d0d7e18ae331e7d8009c15db702c1f4c53f2

--
 i.

