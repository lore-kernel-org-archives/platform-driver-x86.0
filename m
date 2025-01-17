Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36064194C96
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133177; cv=none; b=h2KimB4HumiVeQRznS6SlLLEG+0mJ7J23VjtBdIpFr+M5FvUfKsll+zRh32fPsSF41HIz6FGZxn0ABeGtn6FT+Zl2+fJcuUCrS52Ud7OiDIeGeoNoVcKTaiBuZsprJWSgi2qSM4jsCN7zlyAJ49S7JP5DOn7rr2myFMq23IT9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133177; c=relaxed/simple;
	bh=jN0oNaDN4I2EGgrm18BwM7p+YjzGzB+JvlGFD+0t4nY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=No/DlcyU650CQyyNSA8j6h5UuYZQudu0dOgmiiRyiEjoYMTVJcXsEO2fUrXxC6NdbEDF8rKugG1L2u9E43BufTyZ4Ryu02bkCbm3ts2rY28apyEHUXzOSDSBuMiePMs/aah0cZRORVfmfNQeMOnIJsaPUeYwmNSxUDMh3mfjXAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LH0pwU0o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LH0pwU0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737133176; x=1768669176;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jN0oNaDN4I2EGgrm18BwM7p+YjzGzB+JvlGFD+0t4nY=;
  b=LH0pwU0ol4hFj1oIQa6MDFKgFe92aU2JuljAkyv7SN9UNTWK4kkLYKh/
   u+hTPo1dAIVT8SlTFyVsDjARTmRlQvKGVwYemWl4HN3mpxXZkPdHvbZq0
   BL4qi4rvWH6dtifWsW2Ir9paQW3gekv2+qzgKzYYO/BoQIfhctpyZ0rbN
   6QSWUERANlLY59GvMMjTCi1QwV84TuLA65/s6NUoUOxZuktngokkJE3I5
   x89986EwFZzpHxXLmt3lDhMkj1WPTgqzRzBIcQinFaH6p7PsduZdqhtWM
   7b7ZvnigLmISwTKzZu25o48F4KHW/SeWv3w8pyDvOpjmCxUi/yyq6a651
   Q==;
X-CSE-ConnectionGUID: rayXoeiKT/q388wPGSD2hQ==
X-CSE-MsgGUID: Gy7cFTvPQaSrm9VCKGh9Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37807970"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37807970"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:59:36 -0800
X-CSE-ConnectionGUID: kj7W6EFNRLmCENRiV8MO4A==
X-CSE-MsgGUID: zU1g87FUR7uxwaPSI5Embg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105900533"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.76])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:59:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Julien ROBIN <julien.robin28@free.fr>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <1c00f906-8500-41d5-be80-f9092b6a49f1@free.fr>
References: <1c00f906-8500-41d5-be80-f9092b6a49f1@free.fr>
Subject: Re: [PATCH v5] platform/x86: hp-wmi: Add fan and thermal profile
 support for Victus 16-s1000
Message-Id: <173713316775.8353.4944797350274549745.b4-ty@linux.intel.com>
Date: Fri, 17 Jan 2025 18:59:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 16 Jan 2025 23:20:23 +0100, Julien ROBIN wrote:

> The following patch adds support for HP Victus 16-s1000 laptop series,
> by adding and fixing the following functionalities, which can be
> accessed through hwmon and platform_profile sysfs:
> 
>  - Functional measured fan speed reading
>  - Ability to enable and disable maximum fan speed
>  - Platform profiles full setting ability for CPU and GPU
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add fan and thermal profile support for Victus 16-s1000
      commit: dd47fd79b14695d43862f46b19655fcf2a7b4653

--
 i.

