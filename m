Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A0A13AF2;
	Thu, 11 Jun 2026 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190059; cv=none; b=V8yQoSOv1mnmLw0dlx0qr7JjwPEGob4qekVQCXHm2/Zc4Ft3Bsnf2GHWoIfgS2hc55QUpNsaP75cwKOv0IPz1bpF+8rfxthFas5ehEFCiYx1YEiLsGJ1sb4WV+Qh/d5pEhZYJG0vwmKtHsxIc8nufGEhrBCUvdeNrTFauGf3YuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190059; c=relaxed/simple;
	bh=llb778+RllVcTBZj/dI2QtVo+w1jPQSZHBltSUc+Ylw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrKpqThcGz22ARgepaHsAh3ObnwxXI5xaf49NIQ0OV+IkjRQOIMdvXMDxJzzv2Mc9rTLBiwMd1k/r0tmReMpdNlxHaUhbnD3Pmw4cZmuDzoHXjO6lBoXqN/8G8Yp3lafdUlZNl93XwwY0P2Mt5fbzKAbfNfUEgV6kxdzsNKthA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bG1MNtuy; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bG1MNtuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781190056; x=1781794856; i=w_armin@gmx.de;
	bh=qRb062T7Au4tz9PTAtMIrNPFgF3ky5PIqqj5Si3L1+w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bG1MNtuyCJojBkR5jutYWHYb3uMag/JKzHk7I35efkr4BoZN//Gvwebvi3CPvcZV
	 qBgmSTrI7EWL5/G9r/Hqf7rp15zG3Uog6tGHGhgrzFGXsXbWVoJdEm8X9mRdmvmyI
	 E5VLc3useL5YTyaqEjOivgco+SsuSLbxow6i6VjWoXavjtdDfEywkjkwy/zUI0Xoy
	 y0C1djoOs8k8MAzN/6kj9FvsE8vhdGYplu3GtXAu2lRMG8BcLA1s5dn75PQxhZ/i9
	 jsUx4TcGFxtKSCYJnqpXRcaEKNk46adA4A1pTZw9GKrCHu3PelZeqLGmzkrvKrzfl
	 VrHMC+mgjlTxPSlGig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNJg-1wkKEH3w6k-00Yq8D; Thu, 11
 Jun 2026 17:00:55 +0200
Message-ID: <5e7fd549-eb73-45d2-a40e-4c8b21bb28bb@gmx.de>
Date: Thu, 11 Jun 2026 17:00:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] platform/x86: uniwill-laptop: Support additional
 features
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, wse@tuxedocomputers.com
References: <20260530170813.10166-1-W_Armin@gmx.de>
 <9c74fdcc-20c2-0722-7932-8fa09872d80b@linux.intel.com>
 <84441528-5f33-4795-a650-8b6fccdaed5e@gmx.de>
 <8395fcb7-4de7-85ff-d2ae-a7eefd2dc87c@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <8395fcb7-4de7-85ff-d2ae-a7eefd2dc87c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i8/40RtmcNtkhLve4uKBWDkHnMIQb7YngKtd2apWMkRpcqaNBMv
 X8loDR9qGI1JQv6EUVXkgEdbqAqxhEQtQzSf/Re2TEPWL+PcAd3940xF9bWYRlqZUPN92oo
 uzBrwH1AjxnCw4RIUPdlwYaAqHJOi/LcqnfjyQSG61ArrgUV2Ym9wob+gvKqClImtul16X/
 nv9RXxT5YLLPrXAnQscCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VbXpkS18vfg=;3//quUoYHrmNON9NUG8BtYaecnP
 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
 Hnf0MkpHecDFjWjzkw=

Am 11.06.26 um 15:21 schrieb Ilpo J=C3=A4rvinen:
> On Wed, 10 Jun 2026, Armin Wolf wrote:
>=20
>> Am 10.06.26 um 12:50 schrieb Ilpo J=C3=A4rvinen:
>>> On Sat, 30 May 2026, Armin Wolf wrote:
>>>
>>>> This patch series adds support for various new features to the
>>>> uniwill-laptop driver. The first patch adds support for the keyboard
>>>> backlight available on some models, while the next three patches
>>>> add support for additional WMI events, USB powershare and AC auto
>>>> boot. The last four patches finally add support for additional device=
s.
>>>>
>>>> The patch series depends on commit b1a9b7a904af ("leds: Introduce the
>>>> multi_max_intensity sysfs attribute")
>>>> currently sitting inside the for-leds-next branch of the LED subsyste=
m
>>>> tree. Without said commit the first patch will apply but not build.
>>>>
>>>> All patches have been tested on my Tuxedo InfinityBook Pro 15 Gen 10
>>>> AMD and most work flawlessly, only the AC auto boot feature seems to
>>>> be broken on my device. I decided to still include the patch because
>>>> it works on other devices.
>>>>
>>>> Armin Wolf (7):
>>>>     platform/x86: uniwill-laptop: Add keyboard backlight support
>>>>     platform/x86: uniwill-laptop: Handle screen-related events
>>>>     platform/x86: uniwill-laptop: Add AC auto boot support
>>>>     platform/x86: uniwill-laptop: Add support for USB powershare
>>>>     platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 P=
ro
>>>>     platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NA=
L
>>>>     platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B
>>>>
>>>>    .../ABI/testing/sysfs-driver-uniwill-laptop   |  25 +
>>>>    .../admin-guide/laptops/uniwill-laptop.rst    |  27 +
>>>>    drivers/platform/x86/uniwill/uniwill-acpi.c   | 609 ++++++++++++++=
+++-
>>>>    drivers/platform/x86/uniwill/uniwill-wmi.h    |   2 +
>>>>    4 files changed, 650 insertions(+), 13 deletions(-)
>>>
>>> Unfortunately, I got this error after applying this series on top of
>>> review-ilpo-next:
>>>
>>> drivers/platform/x86/uniwill/uniwill-acpi.c: In function
>>> =E2=80=98uniwill_kbd_led_init=E2=80=99:
>>> drivers/platform/x86/uniwill/uniwill-acpi.c:1827:49: error: =E2=80=98s=
truct
>>> mc_subled=E2=80=99 has no member named =E2=80=98max_intensity=E2=80=99=
; did you mean =E2=80=98intensity=E2=80=99?
>>>    1827 |                 data->kbd_led_mc_subled_info[i].max_intensit=
y =3D
>>> KBD_LED_MAX_INTENSITY;
>>>
>>>
>> The patch series depends on commit b1a9b7a904af ("leds: Introduce the
>> multi_max_intensity sysfs attribute")
>> currently sitting inside the for-leds-next branch of the LED subsystem
>> tree.
>=20
> Ah, I missed that note.
>=20
> This will have to wait to the next version then. I've summoned the serie=
s
> back to patchwork queue so I won't forget it.
>=20

That is totally fine. Since you are ready to merge this series as-is, i=20
will start developing patches based on this series that will be send=20
after the development for 7.2 has started.

Thanks,
Armin Wolf
