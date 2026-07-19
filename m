Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05672D12ED
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 05:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784440773; cv=none; b=EowfdvCgEYafz16LHCdFPAuLISpDPb9XzcRxTKMefzto9PXKpdmKuoG/Nc2hD0NWKZkKQrYKPbN4Tx67khDDSogZSj0Apwm5yI5tSmuqmDJNwGtFeL+rIPxtNZ1xjRwY5tOKlfixUjtpFeJhb2CArkZvmwTveLEgL3mNhyloIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784440773; c=relaxed/simple;
	bh=z7zI4ormmMwmd4+a1vmhKas9U5S2B2I5OjONa7+J2z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nuRRNRKUkDn4L9Zd2F1NfTHVkzPLLxaRp711J/xWRaSvw6GDQ2pxH9UbNNzYFJzmaKn54VFpo7eS/NjOtMretcxc3OVqILSxZYT0mzuJcU6eUyya6VbpG4q5ghVm7VMSVlpLxlkWpGUc9I97bGSSVgmMpNFrsA9Ezy8wcdcQduY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBqnAhFb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBqnAhFb"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so45156191fa.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 22:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784440770; x=1785045570; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DewalVKvSHtPQz7rPLf987kX4I4O55EkRGnJHsM6WDg=;
        b=QBqnAhFbeDXfouIc6iOgVAV02XVHiNKcWvXBrKi8mu+oyBKOOy8rwsjPAOMDlHTGvG
         Ylto4cqg0kFoE8RAinb/aNSIFJPnvpHaa2jSO0vJUV9g5IOAQ51OQE0VgrmI+WMSpRj5
         Bd2edn5k1Z3zmE7DUzA13z/gaLhoHr0e+ColWML8tgqNoF5I9/wb7AZqodydWJAVu5R7
         THjG+jQUIylDa1j9pgqySpxEElr0/CTgDG7jm0C3pbjcvZ5nNr4QtkuiSriPLwW0ZB4i
         6ggnYyf0Dppl0pHGEe9/DbaxqYxCfsbdJdfAT6OvACeKgobYtFdvC1qxxeu+Dz9E/YYO
         nmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784440770; x=1785045570;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DewalVKvSHtPQz7rPLf987kX4I4O55EkRGnJHsM6WDg=;
        b=K8LZArlZ53BULA4QST96xjeUyjDYOTHMs3qUJPWw4tBlXU0PAz8NWBUyNpZfI/Dlux
         7xZ05rGhGtb2rZP6Yj2enpdWtdwjCvhy98y8utTLYmHHm2XMJpu8aYxgp8x7vAmZtkhj
         mfPb+nQLfJ+npTzFaCghucug0HI7yPEP8Ug8A5L7Ptkfq063ErkVNrmUJhJKLjinSzTy
         AEhSIcgsxF5beOMBWvCEiyLFDX1wvfWomMQiQ11NlQJebqPurrINMPesKvmcCtxbP7yu
         UFu8u5tPi8GPQ/H+ewVeTmKyayTL7PhAuIhDOkeoWNWsFI3cDqDSXl4d6MUamgSmgLVm
         LHIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsa8j6D2gHund3mWU9xQ6KCmVJlgUNFT9bGRpYE6/h7lJlo1C3hqwiyGiF9oT/DiIum6JNlGt5kbu2N+vbZidDTZHi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuosz6HIQF3+88rnYwYZBdE0ojq59BGJv0s5KpwUqzQk8rIAD4
	+PhRvki+TpP/nO5gy9GfUZqOiHy1j+0dBSE07RuVF1JboEZeeSyvB06Y
X-Gm-Gg: AfdE7cmhn4m9LtLLcTgE1JOwN3p43DOhCEZp6PjV63gKMzLJsJG8Twt5rENeAlhhMGP
	yBh2TPG28qA69wPoSMzTMPIj08KA+rZLlfx7EOwzO+eIzZ6p280AicrOIvPvyDrNFA0ukVOLcIz
	wSjEMydlgCd7sTAFksDWKvFAfYkWvW/yeMNzj3szpU/6SvEGH8Uy0bt/NYVgUJmMtmiwIai1gbs
	m6sTwKgHX+lUH4r5hqb5ZN0vrBtqHyCqsXBMKDr7/rPCt4DAb79RDnqaOK79p+IH0H0Zzus3jqb
	XgEm9Nb1IrcUEN/eqNVmqMgAxzxnfljex+E+ZTg3zikKLHkCSPCCj5gxanotktJBHgFgleilukJ
	Y71Ojiyt7Tdgs5nx+KoufQfUpBfLwcw+Yzm6riRV8+SzxOawl4yrxUA7iO7+6AIU6x5bhVCeJ1I
	tRAU8KJQWEV96YcnAw+A==
