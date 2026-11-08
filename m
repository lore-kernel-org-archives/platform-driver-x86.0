Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111478;
	b=sjmAvUbh44z/9DGzRm9UfrJfPMLnkbcLe5CK3RHl87svUVlTUeQHisf8TTdnS9kAxs4o
	 4rJd7ddpTu9c2JI9tXn74EgicxpkEfLSMi+25+W9u5NbAJ8jGr5xGgPb3WyxqiQswr1v7
	 cM58gKnCPE/ua/B1Pm+gQwBa81qN2tJ1CQHI4y3FfpH8U3ku0cgUY4NXRu4hvyHRGnv3X
	 GKr3dZllaqXqU/5+SN/2yq63f9HD4hrSUR5ljHPgU2qX7ItvzK03xeB4HdMRMmNp+0Jjq
	 JrZUtmeUSvWgyXIQDDMTIevK9RH3ac+f6jb5hH8VdAztItuZlW2btgm2/OjuIuvGqLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111478;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=y8TVDz2DGWUCnQIm6X0aU1xKZSROELon1gO9k0Csz00=;
	b=a3uEdgorDuV3XvUxHkq8aO1QoGOzBpZBQQR1AXEwTxtQyaj9nsytqK3g1bY3BbHOALbQ
	 BjiPq4NS7XezQ1ARP8NEcm/hW1gkqtxtjNNeCoHkjYZBxTllW5ttOt1AzBvh6ZgPvaeKK
	 GPH6ncPIg3ir5YOdvSH83v8XgflrGZXpVRmOo2NHQiEZcOpVXwnaTlr6hYSf8mvdzlHLs
	 jlQHacTO+nwlzDy/vHQizo8zk6stvn73iZIG4XEmnHy+x5CA0j2rQZSF8ELqvldLcRl14
	 wd+A0Wvz7uBPNaMZYZ3e28YmsMa0Opk60gsQuShb7hz01NBNzIR7/++ilWnQmcS/06Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=ipQJqDdR;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D588F606A31D;
	Sun,  8 Nov 2026 04:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D588F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=ipQJqDdR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1794111439;
	bh=y8TVDz2DGWUCnQIm6X0aU1xKZSROELon1gO9k0Csz00=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ipQJqDdRQTuN7nSwXg4Kq/P3DaaleQPGC4NwBjIe0MbzPWv2Wsy5I08OdhSsPo6MH
	 LUMNPfCoNPofYKSz6yL52LrMBSzE2zWNhEUngZnsEjU+goAlTELymTM13xY0343ijA
	 bjy6jfSC+wU67IWnR+ccxtDlTZWJVE/cw/MTCJLk=
