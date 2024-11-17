Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522DCA64
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Nov 2024 16:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731860523; cv=none; b=qAVWnDhDHyMM/Sc8RUWSM2HZyhacXLVPN1VhjHtQQhbRxcnMzgbw2P7TIASnveHMN2SHEMU8lcd3lHJ4nNOK+gc/O9qwiRNINWUB3Q/Lw/dG086McbwocNouNUTbuKawayUlEYjuIkB+8ut1UHai92waRSuFBKrW+o3KWwrYcGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731860523; c=relaxed/simple;
	bh=2qKu9p3+IC3vQZD/JESy10h3BLNMza5h0ympuwjDCPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glKuW0l2cCfbAjzE9aQT6Mvc+E7l6f4icyUqT0y5BC5JzYE4X/l2wCic3RmwDGgdHXNl7YNMh4UEVhob19lEHEv7vnr159D399q1V2SqEROwqBeCmicV6er9TMnV1KO4wP5vGL+h6NXE/o6NsSXRc73Jqr34g3NoOmiktUvHtTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ivftn8NA; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ivftn8NA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731860518; x=1732465318; i=w_armin@gmx.de;
	bh=2qKu9p3+IC3vQZD/JESy10h3BLNMza5h0ympuwjDCPM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ivftn8NA6ODWizLxQjMHHjUUZ508Fpd0w+AgQTfSEW45VDIVrOGSmsTgWIi3IhXG
	 sk+bglaGe0evIVQ7c7P/9SMUYVpbaq6StzMYcSQuPhDamjns739cgsYdcQbFdjfuY
	 OMjEutOtC20UhWi/Hut5+6yv7TB7fUQYz1bmd9mUmSnO7nCW+YX4SbmeTQZFwplIj
	 FAkvlVwKM9pblpIOrJit7tBGvRNZ7r14IOlvC11gWDNYt2dN1lOZvxQUXBBoBSRm0
	 s+79bqqwPwLhPuGauFsYgbomOujU0LEQQRArv7d+cyYJX7446ZSq+2oDN3dxp21zg
	 YQs3wUsBrv+UgU5Jnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryXH-1taF8q3UHt-00cOFB; Sun, 17
 Nov 2024 17:21:58 +0100
Message-ID: <ba283df4-a0ed-4759-a8b5-384666f1a5c7@gmx.de>
Date: Sun, 17 Nov 2024 17:21:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: bbc42008-f121-4710-a27d-f32b9deabcac@gmx.de
Cc: platform-driver-x86@vger.kernel.org, rayanmargham4@gmail.com
References: <2ffb529d-e7c8-4026-a3b8-120c8e7afec8@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2ffb529d-e7c8-4026-a3b8-120c8e7afec8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vOuJ6Oh5NDJRyKyYYrEz4wLrkMfY90HBPLZ8ufDnlgcKpbL/Yk4
 2d7ADiS1mY8zN61oowTy48mCmArFOXEYkoZc2jqpykM+bntTl5953fpkSM1B1eHxjCTOXli
 xfCgC3vKkTii3qtIHT9DdjTP1WozlHA0jJagpYf984p+Q7uBi1u9RhUtiRUrKymyBJ6s6N+
 3yz1z4Iu+JLTazeBJwPNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bI6NSmqogEk=;NbOVF42fvdSLUfYNawzOLGUYVVj
 vA8ZmyPgzDHKWwP4FivdtkPV0vmkunq6EC10fqKI7KsOZiUMWvGtLKgMd08ACOm1kb1t+yWqZ
 7e6SXLNt0xfxyJAZQdrVJoYga1F8kexx7GQIJvPtOkeVf+MUTZAy9liSPJeY2bGbvA3UXZPpm
 yZkOnTSv4qVNxohvSg6V21Zu3SIDcY4CdB20Y0ApQZPynxbjt3ls3lwUpZ2VK+69IrsReVpag
 V0BxxZCzXyBEdpjRruKXTiY8ikeLwvrqoTbH2WKcQZ0R4RKndqRE7gegkxSJifwztUbWTEbF8
 0gWo9HnEgIgVVN6WOImgsK++xB8fMCvM4VOdP2/YohjQFIXr3SMguCDVIslhMrGVCTMXM8zKf
 OmLci5qY0mIVt39tMzJSq0+Qh9EAIRL0JMKMzZyCm8OSMkzCTWlBYrF+I8O3sGrP/uXsEhZO/
 ViIiNJyE8/SyEeN6zXT2jAsxCa1u2K2lJLKH/hoBcG4bNtoYHMElal4bUxWILgOncQ97UnArL
 fqVPDCUmFPyTLxa33+qRKb/FHidIK9nOWOQ1q7b2Exe9oMMi88LPi0yCgOGKNYcvOCtmLpwRw
 41gyCA6SbOObQsBeg8qJa6k6Q51ssM0+1nOAUXPG/J1jNSeIOHwQB7BRCwtr9yEq2hmTRhcIr
 BP+YMbdFB/a4BHD40599osLP/ZHWiQtLGxa+Ido7M5ASKFliK/YHQMEanS5qyz2atDOd+vO6O
 TVlDPNJaXSrxgt0QDUIIH2egvUvhJtx3/frQuc3YUUqXVf2ME6HlCWtQtDSVp6gXKJ9Ekelba
 TBAmao0vAkB+Qb6fTe/jlXympLnzmuIpfMX4lenW4jH64EclxOqp8dyYSTzQGvi4XvNSKvmM8
 hghsakElA4rRXjJ+kwpOsjtjFQ4N5kQXV8jke6HmBZXB1tnYDnWeAF9ZG

Am 17.11.24 um 08:45 schrieb Farhan Anwar:

> Although I'm using Swift SFG14-41, I have noticed the same events on
> my laptop as well.
>
> Connect AC adapter=C2=A0=C2=A0=C2=A0 : acer_wmi: Unknown function number=
 - 8 - 1
> Disconnect AC adapter : acer_wmi: Unknown function number - 8 - 0
>
> The event for disconnection is printed twice.
> I've also noticed following message occasionally along with these events=
.
>
> workqueue: acpi_os_execute_deferred hogged CPU for >13333us 19 times,
> consider switching to WQ_UNBOUND
>
> Kernel version: 6.11.0-9-generic
>
> Thanks,
> Farhan

Those events seem to signal a AC connect/disconnect, so i think it should =
be safe to ignore those events.

Regarding the warning: it seems that some ACPI Notify() or GPE handler tak=
es quite long to execute, so nothing
directly related to the acer-wmi driver.

I am currently moving and thus unable to access my dev machine. I already =
prepared some patches for the acer-wmi
driver, i will send a prototype soon.

Thanks,
Armin Wolf

