Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C46359A70;
	Tue, 15 Sep 2026 21:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507632; cv=none; b=dKYnIhgHlQPFmLuwy2nsnxg6KsAIKsomlm3sH7W8k5GFiN4u5/chLCeBoOtB98V94jEeV2qEXMx8syg6BUt+vj6omDZAppDXL/UdsP/8dgJo9ijPokkQMAWc5hu0SNR1d5xbvP+N9PqX0C2ihH1EZCRYRxAlBdhxwTM8IR2jS1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507632; c=relaxed/simple;
	bh=NawPWYtKcK840+BClXbw97MLm9Q7PYOqBZG8shIA4fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMpbfhT93SBO7v5na4jgpD9S4MsXoqEZ/jw4K0TS8ksICwPC/cRq//+vJjwA6Li7TAd2iH18MqoREgP14fUuEfq27pKf1VXfbXci4QvkxYqJov2sPpg5Q5v5F19jze/fgH/4NJR9KWUEgmZKHtn6EvlXASBxBJFAyv8FVcGCJZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lR9UFpmY; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lR9UFpmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1789507621; x=1790112421; i=w_armin@gmx.de;
	bh=ljXpSbaILlX0fYUhXR1dEPuzq58dFc+PokOg6jP81O8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lR9UFpmYECutWLfjb8v9MDV6pfKdTHvNj2DWOhDhXhn/ujuSRTR9wQh5l2nYyxPS
	 yU1iP6FYlXEscuxKbt6hUmyr4c3pxgA7KO6XNOOGE9wDhizr6kNvCVPHN6a3BfQjD
	 YUuty3bY7dZ58KQPq4hQSmBewdzYbtGkuZLGea29bYi45Ahmj16C075BIhl5wxsYQ
	 C4+o9dGNhG+6dHi20FYWjOOzey5cT6Jsc41amWRRGQY6DIB8xtIU0axfAQ6O3K0Nt
	 gn1fGDKOuBYAUVV5h7YzHhrkNICoJL/N2W2FxnJke0SN+4Ch1BzbtWmjRrVSzGc/S
	 sZWWeWSdBrEieeeK7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAh0-1wV30P0VCa-00ZR4e; Tue, 15
 Sep 2026 23:27:01 +0200
Message-ID: <7c7874de-c92b-418e-9c9c-f9242326842e@gmx.de>
Date: Tue, 15 Sep 2026 23:26:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix for platform profile issues on USB-C-only models
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 i@rsplwe.com, rahulbheda131313@gmail.com, kento@kekto.ru,
 qby140326@gmail.com, martiya.ar@gmail.com, vlku.milos.fun@gmail.com,
 mm3885525@gmail.com, wleizc7319@gmail.com
References: <20260904224516.8893-1-W_Armin@gmx.de>
 <178947193589.31094.14063517846504462170.b4-ty@b4>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <178947193589.31094.14063517846504462170.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:srz0V/hn0Zd4KLE6nLiaJgFqRe/nqGg3x8ogGiUtFyDuka8RFhO
 h5hkC6oo0md/r01eszgwKC8Hq2xEJIFAX/elLZsdQ5L8DZSdZPAnW/V7BUAQmRdPbmZmkpv
 JZf2+OFt2WYdtspj6h4amUsah9mgjAndGWq8wMDH/Scip4t6rAYoKyfK+wiFa1gBHjXK6+N
 GgqlSrHKUVrV8u3zekQRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dd9ft1WCO8Q=;KtKJdScHNI837r8NXdDncL0EuEu
 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
 /2lYs0cS4f2OguMZ0fzYwKQBQ7UrW8W

Am 15.09.26 um 13:32 schrieb Ilpo J=C3=A4rvinen:

> On Sat, 05 Sep 2026 00:45:14 +0200, Armin Wolf wrote:
>
>> After looking thru the ACPI tables of various people having issues
>> with the bitland-mifs-wmi driver, i came to the following conclusions:
>>
>> 1. There seem to be multiple flavors of the Mifs interface,
>> distinguishable by small changes inside their WMI MOF definitions
>>
>> 2. The buffer format used to communicate with the ACPI-WMI firmware
>> operates differently than previously thought.
>>
>> [...]
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.

Thank you :)

Armin Wolf

> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>
> The list of commits applied:
> [1/2] platform/x86: bitland-mifs-wmi: Detect failed function calls
>        commit: 437954f921dc60a5a988f0a6b343e9e5734b872a
> [2/2] platform/x86: bitland-mifs-wmi: Treat WMI_FN_SYSTEM_AC_TYPE as opt=
ional
>        commit: 46482926cce834fa6cb3b08246f10455a0694b03
>
> --
>   i.
>
>
