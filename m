Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287BA3CBE80
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 20:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785617099; cv=none; b=HPODfSx0sdCT4k4ye7v9VdLeq6mkbzrGGchUzyedZ/omMjy64KBMVeZsQYZkN3lMBc6Lp6KGT6kRHss6gtXjAYCxSkjEIgp74ljcVOhGj2FoKrg7n/koYJGp2KR/kV5O4tRAciK/UvlY+xOcrzp/WRfAsEAB7pvq9dTlRdO6td4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785617099; c=relaxed/simple;
	bh=P4y9J+sUNAmNIjGFhiH3BIuAfHWdRFlr93Hb+AgtBNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOi62sDoomX9bV8SGXuyGj96ahyfXkEBSkdMy5Su6/e0HcB33UWYymhnr8jKH4K5wX7RQsarx5obLx/enqtS0lBuMRxDy0Z6/WVBjMB3XI+z1ydJ1smqXjykvhju0V7f1hzUX1vnXX7tB6zydc2U7S4+B2f4FDM4jdlvumJKjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=THTxR4qH; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="THTxR4qH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785617094; x=1786221894; i=w_armin@gmx.de;
	bh=P4y9J+sUNAmNIjGFhiH3BIuAfHWdRFlr93Hb+AgtBNU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=THTxR4qHgOU6WFoLPpv1NnsbH6vATOG9UpVZIG5X6+zwY6FCXlHieW0mUMfNYFXK
	 W0Atnhu9mzMT5iXWB8PB8kUWJYcmQ5eOa2oTH6mOoVSdFIjhCchYAvYbRfu8iyuAS
	 Wbfzx+YtabDvNMTtt9VLIFAQju0pdHbNoELRIOjiCAvRcUB4wyAuUmmswrQQJDP1K
	 Gn/omI0zFvdiXIFm0te9MUvQX7PeObmX8fpNfSKS26o9YGLJC1jPRZ/NdhDETJapg
	 0qlS0Yq6uR+adSf/jlCPN+P6APNGOMFsNhXDt34v0rkUv37FJo5RtXBLA0UvO8IFd
	 GrByd3kSGPZ2APHC9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE6L-1wW7810S7f-00SlJV; Sat, 01
 Aug 2026 22:44:54 +0200
Message-ID: <885672f8-d47c-4453-9ef6-41884c1093ca@gmx.de>
Date: Sat, 1 Aug 2026 22:44:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the
 modern API
To: yahia ahmed <yahia.a.abdrabou@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <6284ec25-cdf8-4e40-9a5e-0906d4ed1222@gmx.de>
 <20260801160959.20382-1-yahia.a.abdrabou@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260801160959.20382-1-yahia.a.abdrabou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:2UVu9HJ+eESIEquUw+LylxP/4ztIDd52QrB0sUX5lfHnr8/wVn+
 QgNujYGHt5IF6EosYkZLjj2NQvwsjSz7idwdnzMol1TFiIxW7HWu6CQezOzJPQLUC4Umxuk
 V8PSPPljRHWRgvZlgyrtwa6/j1o6s8cF+/fxgRRcBZ0B7qEWikPGm9hbr8C5VprgwAG5Ee1
 2Nv8aC9EDf1qkSmUjYJTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TVzbAdX+Nlc=;lV166PXwr6fOErER91nZTeL6bhG
 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

Am 01.08.26 um 18:09 schrieb yahia ahmed:

> Hi,
>
> I think that the component framework will be better though I dont have
> all the hardware to test stuff like legacy RFKill, I agree for now we
> should remove usage of wmi_install_notify_handler() though I will await
> ilpo's response maybe he has another idea.
>
> Best regards,
> yahia

Alight, keep in mind that the hp-wmi and hp-wmi-sensors driver seem to use the
same WMI event GUID (95F24279-4D7B-4334-9387-ACCDC67EF61C) for handling events,
so you have to move both of them away from wmi_install_notify_handler().

For this i suggest that you introduce a separate WMI driver for the event GUID,
where both drivers can register notifiers to receive the ACPI object payload
of the WMI event (see drivers/platform/x86/uniwill/uniwill-wmi.c for inspiration).
In this case i would ignore the fact that the ACPI object-based WMI event callback
is deprecated, so you do not have to rework the whole event handling in both drivers.

Thanks,
Armin Wolf

