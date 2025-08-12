Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFFC1DD9AD
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Aug 2025 12:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001728; cv=none; b=YYDMVGukjJONnQ1hdGb78c0XrCn93trDQ3Klz6ABW3zsXT6sx3t9CujaTw8MSQxU/2E3ytPaz82diIXLWMkHcaoCoeiFUMsRdr/ZqvJW7n7AMBPJtPdpZEp5wMwEke5+dpVREJ1vOFDVfSqp4Qm2AID54kOiBPbOZwudLy7bd+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001728; c=relaxed/simple;
	bh=gZ6nfGiRT0oHktq1ZFz/+OvM2kIyqlu+iflpAVWmkIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FxIZYuQCs61y9erd2pNKb5m7QiurX2bgSiLNTekSQ1IW7i1pwiO/GXUW4UT/sfNQSngjDNm6xZyBR4kJboc+87faqE/vVD3bsFNOIUQob8UNL5JnMNB1VXZ4tVJ4bngDAY/kaRYtzRxYFB3TbeCe5OdsXa8nJW2h8UgiwaPjQ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=et3KeKZm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="et3KeKZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755001727; x=1786537727;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gZ6nfGiRT0oHktq1ZFz/+OvM2kIyqlu+iflpAVWmkIw=;
  b=et3KeKZmDZrrhmY3/yAwVI9FPWvkJ8Ku9zwIC/nQ/4jTw+JndIjoAY4d
   riOCpD8FqHZqvwrVurxKYSh59c9NxBvchFNMqPjTtjVgu8SKFEOa7cG71
   k4lEqmWmLIuggq2F9+la1Ceyr8aIRYVLO2ER1cbUJBDHTrdpRkQpCwOsA
   DMmwMN+rySdjphkIIOBrzVS9vkTpFL793KUYzoDbRGCoGuxfQRZmKmZKp
   gaLZ3PvZXkNgnieY1Gs5g0fuq5qCZyIH2+1mLMwwdkjWj2ecs4jYrqb8e
   esdyC/7yHW+AfqcnjI0AOzdAArPQp8HP6R4nY+F9sj5RFFrNIQQzWT/iu
   Q==;
X-CSE-ConnectionGUID: 53n0BPQ7RQCHcnp9g+yTag==
X-CSE-MsgGUID: GMMH2A/6Q+O5z8zQWGszVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68648805"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68648805"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 05:28:47 -0700
X-CSE-ConnectionGUID: mvES1GPGRxuPYfi60SsCRw==
X-CSE-MsgGUID: /HE6E/33QwSlwRd0cz206Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166472006"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 05:28:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, hansg@kernel.org, 
 Mario Limonciello <superm1@kernel.org>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250724185156.1827592-1-superm1@kernel.org>
References: <20250724185156.1827592-1-superm1@kernel.org>
Subject: Re: [PATCH] platform/x86/amd: pmc: Drop SMU F/W match for Cezanne
Message-Id: <175500172041.2252.4566199095807504643.b4-ty@linux.intel.com>
Date: Tue, 12 Aug 2025 15:28:40 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 24 Jul 2025 13:51:08 -0500, Mario Limonciello wrote:

> Chris reported that even on a BIOS that has a new enough SMU F/W
> version there is still a spurious IRQ1.  Although the solution was
> added to SMU F/W 64.66.0 it turns out there needs to be a matching
> SBIOS change to activate it.  Thus Linux shouldn't be avoiding the
> IRQ1 workaround on newer SMU F/W because there is no indication the
> BIOS change is in place.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd: pmc: Drop SMU F/W match for Cezanne
      commit: 5b9e07551faa7bb2f26cb039cc6e8d00bc4d0831

--
 i.

