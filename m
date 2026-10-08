Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5514E36F6
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473222; cv=none; b=D+bRNATK+kcN91001PmX9ze8fld4jvWh+OBk2rhkj4pVv+e/cwFdHlstGXUpiwNOUViHG3Gv/IJPNPz9xIsJRXNkaKAvZkQE4866Mk1ZRrzpHwPgvoW7CfzqsC5dnI+0p9k+bnaX/Tdga9L+BjS62C/Z5ej8r8f1dJPtC0mehvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473222; c=relaxed/simple;
	bh=4cGeG5gcafSfHV7dB+/PC8OwEGpDp+k/cnr9Dm71f1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/99t+bP//+qpQOi2bM1spTguFjbmDyPpKAL5gj7jB6H3Ls6I3lHJG+yFXXYDdFxg0eMgxohJGj89mM4lWpcd9+EOiVxPBa6GcwjuBaWL3XtGOuIumBaV4jAE1zRV3w4oQw442IpB1GCMnfE8do/fvDMX57/ChOmHQ4SmNV4Q+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0PCqnOL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0PCqnOL"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a9ad623098so10067341fa.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473212; x=1792078012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jqbkrmyrln9WXMY3pJOA8S50l904yx48reaKZeA7j78=;
        b=q0PCqnOLtpq0VQuCaMCpi+97K+OBh4+q/7XdfMWQvfMfEuH5KPM9RqlohwutStG+g0
         s4gVwzaXxNCgxV6M48XN++2YTvp7MidWDenlp/dyT9GdI++/SXVhQfl+1VV/Y3ZRWXUd
         lVyvaIB7mgemBfbgbTsoiwPMqBJOQQDjXN+wJPs5Z+zQJsEkTpce+qT437CXSYz5DWla
         9xtcbBFbzKpFe7AUaTcrHgjBMjx3LH3Q9CZbTgQf+3NBmegUMqXOEuao/L23WdtG5ACx
         Qyb093ZIXucs9f7MburzAshs65bJTjA74oX7aN9YZLgir9v0XaHouhRIdg9PZbJ4CQxD
         KYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473212; x=1792078012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jqbkrmyrln9WXMY3pJOA8S50l904yx48reaKZeA7j78=;
        b=BTZ67OJ+vEqxOJn5blW97PyFAr354m5Bet1MVATDPieSNUFw/zfMY2qOlvSOYT78w/
         0TiZCVF+mjBsvkXC0yw26L8El6LoJ7vtpA07sLwztvsSrWBpgqJ5zcwVErbDBlpoE3QM
         KpOL1aL6M2zExkwZLAQMrW2XbZW8JLEVgndPkt9fMUEV0nH/QRKOf+CKdw4Istjwb0kQ
         VZwNUc1xxUCBJx13i9TcOSaWZSeRIc1dU8HOG/Pz/z3p1+uinDXHALErjzBYaEpM4NDo
         txo1UKrCxfZMjFVlHP+R4zyf05oxVnGZYPDuZDZkNb9OgoVOSs/iUQ9fOamg266SydBS
         ENvw==
X-Forwarded-Encrypted: i=1; AKwUvBzlo0hvA8v8QR7R8n3gtRdz2mRG8pvKrlJpWXBXvRsFL4Ca7Gfl3AgidA+TEX3tA8duQr1m1L5WCMPxcgofnCwbZSHt@vger.kernel.org
X-Gm-Message-State: AFq9FYJwrvzECnC054s9hxGmR6cZ6QFQkCW+w545BTMoN7hsfxwvVX1B
	Z0hxhhFqh3VLu9NZcOkiYjugHk3V42GOyPAvpWsEvzx2aKOLlWMAMMxZ
