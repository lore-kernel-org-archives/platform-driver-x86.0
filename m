Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541284;
	b=XYjEoLqhG3thY2HpXyWS5TQ1ME4wDVH3eb0btD5dMtcpvnAc2SCFYmp9y0iHvbg+bcm0
	 0eyKEzoxI7M6myu/IO3ocWRhk6bt2APOM9fJEMqoFpOKQIkN4UkdvtnEH2kjPtl7l1TtE
	 70TkXNOFt8fMFCjVqTcNZ0IFqTUvB+iXkMhsQ6/aVKzzI//HI9aaGoRi7HYuzkgp2y5l0
	 Vwr4/ELdzca+V/c1QoHORh2926MxI2GsYUVmerQ/f0WZEu8qN2Ssq9YzHNrH2l7Zwptuk
	 WhTPmSMGqRlFoL6mEfoNwhYgAur4dX+z6r4zj3ZguvzlFtNRXuYfDOYEjkRGVGGQvUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541284;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=btuqp/NU9Ngt66DLJ4H1O8xQwjMO8DGc4b51EvYEnjA=;
	b=Rt2ywdOd7rSDcohoT2gLsM4HWm8BHOkBE36oNGUBmXXsSTMd/L+B2rlAGrV116ej1GSj
	 NIP9N26Q+KB97QnmhGAVyNkvpeEIfN593iMi68iT01BxLFbvrMZxaP4Uv2hXG33QhJDBk
	 LIFTi3pU1E/Pk6Qr6z3zgETUZszhcdOkJNq1vOYn1V0KPDL8XyhCdv5dRDNwCDwBtu3D4
	 kaWicOIoIyihf+CLvRU0y6LFBEMsEI6BogyqjmuGbZvSnwGmfk8hRhikcvXM4c5sDmX6G
	 lGv89LGBRd+qvWGPI+ZW4jU4U79PtqmDxNRL8e/qxGsfKNugoqYXPoUR0jGY6im1cbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b="IO+/2yKR";
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B59606A327;
	Tue, 24 Nov 2026 17:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B59606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=IO+/2yKR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795541221;
	bh=btuqp/NU9Ngt66DLJ4H1O8xQwjMO8DGc4b51EvYEnjA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=IO+/2yKRy8zYGYDANKDqSHuoOP+QHuElc7NJy7K/9TUIHHUCQRExMo3jctJuJwdSD
	 7cGQf/4KqlCowDr8U7Zl7WsWIxe8P9zLrg4/jZn2KmGvoIDtb/r+3eMWj5k7Ab0Az4
	 WGe3hGmIGmoW+QqpIlRH9t/X+RtkNh7KW5MwLWZg=
X-QQ-mid: zesmtpgz9t1795541215t9dde1f49
X-QQ-Originating-IP: WUvYmrX2zvPXBcfRQozLfizPRUaiI9AUrw9XU8nsO7c=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 01:26:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17900397123399840377
EX-QQ-RecipientCnt: 7
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Fuwei Xie <12313607@mail.sustech.edu.cn>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	Zheng Shuyang <yhshzh0@gmail.com>
Subject: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Date: Wed, 25 Nov 2026 01:25:27 +0800
Message-ID: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.55.0
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:mail.sustech.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MwQdfXoP8nuzApoFzAGAat0zwadEjWNu7XxSj4AMG/coiteb8uxzf9nc
	lCun8JxiyussoGUQZ6KBjDl6i/8f2mOqQ9Tcbhwbvg7xBZwz4ylbWoofBjqG7CweKtY5bNP
	t3bnQInfR+OtcdDJIE9peovyZDjTrotWz/g2+Oz4YW/28MzVhqaBtiTxRFNXNIpfm/9kKUt
	CFqQN+SV4CgF3WWpgGCJtX4qTgNnlrRLTrBleCKHRYLaoSHcGfRZE5c8OLlwLsPCzRL1sCi
	VY3AfJIx744OJ1eIWKR+ZWUblLC7uf26R3lKdYfVhMSsxmCvPI77PrQwAHyjLJ5TTOPdzFX
	VqK8fKnz5OZvENYICjO5vSHdsa8bLVN9qE933SIPagB4ky2MGUYOAfVLIt5vmfo7UWnxhm2
	LPVeBAmvxj2dARxpzcwAXNMeQfsHqt2y6htwslUhVyDUqob2OUMEmpVMXwYl8jH31nE0j1L
	umYI2WAi2Glw2ygvg1bJE7JVkqklaK3o/LtN6kQAL7Kx+TaN/E+2Uf97mT1RdF8b+PWFfw/
	H+u6vG5br/JPQl4wvfJapyOcIFTA9HDLvwqLb3hNJDBB3nFLA6P7SkgUdlWfeN4NTpAG5Bc
	33iexEewRvf9bffUaV0Xm32TVSLCzXnX8Mdyr+An/KVgA8EjD1fys//c+cEtuQxE1BZ1CIo
	wKNLUYz0YPuxdhro/kbcCqnChheHHKKBaAq7VMO+oR4Qfy5Dd8ADHCVE4xHcm1Nja65UacU
	fU86oz76bjzDhvLZvMa+wRyVSQ8dLb1FeW9bkjCTWigwLQ+NoBjN1dl5z79bV6LQwlSXuBW
	0YM0thLfT9OMfUTJG3UTUXt5ZjVk+ovy7AAnqel5P2IFRIMuGdmmBGiAjogtK1GZCzLTR43
	D/gYAOdtzAXQILeFuBGaxWWIBfY/qnPzANRiowx4/Ee6RI8pmFjXLjVX+m9scXH67ATHpxw
	REBH8Udy3Muize/Qiu6DX/4FX246sNkkMg/Z7MrcxbcQeFAjdipr0xaFeKSxuhXW31dwEM6
	p7kFJ7chlrshnwTioamCj526Lt2t7tZ2gePi94VnKBP+ok5RqQjt068uzVmiI=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Hi Ilpo, Hans, Eren and Zheng,

