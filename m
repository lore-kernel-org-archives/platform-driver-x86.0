Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E585C1F94F;
	Sat, 10 Oct 2026 01:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595339; cv=none; b=oQSPOTGl1LYlkjk2krSNozUZtFQtQ5jC9F7wwBjZlODoz0WGUQxUJvu/7Ee3UH90yY+8LBuelAdpHuU814N6YeBneic2eNg39t9W+Nsszn67/o+LXjOM3PbVpzsl3SYm2ziHDkFn+Qt/QgW+5td3HQw27m5CSyoSJIATCjM+qoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595339; c=relaxed/simple;
	bh=tgY2nWLiDwBcHBuuvq1BOi2kZ1mqeXtC/8Z0F629hMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jEc/gV8A8l71xAELzDNyncOg2yem1LS0s42eOUWMIf0rccGMRQtNOo3e6EAwdDaxl/8VhTmTvXMniYPTpW4iJOy4mHrUueGGr1oNuKdfhjCiy9NR6CP7bxzXWQWygpSTQyPe7R0JN2gplsfmA2U+9sccG1kBVfg7bf7XeJ7kH1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UiVixOSt; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UiVixOSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791595328; x=1792200128; i=w_armin@gmx.de;
	bh=NjPFDaS2NFkJWVTfWVOECit0aMZi5hRDg2LpE320MD4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UiVixOStJONn6ApGqParF9567fdB5DEq6f2/Dj5Pj1D3m34OZqsCbDPtynZhF+I9
	 jGiZfXJcbzlT3dUVLfoCApEv8QHhPS/JY65dqG4GsdBD5fdZl8TwDb9tegpkXkP26
	 RFODgPv8gt84ahH3SGbSoc6luzgACDlmTAfN206z2+TKC7eBowVWRaD05EIbZcBtU
	 N6S/py6XWTnU+C4ZNo5xT/yb7KXxZExeoQj0Du+xy9aRjQbdTVtdQb7jxcn8m3c+i
	 T7WraQIHgFBQekfOn+gjcsC6jZrVab1LANrZuFB8O9VpMU25Xp9SzFqEIG8+FfF0x
	 WlUgYYCmSluj5EPGaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4zAs-1wYQJo2WYu-00wUGK; Sat, 10
 Oct 2026 03:22:08 +0200
