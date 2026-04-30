Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD1428824;
	Thu, 30 Apr 2026 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557266; cv=none; b=T1M62VO4qXaw1Lk3yFNqgIF0AX8L83i2GK3sCkZsl+aCJzYIx0iTUPEeW3sov7Sjw4fzFoiwEbXQ2LCyRBXQyWPuKJ/pm3yv6xGVfWUc1K9lRqwb0WXUE++rW8fimr0QLl9eqmWg25GvCPzrMVL9spFBq6GTZAOqNaqMfUWhgBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557266; c=relaxed/simple;
	bh=Fb/HrM9JJYascfJFfzzSVUNls8tunBvJ5cbR224BuAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UqPF5oZJHYVUg3UAJgg3XSSqA9gwgkeHnX1OfrAe8mlyFDAKspOPRSQDJwYcvMXei8Fy+EIjrbZ45DBHXNNmQRFRMwpTBeWZ0+zHtw+hw3SjOqZ8ubUIxM+dJy9AikYAgLpVD29mx0p1MQFVSXO8V/VG/Uk6oOhkoDly/pMX9NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxaxvQhD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxaxvQhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777557265; x=1809093265;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Fb/HrM9JJYascfJFfzzSVUNls8tunBvJ5cbR224BuAs=;
  b=SxaxvQhD7iFJqulX0lTNvHjwkHCGIX4xXuUGNEU34dLqvGdq9pN48bTz
   Gb7U5+Ua53sNtf2JzqT9G6m8Zp2463o828M3f8k7vrX1PtkFVNC6C+Xzy
   xXqZsRtEdzcGVLEZ+c5ef3nWEGt3Rl2brWJ00T8kFrBMOxGXBeYGwUBNv
   Ml54s0+fwcz3puoua2M55W9dRqF2BG2hExMNGJeZNnSBbeDyvFZBlkmK9
   NEhYq+sW3nViFvo8Uy7k0GZoo2xpK4jJwpZo2SB6IrMEdVCP6ZNWt9Dfo
   onEolu4a3ojLqzqVTfWb3Eu2FOGgoYI1FTZ8uorT6R1PxxUaNqZgwVbRx
   g==;
X-CSE-ConnectionGUID: 0f/CWDlQTmyg5XXV648kCA==
X-CSE-MsgGUID: DAwvzfdXTSikP9K4d4srFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89103259"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89103259"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:54:24 -0700
X-CSE-ConnectionGUID: nQj1Hm/iSaeONdk+AWXHCg==
X-CSE-MsgGUID: Dbs8szL6TSaBzCvt9JRlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233746570"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:54:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Y <hectare.plains1h@icloud.com>
In-Reply-To: <20260429180953.129885-1-krishna.chomal108@gmail.com>
References: <20260429180953.129885-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: silence unknown board warning
 for 8D41
Message-Id: <177755725623.2048.5432486595239890431.b4-ty@linux.intel.com>
Date: Thu, 30 Apr 2026 16:54:16 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 29 Apr 2026 23:39:53 +0530, Krishna Chomal wrote:

> The HP Omen Max 16-ah0xxx, DMI board ID 8D41 is currently marked with
> victus_s_thermal_params in the victus_s_thermal_profile_boards[] list.
> This disables thermal profile readback and adds a dmesg warning during
> driver init for "unknown board".
> 
> After testing we know that (similar to another HP Omen Max 16 device,
> board ID 8D87), the embedded controller on this board does not expose
> thermal profile which means we have to intentionally disable EC
> readback.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: silence unknown board warning for 8D41
      commit: c2d4b76458c9ebf81eae2916970320f1f61ad002

--
 i.

