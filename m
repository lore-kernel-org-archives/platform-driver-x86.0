Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D322B2D73BC;
	Wed, 26 Nov 2025 22:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197259; cv=none; b=Hc9jch3lskt2Z+9j3Ms91uMm16ZztZMVj5ebpH7pBEtcmHckdVXjbde7qxmN15FzgasKP9mNeizCuIB+zrRSwCYdxNI3+Bqd/BuXVUVYzLkxZqrTYr23EK42EALErNQ8GMNitK2KeEI5FmCUskA4MV4+b3UarOcv3HsomdrmLnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197259; c=relaxed/simple;
	bh=qbZ2SHAn0QyppmMpVNsWI6z+d2gzrL5mPBu9W5w8MA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pV55h5BeLUcbToJVvRPOIktXHN5UzESI0YMHjuEJxVaU/Kg8AqmaHb9cadY2ak+j2HKLBO5igMBGEv3cpdMfpmkMcHKbHkYoA9pGK8hA2QEbi9U9L2QD9lK2Tpco6TkfXl1qB4FYHdCuYESO34i/Lk7QWZvmE6ZqGP+DqGTUAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NcLvNFXm; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NcLvNFXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764197244; x=1764802044; i=w_armin@gmx.de;
	bh=qbZ2SHAn0QyppmMpVNsWI6z+d2gzrL5mPBu9W5w8MA0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NcLvNFXmw/WY2Rw/o9SMymYYCa0FBGfEVhM0soBJNio90a/bkLFfJ8r6Y8BLp6iI
	 372o5f8+Iipm9aGw5LmUFrw2otoMqjfGAVD52jxPfAUM/iwL42VHJ6Vt806wxlcyc
	 ZGznm3iAuM3iuFLKe9kZunPb/cmiESifmjV5ChW7YG7c8u99wPt3Wvz8qOuWWTtRw
	 MNLaecNJBh99idhsytS4lBYxGdw62lp6rEE5lAfp1u9gSCJ7dPQf1MCbmuuHZYRGR
	 X9HtE4ouxRWprSTWbsIpP94FcXCuckd3ArJaab8UVCMhSE/NzonEF49ZZr8HYaFef
	 QrZ1GZmla3JspGlNKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1wIz3G0h0c-013rEg; Wed, 26
 Nov 2025 23:47:24 +0100
Message-ID: <d7eb63da-72c1-4716-b26d-e64b42c63064@gmx.de>
Date: Wed, 26 Nov 2025 23:47:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/nls: Fix inconsistency between utf8_to_utf32() and
 utf32_to_utf8()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251126204355.337191-1-W_Armin@gmx.de>
 <aSdtinICsqilW22N@smile.fi.intel.com> <aSdtxhgmFsjqERvl@smile.fi.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <aSdtxhgmFsjqERvl@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:o1TQ4wOD9Cw/IU2XYQA42KZOtmtebPqndUAn/0fmGEIrn71MhJn
 9M3E6Zg+FfWWKmSBxicaH36Bdbps8fIlVnjUCZIiHoe3E580bSgh0kK/GM+RwV0Un8Lo5ra
 2Ahul48WGsikOR24kb6P8o39148S6iPOtjWx1VB+sY3syYZl7QXTCqZ098mMHAkiakoS1nU
 PQWURZ+L2VW9Quip/QUaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JyAzfXHCAlk=;vjJBC/UhbE2vAxLP6Es7blTjoSQ
 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
 Juu1/+XfzTw/d46nE=

Am 26.11.25 um 22:14 schrieb Andy Shevchenko:

> On Wed, Nov 26, 2025 at 11:13:50PM +0200, Andy Shevchenko wrote:
>> On Wed, Nov 26, 2025 at 09:43:55PM +0100, Armin Wolf wrote:
>>> After commit 25524b619029 ("fs/nls: Fix utf16 to utf8 conversion"),
>>> the return values of utf8_to_utf32() and utf32_to_utf8() are
>>> inconsistent when encountering an error: utf8_to_utf32() returns -1,
>>> while utf32_to_utf8() returns errno codes. Fix this inconsistency
>>> by modifying utf8_to_utf32() to return errno codes as well.
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>>
>> Thanks!
> Note, you might need a Fixes tag as the original one was marked as Fixes.
>
Alright, i will add it in the next patch revision.

Thanks,
Armin Wolf

