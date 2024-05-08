Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1148378C9E
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715165005; cv=none; b=XrROqSIDoSQNZUe/oHngfr4FhSY/HL6Vg17ttqLfaaolqOqA30iKGy5fnPCcvmg6xZDxDR1jsd6Yg02eCMxkBrqwDWVnfC5ZS9l5G5hESfIDfHF6iObiw+XEhcB3SeHtSMJPTT56n2P36cTbm5jd9PIqkxCNb0mPPPRWeGvOxGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715165005; c=relaxed/simple;
	bh=AdV+B9yUmsPOyuDJKdAkNFoSqAGDd/uKzuOMYP2Y0+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IBsl5Mvo3/+bpUakfGRUr8A19TLf2tb1LNPJNxkk5G4Qrst/oJO1mHZBef0aWM32eaE2cpzZGoYnRDqIrAmyJ9skFrt5+RG0tpvkMLLh/ObHTUdr7naBNprvw941/Y97AyrnQTbDScFM99EJv8Fd3t4Tvy28uB6vTejWbG/QqAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=aX0Pcbz3; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="aX0Pcbz3"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59ece5e18bso482772966b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 May 2024 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1715165001; x=1715769801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AImnvo1Yv6QQBwBo/PQQOErjpEng1YiXNlTdoFkDN/c=;
        b=aX0Pcbz3cZtlC+JPuc+tv5udwZNr8a+ZCWod4bNrwhjpnrQo3P/VZokOotnZ4x+mub
         KduD1gxBJlib9CH82f3v2k6kzTaD+rcck8xFhXxGsopNg0/Wcs+/WlPQLabt4fQYCbI9
         YyrtpkZr4Kg46dqK/B7s/sHh/ikocit+fWYJFUugPE6MgNNia0bXflrezUKZ95PsYv+k
         nwA0phSYoY7vRPKGY3F6aHt3IfEcT7JM1Q1dXADN51nP47KwE9FpR8kDyugLYwVpElRp
         52vt8uI4uE2FCOnwpDjgY/VOMxkwsIkYWvdo76Rsd5ns7Lp23OdnUwuHQdUcpH00P/ex
         6bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715165001; x=1715769801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AImnvo1Yv6QQBwBo/PQQOErjpEng1YiXNlTdoFkDN/c=;
        b=EGp2zFajx5cj3p+39dhHucaR8SXnIMx+y0LuvdlLNquY4I/q/gcchqLrZw5/HUwF/k
         C07iX6GY9dM3m4w4ABN5G1NTOPu1btUFkN/Yme1c+U4T1Rw4Os5oCuX4CHwcbqHcFTuM
         6SJS2maClNeYAnDe1jBOb9nH36UKlmvrbNMG+31BouRum2hMRL61mJDxmsI5mifK9S41
         Zl9tIQhiQxz9k3577Vudfn0J4cn9S7TcxWrWVYuLhnLMEbNo5q6wKiazDacYb0NtpMtR
         fkaceZesxzrOrI5rXHAZnAhZkdHbx3d7MWwKx3VNfVbRTeE+BgnGSaZHRP/v4ApXfDaA
         et6A==
X-Gm-Message-State: AOJu0YwOrn3BwZYGQ2GUfIRCgsXy9EENKZUEEcxqX9i9L/AkiGqlEBn5
	0ti0qcKFRp2vOEgMK3hnbWLrlUBpJEYNVS78PW+gmmXav00wAxq7jXKa5sUqSyc=
X-Google-Smtp-Source: AGHT+IFInUoAInvNUg+Pr6feANwga+FXl0TeerqG+DsnNLAldMdb7HKUnSL+Mh0YRl5gYy0rkPm9+g==
X-Received: by 2002:a17:906:f8da:b0:a59:c0a6:25cd with SMTP id a640c23a62f3a-a59fb91fa9emr172899266b.5.1715165001153;
        Wed, 08 May 2024 03:43:21 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-100.dynamic.mnet-online.de. [62.216.208.100])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906548d00b00a59caa028b0sm3877237ejo.225.2024.05.08.03.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 03:43:20 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] platform/x86/amd/pmf: Use memdup_user()
Date: Wed,  8 May 2024 11:46:29 +0200
Message-ID: <20240508094628.308221-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switching to memdup_user() overwrites the allocated memory only once,
whereas kzalloc() followed by copy_from_user() initializes the allocated
memory to zero and then immediately overwrites it.

Fixes the following Coccinelle/coccicheck warning reported by
memdup_user.cocci:

	WARNING opportunity for memdup_user

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index b438de4d6bfc..1b53cabc9aa2 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -301,14 +301,9 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 		return -EINVAL;
 
 	/* re-alloc to the new buffer length of the policy binary */
-	new_policy_buf = kzalloc(length, GFP_KERNEL);
-	if (!new_policy_buf)
-		return -ENOMEM;
-
-	if (copy_from_user(new_policy_buf, buf, length)) {
-		kfree(new_policy_buf);
-		return -EFAULT;
-	}
+	new_policy_buf = memdup_user(buf, length);
+	if (IS_ERR(new_policy_buf))
+		return PTR_ERR(new_policy_buf);
 
 	kfree(dev->policy_buf);
 	dev->policy_buf = new_policy_buf;
-- 
2.45.0

