Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFB3CC315
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104998; cv=none; b=ARbLDqtiUgB8yLv4K5u7aWrqSNob2gUspIj+TuZX3d4LPuqgDUvM01jcnzTyqscWo1xdj0UG5t5ZIpZGeavo+mIjp9RFvxXOOTL+9YYBQoxFuxFRXsveuDxaQe0Mz1eikSkObdUUsMp8zPIvxKa/fiSKAEO2373ayXTiAOqL5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104998; c=relaxed/simple;
	bh=GCrd6HP1YqVVD2Shlp0bMzCJrut+8ZJ/wxofmulhorQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nA3SctSrdsw7eAznWAIKbBL6+Dr+qYL1kg2syZRMUBcOHtpXFTRWEoDbTSvdrVCQlth+lx0HKC+3npuY3QYWmtj6XqHMfwzO9dLKYhu9TZD8LqPV2/KTBdetq1DwMXwTQlvmdgZuE9sNYVnSq4Nn29yBPD0w/Xj5MxMBviz4v5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT7LlU0G; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT7LlU0G"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-48f2b0b12d4so226054fac.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104993; x=1790709793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vP5cScwKB/SRV52FulCQsVGt9v1UGZg+U5ZCK2dz35Y=;
        b=lT7LlU0GJs5rAhItnoiXp5A8VTWVWXW7zjKXD60XtirridtazMHxS7a5uWHpH0LkS4
         qbpDSlpg2MT7E+qkxMUFkMQ6QH2TcJTY0OSgxsjIhvq7riTbEMVC6xw3677qs+3n6ptq
         YqGxUL0GgvXZ9zfDX6ggTrTJAKJs4v52Lup93UJ/SSeVOsVvCU3C+i+c2HSsB8v7uxWI
         vvUTAuqi2yi3dhwEdXkMEMyRkIs0CUxjvYey0wNpaI8E8cRTTpU3+ThhWALPAVPnCTsv
         dXWg4Dk6hfsdeCpT4d9AOmPXBdQRJmOLTKlD8j9+xrYg0n50oyVmgtG07kGmeB+hQQNp
         k15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104993; x=1790709793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP5cScwKB/SRV52FulCQsVGt9v1UGZg+U5ZCK2dz35Y=;
        b=oM6S9OEPM7YoAEI4xTnbvDLa2/Ik1o9S/5yZ5ScL8Dj1b4w0rbzDNq8iyWXhkc7Osa
         0T/VKd14gfgT+OrFgf1ZUNc4IMjlPMhV1dcsWF0ZgbvnKEm7jmQgeVlWBQcCjZkGdAH/
         AeaUXxeTYKklzcNglRYkdu8Vsc4u34v78+mFKqtmHAudg08a+1CsH3Fd4f4GipOL1o0Z
         BGX3LR+K0Xm7+pZJxw8gyAysVc2YhOTwTSI/U9nIDwfxmaXwDFV+OAOyJuoXboZHAVai
         pf5NHcpGti63wHD0ACM7+1f1bPg/WXWN2Jr0y9a51WGOiJiS1S342IKOwwut+nuU/LYQ
         yxdw==
X-Forwarded-Encrypted: i=1; AKwUvBwaIlinkt6yV0O5IFLM3+TVsnRLbd+G1pWtYK60NJij4nIptsYSZ8/XD7pPslWsIUiA7tacFLeZjILwzgABHnhgXXrT@vger.kernel.org
X-Gm-Message-State: AFuF++mZXUnDTfeL3zfPTldj+VK/+GbtCJLTU5SEaC2h5/680v1zl9PM
	B51g3psFBNnjAzjRP835s4mk4LkYFdvWX3X0YTNut2r0t3jfka2T5VIg
X-Gm-Gg: AYBFou3SK6fcJ9wwTzYWk+f0uo9ygAiUIeJpV8yEpLCY3i0XLR+seAJ+QI7QXcz28f+
	SrlYKAKfJvhErHKUI8V3XcF7vMgjLJJ51NPApBDX0hDDBy4OfDrYIy3ZaG0vw27ZLITkUuucnJ2
	P/Geh2F/HDmKsevrRPXJtDrK46eUS1W0o+dZ2l6UxQgAPKFR5ltqtWL40SzW1fFzeO+9uPYtrg5
	9DA2RPx1FPggyRnBO2bzrFJUf+je+nHCvJTrGu6+MQeBsk+O5KRDoYKKEwL1J+190/qcOgtd8Tw
	kq3YEiY4g5ma7DjLmkQ3c3f+d3LG9aLKvGCCYSJqCTtPmdOlSPE3FdLRNdCq9pELyEo7sQsCLQA
	zrg6T3u7EKIu+8lHbrTpjhx/V+QyJiv2ps+TUqGj5If3AtWDMlsHdgFClDDJhhSsClTDHVMpp15
	mWO87W9phPavpifL9qKCtZH3m4jy3L0RSfcyMnMWDBtE2eFpcKWNUTASeKRAFE46LAN3Dh7j2C2
	q8Ec/yGFyoFeb0/F9ctYlaDrVrJ
