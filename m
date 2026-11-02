Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632399;
	b=FWD4F4+aDAIsTLTwhXwCtY5J7QzjMjWjvs16U6veRvYU1dknLu1lVnx87VorhO7hp1P3
	 H99EhnvUSfZFtj048fPyZj2G3JdxxuQufVx8351MQfvh+peu6Opa9aQ5UjsbDIX8At8Wg
	 eF1xVxeXzjoVR5YwOOil+KuYvZBLeU1V2jFtIcA/Si5r8hsO2ko0Km4C32s+NgdjUGVAg
	 0BPw96kQ+rOnme0OOFShBK7klFgbalN4ecjYvCTDp4glQvgSWSY7HmJDlHeacJBMUpJpI
	 zuUSnMh7JRAStAGiy5ga4kBYYkgXp8MTEvQmrNqq9yaBVrh14ELLj/cw7G34e+iCBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YnReSI8mZSWFHXsSi0mG1BCqo+JHs0aKr+7QtxoB65I=;
	b=LiOow7888FHJUydkDPjDex3isr/WsOs5GhmfDECUH/yLf7qkM8ENh+9xZYWviNPbLRwl
	 rrDCK2/SwDvFI2os0mtVb4yUV0jROjfXjI9AMdfjukaxnlUdeGrdH+h0HJNB03L//QCq7
	 Npqmz+yvPV4yzIjyy84PdYUVFcaSpHLLMeMZw1zB/GkjPVrMPq8lSwO2Qfn91sul0ytIX
	 cHvIUTjHnnS5V6fIUw9XcamrrluWu4hq6RlMghtQ7Is+mfRukNDhssmUS87yPt/cKtUqS
	 SudB1RJVDFsro3ckQixeJ0lwb13Iow423gBV6qrocMUdkUkfMhrhsXKpm/Ib7Lkgw7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ot57P1fy;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE8A6078252
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 15:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE8A6078252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ot57P1fy
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so15446145ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 07:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632398; x=1794237198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnReSI8mZSWFHXsSi0mG1BCqo+JHs0aKr+7QtxoB65I=;
        b=ot57P1fySDomCsb826iIwhaJ+57fI8ZdPWl7d7nAaAPpks3AJgxLIrrd+sbKdBvwoI
         Fnu7PxeoqGVt5A5Si0AT01sdN0BDRZxi4riRIMhtW1KlWAIJDI76RiaCb4shkcX6Oplm
         YTcOeie9sEZ6kqrxvYVPSoI1JsFS+LZd46RvTUM2tGckKOECjQW8GkILYf/ejio88hNo
         qwn99drynIWyUHJKK9UguUPfmZmDZckZDf+rVZ1KARzG6eMMW1VZt2NLR0VHit4my2YV
         FDAqQQ/xb0DQe2Kwj87GFwbwDy7VxKxeld4jBbEAix6vs23WuWnzYq5Gd4c0dsCPLbFd
         XhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632398; x=1794237198;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnReSI8mZSWFHXsSi0mG1BCqo+JHs0aKr+7QtxoB65I=;
        b=iJWIivC3GeHIuis+xWS/oYhj0u5Tnv6AymwvUp9aD/frmSNX/GeS//RPec6MV14XHg
         dYRV48GtaeXJzIqRoLT7LoUgWSmTlsFt+zkj7o8Pt2XT6FHmEPFcxcWq7ulqdAy3AyIf
         OvIkbqm690PbFgGMCl/yhSW91mERimQR0nzCrqaH4rCckulK2RMg8YPxl5X2Jo9y8ZkU
         ecvJsaPT6VQl3VTBued+qMpBLUgku58wjKeuakBUCQ2egbcix0oLoIhHwbuc1VftXaTp
         L8nOe3G+uQ4HHLT+K67Nv0R/uSOyvflcDuUkYEupaiMZ8ebGGhd8IV6lP61JmKRcsEG3
         G3DA==
X-Forwarded-Encrypted: i=1; AKwUvBzxiC+HVLkrQzCc4KlJWkH7yvucZhtwhbu/fkoTQqEy7vSPF8DA4WBDblBqaystDhFhOqsuYVkoj7Y7xSODv449/6Rq@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qw2GWh1zU5MeV0o/oLCyDVKeT5W4mDX2YYGAZ/zYBC/RTg3iV
	iUT9WWzrFmcUe7jNunbX8xYk14LSLze7g6OI5tqkritrYmgsOJYVFEaz
X-Gm-Gg: AYBFou1O/gTXZa9Dek1P0m4QrEC/0OVEQ5stveCe+8+lkWxa9Ai3THBGac0to+7HA0m
	5nnBqVAyj+V8pWabh4tW1Buj/EDoIW91KmhHHP7nt2W5mw6oDIhOpFniySQOz9KvWKOE7KNrsnP
	0x5siHiMX1FY1m7tMCZnkuVLedzKCwr/SjXbm6yRBLxbCeK3RwfzEVPI3hZVIazut7FeZ6TNn1h
	fs09Vdj0UxW+tPYl58yuufcKsGmW1xpDh5Y99BXcgu5m8W3ytEMgBcpLbvh3LDlTs1nfrKIImAx
	PyhPi2eotxY1ZStcaEyMeLgui0Od15V90pSLT/hIwBnupgLzmgxaLbfmZuroExgVCQAMoZ7Fxcs
	6Ss8su07p/t5dB1TnxtAjaU/U9Wx28iLwWmaeLWN8Zt3DcfYK+Ys7yx95EIj5IES9tpVzRmqWdl
	Fs62MfMFDqlzod+gfwLfWpyEH4aq2k5Kr5kdPXQhXJ+3GQWuV2h5KEy0yC6EzulU2P4nUxe6nD0
	5srt0xKdYmr5z1ORgwYrEmaz553kfvLRH1dhhjAZQKZxlfKTyq1cfUK10n6g3irzS2OTJU7WC36
	9nrAi0vUEM4HmMepf2Vf0XFzB7ALSBWeBw==
