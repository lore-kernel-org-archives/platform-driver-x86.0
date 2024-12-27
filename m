Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EB0487A5;
	Fri, 27 Dec 2024 04:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272563; cv=none; b=HbxN7nd5Oy43M+zsM93HnwtXFBcHoqVQSBLvoru152ZLtWQ1fXjUmCCHUk183BnTRUpCZDTeze+rRmujI+SgqrImJm79pUGvwQfrGn9ICr/N58Ct2WmOUhhbNoyCJL4AxQkB9IW+h2upuotjK/4+UUSq5A6NIQRMpP1JtOjfWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272563; c=relaxed/simple;
	bh=lvKds8IrRRVJmpg2QY9ucVYj93hM/PZbyay8SeAYiAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbybjVo019a7pAPK9bPhBX5IZ/slaoDoi9JN01UOfqhBXf9tFgQRaKypm9kDBwn1aQl9Bcpxuemm/2Yd0d7ayMeMtSg3dSlqxX1QAt4n4zA/bZz9PuwJJhYjWUwHT/gR4n5TmUputp2mA+zYi9rAVbk0xoxIVlgO03E9I8ZaiF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZyVsKyVc; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZyVsKyVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735272540; x=1735877340; i=w_armin@gmx.de;
	bh=i/UMJ6yTskwJ4B628F1VXFMbLYm5onEfYvcbzoQ3W7w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZyVsKyVcNfDBArTlf/D4CVFBzrw1zGwsEyDa2qFCq0AHNX8MUdxptNMQVBtBMsYd
	 hkfgP0TSAw6pruxR9pz6i1Ua097m4ve/LB0x5m+sEMsb25RughquQnyvnVuYEaJX5
	 nmz8oU3qa+tbWPPgZdysR4rFXC/MkDBymkpW2JBTlLBTB5YXkKAnRZZj+SvkzQXXn
	 eqpNKCW0KFYqm9KMWOsKf/NKY1rSINCXc4aABlyHJbYv0sqyRdnQJOtLyH4fRQm26
	 pWhTX/TQ0UK6YJHwKmSIoIyoA9p+Ox6fDEfsrcHjzmeesvmX/B0Hm+3iGHxnC8JOk
	 +9Ltxiz+83MNNOtd/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpOT-1u2qVW45uL-00h59M; Fri, 27
 Dec 2024 05:09:00 +0100
Message-ID: <8b05f882-7410-49fd-987d-5bdbb69b1e33@gmx.de>
Date: Fri, 27 Dec 2024 05:08:58 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] alienware-wmi: Update header and module information
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-21-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-21-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kENAUhCwxJPJ/LmeeNJuN/LehBU+yb7sO2OX1nl8G52YZF8nK22
 swJeRr7gCeYcI3Sf3sTI+JOxYecXolX7FTGVqdx8ILtnwodluC8blmJBH66CVlJZ1xephwT
 xgi8oFlTHpIj9BUCShXY8lEdKyXBQKqFoBweRwrCf9KW9VQOOgPXt9FIZ3OGg7OPAy6nm8V
 hHzDhrl8Y6JbT0fpbNHrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BU2haP7D7GY=;nkk93QMQLcLFcL9picLeE9iIjMg
 Mc6K1oKwj41bDn5aqJZiegCnH0LCudV3cJLxh3bMGBInk6ivOmrcRjY4B9NqdqQIZATKZ43vG
 iUqlCtt6OWeeEuf87FYRTf6cwQU1XdzPwX6iAzxX0ZDyeodm9Ohzz1/3mDT8Y71bcYhWuWuJz
 ol8hIPBdssk4hMcnm48pzrnlS/g009dNlHk/Q5UHb6BSZYjSzyr2PLTwAFCwYnRUWfQN6mnNP
 4ge7TZHuSHBBcJDZwnSA+GPzWDiqT8oCABrB/cbFmPvEsFYJV0UBs38h57niGCu0Ta6hRzfxj
 cDr2iQicoL3RKwXroxHWPfvGxCrnyPc0jY1N/ni+sKv5kWI5onMbhRCq8AK8A9TDTH7CHXIKz
 H354S3nTWgGFJ05vKv1O941f6mDnvmLJUqZ4WOTNOFLoj5NckDhHl1Z0woQDHCi4meG/9FZ4c
 mBgtJWnP+ajc9yHJDr7+9y24f77KfjiV/WOttGWf+DyFOaxxrf0E/80NBczJ5OoXk8EuZvdZk
 mIlpioNxAwBPd7Lxlw708+2u2B0IJxUp3cH0FumAVf/0RXeci3ZORlnOjiGaS2N0Pefmz72RH
 NjPEfykxxcXast2/vlDomZJ/HSLdd+XXs2UpCeOFF69+OkmegnMAECXXYMhScOpLdi33nx0na
 L0Z6xxTJUDfuqCUCeE0NSLRXghw8TbPBnw8nMTYaWxrMwhbN/RQ1M7+Z6YFwENymfxkLx6I+g
 08lftGY37umA1qGKMRZMqBhmWEKcd6yGH7k7K5oJKs6gZSf2Xmllai6iudiGotswE+Lr7dMNU
 NwlcgNOOQWg9oeDSBoZgIVv+hIXmYlUDN+tygTjbeG6cq1kl/KdjPwFqY+LdBuT86VgdLxp6G
 dmeGIIRAz0UIggbx3kg8HGzzXUkcSOXFOCDd080zQlIJ0BqoKG9Pj0IbWq83jLrGfqehwNeZy
 cwy9bC7nq1OJ7y/ajQzmnpwHw2xYt4Dir5YMuQUqGgiktNwB6vQ2XGc3V4bcfL2mJkr9/TqUD
 II/LRfoa0tUFYebU5O4YTLIkgwKX6M3k+x+H8hx1DnpAIfWUM/nJ2+vDscQaYG5h8pp1oxu/g
 DYYvlDuxA0QP/7Eo++M8mbNCl1jakf

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Update module description and add myself as a module author.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
> index 450ba0a48004..e8ccf9b277fa 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -1,8 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - * Alienware AlienFX control
> + * Alienware special feature control
>    *
>    * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
> + * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
>    */
>
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> @@ -15,6 +16,7 @@
>   #include "alienware-wmi.h"
>
>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
>   MODULE_DESCRIPTION("Alienware special feature control");
>   MODULE_LICENSE("GPL");
>
