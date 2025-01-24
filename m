Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DFC1D54D8;
	Fri, 24 Jan 2025 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737753551; cv=none; b=GIENcnw/1ukwWM1PjhkN3V1CaXkftQwnWI+F2UJBfHCmvQwqRneqWwTRdcJAeCaRMyF8zU3J08ciGliWbBeFdWIA8S7PuDU0fNFSqRxX2B2f758VUljHdy9L6u5U+f0wf3gSl2ZEUU6GQbcLNVUyIG8mL0NekHuVK25+HH4/svM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737753551; c=relaxed/simple;
	bh=8TXOO1XciCkX3+v4EfatfPTfwr4UhjsqtYPrjeNpylI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKlFrwWiFYpY36HsHk1m2mZH43phqqw9rs6TcFHTJd8pHll//A9qzNsgyBgwKWkr5A2ntlke7wCocLgM3FRDCzYE7hd05wKV64M6ToK3LgF2qoH5RlsZfZKdMxHrClJ7+P250HCmx//JDvCEBGR+pn+CxNil4lCLEQPXTOGfvv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=keSDpJqD; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="keSDpJqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737753537; x=1738358337; i=w_armin@gmx.de;
	bh=JESY+zdup80QBhSG9ZbLP2nx/jZdehViaOIQBlfLsNw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=keSDpJqD9qOirI+upcc51EKxpSvM7LYcUl6zLza7zKPZZ0cE+FOnIX6Yg+Nh8Wgk
	 vG4XoQn3gkc0KRK4Ga387R69BMEJaBkouNgJDdGVM8GsTrRJSeXOYjL6Icya8AyWy
	 HG3ZAVySifo3lEK9vC/8CranZlPHUZcbVauhkAhxDZ29Tp/TImAGXfljEvqi+Mas3
	 LdSH0hIgATBfKiDU8iJiHk5UvV0r/AV4LR2H/KxUewCtsyMKbnCFGWJBk6FiGF6AQ
	 MMpcf7CnsM/IsSM79qaX9OPmUOGmpr/Nyqov6wvEDm5O+cUKy96pZxPLNjBFEQHvs
	 qL9IB1mJT8zThRoKWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.246.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwfWa-1tIPrW41nO-016YVy; Fri, 24
 Jan 2025 22:18:57 +0100
Message-ID: <f60a6e96-cd13-4d2f-9024-2c01f4ad8f0a@gmx.de>
Date: Fri, 24 Jan 2025 22:18:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/14] platform/x86: alienware-wmi driver rework
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250119220542.3136-1-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:aWHj18IjDW1jMk22wiP8oi2zXPTUQdczuKx2rNU9PC9emi+V63F
 mnEnZf2hmMg6ITz3D1SdJnlwbcrrRAObYi+E+U1sBscZUAQ3gnJT8nDH+wEp3qPzLb0hn2R
 m739jBzN6e9ICHEgZj6GGbaZvglugPcJQAF8HmQLhgFk14GVLE1LgHc2SNJ8Keg8M5udCJK
 BZJGOzfS+UTIzgLVjvdWw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LqtkhS8NoWs=;eMgm+8XNoocFgqKOIO1n3JQ5AuO
 C6D2tmueX8xmAEEOiE9g10YfZGNrCBWTrGYkJo6YgAxVWHaV9zx7fQiMJrW9PZbe9EJmpWT3/
 oOFSn8JR1tMqnrP6kTXzLy2x9MbQPdmnIod8+P4YjnNf2E7hhwNxQOmnwsaI4x1h7I305vKbH
 a5mNPz+WCaxsdfyj86K4Kfi1Y0+AdCro8YJFavan5ppr8dJYlu3sVqEF9/6UR7T8taiWEOLm4
 o2DuqD7nonlzmE/T9pMjeoBTyVhvgTf4fRVAySOFKTTw3pLA1g/zDoj7GGfbCBUsNDBXkGXSu
 k1+w/Km/c4Lk/5ZHLN190rzJDTL/ms5gmVZieKUhH8iPwDuVP6+ikwm/LFQ6S36WpXV9U8Egi
 ct4pi2WOkkBKghZxJNiB7M0xZ62Ubz0VTljQZd8wAju/J9Rxe/x/xot207fzue9tVnWGbxBWa
 PHSDDoMERAOPnRkNO169P9T3FbwuvmvFsGENXo3ub6Izq2aGL7veTs6O4u/LfncMj7RowUt9r
 uwgu5HrxKPm4eKud4ERrpgk/WEwffsluzIMrK+0foqxxyOu5SRQqZBhrGOIbbeWGaQBbJuqKo
 3xD2V6ewkRFOJ4T1L1M7tZ2zyPsXAfMODHTxEPZHELkEqhqhP4u0j7B6qOtQzAsI3FtDHsiZ1
 Wfk73t8lMz7ECAXWnX221p+tDsEAL1Or29DK9sfj7Fd0QD6d/V/jDxFPdLn7tAZHXY+cD5cQ3
 q88zkTYUFf/I8PwPhTzkvc02seV/rM60oSnU9+KAbUneGINMXRWwm60pVjlJl6KcWqad8JS7w
 ZQVFcthKMsqHvpsYXYpZFx1uqVnAkIMfVaDNOykjdHvTcA6aLHQMO3o1X42jhl0HfupR9q6oc
 oVXOt0XyOyJibAYY4MxWc+feD+gZD2lF06x86KVUc+yhNI+H3urs2zaNiWSQXr6RfMl2Luhb5
 qfavPGpDnMAMCLgRlZuHr941vLluJitRCEycTrWq4w2Sca1k6Q7w3kKiq3NYDxOGdtdw7WVTj
 dEIlyzLT0AORFK+Q62sbMqVXR20bdfbJCwTggNwyqpdgtviQgfHnZPUe23rV4iwqVGiZ47ORM
 OiYXuT+4K/7wyD5PYKVhIOQFa7wjr1UqogSAos1qfnK9tPccbI7YTFfH+1Lr5VKRLsygbQ/8i
 2jrq/2G0ODZyClXtxDGd6/b7NWuMGN3uEfUyct+7AnPJh0lH54CGVziEmbw1O8tTiWvCjGXkD
 979DKT0Itxwa8fBzjBLMSrj5Vh+2kuI7y69rnpkrVrGfQ2Pq21Qy+/6h/lpR4XdsnjmGNGqp6
 y21WE/+ksn9+fV0JRj/Gmi+xgQY5dT9eg2p/G5wN72kMSs=

