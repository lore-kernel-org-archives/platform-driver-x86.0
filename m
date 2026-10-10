Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834AC36826E
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661142; cv=none; b=Ym28kzAY9ps5O7Ae+IYEaPECgPfyVQNImmF/EOSoLwGpgxiM1G2b0kFU6V2rl7KiFgdwJ6EpXmjYFHsAHItLaaDUhPqkSNrwUTLrdw/x8WSZvCIL8Q5pJxlS24ybkbCn//lvB0/hDV6dKsUunNaw8VJVfIPad59z/Nj10SgtOU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661142; c=relaxed/simple;
	bh=dNCvN6Z0p0apcqDeCGNLBgDGxDSrZTK3JiN1BaZpNmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9ahSVPKVFT5fCI2NeLDN5StGsIQUFGJhB+BKl7cuIe3VgvfvHkmuN5jSMljRzCNQj34+njcxWxTi7mlXsZiygWIny54fDa2atYf8i8ktCWwqJdtc68VF+FaQPd/w8XI9OSdhclquggkYX5Yfw3p1yhQkp5UA9HzTFDJh2ztGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNTzDU++; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNTzDU++"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4210475e9.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791661136; x=1792265936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoL34je1TJl46tTvKm6qjnv06WZpCsCclqHksd2Wqs4=;
        b=WNTzDU++3h+WmbhRy/Hiv48K/S1eBLwd8p/lbLRBO4lftxBjaYfP/wTE5KQU4rODB2
         1RIq3TADgsBivrlJfxnJFAlCMbuacDtvVW3OIS/03ynkfbKb8nppTQSiu4qiY5tex5kB
         1BDIfIeNHftQmWGqRAA5FOYB80F8IjN97na/gqfvMZZ8FCGhhZU2FoWZVk3N/n1po8fJ
         hWaF18bI1dryxgivvjYpPRrDYJiM1qqxgWMAdgm66OodoCsgbonARzeLITJak9qbPbAi
         8Y0VHUGqBpqy8BOOUm/WUhwvsm+S0xunvJCG5qiyXl6lszOTqbgH1bnUPqWIZyzrLQii
         ME6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791661136; x=1792265936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoL34je1TJl46tTvKm6qjnv06WZpCsCclqHksd2Wqs4=;
        b=Z6+tWz9lUmiSS9whQiVi2syl3LYNwJjbhc/qwg6y3ofLg+McHpgohv3BxvCapcFr5Y
         tID92gSsgFUdd5snuDFP2IUN5bzK9IN/6IpYWTJijByrTO7xgb9fuJlQfy4Bb2Y+8L6V
         DmU0D7cl39kr5ehvLMnv4F1PWFXfCPtDf7YP29fljO2xIBzLfGb65hC9D/ua0Ah3FEf4
         QeCH0DxdoFoYORTIHCpCj8X2UQwYagtcJWWRYaBOyB7U450k16IEE6woUxbFWDHasVf4
         yw1LRZbnG56jMkEABsKs/b1XDAmYYfsBLfkssN9e/vG/nqfYiOwX8PRPZo6x7YHOIjNx
         dmiw==
X-Gm-Message-State: AFq9FYKcgTLFqpqrd7OyhIcDfenoZGDS4UXuMqLS5uNs0ZiQWEm6e2W8
	Tdq8suLaz3qPgcJADIIK+fAHb6TZyrlcsxzlbYXhKyh9nCfJqV8HE7BZ
X-Gm-Gg: AYBFou1dx48wHF3e8BUpLE2Hj3X5Sfj6NpyFQ8vbLdIoVN1DgH4ibwxGkDw9OdhC9T2
	s5MBsCyevUoBWzbGLBeI+vflkKjpGQ8KwRtfp9aDxo+QZxTwiqfPaC2LX3Cas5TgcGtC3YmB4az
	Qlh/1/L10oLW1iQh4WdLiQHzz8S5p2sp/iMW9h7/xOtla2dPJVVUiUO+8y5gH1e5DQ4QMm0dG4e
	tOjIoEdbwazU3i+ktBuhE4tMcLI6sPMKDfy9qr+mI8TQcdKUW4xxBFYrjKE/9ice4pwdYVEAqnq
	qG90Bv0torIWInC9H1ZxDWq/j9yK+CTTDBNHjRh904mTBCx94P1RLqcPqzb7+qbCIwOaq3YTVC4
	ieG50sjbyBRysnIf750QFY91mRpnhv3aNT/JaeUZPqoKHkGjLkAaRpCWc1yPpiLhJOp6Or2+ip4
	o8GxbF1bCVQZFFZSQcweY/F1SC3gII3wtuJLQf0fXyId8KpSyyDFhhqWZ8N/5qBg0GMWzNJQsuG
	J5TdrWT1EsrQmG8OiJiTLxfiXT43EJIIBph6LBbGd4=
