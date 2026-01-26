Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D413A244
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Jan 2026 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439433; cv=none; b=TsNZbF1v/Qdv0hboA/w9fQE7SQVTBgKFgEAR3Lhf8KG9aeVydzkWLhCW7ojbU5nh/k6x03KZzoK90qW/TLfxFy/eMYBlPP0UhsXpu/0Bhf7kEUc8jEwCjKxPrVqsMn2nR6rEzR0NXNjEZLzBdgZvSV/qOc9s2KD0Phsvm/5OQvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439433; c=relaxed/simple;
	bh=Vd5otWQ1OI8+d4T7GNbLlkkknVwWy39Fy71Zs+azQPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Czkw/WL1KgdUQjclblOeGpXwY9S8wcOvns/TT3o9hrdJ5MpSGO6u+fALL4UHn2jZXl9MQVO7dzDXqV5mIycxCmmxnbThdDl2xuvZgKgl+Z45RBbr2KTnoNlTaQDjVlSrpJ8Gv7WrAUa4YXihfGbAodNaw2x5a/bc19uORlG+3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxcKQ9bN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxcKQ9bN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769439432; x=1800975432;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Vd5otWQ1OI8+d4T7GNbLlkkknVwWy39Fy71Zs+azQPY=;
  b=QxcKQ9bN5uZNMpQ3caCUcnLfbQta18JzFEY3opcYHaX28kg+Njag94Lh
   +xHqApqT+FJ/duY4CQ0iRNMopNGTtRiK5Y/g1Nlcs4iXcSMPmevzVbReK
   D2Tq7erRGRcF9hcta4rUA9czHaWi55sR6vrFWDtOaI9CBQyBTgzDjPmwp
   vX9Qs8OyT/pRRNKefTyBUvobJqw7X2GbbdQxHUtqpqbWJIT4j/rSQaUg1
   7YUsSwb3+am7qkILRZMRv4gg44qAY6ozhyaWtf58CpaDudLDrZ5rfJTwY
   J4czRezTsZpjMglNMI1dp597o67X2Xc+Hj/E21Si+FcTc716cOdblhsZb
   Q==;
X-CSE-ConnectionGUID: npH5xSDlTCewgya9hpwlUw==
X-CSE-MsgGUID: SrImnKnyQZyMdSD76tfpZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70584671"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70584671"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:57:11 -0800
X-CSE-ConnectionGUID: 69HkbxhuR4O4s4yZCtWx+A==
X-CSE-MsgGUID: f5ReoojQS9ODtqSY8A40ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212166379"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:57:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: david.e.box@linux.intel.com, hansg@kernel.org, 
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20251224061144.3925519-1-kaushlendra.kumar@intel.com>
References: <20251224061144.3925519-1-kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] platform/x86: intel_telemetry: Fix PSS event register
 mask
Message-Id: <176943942450.16098.18073684713041084.b4-ty@linux.intel.com>
Date: Mon, 26 Jan 2026 16:57:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 24 Dec 2025 11:41:44 +0530, Kaushlendra Kumar wrote:

> The PSS telemetry info parsing incorrectly applies
> TELEM_INFO_SRAMEVTS_MASK when extracting event register
> count from firmware response. This reads bits 15-8 instead
> of the correct bits 7-0, causing misdetection of hardware
> capabilities.
> 
> The IOSS path correctly uses TELEM_INFO_NENABLES_MASK for
> register count. Apply the same mask to PSS parsing for
> consistency.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel_telemetry: Fix PSS event register mask
      commit: 39e9c376ac42705af4ed4ae39eec028e8bced9b4

--
 i.

