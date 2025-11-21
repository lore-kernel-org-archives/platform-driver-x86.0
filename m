Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20148302CA3
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 19:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763755052; cv=none; b=X2X8a/CmrNvjOjoeGSN0J1UrIj3NH1f8mcSTIIqSRtixIukrp/oMfVOqf0NPmniK4p8/hjV530k+YLsKEDB7ge7YlHnDibjbWk0o4LAgq4KaJQvaZEJXYt8hRT+htwrS+zZu4qBrryWpNRHMUom+h+CyaKUp+0zFkv7jHfCrLXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763755052; c=relaxed/simple;
	bh=e8tctn4zkJ+m0SQTrbFMdiJTjjKoFp8A2HYqKhq5Ozs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxKhZUEZQn28gLcXLickwHDX3fUkvaP2OdABl7okc5q2Ll1O2yjAUEm7aoqO0UcP/BKhWI3esphoL7A7QG4yN06S5ojEg/vgAoODu2CVv2Z1buUUr+SML6UN8SYgTNL89ycQ8zbaOgBocAAbYh93czPGdxT1zB8YMegumEHxo6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ns7THtcE; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ns7THtcE"
Message-ID: <5e21efe3-ea43-4d9c-9c22-dfe7a4a9f2aa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763755047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JA+p/N4W80RLBPHxcdcYqM8FLIR0gOCVnsPh8u6mwj0=;
	b=ns7THtcE259h6HAYkvD0+g2CwXwsx0xNjX5xUtHfdjYCkZfzQqGyX87HwVFXZEwy0v1Ey/
	1FRbxDG07VV0XWWN4RSKrZHCJdN+vArh50kWe5hAUuYYuvyo9bt4+uauNtnMFqVmnadumG
	8a+s3LV16vnodz3ab/8cPzyMxed8m5Q=
Date: Fri, 21 Nov 2025 20:57:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-armoury: fix mini-led mode show
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com,
 Denis Benato <benato.denis96@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20251120024059.1341326-1-denis.benato@linux.dev>
 <cb77645a-8779-6a91-4fc0-4c4871c643f3@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <cb77645a-8779-6a91-4fc0-4c4871c643f3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 11/21/25 16:28, Ilpo Järvinen wrote:
> On Thu, 20 Nov 2025, Denis Benato wrote:
>
>> Perform the actual check of the mini-led mode against supported modes and do not return the first one regardless of the WMI devstate.
> I've taken this patch but I had to reformat the changelog. Preferrably use 
> up to 72 character long lines in the changelog (though I might not nitpick 
> from anything up to 75).
>
Thank you and sorry for the trouble, I'll try to keep that in mind and
commit from an editor that shows the border line :D

