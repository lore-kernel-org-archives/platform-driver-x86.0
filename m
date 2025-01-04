Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66185137742;
	Sat,  4 Jan 2025 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735973751; cv=none; b=qqAAhUIAnJvzmHk1Tm3BN61khD4VYwTadxzv6OAJpvsna6kW/KmIaE4EubH4nmtOu5GFOuT2zxJyvrTaExLcAk+liLqJl/VGOolH5dTlFbEXu/VMBGRpHse6dK2UV5NcJuS/wfutPmuDnhhyN1cYtaDvb5uNYsC/QIqHvK5YuBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735973751; c=relaxed/simple;
	bh=yp7+TD1OQmMcEKw0Op9eE+W522h0kCK/D0ic7hYrvr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQRBuBcZUzy5JwyFiVhXyQ/sATapbv9lS0hmNcL8v+ff3SVRvbZtU0YIXhbQGtDDhKdnY/lAvJYsbiFQlQyWokW8pXEelBckSFAzeKNcsX04kyLUOq6DA3WA3Nwn7WwoHc9mX7Ov3bGYD0qMSQTo5E4YsdSsMONtZ1uGZe5g1iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=gix/P5mV; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="gix/P5mV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735973718; x=1736578518; i=w_armin@gmx.de;
	bh=NoPBVMN9Kya3as0PrdeLXsJR9WWx8PBnqvfIaE3kQ3c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gix/P5mVExtvGDLgpm+K4GrNAAkr3dIKJI4TJ4hi8tlQJNcRT5xgZcSkYNosUJhK
	 UhWVo/HvzUqUHvTEKT8N9v1qZYGxo2WOB05GlUBY3X6+V14zWxv7iR1GyEnTsSQTB
	 SiKe7xPx1rC1RwWQK6m6IPOtyEsx779A9K4IUiRh6kYED07efRUf9PJo3U0CVhGxY
	 5wFcpWTy5cctMdn7J3ysWM7YuuhCKvwQxZOpFG5yY/r1Jpd5omeuGJeRd8duaUggv
	 YcgxmW0k0a8rIQs4rLoTYBSFkC7m+yPRJ88nVPYDypZAgnR9lxvzTtHM50EbL0vTr
	 la1ogBpckctiPXjtSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbgE-1tBCC93VKG-00LpfJ; Sat, 04
 Jan 2025 07:55:17 +0100
