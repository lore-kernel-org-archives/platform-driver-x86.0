Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA3F4A5EA5;
	Mon, 12 Oct 2026 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820557; cv=none; b=fDNRXC6PxE0nPJM2K8zNqu0zw5gQkMEs8IzEtly9AThM4xyZ+bTVoNs5meXBelyqvcOM5jggeiUQX5bs9XYfriiTxZdO7vybiqT2Z1pftwFr9QmwN2DytsjArEAVZM2eb12cwZFHzaVXkZlAXYroM9SCovE2LMu+zVHtrqtHmKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820557; c=relaxed/simple;
	bh=4FmKRksIO7Bny3rPzmqieKmk9ZT0xdfNxBEHw2BnAxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dOBwjacIGfLtqcL6/UDUAQSzVlVb2m4wUW+sFC4V7OwLpNuyTLjzDFSW4oi4J2Uj44SoCY2vzwj1odRn4WtPZhwd0evI2v967e8SJyueSxoPKmJOscnLACACxnM2Cu/w2B3LzVFUgCGVDCw+gjt+P0Y/G9zTvoF5/0PuzmAZZT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrRsszOk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrRsszOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820556; x=1823356556;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4FmKRksIO7Bny3rPzmqieKmk9ZT0xdfNxBEHw2BnAxc=;
  b=UrRsszOk9rNtXndkm/zxajuRXkRRbUtyF4OQwexjfp8HajpjaIgmPf1Q
   PEAcFaAoUy1lo01KZynIbhSU94N1CsNagQXlruNZgEdlRFhev3axejrNc
   eBhTucQ8uEeARM6ABoaRXwyViImm37iE88OwHZzcozIWxUJQP4hLNzbU6
   kZ2xeTq82kXA4tWoaI9OXfTH9dJcCYaET2PO0c+mZMQ/P9s4GM5xXwjuL
   y0HVbxF++8FMYQNvdmTwLIpHpSRRQXMffI3CG6nXjxRqELYCaBhEVqSrX
   ElnkJ7NWRqIvZcsLyxOf16Ux9Dk1kQa7XuBfuKJP5RaBCfglafMb5Qoyr
   g==;
X-CSE-ConnectionGUID: A+m60B2MQi2Zhje0yGNNzg==
X-CSE-MsgGUID: UDGRwmlxTVe3rI7AB0/utw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="417117"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="417117"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:56 -0700
X-CSE-ConnectionGUID: 6nyPggpLSYymnaC9VpvNTQ==
X-CSE-MsgGUID: TK4xHRppRUeHGNLCQgARow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="908837"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001-qcom-hamoa-ec-suspend-irq-v2-1-ec71a7cdec79@oss.qualcomm.com>
References: <20261001-qcom-hamoa-ec-suspend-irq-v2-1-ec71a7cdec79@oss.qualcomm.com>
Subject: Re: [PATCH v2] platform: arm64: qcom-hamoa-ec: Disable the SCI IRQ
 during suspend
Message-Id: <179182054705.17897.3149043112275162830.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:55:47 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 01 Oct 2026 10:46:36 +0300, Abel Vesa wrote:

> EC SCI events require I2C transfers to retrieve the event information.
> During system resume, an SCI interrupt can be delivered before the I2C
> controller is ready to handle transfers, resulting in failed event reads:
> 
>   geni_i2c a84000.i2c: error turning SE resources:-13
>   qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
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
[1/1] platform: arm64: qcom-hamoa-ec: Disable the SCI IRQ during suspend
      commit: 16624ca212e67afd0bffe983d5e9600e87e321bc

--
 i.