Am 19.01.25 um 23:05 schrieb Kurt Borja:

> Hi!
>
> Based on pdx86/for-next branch. Tested on an Alienware x15 R1.

Nice work!

I think the whole series is now ready to be merged.

Thanks,
Armin Wolf

>
> ~ Kurt
> ---
> v4 -> v5:
>
> [01/14]
>    - Remove mention to visibility methods in commit message
>
> [02/14]
>    - Register driver during module initialization
>    - Make wmi_device_id tables const
>    - Add .no_singleton = true to WMI drivers
>
> [04/14]
>    - Return -ENOMESG if out_data is true but obj is NULL or not of
>      ACPI_TYPE_INTEGER.
>
> v4: https://lore.kernel.org/platform-driver-x86/20250117081347.8573-1-kuurtb@gmail.com/
>
> Kurt Borja (14):
>    platform/x86: alienware-wmi: Add a state container for LED control
>      feature
>    platform/x86: alienware-wmi: Add WMI Drivers
>    platform/x86: alienware-wmi: Add a state container for thermal control
>      methods
>    platform/x86: alienware-wmi: Refactor LED control methods
>    platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>    platform/x86: alienware-wmi: Refactor thermal control methods
>    platform/x86: alienware-wmi: Split DMI table
>    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>    platform/x86: Rename alienware-wmi.c
>    platform/x86: Add alienware-wmi.h
>    platform/x86: Split the alienware-wmi driver
>    platform/x86: dell: Modify Makefile alignment
>    platform/x86: Update alienware-wmi config entries
>    platform/x86: alienware-wmi: Update header and module information
>
>   MAINTAINERS                                   |    4 +-
>   drivers/platform/x86/dell/Kconfig             |   30 +-
>   drivers/platform/x86/dell/Makefile            |   45 +-
>   .../platform/x86/dell/alienware-wmi-base.c    |  488 +++++++
>   .../platform/x86/dell/alienware-wmi-legacy.c  |  101 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    |  774 +++++++++++
>   drivers/platform/x86/dell/alienware-wmi.c     | 1235 -----------------
>   drivers/platform/x86/dell/alienware-wmi.h     |  102 ++
>   8 files changed, 1517 insertions(+), 1262 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
>
> base-commit: 4055e18bfbb7cf077da2bfd74615604b6ca51c6f
