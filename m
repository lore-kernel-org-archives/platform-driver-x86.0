Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099364;
	b=OsnxKoW+vz0yxZdyB6FsGim3yYmymzMcagU0jr5hzfkAfb5x87Gl51IiAf5fOe8DKfDz
	 wCCRKiiPCWSAsNAL1PZtxYEZGDnMRu1ifZAFJNg3A6/w4x1t5il9xmH9QxCTB0Y+G5Q5n
	 /zpWjZwbLRoT6boAH/FIbHpGXpfCyDh8+sj6KuxqWaDut7czwJtXWKs0EOOLlEc86Dtie
	 NwPg1rU1oeHbF4f9AwreRsAgACI8OMoEJYaHA1j4nvdw2cZZZLR/l3HiaheDzMJwB5PEb
	 NGZLl7OvZ/BfzcHH0BNoYExlN50n2lr6+JIZwaTfEp8Ymns5os551ShKm4Kps046jpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099364;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=14iPF+5T5I/FxqB+l3ZD0CzV8VhEdP7xoO5GaQox4Og=;
	b=yW5q9AriPSEJUGq9Gjjc+tYfHv6A/34FZK0E/3We0oNnsNFuGicc+qQufKOqKdJ4EJbO
	 pNkEvA/Q180mBwkaxHj84rRh1uQ+dYfCGDVY/fJWyP9O/2uXDvnMWPA2z00r1ICyRpIfF
	 WhOhxeppdhRAqs/UrBGhNX/jQTwmXTQLDMahNCfjBKIvV671tNYrQcS0qMNXtHnhopH+1
	 a1mS56RuQiutTfJlwDjoLfYdTPnlTb8ZixRMBvTRskzWFyPSCqs0mufp4zcEF3iwMjbzv
	 7Rv8m2DXpf/IamVTUqnsE/ZFhdHHsbs9O69PV/ZFW8w9+J1WLGLGziDT2QnzhecSfZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lqGZ+ZdG;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD63F606A324;
	Thu, 19 Nov 2026 14:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD63F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lqGZ+ZdG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795099364; x=1826635364;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=tUQRoH/1bDrWAv6uI4Lz6SZ/WXSLqaY1NZs8G9VZ+i0=;
  b=lqGZ+ZdGd0pzLd3MDD3AjIIZUCeFZmwbDdHBFfIyqopO/olGcOqnP+zq
   nzTBMtZCUAL3n4ggNQqPj70yI+xErXKYqQWPmKaCaHDgt5AAKbSaKTET7
   Ak8ggIIR5tEBi+6xdtFtY0s4kbCvpAuS+Ja0ee7cRO4L52lmsSF8180pA
   tF5DaNB//G8ucpAqnR5FuSD5thYCNXDM1qZ3jizr9QIaHxCgWHqZ7C8x6
   G0sZvivYm7ZjdqIGY+YX5mc1j/jqqQGdN1oyHN7OmCqMHFf7BFbFINAmm
   zDofj2dEhTBy/FWzrxQflw56N4MuqJN6eW/xOqvmXxdssmJs7uHlG4Z7K
   g==;
X-CSE-ConnectionGUID: ozJWBCoBSVGG0iEnEEnJhA==
X-CSE-MsgGUID: L0v6sRIFTWmY7Mx+PtVUaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849546"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:42:33 -0800
X-CSE-ConnectionGUID: ULzRL87RR5mPCyZz87Cl3g==
X-CSE-MsgGUID: 5C87le8lRnGQ9HP46PzFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10786329"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:42:31 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20261102031910.82286-1-rosenp@gmail.com>
References: <20261102031910.82286-1-rosenp@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-lis3lv02d: Add Precision M4800
Message-Id: <179509934509.9442.15011303718987100760.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:42:25 +0200
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

On Sun, 01 Nov 2026 19:19:10 -0800, Rosen Penev wrote:

> The Dell Precision M4800 has an accelerometer on the i801 SMBus which
> is not described by ACPI, so the driver currently skips it:
> 
>   dell_lis3lv02d: accelerometer is present on SMBus but its address is unknown, skipping registration
> 
> Reading the WHO_AM_I register at address 0x29 returns 0x33 (LIS3DC),
> the same address as the sibling Precision M6800. With this entry the
> sensor is detected and reports sane values:
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
[1/1] platform/x86: dell-lis3lv02d: Add Precision M4800
      commit: 83a2e41dd85b426008016c09f56523cf5951b3da

--
 i.

