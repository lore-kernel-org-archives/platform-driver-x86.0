Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038504;
	b=wcRZOwP2PRMe3Bd2mb9ax074NUzZ0TKfm9E5PyPp77HH8Lj7LxXoNLX8KueU2wjFxqx0
	 fEiAhDgD+dK9W4Wm8aBWmuwimf9HigJPQvvKaDZUmD4swDFEV1HEdHlEm/Pq2+TeAxjWY
	 LUqnbUv7zvfVr59K74kBsqRWlVPvaFcn8iBCdVAvouPrNVtRO+7bOD0UJPBIxEhdikPdJ
	 JyquMZPhu7L+xKsZkpXDHUHhmiJHw0GvH6aPwr5xnCgJbB4UU3GcjSXYRTMhwBqKf6hkt
	 mioRAK6Bb4fIL9zTrI/NTQqWEDgs0yBYiofgevFYRKv8QDCYs8i5a8Eb8w88vZrQaRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038504;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=dMzWrLAsLsiZVdZfhpeKx6ZFMvefQZ9ZvGw+l9QAydA=;
	b=CS4SAwDMzpNB5tZUYvSh7rNgtrt0oFU6QDcgrg2gFsHMHetr0+lObOFB+jHo9vmaNIse
	 NitGaqhhBRLsuJUMpPDHTq/Ve0FgVxZjGkHL6kAF2ONeNaviw3ckgKWiUAgx82jd508k2
	 PlR+mKcYdXzDCepDt6+xB8eGUCLdUcl/nJnKW5xY4hDCGaILhY2qmlUw7fOFoPtSozq9Z
	 Z9yT9ixwzPGdd73fvJMbdrC8yBHCd2HXq3hL3Cs0Tq5b7DHTqFjWFudUk0J48TDeaynkM
	 huAsbhqCPKHPHx5PsDbSWd6aECqoIGRbf8mw35hqNzHnjZqhNeU3NUSfwCb6xTyzvSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CFA606A32F;
	Wed, 18 Nov 2026 21:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CFA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795038454;
	bh=dMzWrLAsLsiZVdZfhpeKx6ZFMvefQZ9ZvGw+l9QAydA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FFRuPDNqhDAKWcnSL+oi/GtGkzt03qdmp9050POWl/63dVqi5lnOZA+vA8HOGUAt4
	 t7xinhHgiWdf6VPiE8WxTfmZ/WryuI/rBIZmkIyE2tdkCkxCeKB0Ahoo/p/nQT7mOw
	 FuS9gAf9uAs3xJiTvFoTnIH925yfp9Mlm8di6Axk=
