Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9134EEF3;
	Fri, 16 Oct 2026 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160580; cv=none; b=u4uyQ30nOBPHavPgBk1wofV/37HqekTD5zlWsGMv56vTVqsj+mYPRcZO2ku7RvMmftQNoyioSydvTT2UET3Axa1Rbd9jyNmnMXHIZebrk+zxFrI9o28uyDuD+UOids13szLdMPlKjlPpYgpZ+R92hYd+PlitqpwvPfcNWgu5WfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160580; c=relaxed/simple;
	bh=VhvipMwOktUEFYTtD9KhXWIyIw3NRLywmjGrTsI3GlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOJdy6ts/4Z292crp8iiwnPPIRHAXioqnNP0GUrdTYRCJxUsCFASpjRbtDzuBWbJldmPG/cuSUj7RpkVv84ZfBjnQFipwQ54lN8i5LL9cUX0z0cMA5fK9aKKEixX5J/KH0QiBxD6in3MEDcdJLGE6eA9csmzZLqo75H+c/zJvr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBr3//Jn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBr3//Jn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1603C1F000C4;
	Fri, 16 Oct 2026 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792160578;
	bh=xYXMeTvJum9DO2mB8W+/wDLyjzAKgnkoocasVvXxkJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PBr3//Jn/1vXn98kdoPExm3YSZrEhRMac0TFqgVHY9fnt5RAh7w9yjPDFQQLiwAKE
	 vJWlXL2QjJNcY1DCPS5fHCVxVRCsFxR7vefbuD9rjS5MyjLC0V7xV9SbtB/EUQogyP
	 sQvLrHuZN6ykJJKrRrfhnh3TX/RsdOIiBtAZO88BqBY/hQEvdrUZ0jFoOuDe0VSd1Y
	 2OM528eIMCl7LT372jdRsZNqK7Ln5sk39nsg7155g5nVtSpiK++o8Q0nuC7AYcL/+S
	 cnLhSyEpCYgltnraDsJ4GunGM6pw21ED2G8JzChn8cIFsrJOM89fy+U6f3HncJD+4K
	 tu4aiiTei2VTw==
Message-ID: <df3724fb-1ad6-403c-bea0-19856b11635f@kernel.org>
Date: Fri, 16 Oct 2026 16:22:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for
 DSM method
To: Sergey Lebedev <lsa.uz@pm.me>, Hao Yao <hao.yao@intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016112744.39905-1-lsa.uz@pm.me>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261016112744.39905-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Oct-26 13:28, Sergey Lebedev wrote:
> Hi Hao,
> 
> This fixes a camera on the Surface Pro 11 with Intel (Lunar Lake), for
> your v2:
> https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/
> 
> Its infrared sensor, an ST VD55G0 (SMO55F0), has 24 MHz in its SSDB,
> and INT3472 turns its clock on through the _DSM with 1, 19.2 MHz. The
> sensor driver sets the sensor up for 24 MHz, so everything the sensor
> derives runs at four fifths: it streamed at 47.31 fps where its
> configuration gives 59.14, which also puts its MIPI output at 633.6
> Mbps, below the sensor's minimum of 750. With your v2 on media next and
> my vd55g0 driver, the sensor runs at 59.14 fps in every mode, as computed.
> A value of 0 did not change the clock here either, as you saw on the
> oscilloscope.
> 
> Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel), VD55G0
> 
> Would you send a v3 with the Fixes tag and the note on 0 and 2 that Ilpo
> asked for? I will repeat the Tested-by on it. If you are busy, I can
> resend it with your authorship.

Note that from now on int3472 patches are routed through the media-committers
tree since these are related to camera support:

https://gitlab.freedesktop.org/linux-media/media-committers/-/commits/next/drivers/platform/x86/intel/int3472?ref_type=heads

If you send a new version please base it on top of media-committers/next .

Regards,

Hans


