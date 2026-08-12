Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9443EFFA7
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525221; cv=none; b=ICZg7t0/fzxzBG4B2bJ4XlKOKXaMIc1Ppp9j2dLsIVzzwqPYMs4By7T1dEKFyk95bP8kEsaHX2JneIAFh6Ic4ViPV255SET/hbTIXIrslfCQRs2Kr3bThRy8XQpzDRqr26D+L5IUcSj77aV03upJvV6F/I//5CFy7F8fx/AD0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525221; c=relaxed/simple;
	bh=yqBRs45rJW/f0nLW7fpTNVLvsms8VxpJ9uXllGHL8qI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fxBWFAvFFYIqcjbo0B4J1pYgyiYJB1MzeKigUBYRwe/V0oN3EIim5rpkRw0CbPy7nYkbqSn5JLL97LJgw0BXVgyBK5AO59pTB35E863kQ790RSJxptcnQKdTRBdgf4oIs6FRTAk6JdLhARM0t7co+/+twQWk9yB2EqPEkUPcX3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdbPIqey; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdbPIqey"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso465587a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786525219; x=1787130019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrc/ShWziw9uFMoeJyr/D7LL2jAZid2JLgmjk8Dtuqg=;
        b=PdbPIqeyujfPQZ//rTzOCq0rXiUEfiTpXNDu2EmdhprFGn7QnnnEem8Bdko1WTNX3z
         gyWy9IOSthZWeqISlWVr0bRTQNbjkytAtxxitPSErzlHsIuUiNApftpwy8AB7b2Uoc6h
         0SQ7LGz1rES2z250csTFwCVkTqMTSQt7lZ1F/Pw8BFh2ru6xeeTeQgspVkgMlZ213flR
         p7z7gFXWzPSGDdfE+MNipqxmg5U4/g7Fp4TIlaW/CsrSd6gyDotxCBGN5ACk1xrOuFBU
         q0H9Lr2dloo/7cnMxzIseRYoN3vTFO+rdWPuZAAu+9Npa9HT7cVSrYrhV9XIK46kAFlK
         Ugaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786525219; x=1787130019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrc/ShWziw9uFMoeJyr/D7LL2jAZid2JLgmjk8Dtuqg=;
        b=blkSOpyte9V/KcO2HmwvRi0cb8NDh++k/AOuAhpG75nxhDi/qQi3TNTseflyeBo3dk
         V8cB4m3dKOz72nx2p3DIO2U3BSTDjSCo9vauxDFVZArz69zX2EYdol/0beM6iCvpZooa
         lz2USSpeJuAiVGb58kJZ5nAcOwmpg0WEDVcoFpOitdpgwWRXfJfbi8XFqqhEqQYkKKg7
         /TFPr+leN3wtEIImpu7ZtZVWw99lY9CSsz8SkEXbNVzBpC51zX/68SH9FiKak/NZEzGj
         unM7Z4kSvXdgGbxOb2i91vWp1ISJnwUrZr9aYmDhlLlOxrrelui/k0DJtvp4E/JEEYHb
         Et2g==
X-Forwarded-Encrypted: i=1; AHgh+RrlY1/WarUvwLx+RHGo9pHM3+dSCd+x4XK9KWCCyNlD3bQIgpKK/B7EuuAGEzkBnQmEYth6Jukx3+JTFD8XyCErKxSc@vger.kernel.org
X-Gm-Message-State: AOJu0YzXe2+E/e/KcmxIvYcDP+a9g3zGsknZzlgDe91wtruUwYmlshAR
	hxetA503DIYQM1DLgsvqO+JUHRO7bkQtyODb/WL6rpnyGj2uVmpma58Z