X-Gm-Gg: AYBFou3js0TqW++hmJQuE2sp7wsSzmZ0KTqnGp30yUjpnW3YIzDD6psO9nSCIXtm3vO
	kKyj8Tou7Co67JoNEtJHLOE5htrhIATS3w4EXKizCjlaEo5e93oINFqBVjC6hf7Sl3a15hL/9Le
	3ZcNeyl6vVW2lkqPunEcR+XqNcen1Y+15ZluUBCt3bbaDSuvnkQpjYSGpzoGEEqGOWGnzQjtow2
	A6xpDtcToFCTEHANST5VRRBniaH2toMGYD7UVz06/0ObGmYkbsc4sLVrzYp6/KkZpDHIVHWgwob
	9Q/QFUvZA7eE0Z4F7AutEvYX3ml+HUj3uPkYa2CIMsBk03+J2/znZwy8e+cEMO+mvInEhz+HpWx
	WJif19AA9nqe9BoBTNG2A2K6gioWuHLaBN0ZqYF1SCDbpzdFgUQENN6ociK1OJq9GAanMtDCh1d
	oncP3JmylkRHls/8L9lLLf7C26uvx47FBxJCOkvbBl2qLtIJDWm0OSEY/66EJSZHgsprjMo/zHS
	LvaCxcjljtUK5X3SNg8Qi80yCqsLaaCx/XWqXl6IWsSklCVzKwJyN4T9vHHk0ieAs2V
X-Received: by 2002:a2e:bc14:0:b0:3a9:707e:ad9c with SMTP id 38308e7fff4ca-3a9a2cb4ea1mr13229661fa.4.1791473211741;
        Thu, 08 Oct 2026 08:26:51 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c143cec5sm161201fa.39.2026.10.08.08.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:26:50 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: Mingyou Chen <qby140326@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	ilya.gladyshev@linux.dev,
	kento@kekto.ru,
	platform-driver-x86@vger.kernel.org,
	ericted8810@gmail.com,
	W_Armin@gmx.de,
	linux-kernel@vger.kernel.org,
	chris@miget.com,
	matias.civadda2342001@gmail.com,
	btx342@gmail.com,
	wleizc7319@gmail.com,
	wolf109909@outlook.com,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	bozhenpeng93@gmail.com,
	nika@nikableh.moe,
	atomicus.xyz@gmail.com
Subject: Re: [PATCH v9 2/5] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Thu,  8 Oct 2026 18:26:47 +0300
Message-ID: <20261008152647.1510152-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001133705.69244-3-qby140326@gmail.com>
References: <20261001133705.69244-1-qby140326@gmail.com> <20261001133705.69244-3-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mingyou,

To Ilpo's question on v7 about e0d6312578e1 ("platform/x86: redmi-wmi:
report EC state change events"): v9 restores its keymap entries, but of
the three kinds of events that commit reports (keyboard backlight,
performance mode and Fn Lock), only the performance mode one still
reaches userspace as a key. I tested v9 on a Redmi Book Pro 16 2024
(TM2309, BIOS RMAMT6B0P0B0B), built as a module for 7.2.8 with
redmi-wmi unloaded, with dyndbg on and the input device recorded; the
payloads below match what EV20 in its SSDT (OEM Table ID XMCC1806) puts
into the event buffer. Adding Ibragim Musaev, the author of
e0d6312578e1, to Cc, as Ilya did on v6.

> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },

The short form of the display-switch key, 0x00000101, is still
missing; on this machine the key only produces the debug message
"Unknown WMI hotkey with payload 0x00000101". Since 4/5 drops
redmi-wmi, Ilya's fix for it [1] would have to move here; he offered to
rebase it onto this driver if this series lands first [2].

> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },

These four entries are never reached, because of this hunk in
bitland_mifs_wmi_notify():

>  		blocking_notifier_call_chain(&bitland_notifier_list,
>  					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
>  					     &brightness);
> -		break;
> +		return;

The backlight event returns before the keymap lookup at the end of the
function, so the input device advertises KEY_KBDILLUMTOGGLE but never
sends it: cycling F10 here gave 0x00800501, 0x00000501, 0x00050501 and
0x000a0501, and nothing reached the input device. If the key is meant
to be reported, as redmi-wmi does today, this has to stay a break;
otherwise the entries can go. Either way, the LED is still handed
0/5/10/128 for max_brightness 3, as noted in my v6 reply.

