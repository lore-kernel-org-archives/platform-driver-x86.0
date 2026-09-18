Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D111551E434;
	Fri, 18 Sep 2026 18:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755981; cv=none; b=PMkJG3u/baoQ7p/UWmbh2Licq0/bNPztSODnYQjGaSSfZI7emolRYpNPa05Z8YYrNX054JjuYzsDGCQCoQ+ipoB+TQ9FbvZ/aCT6bw7GnBOOrLOyvwwoT/nQhN7stP8+P+BnYo4bOQxdBHoCScifysJ1mq/Gf94U7jKMbMhYzac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755981; c=relaxed/simple;
	bh=SqZW5hd6WWWsmmbDcmmblBl3JDvxU6S1r8OMtP5fQX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WhQAPB7mdVpBo+v+nVmjoyfJEz46dh60NXbhhgUGOBJyniL1hfuYarfu8Wd400190DjTla2Cmnp7Z4XzcILl+Eycmpi2BJaVxd6UODLY/a8APg7E6oUcsA8H7g31NGs+mbFXGaTFNE8+Uq5q96sxM2mqVP1f1blc+7Vdt6phDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBdmNCdr; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBdmNCdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755980; x=1821291980;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=SqZW5hd6WWWsmmbDcmmblBl3JDvxU6S1r8OMtP5fQX0=;
  b=dBdmNCdrdtKpF4xunQXmDyDfbrAKsyFZdTcFGPvFmzXLknKsRKRoOY1U
   KuuHhBFjpf7TGWhVxcL/1TzSxs/bl2Vh7+4EJxM/YKpZezjDCNJqKS++J
   Ln6CO+9vw5jl20LEcz87VS5px3xPQEtIl3ATjyn0c/Om/f+fCapu9D44k
   pvEL3yRtMEZ2O2UXYzPQ3NHicHk06LItWD+gWeLpO+j1IysqA0FDr9iTK
   YEtXh/p50BvGUMAdfjSAaUYZUhyoBI2HAZGNAnthvPmWvLVqqdbSCm6Z7
   G2aV7yqOhbpD5iVNnwY5q6LCwdKQTx+qktO/svqL7QzGJEhuHHjrm8z0K
   w==;
X-CSE-ConnectionGUID: ruxkYTGNRMKNIt29kROnfA==
X-CSE-MsgGUID: MLNkyRxXTWCuG4EHFqhq4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="791905"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="791905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:12 -0700
X-CSE-ConnectionGUID: RpmAJ20QSCGeJrR20eW1bQ==
X-CSE-MsgGUID: 5rmpGmrEQ5aTOLjoDh8XqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="299625773"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: krishna.chomal108@gmail.com, ShaunV334 <shaunvarghese43@gmail.com>
Cc: hansg@kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260906130114.139261-1-shaunvarghese43@gmail.com>
References: <20260906130114.139261-1-shaunvarghese43@gmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add Omen Transcend 14 8C58
 support
Message-Id: <178975596627.29716.16369572610260910575.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:26:06 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 06 Sep 2026 18:31:14 +0530, ShaunV334 wrote:

> Thanks for the information, I've currently added 8C58 to hp_wmi_feature_boards[]
> and removed it from omen_thermal_profile_boards[] as suggested. Manual PWM fan control
> is confirmed to be working but the GPU is still missing that additional +15w from 'Smart Performance Gain'.
> That will require further investigation.
> 
> Add the HP Omen Transcend 14 board name 8C58 to the hp_wmi feature
> board table using the existing omen_v1_legacy_board_params.
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
[1/1] platform/x86: hp-wmi: add Omen Transcend 14 8C58 support
      commit: 4dabecbb202e872dc8cd4c4b5ee7076b75e23162

--
 i.

