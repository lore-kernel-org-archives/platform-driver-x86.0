Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE947F9
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Jul 2025 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195279; cv=none; b=KvErI8qiVbCDgTnrKsmvmP5Qd2EPupmCuWMeNXNh0U62BDyXAKI/QRuR+p0So5dsvnXZQkDfYIJ5RSrkcXvD+hrQ+GO9oHPUhrz8SvoPg4OCjh2wAhOqNMsoWwvMwICInc0bv1wMCcnXKmBBXiBgY1PQ6ZEk18cuEXR3iu95QFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195279; c=relaxed/simple;
	bh=UAJXRsIT1NMWVzyL5ZFgrQgw59ln0KM5Bh3F6uWvybs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F+qoLz5NJLeeM0voKukQ7wKS2cLHfrAxz3Rx/iB7l/ClHbA6ItzI2AotAjY6Z181aS2X5oaWzz4YJJ+a3ycL3UyMQnGhNQCmZPwwMQn0g0x1Pl9gzLXyQ5thk4BO39WIjHlHzqSweg0WfN9kw2qYTtGBHzr0Cp4uJEQ/xCuDTuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSRDE4cI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSRDE4cI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753195278; x=1784731278;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=UAJXRsIT1NMWVzyL5ZFgrQgw59ln0KM5Bh3F6uWvybs=;
  b=aSRDE4cIVAe/Lu417iNXvTc1FkJSYkOORY1AkVKWj1Vcm0TWPkHMat4f
   4l6g04/we1eqNgvJhAgumFsy0WxQRJN/QBSrejZ+75mO4NDq9pgdhqJpH
   EozYFz74purulvVpQ3A14qXjqfMTJm3BBvYmYizTaGzKW+AVVXxVzEJ8r
   TB6HPSG3WqwKm7hRXKendES3GNbEcfkZSzIU3PbWy0AzN0oBJHre39qC3
   2Mohh36SZzTVO9PeWOg+EMygC+tLMdSEFsFSmJMc/Y1gnVtPqYnjG9OHX
   N5QZXmCGnq+/YH+zKNWQ8L7LyziF2S8xymw1NXH+3Bpwt1cKHVCmwsI9x
   w==;
X-CSE-ConnectionGUID: hDvOMRidRlOUxq0Mia3Qjg==
X-CSE-MsgGUID: m3sGyaglTgaYY6Ps9mEOWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55539208"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55539208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:41:14 -0700
X-CSE-ConnectionGUID: TJ54hqpPTSiOtRD/WpCEwA==
X-CSE-MsgGUID: V8DD5uNeQHqhFP5s+C26Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159476231"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.254])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:41:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Jelle van der Waa <jvanderwaa@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250702182844.107706-1-jvanderwaa@redhat.com>
References: <20250702182844.107706-1-jvanderwaa@redhat.com>
Subject: Re: [PATCH] platform/x86: samsung-laptop: Expose charge_types
Message-Id: <175319526764.17685.9702149024075712749.b4-ty@linux.intel.com>
Date: Tue, 22 Jul 2025 17:41:07 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 02 Jul 2025 20:28:43 +0200, Jelle van der Waa wrote:

> Support the newly introduced charge_types sysfs attribute as a
> replacement for the custom `battery_life_extender` attribute. Setting
> charge_types to `Long Life` enables battery life extending mode.
> 
> This change is similar to the recent Ideapad patch adding support for
> charge_types.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: samsung-laptop: Expose charge_types
      commit: de2884c6cdd3d133704ce37393590dd1c761500c

--
 i.