X-Gm-Gg: AR+sD11EMBYrWteTVJYafSOr+P6m8CaPipV8VOZz8oafmwMD3an+0XibXU06ZKwU5QQ
	oh8bfZMqM3MFEzfXNhHj1NyEKGcC1ucLHSvDufFTke7cysNQwPPhd459IsBsBliWVIBYxJ+j4wm
	W+kWOCmQpPNsKynN8h6DXfWHnR3qhG6Jmf8wEfEnH8wAjZKWisHkzj5FK5nBtvPyBTM0LwICBoR
	LJzkcZp70PiQxJk+pxxC8XLHXzxp1a0aW8pS7hgNOEDrYaymMmMP3mmeo0tVEOZxOFUqK3SeHaj
	3LAMtoDsBG+72WkIQ+zAuNGTyb/Mi9Pum+Orjld3Xv6S2ugoDBwxyYv0l/Zq97nVRNheMWTyZr8
	v0Wq6Jni8b8LTwCVHxh6Ni204hgve4MrV0UMgfZ3claQS41wl1NxanWL3KQBLKcuswnAL53HQjg
	G9/bl68cL7H0qD9Qf5GRnzSpCYnH07ZVjGxYr76fojvHit73V+s4XVtfHzbBaQ9QxSg5Gez6Zcy
	M7Vb9F8UQg=
X-Received: by 2002:a05:6a20:431c:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3cc3f5b35fdmr3946999637.9.1786525219239;
        Wed, 12 Aug 2026 02:00:19 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d726f1sm13571562eec.26.2026.08.12.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 02:00:18 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: naveenkrishna.chatradhi@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: carlos.bilbao@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd/hsmp: Reject negative power cap writes in hwmon
Date: Wed, 12 Aug 2026 14:30:12 +0530
Message-ID: <20260812090012.140193-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hsmp_hwmon_write() takes the user-supplied hwmon value as a signed long
and assigns "val / MICROWATT_PER_MILLIWATT" to msg.args[0], which is a
__u32.  MICROWATT_PER_MILLIWATT is an unsigned long, so a negative write
to power1_cap (e.g. "echo -1 > power1_cap") is first converted to a huge
unsigned value by the division and then stored into the u32 argument.

As a result a nonsensical, multi-gigawatt socket power limit is sent to
the SMU via HSMP_SET_SOCKET_POWER_LIMIT instead of the write being
rejected.

Reject negative values with -EINVAL before the conversion.

Tested with HSMP enabled:

  CAP=$(dirname $(grep -l amd_hsmp_hwmon \
        /sys/class/hwmon/hwmon*/name | head -1))/power1_cap

  # negative write
  echo -1000000 > $CAP ; echo "ret=$?"
  # valid positive write must still work
  echo 400000000 > $CAP ; echo "ret=$?"

Before:
  # echo -1000000 > $CAP ; echo "ret=$?"
  ret=0                             <- accepted; bogus limit sent to SMU
  # echo 400000000 > $CAP ; echo "ret=$?"
  ret=0

After:
  # echo -1000000 > $CAP ; echo "ret=$?"
  bash: echo: write error: Invalid argument
  ret=1                             <- rejected with -EINVAL
  # echo 400000000 > $CAP ; echo "ret=$?"
  ret=0                             <- valid write still works

Fixes: 92c025db52bb ("platform/x86/amd/hsmp: Report power via hwmon sensors")
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/platform/x86/amd/hsmp/hwmon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
index 0cc9a742497f..c8314eee06f4 100644
--- a/drivers/platform/x86/amd/hsmp/hwmon.c
+++ b/drivers/platform/x86/amd/hsmp/hwmon.c
@@ -31,6 +31,9 @@ static int hsmp_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	if (attr != hwmon_power_cap)
 		return -EOPNOTSUPP;
 
+	if (val < 0)
+		return -EINVAL;
+
 	msg.num_args = 1;
 	msg.args[0] = val / MICROWATT_PER_MILLIWATT;
 	msg.msg_id = HSMP_SET_SOCKET_POWER_LIMIT;
-- 
2.43.7

