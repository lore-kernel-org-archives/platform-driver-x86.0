Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CE43785F;
	Tue,  7 Jul 2026 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444155; cv=none; b=XfGqKHrBcBfEnedPQMjLkc5mbhuidEvelAJzsEqCj6ZW+MdPRild8rUrlKonB2hDcUFA/7E0z2HfRQN78HpQF1oCWFwZV6N7sxz9QNNs7MBeeaeSCRq1jY5JUtHOWpgBFsbOaizbK4y0O9/yhFl0UVvXe+5DPkZue8qrcLpsxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444155; c=relaxed/simple;
	bh=V2gL/m1I06ALyk1UzapJ8MVCChywNsmlt30dYoDBfzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bggEPEyChaVsugbnH6fj5X7PvQ4M1nHL4757shkKcqLRcPKqtWjEQ6b0os8p86gZgG0cODalDJoXOIaIVlCs8v70lukQcN4LUaZ7fh1Foq8MPBk7z2Kec1cj+Xy8xG6e3UIITi4Rpr6y9Llde4WIAomX3xm0+ZGy1uBsOAZECCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHb8WtAe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHb8WtAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783444155; x=1814980155;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=V2gL/m1I06ALyk1UzapJ8MVCChywNsmlt30dYoDBfzU=;
  b=OHb8WtAeTbXpv2nSaY1ll/AM5kIkeivG04wx3TrGVolz1zQ8ikbMWHNO
   759Rt9pHhXbJwpDrVeXhMo938jZ7Bgam+usIY1ZiExhsUOvyJpHP4Pcqy
   gqh/hIwsPROJFMdsP6KdBhTsRu6ouBYX/rT+0CsZ7Q5EWf+/DZIIyTRGR
   RNMpXHT9NEy1e8UiTCJUFYokhtG2hQPrS3YcXZb55s7LMhkrAof+6OovS
   ZlwrrPUtQTn7D7im203hrPIgKdhCbHUskgSCBCo7mi0iNFC5P40NwgHUZ
   o6pjbNej1PMna9TfAkd/92TrDp7NUvy9CU4hMQ+fXynYhKgBrMSmBk61s
   w==;
X-CSE-ConnectionGUID: W8vuAGhiTrGvxBtXLavN6g==
X-CSE-MsgGUID: lLBJH2hdR7mudMxm+inRIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95251533"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95251533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:09:15 -0700
X-CSE-ConnectionGUID: UfKYDiWKTOqOENLNMxl5ow==
X-CSE-MsgGUID: PaDp5Ki8TviD5PocRBz59g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252967313"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:09:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: denis.benato@linux.dev, 
 =?utf-8?q?Fl=C3=A1vio_Barroso_Neves?= <flaviobn@gmail.com>
Cc: corentin.chary@gmail.com, hansg@kernel.org, luke@ljones.dev, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260705195126.17120-1-flaviobn@gmail.com>
References: <20260705195126.17120-1-flaviobn@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for HN7306EA
 and HN7306EAC
Message-Id: <178344413965.17784.1546722127410980980.b4-ty@b4>
Date: Tue, 07 Jul 2026 20:08:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Sun, 05 Jul 2026 16:51:26 -0300, Flávio Barroso Neves wrote:

> Add TDP data for laptop models HN7306EA and HN7306EAC.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: asus-armoury: add support for HN7306EA and HN7306EAC
      commit: da57187dbbd5f491d825d91f5a22376eedd31510

--
 i.

