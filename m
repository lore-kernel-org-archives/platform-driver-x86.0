Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415434BEE24;
	Fri, 11 Sep 2026 23:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168997; cv=none; b=QznEgbRJmBaw+1iadlMQtYV387Y/ldoSONPPcZmsbyhGQ5QDUw8yZbuDrT96y1rF6oJCXphPZ1i+2FbkFPf399bRN84O6lNWD4GmOhiBkcOfOvmtGtdvkV4a5O7Xt6eXywJSUD/Sjx+7Km+67je1SUsrkn3odBOIyCfnXwIr404=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168997; c=relaxed/simple;
	bh=vsjP5gKd2GVlUULorp2p2+XVkzlPdtC54ZyU8AMSgLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqWAdHo6pVMwRj4wnqrPIQKE2CH98SyE1myMiUM7eFTMY3PO3c0WDYHKCipEM1SOnSDy9XrVkD4BYh1ls7LOEmiOYayldVlq0UqzczpwNawKiDlRBM2MiLmn8qiZp8zIeweN+ux3WYy92UXjZt+xpcoJlNngmpv+mMcJkb2mMX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=PoeVC/gL; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="PoeVC/gL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789168601;
	bh=vsjP5gKd2GVlUULorp2p2+XVkzlPdtC54ZyU8AMSgLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PoeVC/gLGBebObQvAbqRpSY0Yg2dxa+2vsD9s/jpOVVp1+S9UCYuAII2D0LIrMB6r
	 RMwT9s5nBkjlMNTV3iIe25weiHNtE6PZ6lgqP8oEeXM2zFFgmW0bbpqKNefEQc4O5D
	 M74d6zREeFOq0g4yJVUmy0DOPHD7pfBdF9yAnVSfdEfrO2oIj2EE/71YU7ADZ3sjV/
	 gETZf+4H9WnQdmX5d2KLer7IcDpBKgbRTciol+QRAo+9+PQgWRLNmIqjt+i3VUQcnk
	 ZNJV7E6+eORSqqAkXyqBcn5ZxiVJA9z6wceZq+bdUN3oPpbjI/7yiZp6T/LYla0NHG
	 Q5uxNIYRuKYyg==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 899F920A07;
	Fri, 11 Sep 2026 23:16:41 +0000 (UTC)
Message-ID: <35a47b6a-e3db-442d-916c-e8d279df3605@petermarshall.ca>
Date: Fri, 11 Sep 2026 23:16:40 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: i2c: st-vd55g: Add generic driver and VD55G0
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20260902204549.657228-1-pm@petermarshall.ca>
 <20260902204549.657228-6-pm@petermarshall.ca>
 <20260903-gainful-mellow-mantis-f436cf@quoll>
Content-Language: en-US
From: Peter Marshall <pm@petermarshall.ca>
In-Reply-To: <20260903-gainful-mellow-mantis-f436cf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 1:41 PM, Krzysztof Kozlowski wrote:
> Isn't vd55g_parse_dt() printing errors already? How many times same error
> should be printed?

The original driver already prints duplicate errors in many places, even 
before my refactoring. The next version of this series will clean that 
up. Many error messages can be replaced with a dev_dbg call, and return 
codes can be reported from the probe and PM handlers instead of helper 
functions.


Peter Marshall

