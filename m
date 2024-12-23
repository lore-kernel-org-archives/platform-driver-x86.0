Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064C18052;
	Mon, 23 Dec 2024 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734988751; cv=none; b=GEBTjzTQGWw00Dl5CFWhlagt+FYXrVO+OHX+i84OvoEFIiLGxptsHa3TvATizaYI/dmgN+jQJb/wnEWD+ZkP4YS3a4pplrDQeRgXx20ulEDJZkXyNXtVlIxydwRYivtaUKbIdE4RACe7srfi4QQl5s4sZpQVAwVXn+Rw+cSViAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734988751; c=relaxed/simple;
	bh=VizJ/DjyjfGBqh942G6Ce+JR1OqRe04RZhaa7DY9EsU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=DmqD9mUSJQydehkyfUmSxKyFSaBRNYMoP6xvRJGe+rqqjNoWpDIeyU3iAmCoFvgTd6bqKl0YDjWYVI09dCHpLvUre1y9hr/cXHEu3BSquAdyOogqKKQU9eu6TPRJUVyRUZ6pboe/Cg7bWVYMw8AXhZ8/gYos9wfKI6h+iQLv4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=P/o22VxP; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="P/o22VxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734988737; x=1735593537; i=w_armin@gmx.de;
	bh=VizJ/DjyjfGBqh942G6Ce+JR1OqRe04RZhaa7DY9EsU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=P/o22VxPt+v6T8X4gAlNBNbJJgajYnjxgt3s4pUky/61qPMpwkfn5mw94KAnYC5j
	 RgMdczvn+W4PlA3TmKTEAfRT6GAGAu0UxoRZk8eUJPGO5+KQa3+oM0u8qMcsWLDZh
	 gfUhm399a3pLs7PaqRfZYemGD2eBt/17AQVCZuOhOT+RK9/dXemuQ4Neqk9wTfozW
	 fqSK7fD+lfk8+60S1m+SsNRnsKhhe5LkarU4EKlBtYO9sDy4gaU558riX0ffXmL/u
	 wyij63t0FBS2HpoNp07G2/NABUjX1DSBY8QArXfqhumuM5b3aiR5kqV9Jy68s/Lv8
	 wBQO65dFXH9EnhDrgQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNpH-1tolau2G69-00hlv0; Mon, 23
 Dec 2024 22:18:57 +0100
Message-ID: <051c9272-b466-477d-9b7c-2d3a635053a2@gmx.de>
Date: Mon, 23 Dec 2024 22:18:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jafar.akhoondali@gmail.com
Content-Language: en-US
Cc: Lee Chun-Yi <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
From: Armin Wolf <W_Armin@gmx.de>
Subject: acer-wmi WMID_gaming_set_fan_mode() behaviour
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:noAEW6gYI0GmVcBfaPrZ8LNDjIxEythFl15l7mjD3oLDD41lXzP
 vGnwlk2/9thkau9d79/DgovBAajX33dOFNOSfDFTMvMLgV24qiFpJaj3rhCmj//L2v9KX0c
 TCbpQwiZLgqKN79oyoxoUnBPY9GhRSxhD463D7qeRasgz7kthphBvJ7vuNrvJC2CkjgkCRW
 cIZe1zxofD6Z2mjRupPJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n/rofj4Te8A=;RW8bjOpN81+j0l4MXZ19ycJcrcG
 FkyMXyNVNWFB+N8+kdfwyV70R9dWc9xVp+cLu84nhqfjfgyBQ9Kxy7LyJbgLDIqKepEkT+KPJ
 BLioaabs2yeM8IpJ4+nEAJsXsPLg9QNySn2Bfclp3jQv0SEX+WnLZPWTNbt806Mud+Fz0nGQK
 hPt0iVGejvDKFg8ijVYhiHq61AxxlRNIHAimWa70wsJhRlViHtOath/8JGTvvt1Wz1vciaITT
 lTNfDCxXr+5jO33Uv/dMjcum++CuQNtuPiWRvP/B0WxHg0PT2KpGl9Z+JwobDtmNzG77z5sS4
 D32zfBmb9+WRVwOtxfMDbuETmnPV1ZrkkyZ/r5smhqqh2eAeD80TMV0JqPmof6W+3AxCaAkQc
 pf1LUjusxB7tolRWdRyEdGfzY5VWRs5oQ5XKI99ASWTKgRjOYsrBc1b6OC6jpwABp0eKsxF95
 21eyJ2VecWb8spAEHIuVd16TvucmgjaMlP3vW5MzGa4LFPIhx9gORQShIwNmE/rzzmP/GCsIS
 6/z5h7a2CuL83YdeBD0DunFNfBr1v+E7F94Z1OxkL/XtOk7TzNZpJosmeoqKgHnUvTNqzcGUB
 8hXBDLCuBfAsMaxTAVBeID6agEnNxbO3VAQdo79DQ5BytpKdthJ8wfQTp8tDsj4VHNg7vEWEH
 SUl63K/IQD4vsQDoH3aysF9RHrSURM8psupMu3rWqsZelKIfbZQExg+NnydCL874C+yxZU119
 jhdHTH8ieoW4PlNf+vZAH/F8sUZwqQ8MruGhQlYBMgCKG+tzeiwObS1E+2guGP9r+PhDd0hTG
 TH1jyWJovEfQ+ZmMSSwUYFES7UpxPWSYzt0ckkJmGMII+PBHZ0jxpMiXIygsrDgxi1fKk3tQH
 FAo1rdwFBGBDvtDf4wgnLX6tJKeQaM6dWbRr8tPRDQ571JX3Jv79Vaw6IKp7qz3SSX+nELlOQ
 hOT+OZwf/LRayhhXvEfS81Fe3ZblVLhJKiQIzCAgGCEkwlpwr9lxnHa3QGcFk1gntK10DYuDU
 zT+s6nZsnGsmpKPvd1ieNSGqO47skxpho+I0zrPEl8kxoul67bkfELZVXwKJTGJUnUslUDOq5
 vSKxjmV/o1GAtL95xV8+7She6fLE53

Hi,

i am currently working on adding fan control to support for the acer-wmi driver. So far
i can already control the fans using a hwmon interface, but support for switching between
manual and automatic mode is missing.

Switching from automatic to manual mode seems to be straight-forward: using WMI method 16
to set the fan speed seems to automatically switch to manual control mode.

However switching back to automatic mode uses a different mechanism. Since you are the author
of the WMID_gaming_set_fan_mode() function i wanted to ask you how the function exactly works.

In the end i hope to use this function to switch fans back to automatic mode. By the way i also
found a way to automatically detect the number of CPU and GPU fans for each machine, so maybe
we can get rid of the quirk entries for that.

Thanks,
Armin Wolf

