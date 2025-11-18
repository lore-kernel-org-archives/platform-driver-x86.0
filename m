Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3C2D4B66;
	Tue, 18 Nov 2025 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462354; cv=none; b=Vyd6f8jb41JlmqmS6HdgvfJqUAU7+L0oyr4W83amxq7duDKj1ZOJlVm4PjS5JyB7VHkp5EvLW4bnmwF82o26leRu07uJfJoI3mXCXdkf95KCHDBJqEt7ew6oNDViHpEojo5222G4ga+DhwMf604OzEKtcTcfj445Ny2OR+5EafM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462354; c=relaxed/simple;
	bh=/3PEokETu7g4To3HJvjeMYpIzfzyoI0y5Y3cWQkxgn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwS1YHlt7yz+Ri3FPlzwaNiI2egaaq3CizE1qaypSZbVqzdHfdfd/C+F/szycot3JaTqgEznGKB4gicMzP5m7sR5LVaq5BvgnFXb+UjHhYpzQj2EJAQKTZtgakf1yZWMoo9fETJg7pMNTzQh3FMMhBEKWImlHlpkU8f2PsLyQNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bk2HixRP; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bk2HixRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763462308; x=1764067108; i=w_armin@gmx.de;
	bh=pw7O7ZJadSd40btK5BLk1DU3v9/iXP91OKWYFkg78e8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bk2HixRPQ/wylmSyDHyUHUyXjsjmJiY2e5ck3V4gjqnizhw3ATV7cOMudYM7y0rq
	 t6NaW+nP0yocQ63rbyb2SNmomMGspOxT/yLFMj3y6k2a59mtQy1WO9tpyPp0EnTQs
	 T9P1YbMz79X2GTlbMmDPrvj/w+NwioBDRNRzog/Rn8RWQM30MwFfJzUtcephgbgW4
	 LKhabSjvzdD8Wgqx8QlPZP8SlM/hy/KMIPp04adF5eNNkNAqy7y4wXUwNonHQ8e6l
	 xvMCEUku8WVG+LSmDKa0aN4fRvo7DqSZYFyRVxlPhrXz02aX8ZsNf5foNHS+16b8x
	 gSRHhSvL++a0iu+Gdw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.146]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1vXLoO1c3A-00PekM; Tue, 18
 Nov 2025 11:38:28 +0100
Message-ID: <d4ce47e0-cae6-4410-a9b2-e2fce571d019@gmx.de>
Date: Tue, 18 Nov 2025 11:38:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: acer-wmi: Ignore backlight event
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 jlee@suse.com, Bugaddr@protonmail.com, hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117155938.3030-1-W_Armin@gmx.de>
 <176345348327.8636.1554023632757663812.b4-ty@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <176345348327.8636.1554023632757663812.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7NnDZfHw64iHcg2wT4ZzJD1qp5sXMVJ2wXMimOhlT/KD2XKhIh1
 AbQUswdQCYSh0LVKlunHOsrtnhgi+K+fEZhGcYVUwAGxCk6td50yOcKu2S0rRSFFl23317A
 e5/7QVWLC/X5pBEeUo65OsMqruTe6PMHd64Jdht7XWXU42p3G4uKMW/vs5bQClxpf+guhE0
 NxQIa2gRbsQM7HXCiA8yA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ac4R0W9CE2o=;wxLXKOTRauNO8LBFRxV4g/2CSgZ
 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

Am 18.11.25 um 09:11 schrieb Ilpo J=C3=A4rvinen:

> On Mon, 17 Nov 2025 16:59:38 +0100, Armin Wolf wrote:
>
>> On the Acer Nitro AN515-58, the event 4 - 0 is send by the ACPI
>> firmware when the backlight up/down keys are pressed. Ignore this
>> event to avoid spamming the kernel log with error messages, as the
>> acpi-video driver already handles brightness up/down events.
>>
>>
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-fixes branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> local branch there, which might take a while.

Thank you. I just noticed that i made a slight error inside the patch desc=
ription:
Tested-by: Reported-by: Bugaddr<Bugaddr@protonmail.com>

Could you fix that up inside your branch?

Thank,
Armin Wolf

> The list of commits applied:
> [1/1] platform/x86: acer-wmi: Ignore backlight event
>        commit: 444a9256f8d106e08a6bc2dc8ef28a8699e4b3ba
>
> --
>   i.
>
>