X-QQ-mid: zesmtpgz6t1794111435te6ab0396
X-QQ-Originating-IP: OgnwCmsVEMCaQhezn6a+3Z759nHllDLgIdMetJcZqhk=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 08 Nov 2026 12:17:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8155728893601798832
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] platform/x86: huawei-wmi: native Turbo mode as platform_profile
Date: Sun,  8 Nov 2026 12:17:11 +0800
Message-ID: <5B1B48AF3851EE25+20261108041714.328986-1-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.53.0
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
X-QQ-XMAILINFO: MjP4urDnSEKVFiKpg5bJ18eE3jz1JW0rgWy0YoZVehopZTuNvR0vtJ9l
	2p0+ZMJ6gBuuQdZEa09r6XawVZjWwKvhwqRU+FS28Gm+SewjSgwMWVmImEvEFcH4umhpHzt
	3+YEbkOPCJuVZtveImfiTJ5DvVEjRNQfF68jpBgaYxZUFPaKKwB/2/ms/1cyToo5o7gPBFg
	UmO7A0CJmP2YJg/1DZoPOIJiaqadLPZ1C0y8ts9PIypOB3XWOWAi5166IVu6Z/0CEYONmQ6
	653N/CJIjyHdZT7qkO74XOFA5L9bby+UPbPCMrGwWT2E72vHq60aYOZr+xBqLig4tiUthcz
	/736rc1+ixYWyq3ndPYAC3eiE0/UN6KvO8Lsiy/SRa16S70i65U0lXrGld/PkMfrQ7Nec6N
	2S9yCTJx/XCRxrgWL0eCyN2elQLgGYVWp9dgjCaLlTxYKHu1ufD89w6UTerSTXxAaZx3rvG
	NKyejiebUNEUmPggQjU2RxeN8dUTyAZ3pahNSZvKQScdQ+LX3pe/DdR2QAijekgRg7BIVs3
	vnUiT3KJUz9V4ryC63eXuRhFbrGNLGfg2WrvfltK/3M/fe3D+XSxa+DunucYdryYDBrSwqT
	ToSWFv0PsuOyiYIHlqHClV7vBj6a4AhJmF5TgQ6FVGoYPIwFxu9T+llJW/Wooc84hnjmBLd
	x+IKl/LTET8cKsHu7cNEO9c59EEdCKqM8fe+R4AU0FWZ0xfffXQXZ6JfaHZnw2RVpyxZ9Wo
	VWE1YpqDCSk0bYP/Ueoqe0ij6q5/IRsYNOrd/o8QkSo9mZd7t3cFCu+XInplGTPhL7jrXQF
	9lggODIpqo5pSCPXwlncaVyIGxvH4FJovdVU+w+6KixBOHXp6i6CRjIXJIt0xgoQcSBycJL
	Pii2X5WiO+57W8IvXoxekwN6EwhiaQUh3XBs8GusZCwMSoS5ho6yUIZsQhNKudIKSzl4sRy
	BZpQEdpLq17d4jpPZ9uNMWoRuSxw1HpNJoe40fDREpeHH4MZdI1CLk9vYgMg6UN6lE5vWeN
	HI3J4GAv3uRpsH1pyvIUv5GxmE4ZR3/odTX0oaPDNpW06WKKefBs2N+l3Mb4ShLKvn1/mQb
	oFbOa73AUxcSGNZoh38i4gAJucK+ADFb2BeiG5Dn2/KxFElS2dbruo=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hello Hans, Ilpo and everyone on the list,

This is an RFC patch series. It is not ready to merge.

I am sending code in the first round on purpose. The interface question is
easier to settle with the diff in front of us than in the abstract.

Short version: on my laptop the firmware already has a Turbo mode, and the
driver already receives its change notifications, but the driver never
connects that mode to platform_profile. So the desktop power mode control
has nothing to switch.

Everything below comes from one machine:

  HUAWEI NbF-XX, BIOS 3.07, Intel Core i5-1240P
  Ubuntu kernel 7.0.0-42.42, power-profiles-daemon 0.30, thermald

The problem

Two things are missing in the current driver:

  1. It cannot read or set the firmware's Turbo state.
  2. It does not register platform_profile, so PPD falls back to its
     placeholder driver and the desktop switch does nothing.

There is also a smaller gap. The firmware announces Turbo changes through
WMI events 0x2a0 and 0x2a1. The driver has no mapping for them, so they
appear in dmesg as "Unknown key pressed, code: 0x02a0". By the time those
events arrive the hardware mode has probably already changed; only the
reporting is missing.

What the firmware provides

I decompiled this machine's DSDT and SSDTs. They define two ACPI methods
behind WMI commands:

  0x00000e04 -> GTUB, read the Turbo state
  0x00000f04 -> STUB, set the Turbo state (requested value in input byte 2)

The mapping used by patch 2 is:

  Turbo off -> PLATFORM_PROFILE_BALANCED
  Turbo on  -> PLATFORM_PROFILE_PERFORMANCE

STUB itself requires AC power and a battery charge of at least 21%, and it
applies that check to both enabling and disabling. The driver keeps that
behaviour and reports the firmware refusal as an error instead of working
around it. I have not tested the 21% boundary.

