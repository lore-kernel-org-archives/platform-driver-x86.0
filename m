Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D4434E52
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613331; cv=none; b=IIdoNnzKcl7AwKi6C3e0Kr+lJN7zHMZKXQWsi3APMFEI3nIYzd6WKXT/nV/Axi5Fu7qY+bKawWrx+1ZWNhpWgiSx+FU2YB8nwYiBEU3wpIe/pKaPvYQ7f0HROYenlFQnqG08H7c5pvRz6tEnLbTVV96QiDBoYRTYgAwjZ6TdEn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613331; c=relaxed/simple;
	bh=J+XpfJYXSBiqfZXIpO1I0GBtNPJDJfFvLVjd6lActqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P25gTKjlHOsYLYLj4/bwDmZJWYJYM72gxrfJiijNVe/TgA6zRtLgRUGQf078PKhjbYT7A9WyErh3yb42TXtc/236CON3QveAzjOaWzQhp04G9mJs/RrM4uqoPLPNrZCsV4gbIAE5iLFMwVWUXyIUoiggj7ZQcgk+bjka6VgJQKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=Pan9zUcr; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=TSSnmr+Z; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="Pan9zUcr";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="TSSnmr+Z"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Pan9zUcrSaKtp2D/aSOzz/xRLEO/tpOwMI6KyGgVOR7/CYRuGjg+pysL/qm4T10Pgs9BfYSfzE7r4HubtbZbi02ClaFnsYnDi1ptghRHM5cp9lccvnIaEni9qn6rm1Ojv+VM5Z3M9YfmIfLkxVnnPIbo7fRjslKahgvmiFtoTpXRCqZtiE+luvBoGXxakajtgRA2FfHuSOrlCuTTvZnNDe+3ZK/IYrrvGMI+ISY9c9XczDvZvUTTTyOX02WHHorq44WCnpzeMj/xRpNQpra+fnfutfs1Ledyrn6vMybt/NziINSSZjXZMUXoalQ1Ooq+XbRresGpSPrD0SAdmugfoA==; s=purelymail1; d=nikableh.moe; v=1; bh=J+XpfJYXSBiqfZXIpO1I0GBtNPJDJfFvLVjd6lActqc=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=TSSnmr+Z5g3g9F647jlbi8lkzDnDpaggZKtki+ZSHwIYCBAY0clb7tgVUrZT2+FR4dXgLB8KxTmXNSVfhEUZ+0/kyyJJI9xMQtGAWjmx/H7dKwP5NJvf9HAkKriYEog1tEqITRqx07GgyjGxMKz7jXlDPpjx9188xdm63nmOaC9i9Q49qdY5+bxndi3Qy6tYzNMJf6D9VvZddMnWmS0ok763++p6/pIxJs4PBO92Ov+bXCJ25rUUovDiEDdG+qk57YH7H1E99tfO5fY9nqa0YQYJoAvXpM3OFeREcm/VAMxDsQWVCBs0pF7kb3JRUBGmjML3itTLRKxbr6zVLNvq2w==; s=purelymail1; d=purelymail.com; v=1; bh=J+XpfJYXSBiqfZXIpO1I0GBtNPJDJfFvLVjd6lActqc=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: platform-driver-x86@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1258308269;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 09 Jul 2026 16:08:28 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
To: Mingyou Chen <qby140326@gmail.com>
Cc: Nika Krasnova <nika@nikableh.moe>,
	Armin Wolf <W_Armin@gmx.de>,
	Gladyshev Ilya <foxido@foxido.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Thu,  9 Jul 2026 18:07:42 +0200
Message-ID: <20260709160749.3178278-1-nika@nikableh.moe>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709122337.17417-3-qby140326@gmail.com>
References: <20260709122337.17417-1-qby140326@gmail.com> <20260709122337.17417-3-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

On Thu, 9 Jul 2026 20:23:35 +0800, Mingyou Chen wrote:
> +=09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0),
> +=09{ KEY_PROG1 } },
> +
> +=09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CALCULATOR_START, 1, 0),
> +=09{ KEY_CALC } },
> +
> +=09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_BROWSER_START, 1, 0),
> +=09{ KEY_WWW } },

I'm not a fan of wrapping lines like this. I think it harms readability.
Let's keep it like this (same for the other key entries):

=09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0), { KEY_PROG1 } },
=09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CALCULATOR_START, 1, 0), { KEY_CALC }=
 },
=09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_BROWSER_START, 1, 0), { KEY_WWW } },

These all fit within 100 columns unwrapped (longest is ~95), so there's
no line-length reason to wrap; one entry per line reads better.

> +=09{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 0, 0), {} },
> +=09{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 0, 0), {} },

WMI_EVENT_FN_4 is missing from this ignore block (the old keymap had
it). FN_4 events on Bitland will now fall through to the "Unknown WMI
hotkey" path instead of being ignored. Looks like an accidental drop in
the reformat.

>  =09case WMI_EVENT_CPU_FAN_SPEED:
>  =09case WMI_EVENT_GPU_FAN_SPEED:
> +=09=09/* Redmi refresh rate toggle quirk */
> +=09=09if (event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED &&
> +=09=09    event->value_low =3D=3D 0 && event->value_high =3D=3D 0) {
> +=09=09=09payload =3D BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
> +=09=09=09goto report_key;
> +=09=09}

This remap runs on every machine, not just Redmi. If the firmware emits
a CPU fan-speed event of 0 (e.g. the fan spinning down), it gets misread
as KEY_REFRESH_RATE_TOGGLE. Could it be gated on DMI rather than on
value =3D=3D 0?

Otherwise, I've tested the whole series on a RedmiBook Pro 16 2024
(sys_vendor "XIAOMI", board_name "TM2309"). mic-mute, screenshot, config
and the AI button all report the right keycodes, dmesg shows no unmapped
events.

Tested-by: Nika Krasnova <nika@nikableh.moe>

--=20
Nika Krasnova
