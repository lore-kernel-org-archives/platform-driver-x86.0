Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D5347A0D0;
	Tue, 20 Jan 2026 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921601; cv=none; b=DX7/FuCKqPEYplgeD82ApUJk1hOucBnsLSnThpeVkMY+MPalmLGMi6gG1/L70H+86x7xwawnRYghVWHimgT2UHv549b48/GqMVITeU59naP3vA7cql3uF8K3+8jGoVFU1xv6t9S7yJpJfA3WMamldWNlQkkgHOjLI3IEDSWOeoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921601; c=relaxed/simple;
	bh=dZdygUVv2UjXz54Igq0SNBXzwj5uwKKwxACdBXxCC00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F/DNQIs4vcEq4YzWo+MRQdOY76nTiD4V9uU26U4MrmZKZsF5x0tus/RHuhb1FJWKF3SpXF8gHvHuIkKGkHJtHbc+djrGmlTssoBFLy3n5OIstor6lUIkCKsvK1cdKuAO4tNoDZPd0Xei0vcztnRaXQKl1In1pJ1l2t3BSDMAOnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Eu2FjEVf; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Eu2FjEVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768921585; x=1769526385; i=w_armin@gmx.de;
	bh=TJZoSCr0kilrD5gE8FnbwwULMFh+9+VUNqciQwHj2IU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Eu2FjEVf4qQBbsN9SNZ9yyuLcGKdrOmn+jver8L15PupTcmvB0fnD3QzP/tkYrkh
	 lbX4pCJtgOZcj6PADyXkYtOQ/ORyEbubdj3GOH+eGL+M426ldl1JE5cqtWVRp0667
	 MjDAZzAAKKwGv7sLong5QNliY8yY/8pVn5v7tTy4vc58t4BaRWv6m4q3g3bJKcetV
	 M7EtSmiBV8rHt2fvvtVVV4QQvt39AibsBtoBmwJyyMNrv4O9zEYXYEi0jmza5UoHh
	 f/lCBPSEWyU7ZbL22C8a25URDUPW+le+mBrmLGOcNbeCayDYFkaxgH3tkDbI047yK
	 jnhAHkK41V3Vzl3WMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.117.128] ([141.76.8.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrhUE-1wBnM50vWG-00kPPo; Tue, 20
 Jan 2026 16:06:25 +0100
Message-ID: <c4c14edf-8d84-439e-ba71-135bb47ee49f@gmx.de>
Date: Tue, 20 Jan 2026 16:06:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] [PATCH v3 0/9] platform/wmi: Introduce marshalling
 support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net,
 linux-doc@vger.kernel.org
References: <20260116204116.4030-1-W_Armin@gmx.de>
 <176892030133.15020.7666397577705687464.b4-ty@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <176892030133.15020.7666397577705687464.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HNlQwoOXg30+e1NpgiPT7l8kC9VvFSA4VJw29eql3AG9LrnqwLf
 EM+nUMMqUqqY5LW52FUu9D8aJVHDJG25MLB+7KxcfCLYPJ5jo/ZfAm7SgcGGkO79EeAFldY
 Uyw1B0JZlULoqxALfM3F8vBRLPoIzvGXRRpDmBbleRmzrq0QPna4fG/l+5TnyaB42oLNhMS
 ng9fArBJ5QnXlcDxF+4Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l0ZYk0ZAxBU=;WtkAEyr/S0+1Bh7aUzqKvitomep
 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

Am 20.01.26 um 15:45 schrieb Ilpo J=C3=A4rvinen:

> On Fri, 16 Jan 2026 21:41:07 +0100, Armin Wolf wrote:
>
>> The Windows WMI-ACPI driver likely uses wmilib [1] to interact with
>> the WMI service in userspace. Said library uses plain byte buffers
>> for exchanging data, so the WMI-ACPI driver has to convert between
>> those byte buffers and ACPI objects returned by the ACPI firmware.
>>
>> The format of the byte buffer is publicly documented [2], and after
>> some reverse eingineering of the WMI-ACPI driver using a set of custom
>> ACPI tables, the following conversion rules have been discovered:
>>
>> [...]
>>
>> Thank you for your contribution, it has been applied to my local
>> review-ilpo-next branch. Note it will show up in the public
>> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>> local branch there, which might take a while.

Thank you :).

>>
>> The list of commits applied:
>> [1/9] platform/wmi: Introduce marshalling support
>>        commit: 015b70a6ae697f5dac3562e4ab45ee275d98860b
>> [2/9] platform/wmi: Add kunit test for the marshalling code
>>        commit: 29dfba69c3ddb7945cd772042c6a9ce770c1ba22
>> [3/9] platform/wmi: Add helper functions for WMI string conversions
>>        commit: b990a06f7ec6dc3ceecd8015c3b421690f267122
>> [4/9] platform/wmi: Add kunit test for the string conversion code
>>        commit: 0e1a8143e79713eef7e027737fed259aa58866e7
>> [5/9] platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI A=
PI
>>        commit: 534f685d8a952371148e1374576f8ede2919ec1d
>> [6/9] platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
>>        commit: e210986f52b657301d009e23344e3effec12bbeb
>> [7/9] platform/x86: xiaomi-wmi: Use new buffer-based WMI API
>>        commit: bb7527c63f8567d69a22a818aa5999be47c5d479
>> [8/9] platform/x86: wmi-bmof: Use new buffer-based WMI API
>>        commit: 926a266575a21e96c4c0b9c16b1da1f7fda5a519
>> [9/9] platform/wmi: Update driver development guide
>>        commit: 2177a02246ffef9ed4a01af2942119e601312965
>>
>> --
>>   i.
>>
