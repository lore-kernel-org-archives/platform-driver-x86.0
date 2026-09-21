Received: from mta1.migadu.com (out-219.mta1.migadu.com [95.215.58.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290674746AA
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 23:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790034160; cv=none; b=HQ9QaSwGRJfexin4NqRQDJe5UyXC/iSXyxqXmbSBHuHj6XAFJh8wRUAqB35ii7A5NWl77YPAbM42I5jZZnS+AWuYA6mOknKH1wvMpGgntFDHl6G3ecHze7F+JiTYnnODebi6YonKcxivAAxr9ocNtTPF2GEq3nkGxd+G6UUouTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790034160; c=relaxed/simple;
	bh=NQ4zaW3EQ32kB15faya+m5wrlhqjxE3niV6UUfWKTLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZo4A3I9d6gZHFf5TFwKz45HvxgLcPZ3aQYW3/opxMQAp34EPCtqz6ckMvb7R6pWERlskmi9ntI25qNvP3YTd2UxMs1JIQ6yBIuIHiR2NlK7UTZ3Pao1OczBXYClOiHTwByKyF3HHJtbjLxa7PgyAAYUP/6nk0JnT+P2+fv3H6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uYqBv+B6; arc=none smtp.client-ip=95.215.58.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uYqBv+B6"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NQ4zaW3EQ32kB15faya+m5wrlhqjxE3niV6UUfWKTLw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790034156; v=1; x=1790638956;
 b=uYqBv+B6a01XMLmRrMgMmF0yhsTs4DjAA4saVcrq1HCO6O5mnpbPTJ3sT1tHnG63jLA8hhAM
 QGSZf8G+J23Aaptxt4yj9vyza3NOsMBdJMve8uDqtWZkoXZD719pG1CvcxG7tlPvyYD3p3fjnzf
 9CYQs968ZLxr5K4PvhaMfsK4=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id acd5a16f20b0505a;
	Mon, 21 Sep 2026 23:42:35 +0000
X-Mizu-Trace-ID: acd5a16f20b0505a
X-Migadu-Flow: FLOW_OUT
Message-ID: <81bc2dc5-1f24-48a6-b45c-4813ee9eb314@linux.dev>
Date: Tue, 22 Sep 2026 01:42:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
To: Chipang_Kao <prozac2734@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: corentin.chary@gmail.com, luke@ljones.dev, jprvita@gmail.com,
 scardracs@disroot.org, bryan.odonoghue@linaro.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ee3735b5-6f56-4b88-a582-5bb0aaf3eda8@kernel.org>
 <20260921144307.467-1-prozac2734@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260921144307.467-1-prozac2734@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/21/26 16:43, Chipang_Kao wrote:
>> Thank you for your answers and this all sounds good to me.
>> Based on this I've no objections against this series.
>> Regards,
>
> Hi Hans,
>
> Please ignore this v2 patch. Only asus-armoury.c, asus-wmi.c, and asus-nb-wmi.c are 
> WMI-based drivers. I will move only the pure WMI-based drivers into wmi/asus folder, 
> and follow up with [PATCH v3] shortly.
Hi Chinpang!

You may be be interested in reading this: https://lore.kernel.org/all/0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev/ as there have been quite a few proposals to reorganize ASUS drivers, especially after the addition of the latest asus-armoury.

For me doesn't make much difference where files are (the priority is compiling wmi components on ARM because I suspect newer zenbooks have that) but I haven't seen Ilpo expressing himself yet about this.

I remain waiting for proposals.

Thank you very much,
Denis Benato

>
> Best regards,
> Chipang Kao
