Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F66281724
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166174; cv=none; b=dRFxg2hwQNWP7BJgZYOI3LBqRY0nr+w5voym0s9f7YCPPwjKb7G4Esl7NMxz7Q+WgP6K5AuJPe07KhzumM55bdXS44Br4X9llBm9rUiUCwJOKxxs+0oPiZMPPDgpPVMRJCbZzj78wUkYguVDJFQoIszq62UjORI/TsQTAFNvG9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166174; c=relaxed/simple;
	bh=Ti41zF+THtwv0JgUjuQNie+gLsggjY+88BQZXaD0uww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSZf4ogzP9psYJY/4scoJE2WuzU1u2vwK+z3nhDBzE21z6WkGc6GvJWwhDzlY/Iudjde9SNSSN2Q4Mh8HuCJeFIBlmR3cFF82eIfDgMohyD5IuMqmuwW9kjpmEwYX12UfeIhZDoJdwahaocAtGXmBCqUsJYt0cpRp0uyOpUgg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H90HUVDn; arc=none smtp.client-ip=91.218.175.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H90HUVDn"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ti41zF+THtwv0JgUjuQNie+gLsggjY+88BQZXaD0uww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790166170; v=1; x=1790770970;
 b=H90HUVDn/dGEscIWdxdtaPdTO3CMeI48oKVVPxNyH1Gn4vD4QlKBqfrfsb+eTfR+36i4G887
 Ka2wuMC2OAOwZAMn8ybR+2/zwkbvY9BMX0rkK/QeQZKmOnNBa26C45dImaJLNHhisykXytlYkOx
 jGgciibdDUgvAN3kpnLlsZYY=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4504f534dee3e307;
	Wed, 23 Sep 2026 12:22:49 +0000
X-Mizu-Trace-ID: 4504f534dee3e307
X-Migadu-Flow: FLOW_OUT
Message-ID: <da2c36f3-cc44-445f-a2ed-b2019ccdeb36@linux.dev>
Date: Wed, 23 Sep 2026 14:22:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
To: chipang_kao <prozac2734@gmail.com>, W_Armin@gmx.de, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, scardracs@disroot.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202609221954.123456@gmx.de>
 <20260923082923.154732-1-chipang_kao@asus.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260923082923.154732-1-chipang_kao@asus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/23/26 10:29, chipang_kao wrote:
> Hi Armin, Hans, and all,
>
> Thank you for the feedback, Armin!
>
> I completely agree that separating WMI core infrastructure from WMI client
> drivers makes logical sense. The reason v3 relocated the drivers to
> drivers/platform/wmi/asus/ was based on Hans's earlier suggestion to use the
> WMI subsystem hierarchy. However, Armin's point about keeping client drivers in
> a brand-specific directory like drivers/platform/asus/ also provides a very
> clean, cross-architecture solution for all ASUS platform drivers.
>
> Regarding the background: yes, the RTX Spark is indeed our target platform.
> ASUS plans to provide user-space applications on Ubuntu to control platform
> features via the WMI interface. During our bring-up on ARM64, we found that no
> ASUS WMI modules were currently available for this architecture due to the
> existing x86 Kconfig restriction. This patch series aims to enable
> cross-architecture WMI support to address this gap.

So my intuition about RTX Spark having those was spot on...

Very good to know. Once those drivers are compiled for arm64
we should be able to reuse the whole asusctl software to get
the driver control every hardware that is there.

> I am happy to go with either path (wmi/asus/ vs. platform/asus/). Hans, Armin,
> what would be the preferred target directory before I prepare [PATCH v4]?
>
> Best regards,
> Chipang Kao

Thanks for taking care of this move: it was planned but with no
product in my hands I decided to postpone this.

Best regards,
Denis
