Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E496547072
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384371; cv=none; b=Ls1OMJLGybiv2L2tk9JIi0kpPQskd+6opuXhya0G6NNr1XjSkxti6025XMHMgwM9pEER9BiL0YUst+f+RhLC9uJfrb+VdUdPOI2vV/FWOYLeiufxrVwZKqr5T9b3n5lTU+nCLuo5kPvp7NeoFc02k+Sfr5dOGi9MfSiC/+hWh7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384371; c=relaxed/simple;
	bh=rCKg2xK48ruZpNYMS9/i+f2GHcInTmL6SGOl7FRGKE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLwDGGRbawlKSnHVEubUNKW2qsfhcVd/TkBRBmePCePpTVkKxq7hAgB+vLiY4+PlM30rZWY8/PIBQnNkYxKzsRzHPlUC54YpabOrbGvucDmUcR8CRe6BOj2i19qH9p/ZN1z7OZs8y9JuQWc/ws5PIwXZaU9p7LcF0dN4ic6fwm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MF0cAWAF; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF0cAWAF"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso824208f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 17:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384366; x=1790989166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJrTU06Om83SI/a3dYPjH5Hal8BndE9xiv+eIp2x1qY=;
        b=MF0cAWAF+sgB+uNDqVFFiy6oCby0zUjefgYeKeFAeYFEDIt44av8DM/NzbbAZnOuPx
         8y0P/fd4oyxmAdBv5ib+TSSV1B8tsbUspKviA071zBscnD39YcgvduZ5qKdwU2uXZni7
         H71ETSheEvs+SQ9zIXm9zfWlWA6+rJ7pWC+gmcjjaNhKZadf16mNsCntM44Na9TbgCYv
         Hul4mqfqajao0Z9vyqPmL9yW44/43nnooLir/D5r7uq3AcqOrr9nZ8nUZnkRF8E7wI3Q
         hAPTpyqtDTiRD7phZTEEuyrh0gF4CQTDrVSNokmdhCuIeBI06DFD6uQOS6BQP9dqftnU
         SLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384366; x=1790989166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJrTU06Om83SI/a3dYPjH5Hal8BndE9xiv+eIp2x1qY=;
        b=agskXI/jVJ6nNF+TVYG3oPkmIoF2faBbGiSZ29YdS4kfld0YgicA+xUEiucu4fQgbN
         48oSui7FVWFHg4qQs7lqsQJe/8Dkgzb+ZrdukR1gnaGFZ9V0iVN/Q01Jh/J6LBgbnhTY
         VmIKyQ1A/NlpudMdV706/yUpanANGWhcqWoaGFcyZF4Lb55Wax2zdbqrm9h6idngwrQ/
         ct7O7K6vr5nZuxYjaypxsuUnm/ctmOU/+zOQIUbY3jTb4qBqZ46cOWwkevFOav8mqf7A
         CEv7juNKSDcYkbeI5mQX4wolz0SLVZHCztXc4Iu2DoBwl7XWBoPOGNQpBf7LH7hvNUMy
         SuZA==
X-Gm-Message-State: AFuF++kIZVvp+X5/HTbHBHRBak/Vj40g86cBNKldcGTBMIcBtDZyMA5j
	LEoZwCTHo8lSXQ7/sq/KGOxINbLA+sJ3GP3AdeIWRZPxyyl6E9Xv7Y90/pqxgB1BGttioQ==
X-Gm-Gg: AYBFou2vA8AaSOrAH2TYoiY4GZrKoSqpMgfz8lo/48wHXtX8bvajo76bLaF9ShvVZ3t
	SVfzcVKZxn+s0/B/E38MRsjH30d+DdQaZhPrBY0xOc5tEti6wDe43xaZE9u6jpCCKzz2t3UIOqm
	M2NsLlux0pl5XAxDM2UGclLT417XZ8IEHLH3p0XBYHeYvDb2nDjnpbBG5d2pUiIC+vwvgl/IljL
	gAe85NbGq6sajvo0r+Be3UdIXysq8cjmqphf/MURbAUHTt8YX1AQSMzMKLOpNiIDERuDMxjgPIF
	hVsuVDetAUtTr/nqvHuryDZrDeJuFku+VE4YpQzIiSpskyLFLuPYWUz6ncOwojmqq8k5RGSwCF/
	f0WfptIwjPiPlrwPnPPzYaMLrbsyYzFxyagBgR4xJltRvz3Lep7I7xxwSIBrrw6gmo179arBjOr
	d0NVHLB8CiS0J+bY6iU7VVFhaQLAm2HNsVMwOCxiuWIk4Cm2RwrCTATXu0MwS+mRnbmqv5Eg==
X-Received: by 2002:a05:600c:314a:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-49fe66c86bcmr141643945e9.6.1790384366325;
        Fri, 25 Sep 2026 17:59:26 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm10195890f8f.9.2026.09.25.17.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 17:59:26 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Bartu Alev <bartualev@gmail.com>,
	stable@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 1/2] platform/x86: asus-wmi: fix TUF keyboard power state shutdown naming
Date: Sat, 26 Sep 2026 03:56:24 +0300
Message-ID: <20260926005625.171560-2-bartualev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926005625.171560-1-bartualev@gmail.com>
References: <20260925200744.129714-1-bartualev@gmail.com>
 <20260926005625.171560-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fourth state flag of kbd_rgb_state_index is currently named
"keyboard" and was historically assumed to have no effect. In hardware,
this bit (BIT(7) in the WMI DEVS payload) gates whether the keyboard
backlight remains illuminated during the ACPI S5 power-off sequence.

Hardware A/B testing on ASUS TUF Gaming A15 (FA507NV) confirms that
setting this bit causes the keyboard to light up white upon power-off,
while clearing it ensures a dark, clean shutdown.

Relabel this field from "keyboard" to "shutdown" to accurately describe
its hardware function and align it with userspace tooling (asusctl,
g-helper).

Fixes: 61f64515299e ("platform/x86: asus-wmi: Implement TUF laptop keyboard power states")
Cc: stable@vger.kernel.org
Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429ca7..db6ee1974838 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1119,10 +1119,10 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	u32 flags, cmd, boot, awake, sleep, keyboard;
+	u32 flags, cmd, boot, awake, sleep, shutdown;
 	int err;
 
-	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboard) != 5)
+	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &shutdown) != 5)
 		return -EINVAL;
 
 	if (cmd)
@@ -1135,7 +1135,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 		flags |= BIT(3);
 	if (sleep)
 		flags |= BIT(5);
-	if (keyboard)
+	if (shutdown)
 		flags |= BIT(7);
 
 	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
@@ -1149,7 +1149,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 static DEVICE_ATTR_WO(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
-			     "cmd boot awake sleep keyboard");
+			     "cmd boot awake sleep shutdown");
 
 static struct attribute *kbd_rgb_state_attrs[] = {
 	&dev_attr_kbd_rgb_state.attr,
-- 
2.55.0

