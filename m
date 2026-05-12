Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC773B1ECC
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598885; cv=none; b=HN+YbZBA4TbImYw4Gocld/Ipc97q+aa23uzVXqcOXpBGKma/ZFzwEG3vdiPdWF9/gqDVR5999Yw1Lw9ErAzFC1eyFQo1nyRvsihHuvNzxIdo7VLMBACib1ZnhBj6HzpbqsAOyiDHZVQtKgiukEaolqGDm3xDtTqykJho1DMmc1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598885; c=relaxed/simple;
	bh=+ISAD2AXoO6YZBg+GF0shNCMYFjbxBpDGdGY8+knDMI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IrLpMKV7GMBHZLIofKppmN2LPKCW0hyWRdmcykEA8R4nGAm8haY/hZgntCA2enDXl+78YND2EknneK8YaZs8aTiYtwk0ypZGofNSqAXRdmYGAMzs8cLAb9NIUSXM45LuWWDeFyWLdJoeLojTzsQ/IGfcna34nP5iJM/fs5OjeT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2yJQgHA; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2yJQgHA"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f0ad52830cso8251705eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778598882; x=1779203682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SHn1yqg/UiE28tkXt42cYV8RLNNyeHXsTAHsG4ZY05Q=;
        b=F2yJQgHAEswlAwtfTvF+gCi+Z7UwZGo7ZyZVW7tUP2d6HVYaZXM57K3ZkddlZCEBZx
         zJSnpTCAEBDwXPCncsc4reL+rYc7rE8SlAq7tTEtCAD5efhfNXzKOmQD7bKYiiuitoC6
         DCfxepMzrYeM9BDrTES6B3c0r3sOJsJeNJV4V3WzrnNA/Dzj4EuZzeWYmJHH4Vq3ZMC3
         +uG+Il6t0hmyF2kOtPxoW0bVl1tZ4gRz0yQBOW5M8Oo0eZxva5F3HKlFD4P9Gyy8d8Uf
         u7P5/J+gk0c3OPeNW1lBtqv+8WIsnzMNMAxeuN7iJMrMo+w8o/kfOqQBtNAEVXNhHcvU
         td6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598882; x=1779203682;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHn1yqg/UiE28tkXt42cYV8RLNNyeHXsTAHsG4ZY05Q=;
        b=LAyJjUWwQ3vCl+/JXzgjKq9NPhFBhZeqzoBwYAOV4zCJ7UJ6VnLVS385fnrdeAXAZy
         wGi/ytM18sLasIqCNnsh+i8ImCnFDTxGtxyRrPs21IaKVwwXOduhlgAthm7LmIlji+wd
         WbJG7kjaNW8HCEU4xPsWfbt7gmY9crM8yUmhfkD3BCTcDAfRb2GxHOVw82NGBxbJQjh6
         0eoHq0b+b4KBHbZCaxblpZ8YGzkL4Hb4IeB05W1c4I9bAJOOob6xBDxyqjMujPfsXmQ9
         +GS77PkA6dkwW6grUHJf+FSWH+tSJCk29mGKJy9S6xeapmhGQ98Up7HcBeNJwxQmSX21
         VmKg==
X-Forwarded-Encrypted: i=1; AFNElJ9G8Mcnr8BzP85ZFyA4wMiA66yuhmuroZk+DPz0r8Bq3mGTSvTYvZBQ9+bsJufFy9P34A7BvQMLrjSUk0CwoP2iXWRR@vger.kernel.org
X-Gm-Message-State: AOJu0YzXho2jK799Bql4IeEymNwN5ZKXN3QDDbNuR4HAX8fTNIkibkJm
	+AV1TSm7Wx0/3Ff1j0WQ1htid5qfkb+nSKyM8f32vwy7kfb87Tu939sV
X-Gm-Gg: Acq92OFR+kfdXIuE3Dd0FYIFPlAIM9A3BEpHFzsY1AKgM23Lc/PZV4SGWu69s7bhyiR
	OlwSa4Vbv80zN1fkFGPmO7CFwVaOOszqNbpszrvkwgsfD9DGdKoR362JPxgGS/30H1VZgtlPUPP
	LbyC6zHpvck1vmX37v5ixweSzyvZTLMJAk3T9w6x4Brqi+LWTBtVNOA80dPbBfi1pARrQ+QlOsN
	4BP/RTW6Ri4TI0dG5NuxSyMgf8ZM8YAO3jYpJy6VYQ1Y+xKK85VAjj1GWlhBjQ4dEP+WDHkQI6c
	HH9NZmyEOo2b148mdkxHehpF6tIn8AGakyvYI7H/bdTWYN80PVwWFkP8bvZiP784W9I19WIZcJ8
	FLmFne6FVjLvEAvSNRonaazYtOzzhg2iTGdxo/eUjgg7k6GPM0u7j2Q7mktUwofgTo1avBq0YdF
	l+R0PSxVJqowfr6iiFRZucbwuNm536oJfT/6voXysCbf8=
X-Received: by 2002:a05:7301:4601:b0:2fc:9aa8:83da with SMTP id 5a478bee46e88-2fc9aa88c76mr4296780eec.29.1778598882219;
        Tue, 12 May 2026 08:14:42 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb90:8b60:89af:ad3:e552:812a:cc1f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm17788583eec.11.2026.05.12.08.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 08:14:41 -0700 (PDT)
