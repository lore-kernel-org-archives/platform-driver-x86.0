Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EAE4078EC
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165915; cv=none; b=nA6V7/e0Aw3bk4GV62cmLwSJwOMP/yOrJpE2sYYMehYVsbUOAxQceNTxnfs86LVjdc9miCJPraqymu1lYHt0T3f9mhhaffizuHTpUqiVDZQdUL7QgblGCPUM3zEL+ZhX+uLEMekNTmV/zq/KNUWQY7Z56kyVCsA+SVq73w5IGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165915; c=relaxed/simple;
	bh=5DfvD/ddgKSBVUcqi43IiThh2zCFchOr2BTMLLFDh0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCwC+J7uFfvvgvvq5Yb+oxN7cuBmZtMYz0pIMh2dKYQgi2fJdgHsPL8TBo+0sOiiBB9fSzbmnjupS0F7qXS9NuDhjEblcXAA5Qzw18KSmlEZCJXuyZPODQrLgXeAnOfe3RReqp6O92KdHR/3uszXCYhuPkfRVifuRwMch6qXpzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oKcp6Xtw; arc=none smtp.client-ip=91.218.175.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oKcp6Xtw"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5DfvD/ddgKSBVUcqi43IiThh2zCFchOr2BTMLLFDh0k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790165911; v=1; x=1790770711;
 b=oKcp6XtwV7y1+KchUOmUu6x/hyiMYtfqW7qhKjo0zZicWgIZuKJz6VhBlswZqE5sS7KCg+XQ
 h8awAVS+IHPGdvhuwGIwpMEItO4e2rdbHQoiNmA4lM8GUVaxGNy7IbCqOX1GZNmUZ6GBWSz2vzI
 lCgLdCZUnlnMx3kX8QNiDfGI=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d7396f17ddaeb9a7;
	Wed, 23 Sep 2026 12:18:20 +0000
X-Mizu-Trace-ID: d7396f17ddaeb9a7
X-Migadu-Flow: FLOW_OUT
Message-ID: <7fd63887-9312-41ee-9956-65843eb3ca60@linux.dev>
Date: Wed, 23 Sep 2026 14:18:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
To: Hans de Goede <hansg@kernel.org>, chipang_kao <prozac2734@gmail.com>,
 W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, scardracs@disroot.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202609221954.123456@gmx.de>
 <20260923082923.154732-1-chipang_kao@asus.com>
 <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/23/26 10:42, Hans de Goede wrote:
> Hi,
>
> On 23-Sep-26 10:29, chipang_kao wrote:
>> Hi Armin, Hans, and all,
>>
>> Thank you for the feedback, Armin!
>>
>> I completely agree that separating WMI core infrastructure from WMI client
>> drivers makes logical sense. The reason v3 relocated the drivers to
>> drivers/platform/wmi/asus/ was based on Hans's earlier suggestion to use the
>> WMI subsystem hierarchy. However, Armin's point about keeping client drivers in
>> a brand-specific directory like drivers/platform/asus/ also provides a very
>> clean, cross-architecture solution for all ASUS platform drivers.
>>
>> Regarding the background: yes, the RTX Spark is indeed our target platform.
>> ASUS plans to provide user-space applications on Ubuntu to control platform
>> features via the WMI interface. During our bring-up on ARM64, we found that no
>> ASUS WMI modules were currently available for this architecture due to the
>> existing x86 Kconfig restriction. This patch series aims to enable
>> cross-architecture WMI support to address this gap.
>>
>> I am happy to go with either path (wmi/asus/ vs. platform/asus/). Hans, Armin,
>> what would be the preferred target directory before I prepare [PATCH v4]?
> If I understand things correctly then Armin prefers drivers/platform/asus
> that is completely fine with me, so lets go with drivers/platform/asus .

Hi Hans,

Yeah it's my understanding that drivers/platform/asus is the only path
that so far nobody has stated any reason to exclude so I agree on moving
asus-related stuff there.

> Having that will also be useful to share any platform specific drivers
> which directly use ACPI calls rather then WMI.
>
> E.g. I can see a drivers/platform/lenovo show up to use thinkpad_acpi
> on ThinkPad ARM64 laptops.
>
> Regards,
>
> Hans
>
>
>
Best regards,
Denis
