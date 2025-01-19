Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3DAC2C6;
	Sun, 19 Jan 2025 00:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737245380; cv=none; b=gau+GoKzKo0QJ/xiOZKJRjoUwCSD0K8a5pVzr3qP9VOnLk7Vjvgs6yMiznYfYG+3RldNEm1BFd0VT6F3KHupdJZpEmkG5SW2nhxd8xGTN4Vy7PQw9kfbxj1PNqwljCnDV90mPXgmy+IL7pEMQbi0i4vQhG0Ba9GhpOCitUfD34U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737245380; c=relaxed/simple;
	bh=wrZ/Npz5CIRnsEly2r9RBpJvopK9efF9iOvCGVu+YFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyaGNRLv6evEo4gBVdu5E8Gg+OhUI8YTOReww+mbZ79E1UUQwalGEpSMWjgPCszz8T13rKZahx3gLYfrxKuIDQ9UGhLqFLtOVeHr1TegI9chVKZZPUlhpJmgLkigUTweujCcj6Ygp6hcWMIsFdrtU4/tzMZERM+EEx9XoRY3fIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Tf3iXzpC; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Tf3iXzpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737245367; x=1737850167; i=w_armin@gmx.de;
	bh=N2vKwV1ZSlxFRXBr6gSs0+tMISDKY7xG+yx3bJCkWE8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Tf3iXzpCj1fulwT0RqkP9saBob+psBSos/NA6IlY8Uw0kfnMMnduNXwoBW0zkZmt
	 p1it9icd2heDMELp3860BwMhqIXMhAPlGgDrOyPvxir6iChyD5L41W/tswEnCz/Pt
	 kNsqH15h+V1UoTF7i4iPRn8wu4g4UimOYIF8K72uZvhjzqC4k/+03LQvtJj4qVq53
	 yzkUaEpu74AB259xnqgn6CQ7kj7+eczxJDPKLC2cakg/LN5/xdCn35QSjZbhhtFDv
	 rTWEYNh/cuRG17vGcMCjKwHxkE45SKtvHvA9xwc7ZVdRMtSyGyq5kqTpgwOnXg83S
	 ly9Ciuvdwjfim4qvxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.251.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5QF-1tmHYm1g2R-00Dl1T; Sun, 19
 Jan 2025 01:09:27 +0100
Message-ID: <317cb392-019c-45d1-b29f-62c378a1daed@gmx.de>
Date: Sun, 19 Jan 2025 01:09:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] platform/x86: alienware-wmi driver rework
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250117081347.8573-1-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:mLeKxSJrpxcXgbQpI2JiFeuw1Osk09FCJyH37kRmEF3A1WKAwVS
 /3zf8WLVg+r3dohigPaRDhAlJHbAu56R822PR6xx9QwQL6bPzDSs8UOx/ZkwBfc06pVTlxs
 ad/g6Ls/7vlfk23g0rUFH1Kow817j5EK/lK6JPN1GS4n9vW1O0j0UpRse1PhNc7IrU1OMBv
 GqNDXb3z777+PkUrDVQuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mboBJnhVjOw=;mt+OtHcWHbGnzlHk6yTOmW0cQcD
 aG5oUHvaWtPkP8gptJezvTLGK5GSUJpIu1fXTawxxJ9tblpak39tHgWzKbIZkHU6ifH/1G7dI
 TBT/1H6XTHoIG84UGNnxt4SEYaW5A9/cbUNLXDYFzTT8QVK9jI4EobktdTStdQ6mw6whEeQIm
 Smp5nrYZkCqb/dz82YqLqoJNm74BY/AghCXTnUaD7Q4PlebgjmS2k4w9oCQWI6spCmlKtG1oe
 sBUt8XIKfov5vO0d8LKD5n4yvcydX7NR6uEAR2bFbyY4prA989F7BE0rilhtRTPZAdFWRBqBC
 ZXQh55srnHUUW+5Tn2dj+CuK4YPz/jZGAJOWo8xukzbmk2Ood28s87oHrWUuXAFXytPXpC9uF
 cLA/63N1qKhml6XHPKmr0VZpXgdKlhsLeEvUckSMCZ33a+kKqWr+CO3u64vXcAZ76+IDrUQrI
 cKk0S88cSbhHYkwLLutupDXS13OhX2XaBh66SQliEte3PksxnDQCXGIe10cI/Wn3DEcjhlb55
 gnEtYeSoafGfcs490eT9JhSxLQTvemT8qqe72G6tvPVHo+MU9amZB7lS4vffOQH5B5gM1XA5O
 OtaObx+OdDdMzF5rYdfb7MqLVdcRVMS3mv7PT3u9kUATQASMB65cFQ22l3uTvmsdk/5p7RGqk
 F5xT/vu4TDG7R8uhnTdx/00gmXlzjuw6mXhYVSE9+56ytX7XKIVIJ1LXXuEviKRzVYf6eIBxJ
 UPJBCqYh9f1tYx69gevrG2EKApe3L5pKdWZKYoN13/Ay6BvLiJaUDRLIDfkGBJsT6LIzJt0RM
 4+yfwcgaCNjX3vdIsDnR5PjFdPkjmCGG6ud0xu7xDE6hTjVWQ6G8ZbkMX4/ajd7dHWKYsLT3T
 +eeUl3Xr9UFbp2JbGNwRRU7u9l5L3177qUSlh5Hn0GUma2teQYgqeQtTboNx1GC1OCIQCjvqj
 yqx6s+ThlHdvrNLYp0JVCVFTWRhMQj38bsgpTroxvFrGW9SN86dxTppoTOoVR9gM4nxfE6cO9
 rBehC8sFmSE4/ppNAbESI+UjWvzSsfStrmVp7u6gBaV6GeHOa7zXRy0xcQvjFCNQvPw/QGkY+
 n8w6VkP9PcuKnLUT9NY3110QoZD409fubrilyJRaC8ENLsZXsOC3/lTzjkc2SSYXHCWFzUj/O
 As5ryD2LXcHPh7d/RFtM/AnJMJYZzikD7Nfn7sUcVuA==

Am 17.01.25 um 09:13 schrieb Kurt Borja:

> Hello!
>
> I rebased these series on top of review-ilpo-next branch to pick up
> platform_profile latest changes.

So far i am quite pleased with the current state of the patch series. The issues
i found a relatively minor. I am already looking forward to reviewing the (hopefully
final) v5 patch series :).

Besides that: Did you test this changes on a real Alienware machine?

Thanks,
Armin Wolf

> ~ Kurt
> ---
> v3->v4:
>    - First 6 patches are already applied so they are not included
>
> [01/14]
>    - Reordered some lines in alienfx_probe() for aesthetic purposes
>
> [10/14]
>    - Removed pr_fmt from header file
>
> [11/14]
>    - Copy pr_fmt to each linked file
>
> v3: https://lore.kernel.org/platform-driver-x86/20250105153019.19206-2-kuurtb@gmail.com/
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
>   .../platform/x86/dell/alienware-wmi-legacy.c  |  100 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    |  773 +++++++++++
>   drivers/platform/x86/dell/alienware-wmi.c     | 1235 -----------------
>   drivers/platform/x86/dell/alienware-wmi.h     |  102 ++
>   8 files changed, 1515 insertions(+), 1262 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
>
> base-commit: 81e8e5017f5de3cf28004ae2b628629ef4d43635
