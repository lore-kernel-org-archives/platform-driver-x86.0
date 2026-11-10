Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322089;
	b=V0IXw5SJR2BnqLujvrjzBIVEzeMdykwvVlfBlSOcjA/0oy8IdbagvLX/THA6pirTtVX6
	 nSjdiKGy9i2nLIJwTcR42MUtxoePlXLawumRE8Ruyz5B29QcFGOAPw9W7SMZe7ytU4E7v
	 PDeb9waXyO8/SPpQv8ecUC3BWRzM1eR6mUV6HLXx7occFZLBE0VJ+dhCZCvQX93+ZyOEE
	 1MCJF9OscIbYdxffeFuczHDDeDmKxwfnkGbAhbFRjlHhAp9dMxutTJZJ/QlMO8gzsH4AS
	 tOjV8g1Kzg08WIQEfomJvOFdznNlvZFC5Dgqbj2xlMXquKeX2q28kIZHH3JL5TBWwKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322089;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=gxzWINiIpnXzUkrqXxQgvKL6Z5C8HD59v3oLy36PnXM=;
	b=E5wAPunP9CcafJzBZJn7Z6YQZb+ux5TdFXXWTneTgpBq8JDBIBW2xJikY5StQfAyki0T
	 1uXOMuVxtclvaCXh8C5MBdPzNds4coiqZK3OeZPH5YVv4O5zrKqXlgEvTj4Y8H/DXpZOA
	 Xk7RSyjNrq7HGXErqSvW/xjcHlXd+SGLg6vVVxl6V0QHEKPq4nBnFoM2v8krjo9IDoNo+
	 IUij/P2BM6myAU9rbSWQ1fB45JsXIB/sTaeaeW2VbFD4G2v59GFrYk/DlSZZMJY3bIsLn
	 /I31qwhqkeRXDlKb5sBAk+jkxOIWRtyn2ACuOvzVEK3KnN1t4DEs0ZCE/6pvmeRN6Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JaY1+rrG;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AF0606A31C;
	Tue, 10 Nov 2026 14:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19AF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JaY1+rrG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794322089; x=1825858089;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=To2IiISNRTGVGz3vwW6bRjbnmoVYaSM+CH97s+PzFl0=;
  b=JaY1+rrGEZ2pBxeKIbRuXnzZFjfgHEX8NZoM1CzGpdYXzyAntwL35DP4
   111FF/2EvcgshEQkr1skgZaoLb/kN6udHz2ALmflWxsJyTwlYbX2XDQnv
   +Jw1ltQbKGOQHmNra2OHb/mlnsYP3nnqWVSaBfFJQawNFhTjOBLXY60V3
   33nU8+odnnMVfT4gSt7u5TRZCR3fY9Hriqk71Hx0f5EPUG/61KUlun+k5
   vXe4Z+/xeo810SMdR91mIdjMOj574GUeYIYh2FXDvCdGJM1H5LGKAxU13
   0v2zQ+DihIjvZ/N1yZRBhN7XFq6CRoQl0f/EtwCVDU4nxXebjt+rz5m+G
   g==;
X-CSE-ConnectionGUID: wQwZrux/RnennXuxMU5nHg==
X-CSE-MsgGUID: tHDHxS4sR4uzUmIVDD9UZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3102603"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3102603"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:48:08 -0800
X-CSE-ConnectionGUID: A1FqHYpUSP2J8df7wYzpOA==
X-CSE-MsgGUID: K14FceHRTxuTQwQ5RkmoLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8037181"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:48:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Chipang Kao <prozac2734@gmail.com>
Cc: W_Armin@gmx.de, chipang_kao@asus.com, corentin.chary@gmail.com, 
 denis.benato@linux.dev, hansg@kernel.org, linux-kernel@vger.kernel.org, 
 luke@ljones.dev, platform-driver-x86@vger.kernel.org, scardracs@disroot.org
In-Reply-To: <20261110065630.270276-1-chipang_kao@asus.com>
References: <20261110065630.270276-1-chipang_kao@asus.com>
Subject: Re: [PATCH v6] platform/asus: Move ASUS platform drivers out of
 drivers/platform/x86
Message-Id: <179432207917.2180.5316107179972885113.b4-ty@b4>
Date: Tue, 10 Nov 2026 16:47:59 +0200
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

On Tue, 10 Nov 2026 14:56:28 +0800, Chipang Kao wrote:

> ASUS WMI and related platform drivers currently reside under
> drivers/platform/x86/. However, with the emergence of ARM64 devices
> utilizing ACPI WMI interfaces, maintaining these drivers exclusively
> under x86 creates unnecessary architectural restrictions and Kconfig
> duplications.
> 
> To allow non-x86 architectures (such as ARM64) to select and build
> the applicable ASUS platform drivers:
> 1. Relocate all ASUS platform drivers and headers from
>    drivers/platform/x86/ to drivers/platform/asus/.
> 2. Create dedicated Kconfig and Makefile under drivers/platform/asus/.
> 3. Update drivers/platform/x86/Kconfig to remove duplicated entries.
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
[1/1] platform/asus: Move ASUS platform drivers out of drivers/platform/x86
      commit: 6e3b727ff3115a4f870bdcfafc3f6827c2d36676

--
 i.

