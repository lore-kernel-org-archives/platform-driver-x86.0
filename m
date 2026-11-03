Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716421;
	b=NQOhDF01yZzxapEUgBW3tmTPZESJttMFLU9cMmL4cEazk+jTLpuU7wKRD0Wt4ZbWHxS9
	 MPrYfuvyDAIl2lr/H9RvzV0jokt7S2BMluRLx9Cnz+iMYP6X7iBJsZc40YmwE9SBEEbPI
	 nrzlGZVANkWcb53xQT0uRTtG6C/WInyssdtXq3v7mKfNZvXtH3W/peDEc9jh8Q6pefRgA
	 yHPqOJht0Go3LlCyqkgUCnep97ZhWrNJwKZL+zPoJiPiipJZQUGxvdlg2L+pZwfknpIKz
	 MKPjamESbIy14x5hSHRquDW5GrNS5ffSNFcSK5whJjTSgL+rhsCvneo2mRsaN5RALwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716421;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Yjcxfix6uQo+Hn0hmjT5iCwNk7IHTqrEDnbc55sHB4g=;
	b=WXlW6p2r3r/w6QFGEwubcAiWJs3l1mHI3mzVlIHk20OfOxGFZdkDySKziOr2pbKtanmd
	 p45kfgGUQ3NThONb4dqiPIB17cExNywdPMxgbevcehG6RIPQmPuvQERn7+WGnFGhTnzXs
	 Woiz6vZ71A8+MLarbpBsQYnXhG9ZTZ2VkIH8+KSqt0XukGmQGgwnfobmLG89ZaJgwh4qt
	 O0navZ6hwv0M7IwfpM8yQqI4CwSYu4k1v8ASQ7HRO3V8R4N3DMuocy4VUfoK0mqFrWjck
	 vNYAnoRxi1GSpZhZJz/B+cRq1LgUHFR/9q0bXmrTkvSfb69Bgj9JHE8KA6p/Lr+/XcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="Mjv//tb0";
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2229606A329;
	Tue,  3 Nov 2026 14:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2229606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Mjv//tb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793716417; x=1794321217; i=w_armin@gmx.de;
	bh=Yjcxfix6uQo+Hn0hmjT5iCwNk7IHTqrEDnbc55sHB4g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Mjv//tb0Q+OFuOlHBxMbLYgE/jF+uIoCgx/unJ42gOPbtaU8LmRNxt+OlBsUjdmT
	 GFeNRxrPJjZY1vypC5vq2WM50zVPVn+cGOnajC5X3pM7NA57P1iaFxEdrTCwSEBK4
	 E/kX64x+oPMI1X153crQjarGJ+P3EsRUm94Yks049Hdz0Bs2Tfi5OFYIiFjtCMpm/
	 mOp/EpEWkEqpz/XGeSa193DH9IiBvJ2rVpxxDnJifaxlf/xbR9mkgZqIne3cXnvHv
	 d5FqXy1rWtgXv0pQDqlGFVrAjhy0ILYv+mmYnINUJZtDgITwq7AVFrsHVz/b3hDDZ
	 cgON8XsKP8lk/5HYcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysVs-1wcBIx2xve-00vy8R; Tue, 03
 Nov 2026 15:33:37 +0100
Message-ID: <f1306176-6ce0-41aa-898f-2c08c0e2553d@gmx.de>
Date: Tue, 3 Nov 2026 15:33:36 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Implement .hw_offloaded
 trigger callback
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030194704.424388-1-W_Armin@gmx.de>
 <179362009806.1659.9035755040374496694.b4-ty@b4>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <179362009806.1659.9035755040374496694.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D9CGvoQucKLnjq9hNahy4Rw7a8HFTX8q1e5yergWxk24bLzNDsQ
 T2fzNGB7ujmRw/UV0KZvhUiyZxDHHKCf4PHjr8/4vz1nuwfvCuE/1Ytkcyq+QVu7iZj7aDH
 3iE5Sqab4Vl316TyLGzVk+x053k2FvKoc+y911BaQXom5r7IUTkLuTo4xk1a+qflaCMyFnX
 leZVf69AGSO6eJ9ja4Dow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QhACpvbNGbM=;C8y5F5UYmsA+YLk63sxyHmtfGZu
 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
 Fn4=

Am 02.11.26 um 12:48 schrieb Ilpo J=C3=A4rvinen:
> On Fri, 30 Oct 2026 20:46:44 +0100, Armin Wolf wrote:
>=20
>> Since commit 8e04e5382aa9 ("leds: trigger: Add hw_offloaded() callback
>> and provide trigger_may_offload_to_hw attribute") the LED subsystem
>> allows triggers to report if they are being offloaded to the underlying
>> hardware. Implement the necessary callback so that the LED subsystem
>> knows that the lightbar trigger is always offloaded to hardware.
>>
>>
>> [...]
>=20
>=20
> Thank you for your contribution, it has been applied to my local
> review-ilpo-fixes branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> local branch there, which might take a while.
>=20
> The list of commits applied:
> [1/1] platform/x86: uniwill-laptop: Implement .hw_offloaded trigger call=
back
>        commit: 086aeca907789bd2604f16f07bfc073b19015015
>=20
> --
>   i.
>=20

Thank you :)

Armin Wolf
