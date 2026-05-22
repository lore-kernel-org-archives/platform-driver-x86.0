Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79237386C2A;
	Fri, 22 May 2026 22:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779487296; cv=none; b=d92qK7na35PnJW7UGVJUVnDCsLtxKqsCakZuC8H594bcANsVkjlqSy4o5gFoluyYhAjWTkE2flPoHA4e6Uur2Yq252TjLUfUVA+hbZRBg/SKo0ZrPwDQYBC8qZfnIadVMQy8Kbn3oNFudPry9GInTx+oWPF/AP7/a3hc6/Ca6w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779487296; c=relaxed/simple;
	bh=5BqJNE3ddIlUmjyec4TqYhPd6w8SPGE5i4RjqGT7fxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeGolEHLjEVek4CyOqVpeYMyq1gwWJGhFMwlWJD2GMzS28ySjyIb9Ht8nzCj7bUlaI+nYCVosooIGAypgtM4MkbN6oYQiCe4haqoDReXmIeO0UJst/VHuxEKK+ECbYdY/iAoD0jkOgE87Ljhc9z91a+B0/jnV9xZxqWUKnoeR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Bx3s31rn; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Bx3s31rn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779487292; x=1780092092; i=w_armin@gmx.de;
	bh=BwGJg7Is2L9gogstRh4UgEHNWTty68ySW4RTyy7OMcU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Bx3s31rno/ZQVdRMpeZuMR0oMoMpHGYUVtwY19qeubNZWipS+mWmg51HnPi7A867
	 TfLhIJISN4lAYeOXrMTrnWhWbC6jtyixSfjCwL3c2uYGOSPQVbhlydjiK7h8qsuLa
	 /K+Iaaqr1aEL49vwjDrgHYpHvEu0xVumX8iN/vHoODKE5UmWS1MiddHPUzohvPhSX
	 7ZwDo7eVDPeMYUXf//mwakCJXw5oGtYnLbeOlOat/z4oL1n+YobiJokDsDeLiQama
	 DIFfZPiTlIbXRFgR+9b7Hask2uMgOQGrc7UfmDAHtdQVkJv1uJAbHMqNvI3PM6OyG
	 OXx6tPPo0SmjQSYUdQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKy8-1wt7Qa2sZc-00VFu6; Sat, 23
 May 2026 00:01:32 +0200
Message-ID: <ef98a5f8-d62c-465c-9f15-5958cd92c49e@gmx.de>
Date: Sat, 23 May 2026 00:01:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] platform/x86: uniwill-laptop: Charging-related
 improvements
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512232145.329260-1-W_Armin@gmx.de>
 <177920193411.22546.9855747319755001624.b4-ty@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <177920193411.22546.9855747319755001624.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zrW8YlcO2URkuMyafNmYAaIsy+VzIj2t2c3tRFzkFh0oEPmLMnc
 yF9B3nmLuG6cwE89F5vW6HQ9PMY4/FUOJDltLjnNMTcecwbJcMFvDnB/+UajErNLFNrCJtk
 OUsJkclte5fE6LmxtS/wD5pYi/DGt1vODFR5QhY+CCF4WUwLvHUObuCTRtIa1JYCX1wig1v
 uGkxgBbVXYYVWuYGvudng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WVQ/cGQcL5o=;WJ11mJ7lI7tNeN71QPHI4UWnTpU
 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

Am 19.05.26 um 16:45 schrieb Ilpo J=C3=A4rvinen:

> On Wed, 13 May 2026 01:21:37 +0200, Armin Wolf wrote:
>
>> This patch series contains various charging-related improvements
>> for the uniwill-laptop driver. The first two patches fix some minor
>> issues inside the charging threshold code, while the third patch
>> fixes an issue inside the module initialization code. The next two
>> patches contain some preparations for the main patch. Said patch
>> introduces support for controlling the charging modes available
>> on many Uniwill-based devices not sold by Intel. The last patch
>> whitelists most Tuxedo devices for using the battery charge modes.
>>
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-fixes branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> local branch there, which might take a while.

Thank you :)

Is there a special reason why only the first four commits are actually ava=
ilable
on the fixes branch?

Thanks,
Armin Wolf

>
> The list of commits applied:
> [1/8] platform/x86: uniwill-laptop: Properly initialize charging thresho=
ld
>        commit: c12cc42dadd85dea210d5699d4f21def827382eb
> [2/8] platform/x86: uniwill-laptop: Accept charging threshold of 0
>        commit: c16a4823cc60a32b891f7a148bb30c0f51d12cf4
> [3/8] platform/x86: uniwill-laptop: Fix behavior of "force" module param
>        commit: fb4b67c44557cb4cbb15900083d4e1af22320339
> [4/8] platform/x86: uniwill-laptop: Do not enable the charging limit eve=
n when forced
>        commit: 26cbe119f99c86dcb4a0136d2bc73c0c716d80e4
> [5/8] platform/x86: uniwill-laptop: Rework FN lock/super key suspend han=
dling
>        (no commit info)
> [6/8] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
>        (no commit info)
> [7/8] platform/x86: uniwill-laptop: Add support for battery charge modes
>        (no commit info)
> [8/8] platform/x86: uniwill-laptop: Enable battery charge modes on suppo=
rted devices
>        (no commit info)
>
> --
>   i.
>
>