Message-ID: <3a55c989-f16e-40a5-bd2c-201d45c82c85@gmx.de>
Date: Sat, 10 Oct 2026 03:22:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] platform/x86: uniwill-laptop: Lightbar fixes
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007144101.323289-1-W_Armin@gmx.de>
 <179148110928.29028.17146158167227573018.b4-ty@b4>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <179148110928.29028.17146158167227573018.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6haD/SQb2iXPD1YO084IC0/pAsTqPbKhqg6iymqBcv36wbyZX+e
 q4RxbZovu0gbnQqudsB31NfuMprtS+8hOIjO4tvDEJtwgCtRec53jzc9w0WAza1ULU31fM8
 AAIH5WRhYb3IwsFeXDToDxFiLuOdfuHmYiOMWefPIriIK48kybXUGmjIIBkHuEROw4yxZOR
 utoRY2xG5/eORsAMYwQEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eVDgs6nt52U=;dAiZ84LIuxBIlEhxp13/38TFemu
 e5i+uEhG/zARSGqDfK/21HIsDVAMBEBoLzyrM2nd/u9yAyHZ6npZJNklm8mPzC7X+TmxYUgln
 HgDQO0Q6HgreY85/5TKa5aOuhWinMsd+eHCGsZX+ji7tmuaRhH5lei9VV5oScIv06rOv9Pt+l
 Cl4x+DoGmQDG87jivPUaauj49xoQ1WoEPqbBRMgzB0LUJJeTARy6qB1OUIqOSfpijEWo/iicg
 LRQL38c4xjbEuL3kAqbFc+Kx6AOBQKHMnAMyOr0WhXMADgfOblC3sG23+5fQIy1a/t9oOm5C0
 hcftL3+aF0F0H0Xu5owleTknkEMWjS0ixH7PSj5A9dFObt64VZT9krKwht9P7NEfBc6TY/jXz
 17y1YZE+cAIWU7Re9sFYek088uGfORErVZI+zZVRfqm/NX7KyERIc8Pt6mXieR1FLrTb9FttL
 JFdxtAiJ9d+ChBwR5njwDWEhwdLB0KXyOyUsHJaGIA2G5DxBLj/SkTkIA9DiMtXbF6ZmJrvj/
 xmYVdaSk3mrdXy2XSlaS2CO8UvqcN94QUV8B5451Duy7R2VC52QehLzeP/xoVGiYVgxy39DFn
 FDllXP5TrspdD66NB/AIvuxw+UGVtkEABWmmZG+dXEYLL1p1S1U8iqo3zag+lZmXTNcEzibZR
 xI3H0kj4ZZU2K1Rk2ePejSWK1UklzzxZ2PGeQ6PvSIIyCZ6EUnHZKNFNpXdIOIclP4VXe6nFB
 jqe8lM1tjq4PkDymnJ82KG5z/0YKOiXUdyNj2GbsJCtBtIKyG9i+hgdHMnPVl/AMyPGw78I85
 T3Ocm+/2PoPUJM9LpKexNcg7wMtAz+4BaRSONsLsk/M7ULKBcKOpQdbJJQnNuGgEHaIiwiEDS
 OqQIypfv2SJx5W73sxXmS8lWHI90e6nHEbFF4gIXFYck8S0+NJModP0dHBgL7xfEJa0rw/oV5
 +I/zQbIFqWJeOfdttgxlyMuMbRLM3UEgQDC4LbAIMnw/mSWKew5fyZXqmN8zZLexIDRLE1oJo
 6PqLS31xzxBTDpGL05fSVIvsO+YeII1W0tAzP/IY+cuccH2gU/va3N8vB/driFHK4NrwfFDgT
 VMjk96ITqcsbpXZOP3v4bg6ZjXNUSttpnTpCLDztjduo4y656Y7lDtS2GUd3SeCtn/ifvFNPT
 /LLtS7gmy2Y8MzX3jiX/naqarLYvZW6pzc3k3ULRx7Ro0SqA6UBkxeY8T1rsrUS4NevT6MGGz
 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
 n65Evqn0jyFQl7NfLdvOvOGxrQ==

Am 08.10.26 um 19:38 schrieb Ilpo J=C3=A4rvinen:

> On Wed, 07 Oct 2026 16:38:53 +0200, Armin Wolf wrote:
>
>> This patch series mainly deals with various issues inside the code
>> responsible for controlling the lightbar on supported devices.
>>
>> The first patch utilizes the improved multicolor LED API to report
>> the correct brightness of the lightbar to userspace. The next two
>> patches fix issues discovered inside the code for controlling
>> animations, while the fourth patch fixes an issue with the naming
>> of the LEDs in general. The last patch also adds support for another
>> variant of the Intel NUC x15 laptop kit.
>>
>> [...]
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.

Thank you :)

I noticed that the LED next branch contains a commit that requires trigger=
s
to implement a new callback and prints a warning if this is not the case.

Should i wait till the next cycle to send a patch implementing said callba=
ck
or do you want to rebase for-next onto LED next?

Thanks,
Armin Wolf

> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>
> The list of commits applied:
> [1/5] platform/x86: uniwill-laptop: Report correct lightbar brightness
>        commit: de41d8b4d0dbb81c81cd99c245238d878a3e1951
> [2/5] platform/x86: uniwill-laptop: Implement rainbow animation as trigg=
er
>        commit: 59e4e406b6c08ad41f3ad86db6d42b82d8539c12
> [3/5] platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
>        commit: 969a3bfa474e35828e142d0160f393a97d9bf0ee
> [4/5] platform/x86: uniwill-laptop: Label multicolor LEDs correctly
>        commit: 42e6b269fc1134a3fcce57539034ee496e2c1344
> [5/5] platform/x86: uniwill-laptop: Extend support for the Intel NUC x15
>        commit: 7a159a14ce0f5d5a3c2f835f39986ec5539ae374
>
> --
>   i.
>
>