X-QQ-mid: zesmtpsz2t1795038449t919f6a1a
X-QQ-Originating-IP: MmNCNnHa3Y0I+KLcy6s02vr5TZkVMZ1CP9j9ZIYH+r0=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.242])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 05:47:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12249567471895196813
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	erenozen@protonmail.com
Subject: [RFC PATCH v2 0/2] platform/x86: huawei-wmi: native Turbo profiles with capability detection
Date: Thu, 19 Nov 2026 00:13:09 +0800
Message-ID: <69C3BBDEF214121E+20261118161311.17252-1-12313607@mail.sustech.edu.cn>
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
Feedback-ID: zesmtpsz:mail.sustech.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NcfXIs+Ms1qHhu8uuxFn4YtUVkG3T2oLRxztvHWXkkc9kMrDpSleXVyj
	RZCcQTfwvE8Fh6F93nQSvNkLB6hwn9o251vlBeJgqomnkMDt8K9v2zkgaohYmAEaVb46OVC
	LatAetsmGr/UkFCKyouSJwhAx2KqLPcr4UfApaX2316L/1syIlJ+NzjELdLQJoMXw4OzAeG
	5dZyEmBKqVTlhJSPsqQ2Lr5LIjs1BdCZQJwrOTn+WeOUrQXnrWXtfNglQurBj5hCFvGzCXH
	mHNwXe+D+VcigAzqdDgaIOLJeeUlSQMhWlwLm9/UzSBsMs79LGb9+O/VLF5khLtJHHDNdxl
	h7ptzNWbW9ubLaFtOe0J8squBJRXTIzUkAyRPJKErhEiLMNLgAvFZ9w3e/J8DBQadL9vod4
	ZZtWDc8Nx3Dz2YA4SFzVdVFNCOHHJ/p/hrJGMftjiR7C/c4Anyrm5uDQkGO09xLZx7D8qT0
	swlZsV19vVRtVUWD/C0c3GzEom02Rk9vvOZVg2cD+89oPKicmXQizD2ams+KMBlKDJ0T5ia
	Ahl58cgL/FEdd8qXcBVZKz4O85zCngaWLVSIUJSOP3PaomFmyS1SnWeZSJLdaA7G3n0xKCq
	0obes3cT774vegn2IK/fSw5xNKc4/AiwYShOj535YotGOfdZHvcWs+Yad4nKI5X2RLWT6d5
	1qguDNKEkXE3/fpbwtM75V6RkrfpW5Kt1yBMZphodIxVpP4jP2Z57my5UVRdfCzrYEEcP37
	GXiDkAABDYp9BqjcOuAHZI8GBYiiOUIo82RqSRlYCQuNGmY6fNopdw1V753eLMRvvc0vt8y
	3f4xlZL7E9eFlLk5KFRW1axCyZWwBMYnjlrx1RmHAdbIFR2+lvviygw1fZMTNhlzLCIc9m5
	Iq3jF4dzkEi6/HygMO8gP80yTX/IvmzFaVYsuyyCrhozjezbc/tKvhLEc8JvrqwO6sZMHPQ
	N1oxlEsEt7Vj7GjuWQqEqmJ++GhLd33heT3eMJX2tFy/UJLzAP2ReutWY7HPYq85TArhT2p
	kL92rnLBJRMiNmoItMR/7TabhYHwg=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Hi Hans, Ilpo, and Eren,

This is RFC v2. Thank you for the comments on v1.

1. What this series does

   It exposes the firmware's own Turbo mode through platform_profile, so
   the desktop power mode control can switch it.

   The driver only maps states and refreshes what it reports. It does not
   write RAPL limits, does not force a fixed wattage, and does not add a
   background daemon.

2. What changed since v1

   2.1 Capability detection instead of an allowlist.
       v1 only worked on the exact model and BIOS I happened to own. The
       driver now checks, inside the Huawei WMI method device, that both
       GTUB and STUB exist and that a query returns a known state (0 or 1).
       The probe never changes the mode. If the check fails, no profile
       device is created and the rest of the driver keeps working as before.

   2.2 Short firmware replies are accepted.
       Some of the existing features receive short WMI packages. The
       transaction now accepts a package that is short but still contains a
       complete result, and requires GTUB/STUB to be ACPI methods before the
       Turbo query is attempted.

   2.3 Event handling follows Eren's observations.
       Eren reported firmware that returns status zero while refusing a
       request, that turns Turbo off on unplug without sending 0x2a0, and
       that sends two 0x2a1 events for one set. The read-back after a set,
       the power-supply notifier and the deferred refresh already cover all
       three cases.

3. What the two patches do

   Patch 1 keeps the two-call WMI handshake under the driver mutex, frees
   each reply before a retry, checks the payload shape and rejects replies
   that are too short to be complete.

   Patch 2 adds the Turbo get/set helpers, registers platform_profile with
   balanced and performance, and refreshes the reported state on WMI
   events, power-supply changes and resume.

