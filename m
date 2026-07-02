Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A48434EF1F;
	Thu,  2 Jul 2026 17:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012920; cv=none; b=aT9d6CCg6cKLp35/rmUWJPh6RoiPJjmBPl5UJTxFUch7qBnovoe8xJF8mV/5g9IBw1lHHJCjGNbSxWXnv87sFtZpbuI9e1yGIvV3HUByH+vVPkZqEf13UYV7n+pqR4Rwyv9JlfPE0FGwSaI3HwLIrSElHcVyR1pwVDgGS2AEsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012920; c=relaxed/simple;
	bh=JiG/7WnzksALKFdtTKUMDGf+siLDsuy/lY2N5HZra5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPO650drVZC5BzDwinxD8lPtlfDsWCt6dKtlbxkg2WP1YVrGNVyBxOdbdL0H3N+bMKpfS7Q5rBlE+idnqrIzqkBZOTrNzsSoqZScFxyNzzDz/xeT/yPDcmv9STQPdCBiSHgzcszvc+YlbaiXZG+NAExc7/iQyU8vqJeoek76nDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=okG8AzUk; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="okG8AzUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783012911; x=1783617711; i=w_armin@gmx.de;
	bh=tNqG7P43GYfuMVI1qQ229EM8hZWtH16XQHjoMhueD/s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=okG8AzUkqLR7ZJFHcXCpQMdOGREpQ1jVGxbg9QxAhpm4Ltl+ypTh5rXZfGfHedsZ
	 fE+/EgdBLRzJ0QRoI+9bVgX3lKDziLq9PK/jZY7eDmTYRZsTi/oHFjRhoQEOCE3su
	 TAzPh0plWPdaaB0Q4RUa1D6N0MWkbSkl7Jm4O1O9zZUqyIroBgJXLEGfuJ9sdTUtP
	 w+n3fmdMt8P6yH5kQIUQzXf+EQipCKaESxjEMQuKnPz23G7kf7svhs+r3CGIb66Ec
	 Ky75aI6A5ptnBBtJ8N7NaMWeLA4X0niAptVmPBnUiLhTzpC/+rSK6jAPea8F2Cq57
	 ZI4uVDZ3TyM3Nl152A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1xDZWt46Mv-00kgZB; Thu, 02
 Jul 2026 19:21:51 +0200
Message-ID: <a7bab7fb-f536-4a70-b8d4-0d3dc9695e93@gmx.de>
Date: Thu, 2 Jul 2026 19:21:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] platform/x86: uniwill-laptop: Support additional
 features
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 wse@tuxedocomputers.com
References: <20260530170813.10166-1-W_Armin@gmx.de>
 <178290541404.22449.8889275439954671744.b4-ty@b4>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <178290541404.22449.8889275439954671744.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jgyNUsT7a7n2ZMojmy/ej09Ww6Kz972Nw+OkC+2sRBifmg677jD
 +F6Pub7hVzUoUIkcPWNgiC2Pf3k9+abhyxDW4lZ0h3NDlKaT2FsqjtWdCOMBVTCEakYUTPk
 SVm/s5qzi1kNT0j2IeIsKja0B5f2hR9dLtGLxoFTyaaYABPZVDuesbfSm7VLj71lZPmoxgM
 MKfBElufaZWBgeoar4PvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vYgNzknnNbM=;h7RxZEeEphT2uOtJ2+iPCWYVlMF
 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

Am 01.07.26 um 13:30 schrieb Ilpo J=C3=A4rvinen:

> On Sat, 30 May 2026 19:08:06 +0200, Armin Wolf wrote:
>
>> This patch series adds support for various new features to the
>> uniwill-laptop driver. The first patch adds support for the keyboard
>> backlight available on some models, while the next three patches
>> add support for additional WMI events, USB powershare and AC auto
>> boot. The last four patches finally add support for additional devices.
>>
>> The patch series depends on commit b1a9b7a904af ("leds: Introduce the m=
ulti_max_intensity sysfs attribute")
>> currently sitting inside the for-leds-next branch of the LED subsystem
>> tree. Without said commit the first patch will apply but not build.
>>
>> [...]
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent or clearly a regression fix.

Alright, thanks for the info.

Armin Wolf

>
> The list of commits applied:
> [1/7] platform/x86: uniwill-laptop: Add keyboard backlight support
>        commit: 2d79283eec8dbdca246ca22154d84cebcb2780c4
> [2/7] platform/x86: uniwill-laptop: Handle screen-related events
>        commit: c7f3d21c8f50d64202e191f0ced40190ca1f45f7
> [3/7] platform/x86: uniwill-laptop: Add AC auto boot support
>        commit: e8a41051b95bc8a2dfda3a32b23528d098a7e907
> [4/7] platform/x86: uniwill-laptop: Add support for USB powershare
>        commit: 58d88f08ab1ff8da359b78e3421566669f0d1dcd
> [5/7] platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 Pr=
o
>        commit: c1c6633e3f1f9e38b5b9a26137f87a997445d306
> [6/7] platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NAL
>        commit: 62f334005d59723bcef864b82e95f6da6bbca41d
> [7/7] platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B
>        commit: e451ae739a2c6fa4e9cc1be44678f6ff9223430d
>
> --
>   i.
>
>
