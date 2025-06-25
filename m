Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552B625EF8F
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jun 2025 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859085; cv=none; b=dv6lAKC6lIfEMJlyVmnrTKtefG9Q/oi/nzn1OP2MeY7fTaeeKt1MO0Vr2nwufhXaWmitVysvguUL4pNqA7XzWtJJKYXqzc3uBo30UzTLcI3aI4SFwCT5zuSrP7rVLhDTx/7UcZAEEYO9oLopnmAE4/5IZ6IJLbnu9VJ+1zQTqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859085; c=relaxed/simple;
	bh=uYTyThO2NmY1lau1tUyW6WOL1VeMbjbnouH5wJui5KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuD+IqqR0/02Y5y2wXJ2QTgu79kUs2ru0NB5k9JHEQfR3jAp9VJ7mAvl6iwZeSk1eMzcBfjZ/2RjDKeHTmJQhqLRrZc3EzGhf6jgOi+L84xwtlZNQJjPF64CeuX13wwwAFzw+oZuQtoR4yL/e5wMmO8CSbSs0WfEVoPauQ2BgFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XUqq4FSS; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XUqq4FSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750859077; x=1751463877; i=w_armin@gmx.de;
	bh=uYTyThO2NmY1lau1tUyW6WOL1VeMbjbnouH5wJui5KA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XUqq4FSSnw5vDmsuOENpmgFcJqGGQsLZXjxBQOFrxU27jNWSC2abLV4iziNyEmfQ
	 7em63Tz0D9MO1ABJa56fYLoZuops0532G5cLnCCb1uRrvdVzoP6sj9wNWf388Mycr
	 6oE6prxVBcOEo/gn4oaW6seBk0qnDmGLldDggsdMjRjrAzF+umCthf8EdzCZm+ZGJ
	 CZKu1m/LTHMa9GU8173u+XsaWjTHbULtxt+sSkdVxv/HXsbnQdkIdn72D4YJPvDjg
	 XpxaG8sPuzIMRLWWLC7u/0Fle2VFtQvBPiw9phcolnFodDWN6dDwBUsuuNOGACJff
	 bRosCoe3McRL/pt8QA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAONd-1ua9rq02fr-008t41; Wed, 25
 Jun 2025 15:44:37 +0200
Message-ID: <9642ad7e-3e57-45f9-bfd9-beac3e55418e@gmx.de>
Date: Wed, 25 Jun 2025 15:44:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
To: =?UTF-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se>
 <1037e223-a6ad-4d12-9619-f69a29cecba1@gmx.de>
 <5I8UDmgF_DcJBmBE0zgCXjuvmmhLamDCHkpnkAwRjSAkCa5xcFUvU-SmAeymxTajjDPR8avuW55RxOjhd8idK6jLy-hz8i-Ma3RHSaFy2Gs=@benis.se>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <5I8UDmgF_DcJBmBE0zgCXjuvmmhLamDCHkpnkAwRjSAkCa5xcFUvU-SmAeymxTajjDPR8avuW55RxOjhd8idK6jLy-hz8i-Ma3RHSaFy2Gs=@benis.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AYOqRlsf1H8otbEyVWTKnZOdF7EOsZm4NCzhkIgGMS3kzqw2Fq4
 C6PRow8iSXCOEm9szAOt83y9BhV3WpZDxldRve4+v38k+0ZUqnp6F1eiiinO69+wTdRIXp5
 ZC6JdvoySPwGy2UiW7V2KoVgsNup/7doVn/x+kbyDG9Vd55Q1PDLs/ftxqucxg8jtuxl3Qc
 kZfUxdYltLV18tFzfMz9w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s4iwt0bvNn0=;KNhlS8d0xod6zgRVnsCSGgYFlqG
 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

Am 25.06.25 um 10:06 schrieb Benjamin Hasselgren-Hall=C3=A9n:

> Hi,
>
> The acpidump is here: https://drive.benis.se/s/pcKLAL7i8zncX8q
>
>
>
> Best regards,
> Benjamin Hasselgren-Hall=C3=A9n

The hp-wmi driver should be able to control the platform profile on your d=
evice. Does this
driver load and register a platform profile handler?

Additionally you might need to install and setup the intel thermal daemon =
for the platform
profile settings to work.

Thanks,
Armin Wolf

> On Monday, 23 June 2025 at 20:52, Armin Wolf <W_Armin@gmx.de> wrote:
>
>> Am 23.06.25 um 15:52 schrieb Benjamin Hasselgren-Hall=C3=A9n:
>>
>>> Hi dear Linux friends,
>>>
>>> This is very much a long shot and I understand if no one got any time =
or motivation for this.However, I am trying to understand how HP Omnibook =
Ultra Flip (a laptop with Lunar Lake platform) working with power profiles=
. The reason is that it seems to be very limited while running Linux (to 3=
0 watts to be exact, no matter the power profile, this is for the whole la=
ptop, to compare with something the Omnibook Ultra 14 with AMD Strix draws=
 up to over 70 watts, sure more power hungry platform but still). Also the=
 gpu performance is not as it should be.
>>> So if anyone got the time or so - let me know where to start digging!
>>>
>>> Best regards,
>>> Benjamin Hasselgren-Hall=C3=A9n
>> Can you share the output of "acpidump"?
>>
>> Thanks,
>> Armin Wolf
