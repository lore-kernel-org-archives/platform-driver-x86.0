Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763DA3DCDBF;
	Mon, 31 Aug 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168879; cv=none; b=RpxZys+8uJLOHOFM2V8PHeJwKcfN77KOpG1lZxnLvD6c/9DH5wzn3vSCORAOwLKEu8uajg/ZK3CYZqnHrGEflv597bOkJ6dcEiz/AddJBs8C7jFsJ2YtbQ25qUyv+eH2bNVgf87yash5TU/ZmaUkI+rz5N1IBiV9e9WojHbYWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168879; c=relaxed/simple;
	bh=K2fUCUI1JMDgjHJb90cUQHLvm2qtMQEefTWvuIQbo6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qdh53vX+mwUgxW7F2x18FqUVPE9lOZ6yQZf4HWuWUoPH7Ee3EkiyReqwxcO0fUReBhE9oubzzELJAHw4cwdQ9IJ6qT1e5pRrgADoghKmKWLvQYXpsHjxKO1reT07oAJcawX4kWbTG+uB9oSWx7tG887UXkVJNe8UEOlKys2hBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M462SXzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M462SXzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8C41F00ADB;
	Mon, 31 Aug 2026 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788168878;
	bh=i/kLc3c8EC3Fk6N0sfT9/svpDb5RAuNLzWGjPNizq38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=M462SXzUVyREqyphJL3fhNqVK29WgCN+83bukYxjxOxFcdy5f4pfWQikq1DTXY7JS
	 K3bguPhjNQQa2xX/eZD+btJw5+fnJB/l1n8bt7l1nFdjshEbxYNl6OcLm2xrY1VV72
	 NWqj6P3uhGtDttpS9hgZkg/ug3/S+48jCHddI1tQXk8ojwksndrOq23Go9zutLqbJc
	 a+xo5UIogjBbVoB+WeKNYXXHdeMFhvnTmBI/XLMcX0jabo2w68oVApU4Dr2KT5Dfhz
	 /dymRHAH3nvOHQlGFBZp0lcE6KqyrH0DnCvmR7adEGvjwJ3oThyhRqzHlsGAc5XYDD
	 up3isTSsaalLA==
Message-ID: <df2f3cb1-1bab-432f-a359-59e6bec9580a@kernel.org>
Date: Mon, 31 Aug 2026 11:34:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: int3472: support the POWER1 GPIO type
To: Jakob Berg Jespersen <dev@berg.pm>, Sergey Lebedev <lsa.uz@pm.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830134126.70277-1-lsa.uz@pm.me>
 <xwSI6AZy8i6fOp48SxKkCmFiG2NNdkRtidVqaIi0VsczFe_1Kh9UUuamWCuaSrVXpxPO4YdGgNfeWxbpuFns_VUTQfUCEfCTFTD1ARbH9mw=@berg.pm>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <xwSI6AZy8i6fOp48SxKkCmFiG2NNdkRtidVqaIi0VsczFe_1Kh9UUuamWCuaSrVXpxPO4YdGgNfeWxbpuFns_VUTQfUCEfCTFTD1ARbH9mw=@berg.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Aug-26 11:21 AM, Jakob Berg Jespersen wrote:
> Hi Sergey, thank you for testing it on your SP11
> 
> Does any of the maintainers want me to send out a v4 of this patch where I include a commit message with this limitation related to ov13858? 

No there is no need for a v4, the ov13858 problem is not a problem
with the INT3472 driver, but rather with the ov13858 driver.

Regards,

Hans


