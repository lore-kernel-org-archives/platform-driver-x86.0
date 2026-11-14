Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678611;
	b=gTzvApeew3+ReQ6H4wnqDkp15J4zAaNH19h4FdbMpFe9E0wN8gd97DQ5OhwxG44YoDoR
	 uX3dY8VQH6J0o/6cmhVhV2D4p18WmsMmtfdYEgPiwfvXDjgz2x2dm1J4ukGsWx43LucyN
	 uJlfdgj+PkrVDfjsPmkbuHnINSIzKQKd0PSxOVIikE7tUPLSrOAAE7rGsPKM72DfMdXzl
	 s+2W9fq8I9O+Nhlld+RnBH7FODyLCErDA9hneywv16fWKG7VXQHqOkcgSg+tA2SpcHf1+
	 WYpsnJ4gJ8PF/rZwdgD57+o0AAfpZc0AsQCYoH/LNziM5G/hp78YBUTg4UrI73Aq0Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EmcviWPYqTHYUpdenTWoXsDvHVqyudI3P29XUYf6ckM=;
	b=XVRtkn5MUtnSb700c3j8+OKf2jgBW/w+4kDH6obdWc1B7Qe6+AlVXpknZme2oB1THpPM
	 l3u9W7PZav70rMlljB/XsWhkJ4eFsdBdcjWYhW9ZYDGGAPq139dG+9/N8GRZvR3JaYwwZ
	 hWrv6bnPUNRr2ynDdirnIJahbW/6QZNbE+buM9qZj4tMU4KNcdIRfpam6BqqaxPRNsK11
	 lWv+OmFafnKlA4pWENxhPBh7nXotwz9W4nk6HTX/CXCZySzaFY/3+p/RpIM7P3GZvn3sR
	 ocGwGT7VllgVO1nSCYizRixCcN0cc6HXTmzlQ5jI5K/FZxtooIEaH1hiuUdm9yDNqUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkhylkuy;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ADD606A32D
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 17:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08ADD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkhylkuy
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b196fefa1fso988272a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678610; x=1795283410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmcviWPYqTHYUpdenTWoXsDvHVqyudI3P29XUYf6ckM=;
        b=GkhylkuyhAEELYpG7D/hOS3gmTHFDpRRiCfGU6Xf/2klyAEtwynUhORjNycnuIwB5l
         9QUSnrtp6OzNT+LJ4A3RgX9ZyTYvpGix9aH96FXR6x74C0TQhl5UufozqHJMr6rMGHpG
         Vi5eAr5yeykrj7VtNYNWIGZhqO16Gx29YbsCmAIFQazS1VzMIuMeowsk1ft93A70lsDz
         gy/RdYdJ/pvrB/coi/3+PCjEUw93AdyXAdfBq+t0Wukj1woGnDlqfDLQR5E2Vplp98GM
         z/QOQJLCRXzQ3y4Xc0pj4iymT+xTxoV+76W7fkx9z0JyaV24+puoZ1Ex3lMnzKGUXS9z
         RpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678610; x=1795283410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmcviWPYqTHYUpdenTWoXsDvHVqyudI3P29XUYf6ckM=;
        b=qbCjDry7Efa0kgltyLSkLXOYcYaMYVYDwwR1y4fLAHp6/qY5dsI3oNfq2MDDySZmKG
         f9FTmdybqIOUzBekXFTQFMyhiBlKEkSRy2xkAmhOx82Z+0iv3DEt4Vx28CgK6gRKubga
         oS/N2diFhvKePHtAK9xTRi+N6lZNG6SyZQdXfpnoDRpP1YYOU79liPFEvBzQAtAjd5Th
         vjwbke+hY1p8UkR4vh1jaMnukAJh1maEcgQDJRcxX5pouFk8sGfiadyUj+9OguSPCmYY
         GnbPlkY7gnw0E94jCeY5W/WWrLhOR/FL445ncwWV25CiVtk43mO4hOurSkIr6VBoUKRK
         g6nQ==
X-Forwarded-Encrypted: i=1; AL+hErGdwZ616aNp96mRlwigU49k0s1m2Vnrm8MW575VsZMMvoy/SMU4XyisnklmrJAp7+F5rLHNDtkR8+yb4WGp1l2KceMt@vger.kernel.org
X-Gm-Message-State: APuU4Z9JYU2sDfHAON/0Q/Z+d3MqLGxbNR2WtyLqu2initScsmWmD4iR
	lom1NAkBTveDDPy8ZAs4h64JQimeEQVH2Yoltc0yCz0xKcLI0ChhYTG+
X-Gm-Gg: AYBFou2rIDPXyrwR8VwLIpIJljaRAfmMQF/i3+H/dF+N4pTiBO7UtfH3JcEb8E+AOHp
	4MCoa0Lb29vEXvE1PIwS+/0Ulv4jtHClaDg/asN+wuBoztFI8N1eALEbTedDazZ2xRzRBOzDVoo
	407IXDPUCgn41RswJ5nJgciJfjSWje4aZlCKaClnKGaYcpxCqzjibhOx78qV50beMjJovFP0A0I
	S72ZQbETB0soSN7pOdhXiLHXxei955Su5hQE+6FByEfcm9Iphi01++Cp1BEYP5LnVTl5S0AOX25
	m0fzIeKB5QI2td3hTvRrFj+Iyhw/f8+CbQkG2Uj3SlJjvqUDfniQiF4stzaN3HKGAfsodV+MYAW
	oUk7oIJ4KoahdN2vU3ogksqDjwK1skPwfI1z4q4mT4iav74UWsqVHq4dh/uswBD34LVcdZH++ky
	nnoeIu7ATpONKAmIWw2Rn6763AazlFqgTq6mkJZmLjC/S+TfFCS1KRJjBibiB9eJo1a6QYbUJKT
	LBa8riMZaDELRHp0gNhABf4808qB1bWr3cf2dGaH0c2C4B4xL6PotH6yitXiNtio1Nko8cJKtl0
	E0/xm1JEk9YTAJBdz3EM+VZrbtAO
