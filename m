Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2272199923
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729593469; cv=none; b=UCSRdM5r2+uzsXXpZJ6NEq0ilotDl/r0yuw/LLk1C2jX3ZOhHJ6jZ28Kpo0+dFr8PyjInmijabTlQf1Sgvcn808bpEsixVdhCOLjivD6Dfd+J1WHFdDAcxA5BLRRZALnVYO9r8MRyfS9E1mWCBm77Pkn1Uz/fXDLC0vqw06qQxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729593469; c=relaxed/simple;
	bh=FG1tGyPI7pmsmdvm7WTjIASgQad3XnSu2ZeaCldfSZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y0zSxBybbSWmWTd9lmZLjnbgRTNHNtYXYsYp+m+mpVI1YJ/N+8TnS+8KTzxCRgdlE27FiQZGHkYzzeIANjwYgZjhZJDXHSV1zQBuoA4hcgcWhKKo1Kf1TbncDzLqVHKucZv639wcpemUg4mXHWS8nEPFKWxSSg0VR25y1BKnlto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXQQrJ2Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXQQrJ2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729593468; x=1761129468;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FG1tGyPI7pmsmdvm7WTjIASgQad3XnSu2ZeaCldfSZ4=;
  b=UXQQrJ2YYKcba3FNgvZGOkYvzUwvUSjr2AkyTZ0aVsMW18SriaQzwEoI
   HCx4yQsd5/h1r2AH8ysv1qBK8GHeTXQ2BrQW+wAXs1ldzI6/wbFnY4d8f
   7v9dwzovv44nRhymoYAZWcf0bmO6XmtA9Jx6bWLtLqgIZs4FRjZmmtZQU
   DuYEagXLQwNWNgM9BHVhs6jN8VSEoBvab3hARX2guFF3dkA1uncYHsR2a
   I03bajYtmYhEqyv6s9M39Oz2P93HjZxaS2XQBH1JYsxVA9JHdsso0NuRM
   l5P70N4w3kXPkpu+6Bwf5kzxB3SFQuVjRpGk/PJXCOjYI5Wg1TPywWf7v
   g==;
X-CSE-ConnectionGUID: NvL9EmEGQhy6shtzK32uLQ==
X-CSE-MsgGUID: wvyN3MT8S86ZugQS2cABWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39736456"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="39736456"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:37:47 -0700
X-CSE-ConnectionGUID: 2OZ4/oScSG26Hl/npuCfwg==
X-CSE-MsgGUID: Kvdxh/66RX6Q1UI9Ti5eIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="117260431"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:37:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: hdegoede@redhat.com, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <20241021111428.2676884-1-suma.hegde@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
Subject: Re: [v10 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
Message-Id: <172959345957.3271.14115636341016028696.b4-ty@linux.intel.com>
Date: Tue, 22 Oct 2024 13:37:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 21 Oct 2024 11:14:18 +0000, Suma Hegde wrote:

> This is in preparation to splitting ACPI and platform device drivers.
> Create and move hsmp specific code into its own directory,
> no logical changes.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[01/11] platform/x86/amd/hsmp: Create hsmp/ directory
        commit: 9df193087b9ed58a244faa516334539661fe7f11
[02/11] platform/x86/amd/hsmp: Create wrapper function init_acpi()
        commit: 1e1c4c0ab3088cc94a9bafcd716e4054b3344be1
[03/11] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
        commit: d9a621ebddf2d3351db4ae5df2547b48647d4c11
[04/11] platform/x86/amd/hsmp: Move structure and macros to header file
        commit: 1757d2b8dcf6810d7356d8420606df5080e36260
[05/11] platform/x86/amd/hsmp: Move platform device specific code to plat.c
        commit: e47c018a0ee6962fe3dd895407e2c49538cc066d
[06/11] platform/x86/amd/hsmp: Move ACPI code to acpi.c
        commit: 969f915473d8cb0e298234ee313370b6a2da69f3
[07/11] platform/x86/amd/hsmp: Change generic plat_dev name to hsmp_pdev
        commit: 8e75dff56e003cdd38643024c4f5f8ba227100c8
[08/11] platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers
        commit: f9ad7a2843a65bae3fc449bd02e894dd29eb1420
[09/11] platform/x86/amd/hsmp: Use name space while exporting module symbols
        commit: 5ac20e4ef7b2730a9d939d41fd5ffee005443f44
[10/11] platform/x86/amd/hsmp: Use dev_groups in the driver structure
        commit: 4bad0cf3e6f8fa0eaba55b6290b8b66262aa4672
[11/11] platform/x86/amd/hsmp: Make hsmp_pdev static instead of global
        commit: 79ac20df12f46150031c86eaa86d97f605a65521

--
 i.