X-Received: by 2002:a05:6870:392c:b0:475:a1ec:9613 with SMTP id 586e51a60fabf-49089d46c42mr664002fac.21.1790104993400;
        Tue, 22 Sep 2026 12:23:13 -0700 (PDT)
Received: from localhost ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908e66112asm489416fac.9.2026.09.22.12.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:23:12 -0700 (PDT)
From: sjunhyuk1@gmail.com
To: linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on 65W USB-C charger is non-deterministic across sessions (25W vs ~65W)
Date: Tue, 22 Sep 2026 15:23:12 -0400
Message-ID: <20260922192312.40607-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reporting a non-deterministic GPU power ceiling on a 65W USB-C charger,
in case it's useful alongside other recent reports of EC/PD-controller
firmware state issues (Legion Pro 7 16IAX10H, ASUS Vivobook K3605ZV).
I'm not certain this belongs to USB Type-C / UCSI rather than hp-wmi,
so I've sent it to both lists; happy to be redirected.

System
------
Model:  HP OMEN Transcend Gaming Laptop 14-fb1013dx (B94GQUA#ABA)
Board:  8E41
BIOS:   F.05 (confirmed latest via fwupd/LVFS)
GPU:    NVIDIA GeForce RTX 5060 Laptop GPU, VBIOS 98.06.2A.80.62
Driver: NVIDIA Open 610.57.04
Kernel: 7.2.5-3 (Arch, Omarchy)

Symptom
-------
On the OEM-rated 65W USB-C charger, nvidia-smi's "Current Power Limit"
lands on either 25.00W or ~60-65W depending on the boot/reconnect
session, and stays fixed at whichever value for the rest of that
session. A 140W charger reliably gives 50W (VBIOS default TGP);
battery-only reliably gives 40W. Confirmed under gpu_burn 100% load in
both 65W-charger outcomes:

  25W outcome:  24.7-25.5W draw, clock unstable 200-500MHz
  65W outcome:  59.4-64.9W draw, clock stable 1630-1860MHz

Which outcome a given session lands on appears session-scoped, not a
fixed hardware fault: the same physical charger, same port, same
cable produces either result depending on boot/reconnect history.

Ruled out
---------
- Kernel version: same kernel (7.2.5-3-omarchy) produced both the 25W
  and 65W outcomes on different boots.
- Battery charge state: tested 0%, 79%, 98%, 100% within one boot
  session, all still 25W.
- BIOS setting/update: F.05 confirmed latest via fwupd/LVFS; no
  relevant USB-C/adapter option in BIOS setup.
- ucsi_acpi driver presence: blacklisted it entirely, then re-ran the
  known-bad trigger (hot-swap the charger while powered on) - still
  landed on 25W. So the driver being loaded/unloaded is not itself
  the deciding factor.
- HP WMI GPU boost flags (commandtype 0x21/0x22 under command
  HPWMI_GM in hp-wmi.c, the CTGP/PPAB fields of struct
  victus_gpu_power_modes): wrote a read-only probe module issuing
  only the 0x21 GET across all four power states (battery/25W/65W/
  140W-triggered-50W). Raw response was byte-identical (00 01 01 57)
  in every state.
- HP WMI legacy "Smart Adapter" query (commandtype 0x0F under command
  HPWMI_READ; not defined in mainline hp-wmi.c's enum
  hp_wmi_commandtype, but present in a third-party Windows tool as a
  "smart power adapter status" query): also GET-only, also
  byte-identical (05 1c 1c 0d) between the 25W and 65W states.

Workarounds found
------------------
1. Full poweroff, physically unplug/replug the charger, then power
   on. Reliably restores ~65W in testing so far (recovers even from a
   25W-clamped state). An OS reboot alone, with the charger left
   connected, does not help; nor does hot-swapping the charger while
   powered on (that's actually the known trigger for landing on 25W).

2. Live driver reload with no reboot:
       sudo modprobe -r ucsi_acpi && sudo modprobe ucsi_acpi
   From a ~50W "in-between" state reached via a hot-swap, this
   recovered to 65W in 2/2 attempts within a few seconds. From the
   classic 25.00W clamp, it did not help in 2/2 attempts. A
   battery-only control (40W, no charger) showed no change either
   way, suggesting the effect is specific to USB-C PD renegotiation
   rather than a general power-limit reset - but it is clearly not a
   general substitute for (1).

Separately, this board also reproduces the NPCF ACPI-binding issue
described in NVIDIA/open-gpu-kernel-modules#1162 (Power Management
Object stays N/A, Dynamic Boost above the 50W base TGP never
activates) - confirmed via acpidump/iasl decompile, same topology and
field structure as reported there for board 8D40. That explains why
>50W boost never works here, but Power Management Object reads N/A in
both the 25W and 65W states, so it doesn't explain this particular
25W/65W split.

Full write-up with raw capture data:
https://claude.ai/artifact/WDAN76AWk1JpW49ZSGc2Cr

Happy to gather more diagnostics (EC register snapshots, more repro
counts, anything else useful) if that would help narrow this down.
