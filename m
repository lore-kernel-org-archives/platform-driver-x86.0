Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33EA3F5BFA;
	Tue, 21 Jul 2026 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654188; cv=none; b=jtYKJJl+Km01GzQ6jhw08SSr42Ca3ur3lCCJ0stRdaOXf/0Jt0m5vH94nmZHP898BP3WPfSOp9pYIN+paPgtde8RUvhrkI6hA1nt5TqnPmLqG9X6quZ0trM+no4SNGAnVLzBKOhJLYuN5mnTKDe7+gQeGBkcKw5jxh02WfeC+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654188; c=relaxed/simple;
	bh=7OG4eiyYiOW7jcisRVQpfDjOgB/gDPFf+3/9/JPGbuQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TpFymJWtnAT4zRQ/i6O8bWFSeO0YeykUfiVzJQng2LuGW1PFPvL1+x8Q9c7Q2gSdN/N+558bu8Dmh41Jni6pX0JYDtvWQ7fKCvPEpPGTdEAWWt8sHvAkBlyFClF8kxaEiZqX0YCUmTEDgNEhYlrcHJx1qxZN4f1M8X4LQQd6rAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghwudd/b; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghwudd/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784654187; x=1816190187;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7OG4eiyYiOW7jcisRVQpfDjOgB/gDPFf+3/9/JPGbuQ=;
  b=ghwudd/bf86PwqfVqhsLLWv5zLwcPk+b0YLfldbtkYybMRMQ7V/sbb6n
   M48p7bkG5TCaeV0Lntetqpp/S3JSDq0zLnpX8OgxwwyvUo3pxAni+mLoC
   YXkLHkRgm/bUH5tF88ZhQv9QPy0adl8M68em3kukZO5a18zWjAyufANga
   KDcCZb3DstpIqk5KUvcGjR4fg/Dq8stLz7xahRqj5oldRBZOThaNf46v5
   AlMIONx3plwf1WoQh+jECpq4wVmUNuR45WNYD7w6DpcujAcXiYklkTOhg
   TwlaP6TpP5Pvt1MYETnjxb+F7++p0nv3NY6CoKJkk8odhP4bfm45hZ+mw
   A==;
X-CSE-ConnectionGUID: SnZe+pxXRQKG+QndZtXT0Q==
X-CSE-MsgGUID: DHHXMkmQQMqemLd0kexbLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95627069"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="95627069"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:16:26 -0700
X-CSE-ConnectionGUID: xm/qljS8QsGwPj8uDNh0Pg==
X-CSE-MsgGUID: ASDaJ8TiTKK8WTA6uWb5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="256606101"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:16:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jlee@suse.com, Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: W_Armin@gmx.de, hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260701164208.8998-1-alhouseenyousef@gmail.com>
References: <20260701164208.8998-1-alhouseenyousef@gmail.com>
Subject: Re: [PATCH v3] platform/x86: acer-wmi: reject missing gaming WMI
 results
Message-Id: <178465417941.18499.4679594645233563662.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:16:19 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 01 Jul 2026 18:42:04 +0200, Yousef Alhouseen wrote:

> WMI_gaming_execute_u32_u64() returns success when firmware supplies
> no output object, leaving the caller output untouched. Gaming getters
> then inspect an uninitialized result value.
> 
> When the caller requests an output value, return -ENOMSG if firmware
> supplies no object. Preserve a NULL output pointer as the supported way
> for callers to ignore the result.
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
[1/1] platform/x86: acer-wmi: reject missing gaming WMI results
      commit: caf8342512c3056005f475d350eeca089c3c6623

--
 i.