X-Received: by 2002:ac2:53ae:0:b0:5ae:a36b:e6d2 with SMTP id 2adb3069b0e04-5b28f98a08amr1095915e87.27.1784440769543;
        Sat, 18 Jul 2026 22:59:29 -0700 (PDT)
Received: from [127.0.1.1] ([185.117.148.216])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-5b291da4ff2sm1514810e87.28.2026.07.18.22.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 22:59:29 -0700 (PDT)
From: Musaev Ibragim <atomicus.xyz@gmail.com>
To: Mingyou Chen <qby140326@gmail.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Gladyshev Ilya <foxido@foxido.dev>,
 Nika Krasnova <nika@nikableh.moe>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] platform/x86: bitland-mifs-wmi: Merge the function
 of redmi-wmi into the bitland driver
Date: Sun, 19 Jul 2026 11:59:26 +0600
Message-ID: <178444076601.4076.16818759313258005640@gmail.com>
In-Reply-To: <20260709122337.17417-3-qby140326@gmail.com>
References: <20260709122337.17417-3-qby140326@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 9 Jul 2026 20:23:35 +0800, Mingyou Chen wrote:

Hi Mingyou,

I own a Redmi Book Pro 15 2023 (TM2209), one of the machines redmi-wmi
currently serves, and did a live test pass over the Redmibook side of
this series against WMI event traces from the actual firmware. A few
issues below, on top of what Nika already found. Happy to test v2 on
this hardware — just Cc me.

> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0x80), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {} },

The Auto entry has its value in the wrong byte. On the TM2209 the
backlight state arrives in value_low as 0x00 / 0x05 / 0x0a / 0x80;
a live trace of the backlight key cycling (payload bytes are
[type, id, value_low, value_high]):

  01 05 00 00   Off
  01 05 05 00   Low
  01 05 0a 00   High
  01 05 80 00   Auto

so the second entry needs to be
BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), otherwise the Auto
press falls through to the unknown-hotkey path.

> 	case WMI_EVENT_KBD_BRIGHTNESS:
> 		brightness = event->value_low;
> 		blocking_notifier_call_chain(&bitland_notifier_list,
> 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
> 					     &brightness);

Related: on the TM2209 these raw values (up to 0x80) end up in
led_classdev_notify_brightness_hw_changed() against a LED registered
with max_brightness = 3 — and the MIFS control methods behind that LED
do not work on this machine at all (the profile SET fails with
EOPNOTSUPP and the LED GET always returns 0; the SMM interface differs
from the gaming models). Both the LED and the platform profile probably
want to be gated on DMI (or on a probe-time functionality check) before
the event GUID starts feeding them.

> +		/* Redmi refresh rate toggle quirk */
> +		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
> +		    event->value_low == 0 && event->value_high == 0) {

Confirming the Redmibook side of Nika's concern: on the TM2209 Fn+S
really is event 0x1a with value_low always 0, so the quirk does work
here — but the event id spaces of the two device generations genuinely
collide (0x19 is the AI-button break event on Redmibooks vs
WMI_EVENT_REFRESH_RATE on yours; 0x1a is Fn+S here vs CPU fan speed on
yours). Rather than value-based quirks in the notify path, have you
considered selecting one of two keymaps at probe time by DMI? A single
merged table will keep growing special cases.

One more thing worth a comment somewhere in the merged driver: on the
TM2209 the ACPI event handler (EV20 in an OEM SSDT) cycles the EC
performance mode as a side effect of building the _WED payload for the
Fn+K event. Whatever driver owns the event GUID must keep reading
events, or Fn+K mode switching physically stops working.

Related: I have a pending redmi-wmi patch that reports these EC state
events (backlight / power mode / Fn lock) as input events so userspace
OSDs can react [1]. Whatever form the merged driver takes, please keep
these events observable rather than KE_IGNOREd.

[1] https://lore.kernel.org/r/178405473606.25865.4048095379503614221@gmail.com

Tested on Redmi Book Pro 15 2023 (TM2209, BIOS RMAPH5B0P0909).

--
Musaev Ibragim