Message-ID: <119c9e8a-6797-4774-bb08-9f911b6a8243@gmx.de>
Date: Sat, 4 Jan 2025 07:55:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: firmware_attributes_class: Move include
 linux/device/class.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>,
 Prasanth Ksr <prasanth.ksr@dell.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
 <20250104-firmware-attributes-simplify-v1-1-949f9709e405@weissschuh.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250104-firmware-attributes-simplify-v1-1-949f9709e405@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bzojWrT9tVkJ+pRQ4F6pukzzjWQ5chkzbLdkY8TC4fUTMgYxyDO
 zi+xirLaBT0nhmU7nlFAPYMEr/hikcoVZSM+HwCXF35WP9M5RB61Icd+2c1rxKmv6dNJYXO
 y+Ual66+nK7fX6dDOVl7VkNaBuf89/+hZc1XdXYUwbeul/1FNsbIUkIFAX0GC5dIzX2djIW
 4p1gc3qWIE6V9lMwcBpzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jHw5WHSQl6A=;hVmtvE8ATCHZk7c2TRPLDfHjbBF
 MXd4zou8n6b+wa1x5DU9UySOmHykfhvRYX4UJ2xKpSSXj/19sgbenfuO0JdGacb7VLfFVy3e7
 tnvcV/74837weB/apHZnVHWQTxs46xWNgOcrTgg1euzrCS9YSBjF0EKOzKXh5/7a6wRuMtgOU
 OHmrjhVm2NruLZ9c8N0tUvGgCQ9ETunzbZ5DA3sSbkJp9hZSG79d6Ughxp9bempiLUlGrhj7+
 mMOVwjdK44RfBuEyrY3dYxjLzDxpw2KL8ToQK17N6nB7EOlFdEM7g9dEdVivAgdaeFaEScPEw
 FSu6gRGjCvk3PDy8R4b/hW9FvC5VxPSf2wQEO4TQ6GS0PmFwMaOeU42B5OIKibK8gF0AdZEB2
 /bbgdElQhG8UosUJyJMR1a/yHHn60zo+ZN9rQlj9wXDlWO4DGbNToaqHXn791bbSasWwDUhkm
 BNRFuuxNIKAxzCFk6ssimiviVxY1uxPbA1QpNQLqc0xrrGVAAMGeUGaJ0jFUKnVvdw5jXdLt2
 LHpTil98IFei68O7/l2iIkbCxO3PHpUYBQbgW5Oe9L1MaY9dIUCKNIQL3X5xk3zEGA001wUDc
 nzYvHNeZQRBSbyQzDxXy05THpFYVNuvpXa3E2f9HWDV2xrZ71I0UlCFaIMD8Am0iyubjoGTVR
 0YMrL2794c4EhS1v5aq6x74iRb/mNsNFakx0wcuyG2xGpYpn1PyN+Vtbcw1GdUsM1gURMoGSG
 TKYRMvTyeAT84J8zWbG/4MhliPC144Nfp7wTScp67TPO5KyUx8QqFMbMy8/wXQR1T/6JjOfZd
 zLuK111NssrIc/+JseEfq+62jqQIOphsfxL3q5iz9DuzlxOFMz0CrdkQBY6GieGZHMEqqCEJP
 vEtQAy/UoxY6v7eWR39Yg0jWtXbvnrmx0oseUPaCbfQEAlElyh2Wwz5o6dWx8aquRk9RQXIR7
 Jf5EvpZH1XtmBaS6NqkTLbecI6EJ0PbfRRhpJJPNWRrLx/ElbMnW6nPbJBl3ok3uiP4tq1cFo
 8KmOoEwlq/sqnuFmuf9dYnu3TMp5SsiUUH7j5HDt0m2nP4UDWAjhjWdX97e9AhaqeoIep+RCP
 B1fZw6FRrdD4l5plvwTr6PCf2E0+Tf

Am 04.01.25 um 00:05 schrieb Thomas Wei=C3=9Fschuh:

> The header firmware_attributes_class.h uses 'struct class'. It should
> also include the necessary dependency header.

Hi,

i like this patch series, but i would prefer that we do not expose the raw=
 class through the header.

Looking at the callers of fw_attributes_class_get(), everywhere the class =
value is used only to call:

	device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", <driver name>=
);

I suggest that we introduce two new functions for that:

	struct device *firmware_attributes_device_register(struct device *parent,=
 const char *name);

	void firmware_attributes_device_unregister(struct device *dev);

This would have three major benefits:

- the raw class can be made internal
- reduced code size
- drivers would stop copying the flawed use of device_destroy()

Regarding the use of device_destroy(): this is actually an error since dev=
ice_destroy() cannot be
reliably used when devt is not unique. Since all those drivers are setting=
 devt to MKDEV(0, 0) this
could result in a kernel panic should multiple firmware-attribute class de=
vices exist at the same time.

What do you think?

Thanks,
Armin Wolf

> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   drivers/platform/x86/firmware_attributes_class.c | 1 -
>   drivers/platform/x86/firmware_attributes_class.h | 2 ++
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/=
platform/x86/firmware_attributes_class.c
> index 182a07d8ae3dfa8925bb5b71a43d0219c3cf0fa0..cbc56e5db59283ba99ac0b91=
5ac5fb2432afbdc9 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -3,7 +3,6 @@
>   /* Firmware attributes class helper module */
>
>   #include <linux/mutex.h>
> -#include <linux/device/class.h>
>   #include <linux/module.h>
>   #include "firmware_attributes_class.h"
>
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/=
platform/x86/firmware_attributes_class.h
> index 363c75f1ac1b89df879a8689b070e6b11d3bb7fd..8e0f47cfdf92eb4dc8722b7d=
8371916af0d84efa 100644
> --- a/drivers/platform/x86/firmware_attributes_class.h
> +++ b/drivers/platform/x86/firmware_attributes_class.h
> @@ -5,6 +5,8 @@
>   #ifndef FW_ATTR_CLASS_H
>   #define FW_ATTR_CLASS_H
>
> +#include <linux/device/class.h>
> +
>   int fw_attributes_class_get(const struct class **fw_attr_class);
>   int fw_attributes_class_put(void);
>
>
