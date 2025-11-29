Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA4C199920
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Nov 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376368; cv=none; b=La3UTKLZbjU7lYTQqcmaAVE7VWb/ob2goNVcjucFgX2SnoV+vj3gz5PaGSy22LZ8w2854ls/c0BWnBx+wFWHhbIMUxjr+7z4reeLvwMeYYL8Zae+t8p37bJNtbFDNcC4diaUqiIMhkvz5uPxCv7gD0l+ryyIajWdrOLvFfekaMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376368; c=relaxed/simple;
	bh=Jh/783xqciUdedh9IDWPXZ2+CVD4b9ocBmZqKoH0yfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXfvzF65xj+7X1eiG5lWC3YECokudNaVC5Zf1WqcDeqMtQJ12AS2KhaHArY2ijO+7v4E8x4zqMFlBjvXnDSmQbQ4u6fg1wBQvv4NNR3Ae78pzAHSp88VVcOoGQzjqQFMdLeeJr9EcnZtFVxY+Ih++MC+cYP7yYSME7JwmDaKgAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5xWHzJa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5xWHzJa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2984dfae043so20601105ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 16:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376366; x=1764981166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/sv0PvGQwRqr1vhXxlC6sNnbZ+cS/dp1dWnLHgBvKk=;
        b=m5xWHzJaC25waKlq8PWRMMsWaBuRYjbdHb4bxvMtihJg6qriRih3ZS1UjNSVBmv2hp
         jjzJ7Px8EV+BkMtlM4BDvuPDg5pXOKX1V4TW7x61B6tFGZLaQdzQ4nkvnTNBONq3v4j7
         i6FwR70xsWvB22LsB4/UBwWR6lZgg+EhPirPTOehl3qeyLkqLHB290vMjPGOQr0Smfu3
         2Ukszl2IUwqqhYhlmuArNcetE19nVMjQ8SSYDc0q87f14ibs1mQ1W2QFMl2h4Du8clUD
         dTStBoYiGDQmUtt8uTHn6VbWq5EJTCJ14NsTD/kDMLnqg3hujMxyYsIde1Fe+KQEFhHT
         Nh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376366; x=1764981166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/sv0PvGQwRqr1vhXxlC6sNnbZ+cS/dp1dWnLHgBvKk=;
        b=NuOUtIWU3EMVN3fsmMwRX0o2WcU4KimTv9eRUUWegsjx472qNaH/rUW43nyIMT/WcY
         KGgcAYOVWQP51ThSzXeU5HdWCmND4r41QB23vR7+TXOaVVJK8Ne0DmsCuVJDp9e7SpRt
         8LUr/TIzueEglSmJtK3OaVzVoIsp4sSiQiAitMthCdJyqMHzfw/eIx/YK7b0bLcx25ON
         Fnrwdr33jXdPkEfM/QOCDJNwXPGluSOXyYZ6k7E6M0S9+FDZ/ZmSOkWmE50yHyUWMf9G
         95mOyVefGTmqvWsUjTdH/tfYHrnJ7oJzOf1yKJoHPwJtlkSc2ZGDGiuR3m3OVjlyePVk
         gJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS7SFTy/Z2fhKVc6jIrc2PYnVcyDl/B/nDk5bPNAV2GY3l3J4wI6xvjXPdx38p2WFvP1+zAAbsRWTHbuhNGLjBk9qh@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLcoErfYChGZjSDE4VH+HDWmP01A6/6V+nYJwhwcob5dWTc8C
	/bHpr2F8Q0owL+D8WgOK5tr9uKZELA7MyA0ytPI7obembW+1R4Vn115L
X-Gm-Gg: ASbGncsWt9CsvyV0XKun7LHwGJAgsF5Yx8cqSIEjW2v1+i/AtPMn7tm+QURzbnD2SMx
	cPLNxrV998MwxwpXbYdze1EUPslUZFm4YvVl79N7aD1vdFnzYbiXYKNm6PJXIMSpREQotjOc7Cr
	yGmDU5c2Enl+qsSNdjmuIzljm/dBZa2w9QqK2Fn5ZdvotCYpCb0etrGJzKL8YLRlR1SRbw5Z11z
	ed5FwFfuJk/ohgYGenwXnBN9OV51qH249Q/gQxHJwhpyhTpmJTWK4AgxDpqPE1n4W6rUWV0FNRy
	5iqoo3t23DjoKLghzRkeEs4+VQ1JZNejRIgjwWcxwFVcfeachgMGeIHrY+Gd2N68oRLbh6avth8
	TM+V1LrOsz0SV22x5J5GoQ7lvbNYJIazze0uU42HmNqWsDIuP956BamSnMUFMjF90m+iZRGCW6A
	3fLAqJ45LxACgd5VMfAH9moXUVHuY3sJOYgAkcU6YkwAMEB08KxCcOogr66DhvP5Dsug4GPucd4
	OX9
X-Google-Smtp-Source: AGHT+IGaG7HX0TRE9DPtAnNXxioWmI46iVYPjVATZ6u7cdhnEXZz3iP5AEmvXo+W0mfvPpLft8hqUQ==
X-Received: by 2002:a17:902:fc43:b0:295:6e0:7b0d with SMTP id d9443c01a7336-29b6c6bb2f3mr323906235ad.56.1764376366189;
        Fri, 28 Nov 2025 16:32:46 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:32:45 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 3/3] Documentation: thinkpad-acpi - Document doubletap_filter attribute
Date: Sat, 29 Nov 2025 09:25:33 +0900
Message-ID: <20251129002533.9070-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129002533.9070-1-vishnuocv@gmail.com>
References: <20251129002533.9070-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the doubletap_filter sysfs attribute for ThinkPad ACPI driver.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..a1e84d25e151 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1521,6 +1521,26 @@ Currently 2 antenna types are supported as mentioned below:
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+doubletap_filter
+----------------
+
+sysfs: doubletap_filter
+
+Controls whether TrackPoint doubletap events are filtered out. Doubletap is a
+feature where quickly tapping the TrackPoint twice triggers a special function key event.
+
+The available commands are::
+
+                cat /sys/devices/platform/thinkpad_acpi/doubletap_filter
+                echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_filter
+                echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_filter
+
+Values:
+	* 0 - doubletap events are processed (default)
+	* 1 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0

