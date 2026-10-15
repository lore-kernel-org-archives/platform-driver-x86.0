Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C8538D62;
	Thu, 15 Oct 2026 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074551; cv=none; b=ou3r0RV7i0Mxw7btOuMq4gPIzu8JTZ6dW3URVvTC81Zgm4WMZkuZSDsxqBiGY/IkywSyUsVvXUVMlDladaadW55npz9/4IELJHHfwTg5dRyQL/kH65T6p0t2aXHn+bwgWsilr/V8HMfREjQ7U3v0xcjWE9w35i++v7st8LgPhjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074551; c=relaxed/simple;
	bh=X4HZNpiC/6Kt4jYx+IzwFRk5NN1a9lgqX748Ms15TSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ottgAiCNw/tjRM3I8supAvCU1SOPl4qI5EIqAO1v4moECiaCNsAj6fnLZW15kC/9LvWWMMAlwREWxjHf2xyECYLwNgSCYS2yqI0OqIl1uzm1HWB25uB8Fq3a6wOkIz5PdWW45l5VLZzyG5vvoYc5de83FFDO1HnBTZ7NA+bD1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lnjg5h/V; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lnjg5h/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074550; x=1823610550;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=X4HZNpiC/6Kt4jYx+IzwFRk5NN1a9lgqX748Ms15TSo=;
  b=Lnjg5h/VVepGbJJ2kfV2i2xWwRcSi1gUy451OWb9TsgVvHyZYGw1hNJf
   AXjAuQn6YRSqS2yPiX+sWl9wCvkOe5Rhjssuvf7Yg8d35SW71KcE8xCxc
   NNR89ziFxQRuqxb90iDzlQbMwzwdc/P4ZWz+h4Wb6UN7hGptHe+yBk3ax
   rwwD0KB0TDOegEkHsiP7qCeF47uKtre3QK3h2DjVFv3is/YpEX8rTECV+
   Tu8R3GkFmUu82HazSxMKeXRwnDvAcOien//8sf8XveVa/nqCvO1mLyTKg
   eE68aLMk4/LvMMWweDgDobR8E+j9v/+MWTogSsLQO4/QzjGY9OYCxxE2R
   Q==;
X-CSE-ConnectionGUID: 4Obj1+OrSeSOmFJoIHSePA==
X-CSE-MsgGUID: yBL1SVWIT6GltgHgL+JkdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="750440"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="750440"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:29:09 -0700
X-CSE-ConnectionGUID: nVBrKlhCTgC5q4N1IMdLQA==
X-CSE-MsgGUID: akihr3ANQrqNQX7N7P0Oew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3458010"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:29:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Alexey Subbota <subbota-job@yandex.ru>
Cc: teackot@gmail.com, hansg@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013212228.17349-1-subbota-job@yandex.ru>
References: <20261013212228.17349-1-subbota-job@yandex.ru>
Subject: Re: [PATCH] platform/x86: msi-ec: Add MSI Creator Z16 A11UE EC
 firmware
Message-Id: <179207454308.13793.15851583746732722491.b4-ty@b4>
Date: Thu, 15 Oct 2026 17:29:03 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 14 Oct 2026 02:22:28 +0500, Alexey Subbota wrote:

> Add EC firmware version 1571EMS1.106 (MSI Creator Z16 A11UE) to the
> list of firmwares handled by CONF14. The EC register layout matches
> CONF14 field for field (verified against the out-of-tree msi-ec
> configuration for this firmware, where it is part of CONF_G2_10).
> 
> Tested on a Creator Z16 A11UE with this driver built against
> 7.2.9: the module loads, charge_control_start_threshold and
> charge_control_end_threshold read the values set by the EC, and
> writing charge_control_end_threshold is applied and reads back.
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
[1/1] platform/x86: msi-ec: Add MSI Creator Z16 A11UE EC firmware
      commit: 68f1b80d34d3a3d47d4de704485c071a6c29d023

--
 i.

