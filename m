Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C85525A357;
	Fri,  8 May 2026 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264128; cv=none; b=RG38ZeOyqwzrXZRFP0x7ID2MmPgsQtEYXXmIO/gVybWaLtSJ05YLy0gTPRGuXf85XNkbKnnt7e6DzyoTqrHNmx9ik+Hhc20jgpTOPkILxu0juwumr3A1tvrPbj/7l8AZ8pGupwQ0VDjRyuG71EsUpV+5dQi8J8q0JRsbsyFJY9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264128; c=relaxed/simple;
	bh=G3gqAq6R7a95IU956OKhxdq4TOJe3TdTwd59qtf359o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BeSGz+aNkOuKw9KG79KKhOfrQVgIDO42vCblVLWUK5mQsIn9On++S2v7Y329xmEn9vGxv+1jht/9V/C0WFnxX+xBfU9iloG6sx3FddR10s4lgfyp7koYxGRRRvhLGk9g/QjpitdV/Ar/pKoGGvH6JxHhisfSsdrmjtEWibvszC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mV86MDGW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mV86MDGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778264126; x=1809800126;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=G3gqAq6R7a95IU956OKhxdq4TOJe3TdTwd59qtf359o=;
  b=mV86MDGWBVCjpCXQ1LEAe588BFisfQe0SMswC1aT+xh7x+6yM1rL4Qx/
   AkwUE8nLcU5x9AB5+JiSI6Gr4ZIzvXYNsQebyNGvQqwR8ajYdWQ3980vF
   hffOxnaGkr7PlrYoGnshAxlQ+fOhYoEaI7EN/fRFKJl96RLtaXHOvRw1W
   OjelqRDqscHkOqSMjoZc/61Z2hjH94vh44c6C7mJvo8hrem18b5CEXSeQ
   c1R4z9ac4rhxmqEUqJlZKch32mqgptBy6PH5eXq0LGrInDUevUF2DgPCg
   oSZLdr0sHS+a4qoHK1CS+gATZFb8ikmgkKqGcUjczE30LefSU6EMK4Jvr
   w==;
X-CSE-ConnectionGUID: RHuGI4J5R+ydPZhXRMAARQ==
X-CSE-MsgGUID: U7jrYhPxRCWKHdy4ml05Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="96665824"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="96665824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:15:26 -0700
X-CSE-ConnectionGUID: +/InKxg2TUeD15S+4bOuTA==
X-CSE-MsgGUID: Kkg3Z9w4SliIhcjWB6DMtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="232320447"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:15:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260429-pcengines-apuv2-swnodes-v1-1-cd1a6fad856d@oss.qualcomm.com>
References: <20260429-pcengines-apuv2-swnodes-v1-1-cd1a6fad856d@oss.qualcomm.com>
Subject: Re: [PATCH] platform/x86: pcengines-apuv2: reduce indiraction in
 swnode assignment
Message-Id: <177826411784.8043.2027766157346539886.b4-ty@linux.intel.com>
Date: Fri, 08 May 2026 21:15:17 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 29 Apr 2026 11:46:01 +0200, Bartosz Golaszewski wrote:

> struct platform_device_info now has the 'swnode' field allowing passing
> software nodes directly to platform_device_register_full() without going
> through software_node_fwnode(). It supports both registered and
> unregistered software nodes. Use it to drop one layer of indirection.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: pcengines-apuv2: reduce indiraction in swnode assignment
      commit: fa84425e53c43c8a17ac2af2c8f99202f4e1ee7e

--
 i.

