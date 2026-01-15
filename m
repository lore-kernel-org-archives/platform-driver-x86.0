Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8E9397AA0;
	Thu, 15 Jan 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487247; cv=none; b=kR9CsYI2wc5bKR07fdO7nouqFH9pZQMCcPLid9OGu+7ukEZ9yeXtCVIz9wxh2M8fAiL1/InqJX4XBQlcch2Qe3/oqzW+HUd00aKnrjh0HpLoUDDY5JZbFoezE1sKG0++kbouo9cE7hsgvnfE8sWW8fGINVf5YEaR5rS44qS93Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487247; c=relaxed/simple;
	bh=csA166JAfKeoOlw/5gqcwxRfmoPVIeFohKb4d3gSx9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EfJoVTDZljwzvhk6AMXuWhBwxHC1QX8JvPMXXKc2PLncAlI2554tdbgcrmOaVTYism8xCymZpm3UrGHEeOhJqAtWS6uqGcuI9PIOBjcx0yii08CHaAGz4ZvtmONYURHKkVTWd4tslKaQ5+SaNYwBvenG8KXE240YzNCgmLAYkJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcCBpt0P; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcCBpt0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768487246; x=1800023246;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=csA166JAfKeoOlw/5gqcwxRfmoPVIeFohKb4d3gSx9s=;
  b=EcCBpt0P10DwgKktsVu5EYePyCcLnbJDIUH2QW3lPHTpK7Avl8Rp90ac
   bRjXTwdiyAnpj/oNyfOtphxZrCdf25mDz2hFEGiSVOd0X7VYq2MTa58UU
   Mt+FAzVJHapqzA/tYWP4NI+c2frH+Em3SAZYZ0yJjG1frXaneya3uucYI
   4sWPZKfrbDEepHdVpo+OEMoNXdopRHF8GCFxaQO3WvKIsL6kmtPcCdxS5
   o485lolYzlAX7lbeh2tIV7Szus5WKm1wWqH0lgPsXrV7p+CKHw8cfG3Zr
   I7rD9IuGv5M1qg/rJAgNr0LD+XWks+IL/ZqQuiMeX+Mh4/BoNyKdK7cwe
   Q==;
X-CSE-ConnectionGUID: yYKwGp9CQgWvdWi96hImeA==
X-CSE-MsgGUID: IN8JIpVLTo2/UcK+p5htUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69000367"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69000367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:27:26 -0800
X-CSE-ConnectionGUID: HPqSGBTrTQqJP2K/zrdqFQ==
X-CSE-MsgGUID: 2qdpLfZfQPW6hZSzqpN74w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205025126"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:27:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shresth Sarthak Awasthi <bengdeeba@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260109130557.78720-1-bengdeeba@gmail.com>
References: <20260109055026.18593-1-bengdeeba@gmail.com>
 <20260109130557.78720-1-bengdeeba@gmail.com>
Subject: Re: [PATCH v2] platform/x86: asus-armoury: Add power limits for
 Asus G513QY
Message-Id: <176848723835.21830.13084303688434788887.b4-ty@linux.intel.com>
Date: Thu, 15 Jan 2026 16:27:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 09 Jan 2026 18:35:57 +0530, Shresth Sarthak Awasthi wrote:

> Add the DMI entry and power limits for the Asus ROG Strix G15
> Advantage Edition (G513QY). This laptop requires manual fan curves
> and specific APU/Platform PPT limits.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: Add power limits for Asus G513QY
      commit: 2e91919a67953609d34786807697410a6ffb760e

--
 i.