> +	/* OEM preset power mode */
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 1, 0), { KEY_PERFORMANCE } },

On this firmware, event 0x16 is raised not only by Fn+K but by every
SET of WMI_FN_SYSTEM_PER_MODE other than 5 and 7, which WMAA writes to
SMMD instead: WMAA writes QFAN and calls QV20(1, 0x16), and EV20 then
reports the new mode. In a trace on 7.2 the echo arrives within a few
milliseconds of the write. So with v9 every profile write that reaches
the firmware also produces KEY_PERFORMANCE, whether it comes from
power-profiles-daemon, a direct write to platform_profile, or
bitland_mifs_wmi_resume() restoring the saved profile. With v9 here,
low-power, balanced-performance and performance each gave
KEY_PERFORMANCE; balanced (0) comes back as 0x00001601 and hits the
KE_IGNORE entry. (The writes return -ENOMSG without Chris's GET-only
patch, but the firmware applies them.) The same is true of redmi-wmi in
7.3-rc since e0d6312578e1, so this is not new in v9.

KEY_PERFORMANCE was added for a key that asks for a mode change
(89c521463929, "Input: add keycode for performance mode key": "so
userspace can act upon it"). If userspace handles it by toggling
performance or by stepping to the next profile, then with a map that
never writes 0, as proposed for the TM2307/TM2309, a single Fn+K press
on AC starts a loop that never stops: the EC changes mode,
KEY_PERFORMANCE, userspace writes a profile, the write raises 0x16,
KEY_PERFORMANCE again, and so on. With the default map of v9 the loop
ends when it writes balanced.

This is not just theoretical. On 7.2, with redmi-wmi owning the event
GUID and a local build of this driver owning the method GUID, a small
helper of mine that read 0x16 through a kprobe and set the
power-profiles-daemon profile from it started switching between
balanced and performance about three times a second after a resume,
because every write came back as an event and two opposite events were
queued. It went on for about 46 minutes, over 8000 switches, until it
died out by itself.

Since the event reports a change that has already happened,
platform_profile_notify() is the natural way to pass it on, as
suggested in my v6 reply: power-profiles-daemon then re-reads the
profile, which is harmless after the driver's own writes too. If
KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
keep these events observable), it may be worth not reporting it for the
event that echoes the driver's own write, or at least saying in a
comment that it reports a mode change that already happened. On
Ibragim's TM2209 the profile SET is reported not to work [3], so there
0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
you confirm?

> +	/* Fn Lock state */
> +	{ KEY_FN_ESC, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {} },
> +	{ KEY_FN_ESC, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {} },

KEY_FN_ESC ended up in the type field, and the keycode is 0.
sparse_keymap_entry_from_scancode() still finds these entries for
0x00000701 and 0x00010701, but sparse_keymap_report_entry() knows only
KE_KEY, KE_SW and KE_VSW, so it reports nothing, and
sparse_keymap_setup() does not advertise the key either. Here Fn+Esc
gives 0x00010701 and 0x00000701, and nothing reaches the input device,
without even the "Unknown WMI hotkey" message. redmi-wmi has
{KE_KEY, 0x00000701, {KEY_FN_ESC}}, so these should be

	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), { KEY_FN_ESC } },
	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), { KEY_FN_ESC } },

Unrelated to this series but for the same machines: I have sent a patch
that hides kb_mode where the firmware does not answer its GET [4]; v9
2/5 still applies on top of it with "git am -3".

[1] https://lore.kernel.org/all/20260928221417.37875-1-ilya.gladyshev@linux.dev/
[2] https://lore.kernel.org/all/759c1ed3a7733afdc3056de952edc4e776dc8b15@linux.dev/
[3] https://lore.kernel.org/all/178444076601.4076.16818759313258005640@gmail.com/
[4] https://lore.kernel.org/all/20261008-bitland-kb-mode-v1-uselessfire@gmail.com/

Thanks,
Anton Karasev
