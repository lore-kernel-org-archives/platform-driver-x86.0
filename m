Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4058D531B01;
	Thu, 15 Oct 2026 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074521; cv=none; b=pqxXfhh4PytylphietG+DMJWQAM/1MImu6x9SyDw66EV66U4qLl23j3cczxyFxEZGxFWX+qoUe9sMi5ORd52ASxm2M0I5584cycDCBReIm+Itop0Zet3LLIHvfQq+UdgdU1pWReBgEDQFmFRlXdB6bQpttU3DD/Sy6EF67Xp7Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074521; c=relaxed/simple;
	bh=j/jbYAs5tD3HK37L89Fufo/qeFxxEKCG9o1b/8mIHvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Npu7YTV4NAkypHGRa0vn0U2ghgpEt+/tK6ciMkRF1x4n9f/fDsLNO8g3vhN0WZnhkOIK5b9w7oFbEc1RlxkvI6kpQqOhnckamdWBXaSAWhhjfAmqAJR7TWZu+SHx+f9ATDPOfU4uCW5iPM5Vn2iQnOP8szq9tPKzcs8hjywEl7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6cd+pk7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6cd+pk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074520; x=1823610520;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=j/jbYAs5tD3HK37L89Fufo/qeFxxEKCG9o1b/8mIHvw=;
  b=U6cd+pk79xvd8ZIkAa6+eTHhmDYGdgBWZcOQAy3eX3nkYxMOyhXfmmp4
   Ivbn2JjI48W24xCe0L8s3PtO5h6IUCdqoSfSS3x8COgXTcBGll8UG4Jne
   0tdI9TVHOBlEYe/5ZOuk9+Z5fSd1CxTtx8g1EMXqCfE5hwdqBJa607Iqy
   Grju2kwz0uP0qFllOGEqkJrkxsgIWJgV/obdkK1FVJULVdq4/skVVh5We
   yFHZeYSP4EbCo7sfpSpb8pKQdJTjcgEgnQPWOgEFmaKgx1VYKveWNmK2R
   MQh8uV8D6L8yDvHwrAv0r24JGr9Q93GAOwxlAF0KxhmwkR6sBg1rSYW3p
   A==;
X-CSE-ConnectionGUID: hydGVg+OR0u7ZyZCd9Czkg==
X-CSE-MsgGUID: 5E+m5OFCSNep3p/x618DwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="732071"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="732071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:35 -0700
X-CSE-ConnectionGUID: 8DOHapCLRomW6llBped0fg==
X-CSE-MsgGUID: LBKVZ8oSSgSr4XnN4Fne3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1955281"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
Message-Id: <179207449898.13793.6897763208667873901.b4-ty@b4>
Date: Thu, 15 Oct 2026 17:28:18 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 06 Oct 2026 02:50:26 -0700, Gopikrishna Garmidi wrote:

> This series adds initial support for the Microsoft Surface Laptop 13.8"
> 8th Edition. It's built on Mahua, the 12-core variant of Glymur with
> cluster2 fused off.
> 
> As on the Surface Laptop 7, the keyboard, fan and platform profile are
> handled by the Surface Aggregator Module over UART. The rest of the
> board is close to the Qualcomm reference design.
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
[1/5] dt-bindings: arm: qcom: Document Microsoft Surface Laptop 8th Edition
      (no commit info)
[2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
      (no commit info)
[3/5] platform/surface: aggregator_registry: Add Surface Laptop 8th Edition
      commit: e93536b1fcf775356b06ddc845461e64d4c87313
[4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
      (no commit info)
[5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
      (no commit info)

--
 i.

