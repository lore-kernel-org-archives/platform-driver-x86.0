Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1321721FF47
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768857560; cv=none; b=HDFMzqMJBAk0wl3whjPDqxmiujAaWIyY/9FejdK1QZboFyvlgCqTsZg8lyx3RZt+sZb6fspYptjI87piuG4KrxnR95JHsQnPMtV2I/5LwUgTStskUaUfxMQZkXefJH5xp6jnnabAuAm10bJklKAiI0rS/UoaZY3wZax64BzCNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768857560; c=relaxed/simple;
	bh=uwVmlks/bqdZz12wZuTA4eh84QEsHTW2vsOoyjRIZbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GT/FtV2JMJGDkbBX2H7IKLDa/mg3CkTqypBELwEt7B7lVB3N0tn/u1ZmefaYvzf4HMj/NbnLagvKvCB54O7MKFmPed22HezdnpW+W9PvFj7FYi3nG4w9OYjvaYDLTFtxkEku6hxmw3u8kfhl6QYsGYkxwAMplIhPE+TVKNN8+Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IOx9JARI; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IOx9JARI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768857552; x=1769462352; i=w_armin@gmx.de;
	bh=uwVmlks/bqdZz12wZuTA4eh84QEsHTW2vsOoyjRIZbE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IOx9JARIBE4dxl934ll2ugZuSOK1XSaZLWstCxz1cwWf9dvdAXs9Cg5LFiijktSH
	 VQtOQdcFLwmiiUPmLfwtyLGVovkQ0aO72NKQ4WrRaQyEUxDWn3lrLBnFyDM/g8Mlr
	 itW3SKYsxSSOISUZFgJOTrD5D5hJSiiHp+8M5YLR3Wdy8AYZXnG2v7jt4p3E8RKEg
	 p/JpQba5s28XhYjm0rbiKlqKp6HJpTv+PIIa/XlmNXD2SV2msz6u8Mk4S8DvksQYB
	 KVHDfk9C2PcW6ru3CnnH6KKxHykdfH8EBrTIIzqfNRT2Z/fDrYTKD27WLnw3nQYN4
	 UGr/ac96dIL0V7r/Rg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26r3-1vg0hy2Yu1-006Wd3; Mon, 19
 Jan 2026 22:19:11 +0100
Message-ID: <5dae062d-3e16-4c2c-80b7-45a2c713a93a@gmx.de>
Date: Mon, 19 Jan 2026 22:19:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] add Acer battery control driver
To: Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260105171024.227758-1-jelle@vdwaa.nl>
 <90ba47db-fe4b-4f1e-aadf-160d44c6930c@gmx.de>
 <d6991fd3-21a2-467c-99a3-9742e70977d9@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d6991fd3-21a2-467c-99a3-9742e70977d9@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vXCKtOI/3gz2QqfjHcXHE7eOoA4D6Ky7J8C/r2cPxfKdZHQUcIt
 HMzTtPY6F77SSVDSf5i1087XpL09HK6HCRVcKStiGra/SwLEsWQCtl9xov47hL8xAiiFqJi
 PNvkZQgjKsKhNGafbIi1ZQ6XVVS93AUtXtF7STRdBBiNvXDtJCV/I7cTZax5gtHLfRdXdJl
 k5MfRhQe6I5SjYO6PrfHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vfjtJpq5l+o=;oh7K5Ki55BF5dKr7yx6qZ8naXP4
 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
 xsOgBYlC0gzMsHT9crR9kiTH3YMCG

Am 19.01.26 um 21:23 schrieb Jelle van der Waa:

> On 1/8/26 14:52, Armin Wolf wrote:
>> Am 05.01.26 um 18:10 schrieb Jelle van der Waa:
>>
>>> This patch upstreams a part of the out of tree acer wmi battery
>>> specifically the battery charge control and battery temperature. [1]
>>> On my Acer Aspire A315-510P battery calibration did not work as=20
>>> expected
>>> so for now this is left out.
>>
>> Nice work. There are some issues with this patch but nothing too=20
>> serious.
>> Can you tell me more about the calibration mode issue on your device?
>
> Thanks for the review and sorry for the slow response. When I enabled=20
> the calibration mode on my device the device started to charge but=20
> never discharged successfully. I want to take a bit more time to=20
> investigate this properly. On my thinkpad device enabling calibration=20
> mode discharges the laptop till ~ 0% and then switches over to AC power.

I see. Maybe the battery is first trying to reach 100% charge before start=
ing to discharge:

https://community.acer.com/en/discussion/688985/how-to-perform-battery-cal=
ibration-from-the-acer-care-center-in-predator-helios-neo-16

But if you want to do a bit more research before adding support for batter=
y calibration then this is totally fine.

Thanks,
Armin Wolf

>
> Greetings,
>
> Jelle van der Waa
>
