Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB13A254B;
	Tue, 28 Jul 2026 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261238; cv=none; b=rHEZFGrHFSI6U8bLQwKr++DRx1JV2hPJMIBbGhj0PTOTYb+XjYXJZTppoiLmbAWER6Roy9Xo+eQqPSPSsDJB/kup5g6g9BpbZuifScqHAt1gGKNGnPxP6ZLLJw5d9qfIY2g1Mry8cN+/cYmM+ZabxncLIJku63VaaOeFJbJZzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261238; c=relaxed/simple;
	bh=MZ66aUptBTWFExEFcP+FsAfv73lWKGWzlP+JebMwz50=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=IX2TIWpNPlpMwUPUKgJyWZsuBGY8h8iMASZ0poIJScocvVMwFZri5X64t+14ND9+FzFmvJ30TPJlrhKaFatnp2oGCh40TtKiilhTDYK0+Qz81WEOqBr7Vn1RbHrdH9l9CHC1x/Qs1Zw1F/dQqX2jzgIP3o85tW4iXfFoW4H/2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=ji19qGLW; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="ji19qGLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1785261225;
	bh=Sk6KS4cKViN5iaQRNEV72saKkoP2spKS5Yu1gXmWcl0=;
	h=From:To:Cc:Subject:Date;
	b=ji19qGLWTuRRBV0aOTtn8DLkXoU+tq7Xp7wSDgruWV5nwXwKRpvAVQN8f7OZ8cHk8
	 86ROp+NQj2lpXzzQw8rthkrHLb2qUv2DzTPxCdns6F6aDxeJY/rhOqALcVsAgYLyRG
	 yTP8XzGmL3mORJjFdko5LYSIXUHNWt1QmsH+0/KM=
Received: from max-laptop-cachy ([240e:3a1:20e0:1ea0:2fa7:34d4:60dc:c367])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D6A85AE0; Wed, 29 Jul 2026 01:53:42 +0800
X-QQ-mid: xmsmtpt1785261222tua5kb144
Message-ID: <tencent_FCC6CDAEB2E4FF0272905D423D2CB0F5970A@qq.com>
X-QQ-XMAILINFO: NdJjTjI40ejMWliyr3R5YFZCsCZDQhmScJoNQC0nFDmoJgRYhpuTK0ICuENK73
	 taYnNKnSG6PD0/MB7wfoshJWt/lR84XmohuiBXQEXGvI9XfaQz+F249vmRRUyRIJXW0NfVHNW+H/
	 MISOZKJqTJcV8jLjznXtZHSZ+C0GjfeFdO93G5IwwBe1BgPw1xmquYYT90q05i6ffmr8I3Lpqx/K
	 ygwkHPP59S70jwL5MJDvLaRPek5I3iMSNQEPLdQLAklUI2Hbr4aFmFNh7SItqq1YTqPq8XHS713H
	 eeM//r+Zk5ZHphXBHCNNHK5wiBkPEl07nZWbvnS3USqTPc0d5wQeWV4Y9IcSNfSccmq46urm2hhE
	 mFxPZ4Ny7svNn+5JBUehKo4bKcIE9uYC8YQEyIwxoPGye3CgiuzN3ywQv6cPDo0bumA8+Pq8n2ua
	 0H5hTZ/dZ9kts/RyeJnVQPAm46oIsQO9QGYV+gXEan1qzNEnh/3XW5tIR3RghKPJJhQYiPNo35ch
	 mGgQ13zToOd0rqthEE5Q5Zd8CIZYycJyByh4SGbF/XFCbXFJBVOCsJNPMhgmLJEklX3D/uvHm+fm
	 RcbEW8OxqYvO2LGZLx8WebOU425fX1xbwvdf1weG5KLOkkBvKKD8SCyuXA2STyHlaqkYecMvKTGg
	 JSTu2PsJQyLx4QSz5TEH+6D9r0sE4+CQF7LfwNuZW/UuS12sOBF+9llv1Lo3wIHdffPqCZfQqWoW
	 yT9auLe3/ZU2tRIeiEhFZ5gAmGtZs58A6nklBoO/dVjRmOsW68GL09t2S9zshPb2e13kOPKQ7lfi
	 aKo/lF2GamyRls0Jp9wyOTkOKw3h4pILNCL+I9BwnzPJTwQLIgh9yL1b78D8OJnH8PjGWToYyG3T
	 Ul4Zby4DmJGmf5M5SGrnRPlPgT+GPKN4iJB84CEXBZg+3CdZthF29kTRUZ/2IQs4ovYurMVT3gah
	 KA0jokPG+20jB0BGe1XNLeUMZMYar5iyFTbqreSNTX9+95ie3uTDixIvbrpLnfOlrDzSwWC+yTlI
	 tOgULQzH8Mu2QQCRFSm58rxkL84P5MQgCvbRLiO13ITe0S/VMHL0cEpDCMyQb7xh3YAGUgHxd49F
	 cGy8Zx
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: wolf109909 <wolf109909@foxmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nabil Danial <nabildanial.93@gmail.com>,
	Yuming Sun <wolf109909@foxmail.com>