This is RFC v3. Thank you for the review of v2 and for the tests from
Eren and Zheng.

1. What this series does

   Huawei firmware on some MateBook and HONOR machines provides a
   balanced/performance mode through the WMI methods \GTUB (read) and
   \STUB (write). This series exposes that mode through platform_profile,
   so the desktop power mode control can switch it.

   The driver only maps the firmware state and reports changes. It does
   not write RAPL limits, does not force a fixed wattage, and does not
   add a background daemon. Probe checks that both methods exist and
   samples the current mode once; it never changes the mode to probe.
   Profile reads use the cached mode. A userspace write sends STUB and
   returns its status. Fn+P events carry the new mode; on 0x2a6 and
   0x2a5 the driver re-reads the firmware mode.

2. What changed since v2

   2.1 Reply ownership and the two-call handshake.
       A preparatory patch moves each ACPI reply into a __free(kfree)
       scope, so the first reply is released before a retry. The method
       mutex is held across both attempts.

   2.2 The sized WMI interface.
       Following the review, normal commands use wmidev_invoke_method()
       with its min_size argument. Both firmware layouts have a
       four-byte prefix followed by the status byte; the WMI core
       unmarshals them and the driver checks the fields each getter
       needs. On the NbF-XX, WMAA returns status 1 in a full-sized reply
       on the first call and dispatches the command on the second.

   2.3 Binding the WMI devices.
       The method GUID is bound through the WMI bus, and the hotkey and
       legacy key data GUIDs are bound by two more WMI drivers. The
       existing platform device and its sysfs paths are kept as the
       parent of the userspace interfaces. Event-only machines keep
       working without the method device.

   2.4 0x2a6 and 0x2a5.
       A STUB write can return success while the EC still reverts the
       mode a few tens of milliseconds later. The driver therefore
       refreshes the reported mode on 0x2a6 instead of trusting an
       immediate readback. Zheng measured the revert at about 51.8 ms
       on FMB-P; that firmware also emits 0x2a5 for TBF2-restricted
       transitions, and v3 refreshes on 0x2a5 as well.

3. What the five patches do

   Patch 1 scopes each ACPI reply and releases it with __free(kfree)
   before a retry.

   Patch 2 binds the method GUID and gives the platform device the
   bound wmi_device, keeping the existing sysfs location and the
   event-only path.

   Patch 3 moves normal commands to wmidev_invoke_method() with
   min_size, holds the mutex across both attempts, and validates the
   data each getter needs.

   Patch 4 registers platform_profile, samples the firmware once, reads
   from the cache, writes STUB, and refreshes on the WMI mode events.

   Patch 5 binds the hotkey and legacy key data devices on the WMI bus,
   keeps the existing input and sysfs paths, and displays the marshalled
   WMI reply bytes in debugfs.

