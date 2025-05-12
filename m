Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E27A22338
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 21:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747086685; cv=none; b=VciEss+15bLAeMC7B9rLxVWEl7oyUeE9HlbRUh3EOLs9a9nrA5iJ7wxuPGn8zNU1kdqTozcB+zpfbMkHhgX8GsOVZ/gsF91ESffOvrOwXXLtaeMZqRWZ1H8TiPLLkXUODR3Z09PmtfX48Uq1m82RmAes/ZXTRdHg98xnZqntUDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747086685; c=relaxed/simple;
	bh=Syen2O+ZJbVidFflNILyU9OKNqLp1htRx9zzX/4d/3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdilN520Li8nTeh4FY1Gldua0JelCq/LpcNeD5qR22KjiVVs8mL1D17fJcVlZZvSV2cMtMov73+hPbdyv4MIUKd8T+JNOeYaK9zWug1lYPdf3Ycs2YZ6gahiNbu2xD1gpuj2hnLt8YbQ2uVAy0ksYTKSbpipLzGKOQKynYMmG6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ALYbNpva; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ALYbNpva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747086674; x=1747691474; i=w_armin@gmx.de;
	bh=fuWsQlb9NyhBx4zBJzPQAMx5RmguVfo9IzzmK6oWnws=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ALYbNpvaZvQiQKxfuTHaPqrkSDGzpK5jGMCDU0Bv8XPnbRJrJXloa1TF+t1lprnZ
	 O8thBgfwyCy8P3MFQeFZQwavWu4mUNed3BCK5hfkd+74nBukTXxRRfYDV66PzVpYz
	 mPw89qQJ6VjiqOQpkiHR8Cohc2YxgrxZQn8+MdtMMRa9jcjTAjv7tKyckDifokQTC
	 pcTGWD+W6gseCi2IE12/WXadtxTixT7k6YxIn/+foTgrx+pKDD7YtQ9kiRy5PC4A7
	 6btyw+X6JCwb8euzlsbTxfmwNZnHproWmBB2TNdgaKI+eyHGh9O8Jekrx/GerAH5u
	 ju3nQTm43wJrmOhQ4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1uzMrM0pTS-01685s; Mon, 12
 May 2025 23:51:14 +0200
Message-ID: <846a8a5a-9032-4ce1-95c6-1b00bb4c42d6@gmx.de>
Date: Mon, 12 May 2025 23:51:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging
 states
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Hans de Goede <hdegoede@redhat.com>, debarbos@redhat.com
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.org
References: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
 <ad09634e-e6a4-48af-9e02-345ffa866474@gmx.de>
 <aBDAZO7fR0FGTJ5Y@debarbos-thinkpadt14gen5.rmtusma.csb>
 <d7756075-0133-4511-9a9c-2971a3e5071a@gmx.de>
 <aBEVi3hsxCQGUm4R@debarbos-thinkpadt14gen5.rmtusma.csb>
 <b658e3dc-5561-42ff-a866-e17aa41db64b@gmx.de>
 <0344362d-66b0-4001-b115-65dbda31a149@app.fastmail.com>
 <446ef648-60ae-4b66-8c80-1f692b6c9df9@redhat.com>
 <42a03b2d-ee9f-422f-994b-c245891afc33@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <42a03b2d-ee9f-422f-994b-c245891afc33@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:u6iM8XI1BQ/Uk0okBXGbPeS/vFa35fmmUCI2xVcoS80B8Hb8efZ
 K+PXPAF0Ep2UXKSqo2uvtZfd4vFK8UjTldTon3GrRlzMWAtxsIRQeZs6ZWvmWfMyc6ZFXqx
 yQ54W2+ohMPUyQ60T/jSj2/KgzSlASq5JP7v+ldBFmdZRkZCva71Qjmv9IWUxVsUPS274OO
 o0m1M3Hf/QYA53ZuX2Wlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5XReLGThs0E=;VyUWYlh2v9zeDl5OedHNpGmMxGt
 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
 b+2SdTKWuA+k0=

Am 06.05.25 um 14:54 schrieb Mark Pearson:

> Hi
>
> On Thu, May 1, 2025, at 6:52 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 30-Apr-25 9:45 PM, Mark Pearson wrote:
>>> Hi
>>>
>>> On Tue, Apr 29, 2025, at 4:12 PM, Armin Wolf wrote:
>>>> Am 29.04.25 um 20:08 schrieb Derek Barbosa:
>>>>
>>>>> Of course. I will label the two scenarios as Scenario 1 & Scenario 2
>>>>> respectively.
>>>>>
>>>>> Scenario 1 (below 80%):
>>>>>
>>>>> Battery roughly at 75%
>>>> I see, interesting. I CCed Mark Pearson, he works with Lenovo and maybe
>>>> has some additional
>>>> info regarding this unknown 0x6013 event.
>>>>
>>> Looks like it is 'EVENT_SMART_OVERNIGHT_CHARGE_CLIP_CHANGED'. I'll need to check with the team in Japan what this actually means.
>>  From the name it sounds like it is an event to indicate that
>> the charge limits (start/stop thresholds) have been changed,
>> which is exactly what happens when hitting the toggle in GNOME
>> which triggers this.
>>
>> So I guess we can just ignore these events.
>>
> Confirmed with FW team:
> EC will send event to BIOS when customer set or clear battery charge limit, BIOS will send this event (0x6013) to hotkey driver to tell it that the battery charge limit has been changed.
>
> I'll look at doing a fix for this, but it can safely be ignored in the meantime.
>
> Mark

Can the battery charging limit be changed by the hardware itself or only by the user?

If only the user can change the battery charging limit then we should indeed ignore this event. Do you want
to send a patch or should i do it?

Thanks,
Armin Wolf