X-Received: by 2002:a05:600c:3e11:b0:4a1:6a10:4dc8 with SMTP id 5b1f17b1804b1-4a18e4a90cfmr95543885e9.28.1791661136292;
        Sat, 10 Oct 2026 12:38:56 -0700 (PDT)
Received: from localhost.localdomain ([67.209.128.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm11123224f8f.16.2026.10.10.12.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:38:54 -0700 (PDT)
From: "Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
Subject: [PATCH 0/2] platform/x86: asus-laptop: Fix Wi-Fi hard RF-kill on Pegatron Lucid
Date: Sun, 11 Oct 2026 00:38:35 +0500
Message-ID: <20261010193837.1120-1-kotekompotek@gmail.com>
X-Mailer: git-send-email 2.47.0.windows.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Pegatron Lucid tablet the built-in Intel Centrino Advanced-N +
WiMAX 6250 (8086:0087, subsystem 8086:1301) is permanently hard-blocked
under Linux, while the same unit works under Windows. The driver and
firmware load, wlp2s0 is created, and all pega-* rfkill switches are
unblocked, but iwlwifi reports:

  iwlwifi 0000:02:00.0: reporting RF_KILL (radio disabled)

and "rfkill unblock all" does not help. There is no physical switch
and no BIOS option.

The Lucid DSDT implements \_SB.ATKD.ENPR/DAPR for radio ids 0, 1, 2
and 6. Reading the GPIO level register (GPBS + 0x0C, GPBS = 0x480) at
boot shows the lines that asus-laptop drives (GP18 WLAN, GP17 BT,
GP20 WWAN) low/enabled, but GP27 (id 6, EC bit WMHD) high/disabled.
asus-laptop never touches id 6. Calling ENPR(6) via acpi_call
immediately toggles the card's RF-kill bit and Wi-Fi works.

Patch 1 fixes a pre-existing leak: asus_rfkill_exit() never
unregisters asus->wimax. Patch 2 needs it, since it reuses that
struct for the new pega-wimax switch.

Patch 2 registers id 6 as a "pega-wimax" rfkill switch, following the
existing pega-wlan/pega-bt/pega-wwan pattern.

Testing (Pegatron Lucid, Debian 13, kernel 6.12.111+deb13-amd64, the
patched asus-laptop.c built out of tree; the two hunks apply to 6.12
with 2-line offsets):
 - Clean boot without any userspace workaround: pega-wimax is
   registered unblocked, phy0 is no longer hard-blocked.
 - wlp2s0 associates with a WPA2 AP (-43 dBm, HT40), gets a DHCP
   lease, and downloads 38 MB at 4.7 MB/s.
 - "rfkill block" on pega-wimax hard-blocks phy0 ("RF_KILL bit
   toggled to disable radio"), and unblock re-enables it.
 - rmmod asus_laptop removes all four pega-* rfkill devices
   (previously pega-wimax was not freed); modprobe re-registers them
   with no warnings.

Not tested: patch 1 on a non-Lucid Asus laptop that implements
WM_RSTS (asus-wimax). I don't have such hardware; the change there is
the same asus_rfkill_terminate() call exercised above.

Only the 6250 combo card was available to me, so I can't say whether
id 6 also gates other cards fitted to Lucid units. Registering the
switch unblocked matches what the Windows tools apparently do.

Tool use, per Documentation/process/generated-content.rst: the
investigation (DSDT analysis, GPIO register reads), both patches and
these changelogs were produced with an AI coding assistant (Claude
Opus 5.5) working on the tablet over SSH at my direction. I reviewed
the changes, ran the tests above on my device, and can answer
questions about them.

Based on pdx86/for-next (98f039265e58).

Pavel Kossenko (kotekompotek) (2):
  platform/x86: asus-laptop: Unregister the wimax rfkill on exit
  platform/x86: asus-laptop: Add WiMAX rfkill switch for Pegatron Lucid

 drivers/platform/x86/asus-laptop.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.47.0.windows.2

