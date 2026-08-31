Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE725361972;
	Mon, 31 Aug 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204161; cv=none; b=r10tKoJk9cdrn+ahavxG4GfBLgZEwxMRi80gEut2PaxfWiHThkm5n5IO9yij4uSE+cgHSIuNJjoHiif1vg16BOdfVYBauMtai3VHk6fhojer9L9TQuC2iyTuxwji+GGY3zP4EllK3r8WkQvp23OnG2A13dlknTrlimQ7DDgnLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204161; c=relaxed/simple;
	bh=Jse384y3ZTxzylrA4QgjxJbZWxihktMMVi1EvYoGLw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssrYxvRKf5tndBc0pw1suI3YUfY+DMCFP7A5NvdKAloTyDHHUtFj+JaZqLdyEuAIIJj7g5srtQHqmOCOhXZs0uQpGv0qwvQjCQmJCc02CvPC4X7X2e4x7QvlIn1bQMqqFxAMgplM4aEiHJ5k51T+Mjua0CkxgljL0tAOP2rC/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hHK8iHc1; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hHK8iHc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788204153; x=1788808953; i=w_armin@gmx.de;
	bh=qnHZSPvPPGhHK8K2HPG8Wyfk7PlOn1uvmW3PTsIy57k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hHK8iHc15lPzD9e1vXyOWK4XvUZ8izDy7E01hFV7PLwvyZQIj5DZPjdzHUcDKB7F
	 /TmcXx6xe42nJIVR4a1cb+rlnOMK8GPvU0T3nDtjA6GxIs0TRDqqNR/V+KSVa+NQC
	 qZc3hJLUj8BPCEKzwCLaX7+uRDCk/BjRSZq85IUI/YAh39LLm/qO7baj8WABV3H3F
	 sCgX8qU3a1Ml+M9Q6Rma+AN8Fnl6gwolpERFUAPZLPNCSterV8gsKpk/9vHMuzS76
	 sNJ9UcYfbdVmb+oMNi4HWFrS6WjZgUaPTNauxsxsLmVIrsdoxW+EC5w+KkJJG3dnr
	 wmbVAbSYErcPXZWRTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwwdf-1whO0R3hcJ-013Z7R; Mon, 31
 Aug 2026 21:22:33 +0200
Message-ID: <f3afc121-e9ee-426f-9c73-04dd1906fc23@gmx.de>
Date: Mon, 31 Aug 2026 21:22:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-laptop: Fix ACPI event handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, royclark086@gmail.com,
 rafael.j.wysocki@intel.com
References: <20260830235058.324140-1-W_Armin@gmx.de>
 <178819471792.5620.5311886885453382430.b4-ty@b4>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <178819471792.5620.5311886885453382430.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6J6PzIGeb9wishx5k0vxwJ0QW7qg8J6FQf0E1ywWFMEDllT5LYQ
 aFYFjXdzr1RIPHwprcPkj91LTmDLRkK+CmDX5+9jHUdKbEkHyLoiek+8WgvUg4drpThVBR2
 qKtJ/0PxDQUjDcx4siGPwMu18Qh5/gt42LOcyqh2SMVUOwgFIOB5DuCamSJC+FFKoFjzova
 ebRhZCg17LJzLvAjrbqUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2A6YgdoCKSI=;BApUR7WSqxAbqp0DCELVPwi3/ks
 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

Am 31.08.26 um 18:45 schrieb Ilpo J=C3=A4rvinen:

> On Mon, 31 Aug 2026 01:50:58 +0200, Armin Wolf wrote:
>
>> The event codes inside asus_keymap[] span a wide range from 0x02
>> till 0xC5, but using ACPI_DEVICE_NOTIFY prevents us from receiving
>> event codes below 0x80.
>>
>> Fix this by using ACPI_ALL_NOTIFY instead.
>>
>>
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-fixes branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> local branch there, which might take a while.

Thank you :)

> The list of commits applied:
> [1/1] platform/x86: asus-laptop: Fix ACPI event handling
>        commit: 156c129509869a090f88e96fba4bdf2dad12969a
>
> --
>   i.
>
