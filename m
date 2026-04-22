Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45537C11E;
	Wed, 22 Apr 2026 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874371; cv=none; b=DrRQEfvD0UsZrSeVunnaeEaRqKwoHOnETg97WV7IVvtvYdEgsb1mjiGMMllrZUJ4iZNRAEzfcfMHIGVeDR+ZIXrYsOk07HR8TwF1ZKMtI/gH5FlprxPailyNffoH0Boe6Jcia7DN3X2Mdlanbo+cjAmw1UiLRrxLO54NKCx7EDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874371; c=relaxed/simple;
	bh=pV9LhmQCd735uaSednWZX5s9OiuSVzMXzI5CubvtBtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ga4I0CuwOEZ7BtPobr1Z9pc4HrXXfOBGO/Vhpkq0Z9yU9Vwn3ItpAwCmfk7DSnP8gb/7qidlyDjoRRtRsUqt+LD6SjJiDfMb6fQBKTlFG+3tF0EvOtarYHuSO3vQY1HLlxzUufEK7juuGNT6aJXpZi1Cka9ydVYzQrQS1LtQgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UsG+MOqs; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UsG+MOqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776874355; x=1777479155; i=w_armin@gmx.de;
	bh=pV9LhmQCd735uaSednWZX5s9OiuSVzMXzI5CubvtBtU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UsG+MOqsZaHNDimdI5/jQCU4q9husIyKtVpwAPfyHyQo+yC4yL0vqE7sX9/6dByl
	 NpcR3+Q7MqNntU12UUdl3U/T3HFGgDqor0FF7tKCUwKit2jGa+ASoks9gjIQ30EXG
	 UEU84APL3+I9WjYtMV61PM0s22509ETZo01evmK7EacFz8Fqz+xasLWkdO/iVy17n
	 Vw6crPyI+thB8rb+ti+3pK743zMn+1Pn7l0Ua5Krd+TPGNgUjjT7sB7O8vnPSO3QQ
	 hJoU9q7nVa7xc2mZenbrBAP2WQqkbfqf9Vf1TtMDQ3JKxTKRhD3CmcXZySYJpwOqn
	 LuZ7SNYKgIsaWkRUrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSbxD-1vnACY201x-00LjeF; Wed, 22
 Apr 2026 18:12:35 +0200
Message-ID: <46f7d442-04ea-4345-a540-2600a97867ab@gmx.de>
Date: Wed, 22 Apr 2026 18:12:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] platform/x86: uniwill-laptop: Another improvement
 and another feature
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
 <00de99ce-cb58-491d-81fc-f8bfb8ea4a16@gmx.de>
 <119c3496-9f2f-460d-9727-251731e32686@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <119c3496-9f2f-460d-9727-251731e32686@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4dqUaRxcJsZ/3G9v75BbzNJNElVmKogMef5ImBGVOMW4AQDyuhJ
 BELJtVjnWDXgrSfOft+QLD6LqU4wtYiQj0je74jbkiTlWDVbvACWJPiruF0Je69z4hZvq3S
 sdwSgcMm00BaQ77ABeicwygQk1CANTtAEQUSGBviNBj/viupKTsx4aBYhS+8g+OwyolFe83
 cZA4YdwizJwGFZNt7iSsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MAJQUbjYnZM=;aUOGFOIlRsxrK/PaKQ1c0w7EHyl
 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

Am 22.04.26 um 17:30 schrieb Werner Sembach:
>=20
> Am 22.04.26 um 13:28 schrieb Armin Wolf:
>> Am 21.04.26 um 22:01 schrieb Werner Sembach:
>>> Hi,
>>>
>>> This series is based on another not yet accepted series
>>> https://lore.kernel.org/all/20260417050912.5582-1-W_Armin@gmx.de/
>>>
>>> RFC because of that, because the third patch is not yet tested, and=20
>>> because
>>> I have a question regarding the 3rd patch:
>>>
>>> Should I abstract the call to wmi_evaluate_method away in a wrapper
>>> function in uniwill-wmi somehow, or is it ok to have it straight in th=
e
>>> uniwill-laptop code like that? It is quite self contained.
>>>
>>> Best regards,
>>>
>>> Werner
>>
>> Hi,
>>
>> i prefer having the code for this WMI interface inside a separate=20
>> file. I think we have to first rename uniwill-wmi* to uniwill-wmi-=20
>> event*, then the new code can live in uniwill-wmi.c
>>
>> However we also need some synchronization mechanism between uniwill-=20
>> acpi and the new uniwill-wmi because some code path need to check EC=20
>> registers before enabling support for local dimming. I suggest that=20
>> you use the component framework for that. Basically the new WMI driver=
=20
>> registers a component during probing, while the EC acts as a component=
=20
>> master _if_ local dimming support is present. When the component and=20
>> the component master match a sysfs attribute is registered to allow=20
>> userspace application to control this feature.
>=20
> Calling the old uniwill-wmi uniwill-wmi-event and the new driver=20
> uniwill-wmi from here on:
>=20
> I haven't yet worked with the component framework, but i wonder: since=
=20
> the same manual register call structure that we already have for=20
> uniwill-wmi-event will be also required for=C2=A0uniwill-wmi, can't this=
 call=20
> not also be used to exchange callbacks like for=C2=A0uniwill-wmi-event a=
nd=20
> the notifier block? just the other way around with uniwill-acpi=20
> receiving a callback instead of providing one.
>=20
> ofc these callbacks must be guarded in some way to not accidentally call=
=20
> uninitialized code, if=C2=A0uniwill-wmi fails to init or probe

This would indeed be possible, but where would be no mechanism for=20
detecting when the WMI driver has finished probing.

I was thinking that the WMI driver uses the component callbacks to pass=20
a pointer to its data struct to the component master. Said data struct=20
can then by used to change the local dimming status.

I am still not sure when the associated sysfs files should be created.=20
We can create them during probing of the EC, but then there will be=20
problems should the WMI device take too long/fail to probe.=20
Alternatively we can create the sysfs file when the component master=20
binds the WMI component, so that the sysfs file will only become visible
once it is operational. We can then issue a uevent towards userspace to=20
signal userspace applications that the sysfs attributes of our device=20
have changed.

Thanks,
Armin Wolf

>=20
>>
>> Thanks,
>> Armin Wolf
>>
>>>
>>> Werner Sembach (3):
>>> =C2=A0=C2=A0 platform/x86: uniwill-laptop: Make super key init lineup =
with other
>>> =C2=A0=C2=A0=C2=A0=C2=A0 inits
>>> =C2=A0=C2=A0 platform/x86: uniwill-laptop: Implement lightbar for XMG =
Fusion (L19)
>>> =C2=A0=C2=A0 platform/x86: uniwill-laptop: Offer support to activate l=
ocal dimming
>>>
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 195 +++++++++++++=
+++++--
>>> =C2=A0 1 file changed, 182 insertions(+), 13 deletions(-)
>>>
>>
>=20

