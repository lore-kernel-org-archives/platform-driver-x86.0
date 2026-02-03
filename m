Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9F2EF64C
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137366; cv=none; b=NVFtI5tBWYQLbx35eaH5GO7uwZKsFC69UZA2HD9swm7QCu5srO75FfbbKxWkyPDtCqk5+WlVDKeUsO/GlFeNtHLGfbyJlg2c8tDYDPXOu8hg94fF9ITKhMmP+h6KEkONWUmNJEYKuL5PDmOkbTKJOLv6voZPdD4Xh7piSMQivPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137366; c=relaxed/simple;
	bh=+puJDLlnbB/KM1dORCOCj3kYkN7CPO2nL8qYdS9IvwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JzbS+Mos06VPDJ0N1L5UpETVGF5+Pr5akXu1LrAPg+eFyGJfPv4xlHX0qKvJTtiT7je95laGfbLTtaYJQ2R85ptrWy7vyTQcnSVU6y1UIFN9tvA38BrXhrxvmYQNZCtbciRsww3jQeecScQ+ciE67nP3IQ21e9kphdUiNqtX4Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHiREcOj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHiREcOj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d2670932so5253005f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Feb 2026 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770137363; x=1770742163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bHAT4/Kzwmem9Xpx4dgmi4yVzbw8YuygAUIFJymYxk=;
        b=AHiREcOj1ml/egPDxq7vaiPV+wk2Q4KVMyxM823/a4hskEmWfuuB+6lhLbRDQCqTmT
         F/oK39pNU5eVWDQSfMT67EWirLB8Ckfl7A4EOptIQ7lp2yarqo2eiMKikEZnLQeiqOpR
         1QGElhjiSSSQ3hywc4EyrVEHgFvu7vJe5NCrMFubyyAl1HXvVV92fqCqpQI7gCAWKj66
         08uQ7pTUpJ6YFCXsxup2gHwefzhO5PLfeZiYiXVY9t5n0JNK0Sp8DjfquQ8eETCqX5g6
         wJ81fdJhzFdJ9seRHxewFm7rmrH6YBSBwjrpQ+qV7PFR7fp0KGSB+tmTbJ0qDvDFvT8v
         c8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137363; x=1770742163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bHAT4/Kzwmem9Xpx4dgmi4yVzbw8YuygAUIFJymYxk=;
        b=EkUDmIOPd6HQ3eaguc7M+4Z3KWo5PNAnpvg8odg28/YxYIp9KrmcgkKQsSv9YwFWHE
         UbF+tT7OYiij0FEzrbA+KiWarpJJe+AZhsyRQJhglRvnCIvPjF0iZmmB21Sl+LsEX2Ap
         30vKOxAkrT47c3XQzc1fppMeV+G1Pspo3cZpDP6Vux64nKYniNusur2+9XBvmMMhQ7Hv
         Vhgeiazfsn9bY8ggAVPLouG6FGulaJdIOS09i9On823kt5vH9DMwB35ZMj+L33JeTGG1
         F3u/KKMcTJ+uVF7D7aB287ufwdk66GwHjoO2YzjxWs1QQrlKnIeWdyE3wAHhdEcYtPLo
         Y8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVN7Ld1fPH0LdL27vNAuYZNpEZryCzH2SeZt8AmjYsCP5waZuyVUfTpdO9Vdx1Ty5P7EDaG0UqFnSIlIbdjJYXB5a/b@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJFviS8si3tyKqYQ7691NiIySz+U3Cd95lD2+vnZaErt5mH35
	H+FBPHsmwPDGf+iSsA2QnRyivCF0o5vGlIY3tld4CD8jjIK6IW8fE4Zb
X-Gm-Gg: AZuq6aKEsa+Daj0/36gyzsT78sQfsU6+Nv74wcy6ZEKE/Gp7kizTeXnwODzbWDu1fKB
	ZdHOtd4ZXR8NEsZJgwO+xGpg7Un7Cy5AyubdEKc+TFr1h/OTUCjyDK00ufBIP0JhSgoEfKCkH3P
	4GY+iN51WMbTYZ4cYoxYKgrJALmYlDo11+gBovT5VKm1bVpico/v7bkrxbCtD9fs4xGEkV4mAdv
	qBT+kCwEkdZ34UOO7MctmAy/osPZ3m38pnOjfBSuRm7cMa2Tn/zazK/g15OXUSpby6JDzZhQLbV
	yvZAXfKSkJVDamVLDWpvWvmz1EePuIgkwpmYkFGNGuNMeoK4YcRBhd2+AiSW+KZY6TpcInoRyMu
	jmEljE8sRWnAKeKPHWnDVzIiqp+oebcQvK59hs0GytuDZJmi5eOy1tHW8OQrr+i5OmwhaopzZpw
	fPtE2ENQzAsbzmCVvl1r5qkdZqG3nK8pqhRixi6trEYljZ
X-Received: by 2002:a05:6000:4308:b0:42b:2ee0:569f with SMTP id ffacd0b85a97d-435f3aaa353mr25333154f8f.33.1770137362686;
        Tue, 03 Feb 2026 08:49:22 -0800 (PST)
Received: from omen-14 (31-24-101.netrun.cytanet.com.cy. [31.153.24.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e135422csm55488786f8f.40.2026.02.03.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 08:49:22 -0800 (PST)
From: Anton Plotnikov <plotnikovanton@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anton Plotnikov <plotnikovanton@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: add Omen 14-fb1xxx (board 8E41) support
Date: Tue,  3 Feb 2026 18:48:32 +0200
Message-ID: <20260203164832.40514-1-plotnikovanton@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reverse engineering of the HP Omen Windows utility shows that for performance
mode it uses the same codes listed in hp_thermal_profile_omen_v1. Therefore it
seems sufficient to add the board model name to omen_thermal_profile_boards.

Tested on Omen 14-fb1xxx: CPU power in performance profile reaches the Windows
limit (65W), instead of 45W in automatic BIOS mode. Max fan speed was reached
as well.
---
 drivers/platform/x86/hp/hp-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea05..0a85120de 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -73,6 +73,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
 	"8A15", "8A42",
 	"8BAD",
+	"8E41",
 };
 
 /* DMI Board names of Omen laptops that are specifically set to be thermal
-- 
2.52.0