X-Received: by 2002:a17:90b:3912:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3b1b087c1b3mr6348390a91.9.1794678610160;
        Sat, 14 Nov 2026 09:50:10 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:50:09 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
Date: Sun, 15 Nov 2026 01:48:07 +0800
Message-ID: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Thanks, Rong, for the two rounds of detailed review, Vishnu and Mark
for the firmware-side answers, and Andrea for the bug report that
became the first patch. This v3 addresses the feedback in full; the
series grew from two to seven patches to pick up the suggested
structure and to make the fixes independently backportable.

The series in short:

  1/7  Report auto mode as brightness 0 instead of 3          (stable fix)
  2/7  Extract kbdlight_notify_change() helpers               (refactor)
  3/7  Sync LED core state on level writes          (write-path sync)
  4/7  Detect auto-mode capability via MLCG bit 20            (groundwork)
  5/7  Skip LED suspend/resume on auto-mode machines
  6/7  Add support for auto keyboard backlight                 (the feature)
  7/7  Reconcile EC level on resume

Changes since v2, by comment:

* The notification path is now split as suggested: a helper that accepts
  a level and a wrapper that queries the EC (2/7), and the proc write
  path goes through it (3/7), like commit 07f48f668fac did for the
  ideapad FnLock LED. The manual check-then-act trigger removal is gone
  entirely; leaving auto mode through either interface now drops the
  trigger through the LED core.

* LED suspend/resume is skipped entirely on machines that support auto
  mode, keyed on the capability bit rather than the current level (5/7),
  as suggested. My testing confirms the firmware restores the previous
  level on its own in all cases except auto mode across hibernation;
  less state remains in the driver, and the class of races around
  LED_SUSPENDED disappears.

* activate() is now a one-liner with no read-back verification (6/7);
  it only writes the level, using the plain set helper. I did not use
  the updating wrapper there on purpose: the trigger core is in the
  middle of its own activation flow at that point, and the 0x1012 event
  that follows the level change is expected to bring the state back in
  sync through the regular notify path.

* Trigger registration is gated on MLCG bit 20 as per Vishnu's
  confirmation (4/7 + 6/7).

* Andrea's report is fixed by 1/7, which reports auto mode as 0 to the
  LED classdev and is marked for stable. It is deliberately minimal -
  a single check, no further splitting - to keep backporting easy.

* On the proc attribute deprecation: I support the idea, deferring to
  the thinkpad_acpi maintainers.

One addition that was not in v2: testing showed that the firmware does
not restore auto mode across hibernation - the EC comes back with the
backlight off, without an event. Rather than re-attaching the trigger
from the pre-suspend state, 7/7 simply re-reads the EC level on resume
and routes it through the regular notification path. If the firmware
exits auto mode across hibernation, the driver simply reflects the
resulting EC state rather than restoring the previous mode: it stays
out of the firmware's way and only synchronizes, which keeps the code
simple. Happy to hear opinions.

A few notes on the result:

* Writing a level through either interface now also emits
  brightness_hw_changed: both write paths share the same notify helper,
  which keeps the LED core and userspace listeners consistent with the
  new level no matter which interface was used. Rewriting the current
  level emits nothing, matching the firmware's own
  no-event-on-same-level semantics. Extending the notification to
  userspace-initiated changes seemed reasonable to me - the OSD then
  also reflects echo-based changes - but I'm happy to restrict it to
  hardware-initiated transitions if that is considered the better
  semantics.

* All state transitions now run under kbdlight_mutex in single
  critical sections (query + reconcile, write + reconcile), with the
  set and notify helpers expecting the caller to hold it. On the
  ordering with the LED core's trigger_lock, my reasoning is that the
  trigger callbacks (activate, hw_offloaded) are reached with
  trigger_lock held and then take kbdlight_mutex, while the
  notification helper is lock-free (it only queues the worker), so I
  don't see a reverse nesting. Extra eyes on this are welcome.

* The cached level is now the raw EC level including auto mode, so the
  kbdlight_brightness name has drifted a bit from what it holds.
  Renaming it would touch quite a few places; I left it as is for now
  and can do the rename as a follow-up if preferred.

One open question, mainly for Mark and Vishnu: the skip of LED
suspend/resume assumes the firmware turns the backlight off on suspend
and restores it on resume on all auto-mode capable machines, which is
what I observed here for manual levels (suspend and hibernation), auto
across suspend, and auto across hibernation coming back off. My belief
is that most machines handle this fine, but more testing on other
models or a look at the EC documentation from the Lenovo side would be
needed to be sure; if an exception turns up, a DMI quirk could restore
the old path for that machine.

Tested on my ThinkPad X1 Carbon Gen 14 (linux-next next-20261030).

I'm still learning the ways of upstream; thank you all for your time
and reviews, and any further comments are most welcome.

This series was developed with LLM assistance; I reviewed every design
decision against the framework sources and validated the behavior on
real hardware myself.

Regards,
Qiling Zhu

Qiling Zhu (7):
  platform/x86: thinkpad_acpi: Report auto keyboard backlight mode as off
  platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helpers
  platform/x86: thinkpad_acpi: Sync LED core state on level writes
  platform/x86: thinkpad_acpi: Detect auto-mode capability via MLCG
  platform/x86: thinkpad_acpi: Skip LED suspend/resume on auto-mode machines
  platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
  platform/x86: thinkpad_acpi: Reconcile EC level on resume
