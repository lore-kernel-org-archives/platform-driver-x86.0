Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CCC29D266;
	Wed, 10 Jun 2026 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109420; cv=none; b=CiF+VQ8nXu8RdqKumE5WaH02HU2/zLwB3pMeTs3PV/b2qq8CalPfR007ryOLD2cq2kws2SU+csVw2sVNR/nuYV9CrKsXxX+IvEmiAkU1FFWfKJD+5B7Sems4RuHjcm5os8Ci6cg5QKWQ6U2/jkbQPN1twO043FdO056CZD+KU50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109420; c=relaxed/simple;
	bh=O3Xyk0yIcBrJWp9Hi3Vrqdff2W47d8I/SYioRD1x8BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTEi+3oO7BClo+ZB/C9Cd0GG81t6NOhDkqeqKzZasuHDSXh87Imzh4YIxq1h/gs51b0cLKxW3phaAK8ApNpshlAB58y1upwsPWYR5sWJrXVKZekf+38vDaI8fGcVW7twe6cCa7IcLHdYWI6810iKTQY1BIHeqrI+nsLexojhAik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nVCeELiH; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nVCeELiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781109411; x=1781714211; i=w_armin@gmx.de;
	bh=hnkpP0ogHyenPB3/jOYx+6bkpbrmF2FNh5lbcefnGpA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nVCeELiHvOFPZO+PR8+6EGf6aGR8VOxvM9QShrHpYE5IBslpKj0sz9rEmI2pIbWw
	 Es6QlsKtGlHBecMaZNZY4rManN5mEc5jotXrfhTyg/TEPWwEUoqG5w/3nSFV560K+
	 UXPHsEqECYhZlvanLtzcaYtR4s5vK4o/1mJoTtOyUM+ES9o0FzDxWTeruw84LEUP1
	 I7IShBa0F38D5lGB1g/lmBYIO7Kz+wl1fmNfBm7X/kQkUjL3s75aq4p4Im7yjA7nq
	 GrLEnEpw9MyRJBOic5ptWHn3DN9dOb6+tSoKV8o3FhcNpzQRJlAEjcesnsYVRU3aX
	 cZTn9FiAti6/sIxPtw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72oH-1wavEK128l-005DVr; Wed, 10
 Jun 2026 18:36:51 +0200
Message-ID: <84441528-5f33-4795-a650-8b6fccdaed5e@gmx.de>
Date: Wed, 10 Jun 2026 18:36:49 +0200
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <9c74fdcc-20c2-0722-7932-8fa09872d80b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GxJmZQrtpk0CRj7j+Ue8njmFWia0UcaosYv4fZE1fJTep1t90a9
 MTAuaulFdjuzEIf7+169JnD/2QhWgLz4kkTXTmqGo+8xSb5sD5SzhWuSURSwaLa5OMNmToD
 UjMmMGvIASY9lVq4tjQKPAMRbZSc11VpAifSTYUOkiFgeY6NDeREM9/ohMiIMnx5qKmijaM
 e201X4M9yTRYUOlnuF2HA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JWGrK0PMZCo=;wMnV0jLXCSOUyvnnJAITgNvPR2c
 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

Am 10.06.26 um 12:50 schrieb Ilpo J=C3=A4rvinen:
> On Sat, 30 May 2026, Armin Wolf wrote:
>=20
>> This patch series adds support for various new features to the
>> uniwill-laptop driver. The first patch adds support for the keyboard
>> backlight available on some models, while the next three patches
>> add support for additional WMI events, USB powershare and AC auto
>> boot. The last four patches finally add support for additional devices.
>>
>> The patch series depends on commit b1a9b7a904af ("leds: Introduce the m=
ulti_max_intensity sysfs attribute")
>> currently sitting inside the for-leds-next branch of the LED subsystem
>> tree. Without said commit the first patch will apply but not build.
>>
>> All patches have been tested on my Tuxedo InfinityBook Pro 15 Gen 10
>> AMD and most work flawlessly, only the AC auto boot feature seems to
>> be broken on my device. I decided to still include the patch because
>> it works on other devices.
>>
>> Armin Wolf (7):
>>    platform/x86: uniwill-laptop: Add keyboard backlight support
>>    platform/x86: uniwill-laptop: Handle screen-related events
>>    platform/x86: uniwill-laptop: Add AC auto boot support
>>    platform/x86: uniwill-laptop: Add support for USB powershare
>>    platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 Pro
>>    platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NAL
>>    platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B
>>
>>   .../ABI/testing/sysfs-driver-uniwill-laptop   |  25 +
>>   .../admin-guide/laptops/uniwill-laptop.rst    |  27 +
>>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 609 +++++++++++++++++=
-
>>   drivers/platform/x86/uniwill/uniwill-wmi.h    |   2 +
>>   4 files changed, 650 insertions(+), 13 deletions(-)
>=20
> Unfortunately, I got this error after applying this series on top of
> review-ilpo-next:
>=20
> drivers/platform/x86/uniwill/uniwill-acpi.c: In function =E2=80=98uniwil=
l_kbd_led_init=E2=80=99:
> drivers/platform/x86/uniwill/uniwill-acpi.c:1827:49: error: =E2=80=98str=
uct mc_subled=E2=80=99 has no member named =E2=80=98max_intensity=E2=80=99=
; did you mean =E2=80=98intensity=E2=80=99?
>   1827 |                 data->kbd_led_mc_subled_info[i].max_intensity =
=3D KBD_LED_MAX_INTENSITY;
>=20
>=20
The patch series depends on commit b1a9b7a904af ("leds: Introduce the=20
multi_max_intensity sysfs attribute")
currently sitting inside the for-leds-next branch of the LED subsystem
tree.

Thanks,
Armin Wolf
