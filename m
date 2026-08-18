Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E03E2ABA;
	Tue, 18 Aug 2026 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052016; cv=none; b=Q8jEK7BqLoh/W3Ls/cWoYR2wRIEqU1iORnYwjDzUwI9H2wXsQ+A42yUsSem56sV0wV1F3H1Elbjz7IIVGOzdKorVgPioF1sv5Xb4g70yTZsytxSX6O18+dQqRGloKnn9NW4sU/XbkzGSgyhrWBL4AYM6p0oYLY35L+88M3ueKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052016; c=relaxed/simple;
	bh=zAsv0TF8ARMtA7qZt86H6H+J1X0i/sRVEG/AfeXD/ko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NSSXnE4WCXOPhNA3wutiQvpB3KfhbgY1hnuHUTCkK4STjLAfVbQ4KDPd/KdNmvZteX04ZHEoRk2DPqvbTknTe4fvf1m2dR4PlASJVab6EJfKxPXTQizGaGvEDB61l+V2l8awilarDRiBwAYEcrdF2VxSURVVE+rY/CPAj6T72aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCbZ7Wy3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCbZ7Wy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052014; x=1818588014;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=zAsv0TF8ARMtA7qZt86H6H+J1X0i/sRVEG/AfeXD/ko=;
  b=RCbZ7Wy3wxhU3ZkcmZvjXLhBvAmxyaDOPVHp0yWOe6BHExh3+loaXcaB
   N2DEbHBpxLZ8UFNsAnRYziDheiTVjA5SzOpb0a/Djgn3P1FtwWqd6+m2D
   ZH5ey9uDSbrATu8HsDdxFWmBLRfIqez/S/OQH9Uu+jm7faus5m6HWYm2d
   zBqy195WKFtQ+ZvMIJQtH0SKkUsMZmCdI/7boz8s/cDt/SEDRGK9SS9oe
   u849wBi86IiJwXAb/MuMSJ7pS3ptPW7vNgNsQ8oXQWGkAl/tj25cAcYxY
   nbJ6N1DBSpqJ2fUDziSbbC0fZJ5ipaT1dYdJnGMpzayJF/Iky9pp1tjah
   A==;
X-CSE-ConnectionGUID: YZrLJfd8SCWZntptRG6YNw==
X-CSE-MsgGUID: lqQmkjRJQrKvRJXdLgV7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75071414"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75071414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:14 -0700
X-CSE-ConnectionGUID: 1vyvk9H8TEaFu+3ErrfvEg==
X-CSE-MsgGUID: 2zlshcsMT8i4caC7bIw2eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="303423621"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Suryansh Singh <technosfan14@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260817121233.44636-1-technosfan14@gmail.com>
References: <20260817121233.44636-1-technosfan14@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8BAA thermal
 profile support
Message-Id: <178705200736.11998.7849772756911563694.b4-ty@b4>
Date: Tue, 18 Aug 2026 14:20:07 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 17 Aug 2026 17:42:33 +0530, Suryansh Singh wrote:

> The HP OMEN 16-wf0xxx (board ID: 8BAA) has the same WMI interface
> as other OMEN boards and is compatible with the existing
> omen_v1_board_params.
> 
> Add the DMI board name to hp_wmi_feature_boards[] table
> and map it to omen_v1_board_params.
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
[1/1] platform/x86: hp-wmi: Add OMEN board 8BAA thermal profile support
      commit: 7a3db155e06275e0d302a243420739abe1f71b45

--
 i.