4. What I tested

   4.1 Switching, on two systems.
       Ubuntu 26.04 (7.0.0-43) and Ubuntu 26.10 (7.3.0-10), NbF-XX BIOS
       3.07, Intel i5-1240P. The earlier runs used MOK-signed modules with
       Secure Boot enabled. The final v2 revision was re-tested on 26.10
       with Secure Boot disabled, after the module's MOK signature had been
       verified.

       On both systems: native switching, all three desktop modes, Fn+P in
       both directions, unplug and replug, battery power-saver, and one
       suspend/resume cycle passed. Each run restored the original module,
       the daemon and the original mode.

   4.2 Load, three desktop modes, 60 seconds each.
       Last-window package power:

         Ubuntu 26.04: 10.21 / 20.21 / 28.02 W
         Ubuntu 26.10:  9.94 / 19.97 / 25.20 W
         (power-saver / balanced / performance)

       Power-saver produced only 8 and 9 late samples, below my own
       10-sample bar, so those two numbers are descriptive only. This
       machine exposes no fan RPM sensor, so fan behaviour is not measured.

   4.3 The 25.20 W figure depends on thermald, not on this driver.
       Ubuntu's thermald 2.5.12-1 holds PL1 at a ceiling the firmware
       declares. With thermald_next (8eeddcff786b, which includes
       f9411e884698 "cdev_rapl: put PL1 at the PL1MAX ceiling when the
       device is not throttling") the same mode returned about 28 W on the
       same laptop. So the ceiling I measure is set outside this driver.
       That fix is currently in the thermald_next development branch only;
       it is not in a released thermald package yet, so reproducing the
       28 W result currently needs that branch built locally.

   4.4 Build and host tests.
       Both commits build as modules with W=1 against Ubuntu 7.0.0-43 and
       7.3.0-10 headers. 47 host-side cases passed with ASan and UBSan,
       covering missing methods, wrong ACPI object types, short replies,
       retries, silent refusal, and read-only probing.

5. What I did not test

   - any other model, BIOS version or firmware revision
   - machines without GTUB/STUB; the series should leave those untouched,
     but I could not verify it
   - long runs, repeated suspend cycles, or concurrent stress
   - fan RPM

6. Separate change: PPD state cache

   With only balanced and performance exposed by the firmware,
   power-profiles-daemon 0.30 maps power-saver to balanced but remembers
   the desktop mode that was asked for. A later balanced notification can
   then reset the desktop selection.

   I reproduced this in isolated PPD integration tests without the Huawei
   module, and caching the mapped platform mode fixes it. All 129
   integration tests passed on both systems. That change belongs to PPD
   and is not part of these kernel patches. Power-saver used firmware
   balanced and CPU EPP power in the hardware tests.

7. About Eren's test

   Eren reported that v1 plus a CREM-WXX9 / BIOS 2.32 DMI entry works on
   his Ryzen 7 5800H MateBook 16, with tuned-ppd, Fn+P and AC transitions.
   That report is why I moved from an allowlist to capability detection.

   That result is not carried into v2 as a Tested-by, because the probe
   changed. A retest of this version on CREM-WXX9 would be welcome.

8. Questions

   1. Is a capability gate on GTUB/STUB acceptable, or would you prefer a
      DMI quirk list in addition?
   2. Should 0x2a6 stay in the refresh path, even though its meaning is
      only known on one firmware? I do not assign it a general meaning.
   3. Would you like these two patches split differently, for example the
      transport fix sent on its own first?

9. AI assistance

   OpenAI Codex helped with firmware analysis, the code changes, test
   tooling and wording, in a debugging session that I directed. I set the
   scope and ran the hardware tests; the observations above are mine.

Thanks,
Fuwei

Fuwei Xie (2):
  platform/x86: huawei-wmi: serialize WMI retries and validate responses
  platform/x86: huawei-wmi: expose native Turbo mode as platform_profile

 drivers/platform/x86/Kconfig      |   1 +
 drivers/platform/x86/huawei-wmi.c | 328 ++++++++++++++++++++++++++++++--------
 2 files changed, 261 insertions(+), 68 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.53.0

