Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6933EC
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Oct 2024 05:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847638; cv=none; b=MYrqxxcEipoVnicPICFNqjccRYQnEqstuoJ4/RRN6TuEjDFw0nA0XM0R4mH21HRN9nrFYOAB8UEYiCfmhKspi6AbYMUqTLKmKERatZpuLFKUZ4UyKvKDR29GlhksdQ7SWbJe4eh6qRZoRNcJA2h4CojJ93ZpyzfJsbp5fSAfaQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847638; c=relaxed/simple;
	bh=9iyJEaBAN1iIux+dDyFpOQLAg+enxnBNzNBIA5HbOGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTQZpHM+25wc68lhIrsydJNRwprb4V3xWoLA7VtLaOCIVclL/5a/oJRnIy6+UnwKlff8t8oJusG1zg2PjE3/wTeno6OCo4Xvb7/mvmD/shMkbUSJijxOlkfow8dlYmJUUlT6PfGM4ILsPxEsjGfqH1qvgkf78hM1UKr0VJDNjUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=n7fQk/5m; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="n7fQk/5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727847623; x=1728452423; i=w_armin@gmx.de;
	bh=9iyJEaBAN1iIux+dDyFpOQLAg+enxnBNzNBIA5HbOGg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=n7fQk/5mRx/SLXegJgXK8gdMZE59EXJLEC2I3z6tCbxSHLrV0RsU6AYDB3PJM8GV
	 I6Uedt7LaVUyo5DwXCllBxR1zdA8y8OBNOsgwgADPJ+q0iXGF/8xOMAJ+Vs8V8ru+
	 BG3L2EdWDln69+rSIwSALJ24OynCxdB4zM+3zp0yfZ6BK1ghtJetmJKho3NxgcSJT
	 N3XvkuGVnFPli1ATm7oGuZt429d9Zaq6NC2QkKA1qZQfRGtIJvc9q28O351ep/fNI
	 w0ItZT/tSP8v1+gztwDE+x6r+BDeTIfKsE27u4dVwOpIabsPE1zfN1qVnNJ5hGZ86
	 1akado9eUDeJvnGL6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49h5-1rwNYk0NAP-014uck; Wed, 02
 Oct 2024 07:40:23 +0200
Message-ID: <446996ed-8e5d-4d8f-9b82-248150723614@gmx.de>
Date: Wed, 2 Oct 2024 07:40:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Improving WMI support for Predator/Nitro laptops
To: Alexander <al.safonov@inbox.ru>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <d1a92068-2498-4892-8294-532222b4d94d@inbox.ru>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d1a92068-2498-4892-8294-532222b4d94d@inbox.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T28V2DhwZXakEJcScQjA6uRBNH1/RGWXQm4G8/Chtg3sLvv8wIY
 qjFElOKJvGk3ORdeRbs1vbqXxhD3JIimYL5BpNjQDdahBCSY1gQ8hcC+8qz82zgRNBFSEOV
 yoeHCSQoexdcB+Is90aG4LyEESUiQSB9GMdcwLIIFILDlgANM6Stmzz6+gPOx8khf+90zOB
 4wV67jUC8k3Pj/SgYguuw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:svpSAIy3V3o=;7wwSVTOdmkcuHwoEtaOiKWzmsPB
 5aXKQ+Yh4w1GK0Dv3xwKWSGcTANENJAzV2QlsFXzgvdigEpyMO6zEuzPLz+f3piABU9AYSJMC
 35+hzihrgRGaxzrW9wxROx19C06kC/gY+ve6m2v+QxkE8LFKdxRZG1fffD9N33HzFLJmNGLUK
 506Rk9OsVXUBYaWJRXZQB0GV+lahCuUo9JSeWWDQInw9xwWAZuG/2SSu5+y7/MQlJYwHZ+Hsl
 D1szG9OjGujH78IUmRzJ3nQSpP7NoIHwHJ0mifAVxqQQno6tgwn0lSyaC+9xtWrogYrMgJ/mS
 HuymhZRhM4cuIBoFV483bnpv4M/XYV/69Prh3/bUbSIJsbrX18CT8Z0flXmeg5WNud1gvXhBH
 GwK6mVzpCkBeMjF+5i0mljnEqAEF3LAlgol5EfEMDJvo7GpJ3nVrQrFaIDyJW3fOaLLVVCciO
 SxEJb3CO1jEQjbVQftZzj58AWMrxBefGkuiP/+ZiNPES4bMSQNkmrRwrF4eycSr7PUyz8BHrr
 ervBAHEmL/SRjc3L8m4Ut5hQDHDSuKmlAnHa2WIrOrcXRbyAeqrCAzBVnnCvX7zgjSInjydGJ
 7+VRoBDOgA1eigOEmf2wS4Op+WvYr+w5JQAhojHibwa9hu3vJk7MI19hl3yjAB5br1+j3X6FL
 OKXO2kZxJDVf3ZyJOR9B6kCafRtaYN7wpFCiO2fFMGXKK9TxPSNWixlHIRtSamXkaObBjqTOR
 rUxhPSFwoB8W6p2iL1ERU5ofXZ9Qn8Fdd6UrJKDU3ZhxJjVUSKjXXXqYlAjDi21JsdqNwjtMV
 0Qow4+rYLCJtke+qdCnsH4ps6i+kkrveVWx0QDYEkEYfQ=