Date: Tue, 12 May 2026 08:14:31 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Ahmed Yaseen <yaseen@ghoul.dev>, platform-driver-x86@vger.kernel.org
CC: yaseen@ghoul.dev, corentin.chary@gmail.com, luke@ljones.dev,
 denis.benato@linux.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org,
 asus-linux@lists.linux.dev, mario.limonciello@amd.com
Subject: Re: [PATCH 0/2] asus-armoury: gate PPT writes on active fan curves
User-Agent: Thunderbird for Android
In-Reply-To: <20260511061901.907540-1-yaseen@ghoul.dev>
References: <20260511061901.907540-1-yaseen@ghoul.dev>
Message-ID: <79556116-6362-4C2B-ADBA-00A325D79CB5@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 10, 2026 11:19:14 PM PDT, Ahmed Yaseen <yaseen@ghoul=2Edev> wrote:
>My first kernel patch series, posted in agreement with Denis Benato (Cc'd=
)=2E
>
>On 28 ASUS ROG laptop models flagged with requires_fan_curve in the
>asus-armoury DMI power_data table, the BIOS ACPI method SPLX silently
>discards Package Power Tracking (PPT) writes unless the fan mode is
>set to Manual (FANM=3D4)=2E FANM is set to 4 by the DEFC method when a
>custom fan curve is written=2E Until then, the WMI DEVS call returns
>success but the firmware ignores the value, so userspace sees no
>effect from writes to ppt_pl1_spl, ppt_pl2_sppt, ppt_pl3_fppt,
>ppt_apu_sppt or ppt_platform_sppt=2E
>

This very nearly touches on an issue that has been present in the asus_arm=
oury driver for a while, and presents a possible avenue to correct it=2E Wh=
en originally adding PPT adjustments it was discussed that doing so should =
be gated under the "custom" platform profile [1]=2E This was simple to do f=
or the Lenovo WMI drivers because that interface includes a BIOS custom mod=
e and requires it to be set for PPT settings to take effect=2E This soft "r=
equirement" was missed when asus_armoury was accepted, and it currently all=
ows PPT settings to override manufacturer intent=2E Please correct me if I'=
m wrong, but I believe the fan curves associated in BIOS for low-power, bal=
anced, and performance will not automatically adjust if a user changes the =
TDP outside of the window=2E I=2Ee=2E setting low power and then maximum SP=
L would leave the fans in a quiet mode=2E

Since some devices require this bit to be set, it seems like a good opport=
unity to gate the platform profile under custom, and use custom to set the =
performance mode and this bit, then allow userspace to set the curve and pp=
t values=2E

Adding Mario to CC for his SA/comments on this proposal=2E

- Derek


1: https://lore=2Ekernel=2Eorg/platform-driver-x86/20241206031918=2E1537-1=
7-mario=2Elimonciello@amd=2Ecom/

>The requires_fan_curve flag has existed in the per-model power_data
>entries for some time but was never read=2E This series wires it up:
>
>  Patch 1: Adds the actual gate=2E Exports
>    asus_wmi_custom_fan_curve_is_enabled() from asus-wmi so
>    asus-armoury can query fan-curve state across module boundaries,
>    and returns -ENODEV with a pr_warn() from the PPT write path on
>    affected models when no fan curve is active=2E
>
>  Patch 2: Exposes the same flag to userspace as a read-only sysfs
>    attribute (requires_fan_curve) so tools like asusctl and rogcc
>    can surface the prerequisite to the user before issuing PPT
>    writes=2E Documented in
>    Documentation/ABI/testing/sysfs-class-firmware-attributes=2E
>
>Testing:
>  Verified on G835LW (ROG Strix SCAR 18 2025, requires_fan_curve=3Dtrue):
>  - With no fan curve active, writes to ppt_pl1_spl return -ENODEV
>    and the cached value is unchanged=2E
>  - With pwm1_enable=3D1 on /sys/class/hwmon/=2E=2E=2E/asus_custom_fan_cu=
rve,
>    PPT writes succeed and readback matches=2E
>  - The pr_warn fires exactly once per rejected write=2E
>
>  I do not have access to the other 27 affected models=2E Testers from
>  any of these would be appreciated: FX507VI, FX507VV, FX507Z,
>  GA402X, GA403UI, GA403UV, GA403WM, GA403WR, GA403WW, GA605W,
>  GU605CR, GU605CW, GU605CX, GU605M, G513I, G513QM, G513QY, G513R,
>  G614J, G615LR, G634J, G713PV, G733C, G733P, G814J, G834J, G835LR=2E
>
>Ahmed Yaseen (2):
>  platform/x86: asus-armoury: gate PPT writes behind active fan curve
>  platform/x86: asus-armoury: expose requires_fan_curve via sysfs
>
> =2E=2E=2E/testing/sysfs-class-firmware-attributes   | 25 +++++++++++++
> drivers/platform/x86/asus-armoury=2Ec           | 35 +++++++++++++++++++
> drivers/platform/x86/asus-wmi=2Ec               | 28 +++++++++++++++
> include/linux/platform_data/x86/asus-wmi=2Eh    |  5 +++
> 4 files changed, 93 insertions(+)
>