Subject: [PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2 firmware support (Xiaomi Book Pro 14 2026)
Date: Wed, 29 Jul 2026 01:53:36 +0800
X-OQ-MSGID: <20260728175341.45927-1-wolf109909@foxmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuming Sun <wolf109909@foxmail.com>

This series makes the Bitland MIFS WMI driver work on the Xiaomi Book
Pro 14 2026 (Intel Panther Lake, Ultra 5 358H) and very likely on the
REDMI Book Pro 14 2025, whose suspend failure was reported earlier [1].

These machines ship a reduced MIFS firmware ("v2"): the WMAA method
implements only function groups 0x0800/0x0a00/0x0c00/0x1000, reports
the performance mode as raw QFAN EC codes {2,3,4,9,10} instead of the
v1 0..3 enumeration, and exposes no WMI fan function. Additionally the
firmware never defines ECON, so \_SB.PC00.LPCB.Q_EC._STA fails and the
ACPI EC driver never binds, which kills all EC query handlers
(including the lid switch notifications _Q0C/_Q0D).

Symptoms fixed by this series, all reproduced and verified on the
affected machine:

* Suspend/hibernate aborted with -EINVAL from the driver's suspend
  hook (same failure as [1]: "dpm_run_callback():
  bitland_mifs_wmi_suspend returns -22"; 242 failures counted in
  suspend_stats). Patch 1 makes the WMI call validate the firmware
  status word and the suspend/resume hooks fault-tolerant.

* power-profiles-daemon could not read or set the platform profile
  ("Failed to get profile for handler bitland-mifs-wmi"; selecting
  "performance" failed outright and wedged the daemon). Patch 2
  detects the v2 firmware variant at probe and maps the QFAN codes
  (2=quiet, 3=balanced, 4=speed, 9/10=extreme).

* The hwmon device reported zero RPM on all channels because the v2
  firmware has no WMI fan function. Patch 3 reads the two fan
  tachometers (u16 RPM, 0 = stopped) from the EC shared-memory window
  at 0xFE0B0300 (DSDT region "ERAM", offsets 0x69/0x6B).

* Closing the lid produced no SW_LID event (screen stayed on, keys
  pressed by the closed lid typed into the visible lock screen,
  locking the account). Patch 4 polls the LSTE lid bit in the EC
  window and, on a change, evaluates the very AML methods the EC
  query would have run (_Q0C/_Q0D), restoring proper lid events.
  DMI-gated to the affected model.

All values were reverse-engineered from the machine's DSDT/SSDT
(WMID device, _UID "MIFS") and verified live: mode switching changes
the EC QFAN register as expected, fan tachs ramp 0 -> ~2700 RPM under
load, lid close/open emit proper switch events consumed by
systemd-logind, and suspend/resume cycles complete cleanly with the
driver loaded (suspend_stats: fail 0).

Notes for reviewers:

* The v2 variant is detected at runtime (perf-mode query result
  outside the v1 enumeration) so other Bitland machines sharing this
  firmware generation get support without DMI entries; the lid quirk
  additionally requires a DMI match.
* On this platform the firmware perf-mode switch reaches Intel DTT
  (\_SB.IETM, INTC10D4) via ODV variables; mainline has no driver for
  that device, so the TDP change the firmware intends is currently
  not applied on Linux. Programming RAPL directly from this driver
  seemed inappropriate; I left it out. Happy to hear preferences.
* Interactions with the in-flight "Merge redmi-wmi into
  bitland-mifs-wmi" series [2] are limited to file context; the
  control-device paths touched here are disjoint from the event-device
  merge.

[1] https://lists.openwall.net/linux-kernel/2026/07/10/72
    "[BUG] platform/x86: bitland-mifs-wmi: Hibernation fails with
    error -22 on Xiaomi Redmi Book Pro 14 2025"
[2] https://www.spinics.net/lists/kernel/msg6309086.html
    "[PATCH v1 0/4] Merge redmi-wmi into bitland-mifs-wmi"


Yuming Sun (5):
  platform/x86: bitland-mifs-wmi: validate WMAA status, never abort
    suspend
  platform/x86: bitland-mifs-wmi: support MIFS v2 perf-mode mapping
  platform/x86: bitland-mifs-wmi: read fan tach from EC window on MIFS
    v2
  platform/x86: bitland-mifs-wmi: drive lid switch via EC poll on Xiaomi
    Book Pro 14
  Documentation: wmi: bitland-mifs-wmi: document MIFS v2 firmware
    variant

 .../wmi/devices/bitland-mifs-wmi.rst          |  26 ++
 drivers/platform/x86/bitland-mifs-wmi.c       | 272 +++++++++++++++++-
 2 files changed, 290 insertions(+), 8 deletions(-)

-- 
2.55.0