What the two patches do

1/2 - transport only. Keeps the two-call WMI handshake under the driver
mutex, frees each response before a retry, validates the payload shape and
rejects short responses. This does not depend on the profile feature.

2/2 - the feature. Adds Turbo get/set helpers, registers platform_profile
with balanced and performance, re-reads the state after a set and reports
a mismatch instead of claiming success, and refreshes the reported state on
WMI mode events, power supply changes and resume via a workqueue. It also
adds "select ACPI_PLATFORM_PROFILE" to Kconfig.

There is no polling timer, no kernel thread, no userspace daemon, no direct
EC or MMIO power limit write, and no custom fan curve. Real power and fan
behaviour stays with the firmware and the existing thermal stack.

What I tested

The series applies and builds cleanly against platform-drivers-x86
for-next (c339f4010, v7.3), including with W=1, and checkpatch --strict
reports no problems.

The hardware results below were measured with a DKMS build based on the
v7.0 driver source, which carries the same change set. The for-next
series has not been loaded on hardware yet; it differs only in
whitespace and in the surrounding upstream code.

On the machine above, with the driver built as a DKMS module signed by a
locally enrolled MOK and Secure Boot enabled:

  - balanced <-> performance round trips worked through both the desktop
    control and the native sysfs interface
  - Fn+P changed the mode, and PPD followed it in both directions
  - AC unplug and replug worked; the firmware went back to balanced on
    unplug and PPD followed
  - one s2idle cycle of about 11 seconds worked, including a mode change
    after resume
  - a normal reboot loaded the module automatically; mode switching still
    worked afterwards
  - two 60 second runs with 16 SHA256 workers each gave final-window mean
    package power of 19.99 W in balanced and 27.98 W in performance, with
    PL1 reading back as 20 W and 28 W
  - a full kernel build in performance mode ran with PL1 at 28 W, the
    package steady at 86 C, and no new thermal-throttle events over a six
    second sample

What I did not test

  - any other model, BIOS version or kernel
  - long runs or stability over hours
  - the 21% battery boundary
  - fan RPM. This machine exposes no fan sensor, so "the fan is louder in
    performance" is what I heard, not a measurement

The two load runs started at different temperatures, so the numbers are not
a controlled benchmark. On one later switch back to balanced I briefly saw
29.5 W before it settled at 20 W. The driver does not promise a fixed
wattage at any point.

Questions

1. Is platform_profile the right place for this mode in huawei-wmi, or
   would you rather see a separate attribute first? Is anyone else already
   working on it?
2. Is an exact model and BIOS restriction acceptable for a first series,
   or would you prefer a capability check only? I restricted it because I
   can only test this one firmware, and because a wrong guess on a
   different model could drive it into a power state it does not expect.
3. This series uses platform_profile_register() with explicit removal,
   while several other platform/x86 drivers use
   devm_platform_profile_register(). Would you prefer the devm variant?
4. The driver re-queries on 0x2a0, 0x2a1 and 0x2a6. I do not know what
   0x2a6 means yet. Should the first version leave it out until I do?

Tooling disclosure

OpenAI Codex assisted with the firmware analysis, the driver changes, the
test scripts and this email. I set the direction and the constraints, and I
ran all of the hardware tests myself; the observations above are mine. The
code has not had human upstream review, which is what this series is asking
for.

Thanks for your time.

Fuwei Xie


Fuwei Xie (2):
  platform/x86: huawei-wmi: serialize WMI retries and validate responses
  platform/x86: huawei-wmi: expose native Turbo mode as platform_profile

 drivers/platform/x86/Kconfig      |   1 +
 drivers/platform/x86/huawei-wmi.c | 290 ++++++++++++++++++++++++------
 2 files changed, 233 insertions(+), 58 deletions(-)

-- 
2.53.0