4. What I tested

   4.1 Hardware.
       Capability detection, platform_profile registration and
       switching work without a DMI entry on:

         - NbF-XX, Intel i5-1240P, BIOS 3.07, Ubuntu 7.3.0-10
         - MateBook 16 CREM-WXX9, Ryzen 7 5800H, BIOS 2.32
         - HONOR MagicBook Pro 14 FMB-P, Core Ultra 5 225H, BIOS 1.16

       On NbF-XX the final series was hot-loaded; platform_profile
       reads balanced, Fn Lock reads 0 and the charge thresholds read
       75/80. Eren covered Fn+P and AC unplug on CREM-WXX9; Zheng
       covered those plus s2idle, battery thresholds, Fn Lock, the
       micmute LED and module reload on FMB-P. Physical Fn+P and unplug
       on NbF-XX with the current revision are still pending.

   4.2 0x2a6 timing.
       Zheng measured a refused STUB returning success in 0.8 ms while
       GTUB still read 1 at 0.9 ms; the EC reverted CRWM at 51.8 ms and
       emitted 0x2a6. The driver therefore refreshes on the event
       instead of reading back immediately.

   4.3 Build and host tests.
       The five patches apply to c339f4010dea and build as modules with
       W=1 for the development tree and Ubuntu 7.3.0-10-generic; the
       final revision was built by DKMS and hot-loaded. QEMU covered
       modern and event-only firmware, duplicate GUIDs, and
       unbind/rebind; the transport and profile harnesses passed 54 and
       19 cases with ASan and UBSan.

   4.4 thermald.
       Ubuntu's default thermald 2.5.12-1 caps PL1 below the firmware
       ceiling (25.2 W instead of 28 W on NbF-XX); thermald_next
       (8eeddcff786b, including f9411e884698) returns the full 28 W.
       That ceiling is set outside this driver.

   4.5 Firmware quirk on NbF-XX (BIOS 3.07).
       Fn+P enables Turbo at about 20% displayed charge, while STUB
       enables Turbo at about 20% battery health. The driver reports
       the firmware state and does not paper over the difference; the
       21% boundary is not tested.

5. What I did not test

   - other models, BIOS versions or firmware revisions
   - long runs, repeated suspend cycles, or concurrent stress
   - 0x2a5 semantics beyond Zheng's FMB-P observation
   - fan RPM; this machine exposes no fan sensor

6. Userspace counterparts

   6.1 ppd reads a firmware notification after about two seconds.
       sysfs_notify() generates a modification event without a
       close-write event. power-profiles-daemon 0.30's platform-profile
       driver only acts on G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT, so a
       Fn+P change reaches D-Bus about 2 s later. Handling
       G_FILE_MONITOR_EVENT_CHANGED as well, watching the inode with
       G_FILE_MONITOR_WATCH_HARD_LINKS, and setting the monitor rate
       limit to zero brings the observed Fn+P-to-D-Bus latency to
       11.6 ms going to performance and 6.8 ms going back to balanced
       with the same kernel. That change belongs to ppd and will be sent
       to the ppd project separately.

   6.2 tuned-ppd needs sysfs_acpi_monitor for firmware-initiated changes.
       Stock power-profiles-daemon 0.30 follows the notification
       immediately. Fedora's tuned-ppd only follows external
       platform_profile changes while its sysfs_acpi_monitor option is
       enabled (off by default before tuned commit bd5f2850, which
       enables it); see
       https://github.com/redhat-performance/tuned/issues/710. Enabling
       the option in ppd.conf or upgrading tuned makes the menu follow
       Fn+P.

7. Related change: Eren's charge-mode patch

   Eren's \SBCM patch also touches huawei_wmi_battery_get(), so the two
   series conflict in a few lines. v3 changes the helper signatures and
   the reply offsets; after his patch lands I will rebase on top of it.
   The combined tree builds cleanly; a hardware retest is pending.

8. Questions

   1. Is keeping the platform device for the existing sysfs ABI while
      binding the method, event and data devices on the WMI bus the
      right shape?
   2. Is treating 0x2a5 like 0x2a6 (re-read the mode, notify only on a
      change) acceptable, or would you prefer to leave 0x2a5 unhandled
      until its meaning is confirmed?
   3. Would you like the series split differently, for example the
      transport and __free changes sent separately first?

9. AI assistance

   OpenAI Codex assisted with code, test tooling and drafting this RFC.
   I set the scope, reviewed the changes and ran the hardware tests; the
   observations above are mine.

Thanks,
Fuwei

Fuwei Xie (5):
  platform/x86: huawei-wmi: scope method responses to each call
  platform/x86: huawei-wmi: bind the Huawei method device
  platform/x86: huawei-wmi: use the sized WMI method interface
  platform/x86: huawei-wmi: expose native firmware power profiles
  platform/x86: huawei-wmi: bind hotkeys and key data on the WMI bus

 drivers/platform/x86/Kconfig      |   1 +
 drivers/platform/x86/huawei-wmi.c | 778 +++++++++++++++++++++++---------------
 2 files changed, 468 insertions(+), 311 deletions(-)

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.55.0