Am 01.10.24 um 00:37 schrieb Alexander:

> Hi,
>
> I've recently been trying to add support for gaming features to my
> Nitro AN17-41 laptop.
> in particular, I was interested in the "mode/turbo" button, which change=
s
> the CPU/GPU overclocking and fan control from the HW.
>
> Looking through the ACPI tables and WMI methods, I realized that this
> support
> was already provided for Predator series in the `acer-wmi` driver.
> But it currently ignores AC adapter plug/unplug events.
>
> I have found relevant WMI events that are currently ignored:
>
> [352418.426647] acer-wmi: Unknown function number - 8 - 0
> [352418.426647]=C2=A0acer-wmi: Unknown function number - 9 - 0
>
> After fiddling a bit more, I now know how to trigger these events and
> what
> their values mean:
>
> * Event 8: triggered every time when AC adapter is plugged in or
> unplugged.
> It also triggered when charging via a USB PD adapter.
> Values:
> =C2=A0=C2=A0=C2=A0 0 - not charging
> =C2=A0=C2=A0=C2=A0 1 - standard AC charging
> =C2=A0=C2=A0=C2=A0 4 - charging via USB-PD
>
> * Event 9: triggered when HW detects that it is being powered via a
> reliable adapter.
> It also somehow coordinates with the result of the WMI method
> `GetGamingSysInfo(ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS)`.
> In most cases this event fires at the same time as the previous event,
> but in some cases (USB-PD charging, or AC charging when the battery is
> low)
> this event fires later, when the battery is charged to a certain level
> and
> the AC adapter is connected. I assume this event means "allow turbo
> mode".
> Values:
> =C2=A0=C2=A0=C2=A0 0 - turbo mode is not allowed
> =C2=A0=C2=A0=C2=A0 1 - turbo mode is allowed.
>
> This can be used to automatically switch to the appropriate mode.
> I can work on this and submit a patch, but I struggling to find what
> has to be done here.
>
> Questions:
>
> 1. Is it allowed to change supported platform profile modes at runtime?
> Suppose I set or clear bits in the `platform_profile_handler.choices`
> when these events fire, so that userspace can know what modes are
> currently available.
> Is it allowed, and if so, do I need to use additional locking mechanisms=
?
>
> 2. Do I even need to export this specific HW state
> ("reliable-AC-adapter-and-good-battery")
> via sysfs?
>
Hi,

the documentation at https://docs.kernel.org/userspace-api/sysfs-platform_=
profile.html says:

"It is explicitly NOT a goal of this API to let userspace know about any s=
ub-optimal conditions
which are impeding reaching the requested performance level."

So i think the acer-wmi driver should automatically switch to turbo mode i=
f:

1. Turbo mode is currently selected.
2. It receives event 9 indicating that it can switch to turbo mode.

I think commit d23430233494 ("platform/x86: hp-wmi: Fix platform profile o=
ption switch bug on Omen and Victus laptops")
might be a good example on what to do in such a situation. Exporting the a=
vailability of turbo mode via sysfs is optional.

Please note that you cannot modify platform_profile_handler.choices at run=
time, so you have to "hide" such things like
"cannot reach turbo mode yet" from userspace.

Thanks,
Armin Wolf