X-Received: by 2002:a17:903:1ace:b0:2e9:723a:cf41 with SMTP id d9443c01a7336-2eb3648b9c2mr103201975ad.15.1793632398375;
        Mon, 02 Nov 2026 07:13:18 -0800 (PST)
Received: from ThinkPad ([240e:46e:8710:e4e:e10f:cd51:e533:58a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c93fsm30567675ad.34.2026.11.02.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:13:18 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [RFC PATCH v2 0/2] Add support for auto keyboard backlight
Date: Mon,  2 Nov 2026 23:10:17 +0800
Message-ID: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mark, Rong, Ilpo,

Thanks for the review comments on v1. This v2 addresses them and is
now split into a pure refactor (1/2) and the feature addition (2/2),
as requested.

Summary of the changes:

* Kconfig: the "depends on LEDS_TRIGGERS_HW_CHANGED" is gone. While
  at it I also added a "select LEDS_TRIGGERS": without it the trigger
  helpers become no-op stubs and the whole feature would silently
  disappear in configurations that don't opt into LEDS_TRIGGERS,
  which seemed worse than a small select. HW_CHANGED support stays
  optional; without it the trigger still works, only the
  hardware-initiated transitions are not reported. The select goes
  beyond what was suggested, so please let me know if you'd rather
  drop it.

* The auto mode is never reported to the LED core as level 3: a
  single helper maps it to a brightness of 0, used by both
  brightness_get and the brightness_hw_changed notification, so
  level 3 has no path into the LED core at all. Internal state
  tracking compares raw EC levels.

* Writing a regular level through /proc/acpi/ibm/kbdlight now drops
  the trigger when leaving auto mode. Instead of raising the
  hardware-control notification and letting the worker handle it, I
  went through the same path brightness_store() uses: drop the
  trigger and hand the new level to the LED core, which applies it
  after the LED_OFF queued by dropping the trigger. That way proc
  and sysfs behave alike.

* suspend/resume no longer touch the LED while auto mode is active
  (v1 would have restored brightness 2 there and left the trigger
  state inconsistent, as Rong pointed out — thank you). The LED core
  is now kept out of suspend entirely in auto mode; resume just
  re-reads the EC level and reconciles. My reasoning is that in auto
  mode the EC owns the backlight, so the driver should not make
  decisions on its behalf — the firmware already turns the backlight
  off for suspend and restores it on resume by itself. This is based
  on observing my own machine (s2idle), so I may be wrong about
  other models. The non-auto paths are unchanged: suspend still
  turns the backlight off and resume still restores the previous
  level.

One thing Sashiko (the Linux Foundation's AI review system)
brought up in its review of v1, and which I then verified in the
code, seems worth raising here: led_trigger_hw_control_changed_worker()
reads the transition flag before acquiring the LED's trigger_lock,
and the read and the transition are not atomic. If, while a worker
carrying "deactivate" is still on its way, userspace re-selects the
private trigger, the worker then drops the trigger that userspace
just set, and no further event arrives to reconcile the state.
I haven't reliably reproduced this, but the window looks real, and
the ideapad wiring seems equally exposed. My feeling is that this
would be better addressed in the trigger core than worked around in
each driver, but I may be missing something — Rong, I'd appreciate
your thoughts.

A few observations that may be useful for the discussion:

* I disassembled the DSDT and instrumented the driver to see what
  MLCS returns: it is the EC status word, and bit 31 looks like an
  error flag — the DSDT skips the hotkey event when it is set. On my
  machine it reads 0 for all levels, with no level echo, and the
  error path is not reachable. That is why activation verifies with a
  read-back rather than the return value.

* The 0x1012 event is raised by the DSDT itself: MLCS issues it when
  the write succeeded, the level actually changed, and the hotkey is
  not masked. This explains why driver-initiated writes also see the
  event and why rewriting the same level doesn't.

* The Fn+Space cycle order on this machine is 0 -> 3 -> 1 -> 2 -> 0,
  confirmed by testing; sharing in case it is useful for comparison
  across models. Nothing in the code or tests relies on it.

An open question from v1 that I'm still unsure about: on models
without an ALS the auto mode presumably doesn't exist — how should
the driver handle that? Mark, do you know what the EC does when
asked for level 3 on such machines, and whether there is a reliable
way to tell at probe time whether auto mode is supported? For now
the trigger is registered unconditionally on keyboard-backlight-
capable machines.

Vishnu, Rong mentioned in the v1 discussion that you are also working
on the same support using the hw control trigger framework — how is
that going? If you have answers to the questions above, or if there
is a chance to combine the two efforts, I'd be happy to coordinate.

Tested on the same ThinkPad X1 Carbon Gen 14 (linux-next
next-20261030) with targeted tests and on-hardware verification of
the affected paths, including suspend/resume; checkpatch --strict
clean.

Regards,
Qiling Zhu

This patch was developed with LLM assistance; I reviewed every design
decision against the framework sources and validated the behavior on
real hardware myself.

Qiling Zhu (2):
  platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helper
  platform/x86: thinkpad_acpi: Add support for auto keyboard backlight

 drivers/platform/x86/lenovo/Kconfig         |   1 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 179 +++++++++++++++++---
 2 files changed, 159 insertions(+), 21 deletions(-)

-- 
2.56.0

