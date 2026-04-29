Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F413F0755
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468936; cv=none; b=qT6W2EEXYWFTDf4FHuFQsW2qNCL/Ov8B0fJ4LEqOho3JmI/YPwTZ6xfFREn9FIWpWRIAqX4xuZmViEg6nNoNBGZGBOf7Za3J4eHgHws11WBpHcOCNKD+qkmGsRmr76PBT61vT2c+upyESxIkAQKXer8NSVsK2nPRtHsu7qAV4BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468936; c=relaxed/simple;
	bh=aUpuia9WHgQ6hOfyLswMT8zkOHsljxgxrYt3rFLKGhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OgMBwcve+qkLnVfDFAq6VVprSAv6QQT2U0caBdEU+XOJjRbF+j8Y3yYIbvlLiZmPZGfFWuGP9r0kIYMdt2RUJ/ocVuxV1klHs8RYf5HRqlJWCiHEPftrt3XYlg8w8fApCU1DKAZJ4f3r803t0+aHZ6Oog4xygKiRYJBpIbiYPPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqzQR0Si; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqzQR0Si"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-60fd9b71745so4456515137.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468934; x=1778073734; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JBJhqbzIuFLPCqvZh+266Ro7P+AUWSmBUVOhMjvMuMI=;
        b=bqzQR0Si99zp9f5m9Wlbscviw1WXheye6ZOVM8rdkB0PLu3E/86L0n9D/FDJbZLc4k
         e3z+3ZjHgRSowr2jcyArQBxt23XcJ33sHRzQl6jPDwLZoCvardnNwKA34cM0dYCdqmn5
         4QrJUxjKSwHJYfy7AlPmBMGR5ZWJlNaPDyjyg+kRyQrdChtkuB0lzZ+vycz6iIRX8AOb
         J9VNmpvZRJBrUPAPFCgcLbl+LFB2dXM0sqWGZLyoI2P2wPAV+VH68WIO9dgrKS1Ee2ee
         GMA+sGjg4u/7xUARWcC0ZUAEd/yCbRX/K3RHbXj+UcHUXyAkuc0hFqjZbkedUK4t1RF1
         umdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468934; x=1778073734;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBJhqbzIuFLPCqvZh+266Ro7P+AUWSmBUVOhMjvMuMI=;
        b=QUYXCwVba2rQntcsSiY0Yrgo1nBQbX3gO0D1nEPn8xzbCGqR0s7MSLFdZLUSKfAV5X
         duiiMlL+pkIqUmQUqKqrwMjFnWq1AEBH863kUtJATRTyw715tOEW8BgSxf1o7K8xuEcS
         YVX3VlOfEvl9xqiirKfhm7svr3z7GSB3v6s69FXmYo7tXalZvvlFGK8+yuq+Sormw50r
         kfJFKjqHAkHs5AtWfgBI2lLHB6YPULDvM7wz50oeaaogWOS/AcMn5iMNuVryD+HPVQOJ
         1CN8II+dxBS04GWtKRd61qePYMY+Z8MVQuiTy9MASD+RcLeKnis2lknygidg0sZeAjz2
         QnzQ==
X-Gm-Message-State: AOJu0Yyel9UCoHzFofILlan8/MdXsdqEXlUOdjviAB5XmzpgtyQqv14n
	ocJ0xg7ZAieIA/4Oyi3a1CzJ4YOt4iUPSC3RP4YdoA0r20WmX40p1Ray7qg1vQ==
X-Gm-Gg: AeBDieu8JRA8hr5kIB2IAWXRD/7HXENKfvAcryS6pM5+GWW5fObEP7bXKPFUhh5ErWB
	K0KJc6f1U4rnoZXqKK7R1D418v07CHlSAh4d5GKdA1WSmJjzD5kFRHUkIRkoq9NlAF+IQfs9km3
	ZyX9jMoFJ984dqNNXRLho9VbvQUZy43u0IeASKTIOJkpyecE2L3OZ8tfyrVHR5jNmPhZz02MaZV
	EyyVZ0NtQifSw53tSmUmauAQvMGCQ49r14/YN74w9NP+/07iZHfypyUJlDMSUlNkIJXlKjPThfZ
	gqkmuyRBkX3V1ER3Q1DSDGLckuK5407eSXiNHpbSPbsCER/O7twDCvyQw9tnTakGoTGx6nctNUq
	TwqhFPtAYySud09l8tNue692LIsL+FN5w0SsVvFU9AmTDdtZQTU2Rhc7/b3jgn/p8Vby7Rja573
	my20TwSrazIBZV1jNXl3MVpa9tZY8KQ3bU
X-Received: by 2002:a05:6102:3f90:b0:610:5b9:dde6 with SMTP id ada2fe7eead31-62808c5236amr3825955137.6.1777468934093;
        Wed, 29 Apr 2026 06:22:14 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb760fbe7sm952704241.7.2026.04.29.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:13 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 29 Apr 2026 08:20:56 -0500
Subject: [PATCH] platform/wmi: Fix unchecked min_size in
 wmidev_invoke_method()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-invoke-fix-v1-1-ce938eb80cd3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QpAMBRAf0X32WrWrPgVeWDuuNRoQ0r7dxeP5
 9Q5N0QMhBHq7IaAJ0VaPUORZ2Cnzo8oaGAGJZWRWlWC/LkuKBxdQmvH1lXSlgY42AKy/mZN+3M
 8+hnt/h4gpQdju+1dbgAAAA==
X-Change-ID: 20260429-invoke-fix-44f026f90c56
To: Armin Wolf <W_Armin@gmx.de>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=aUpuia9WHgQ6hOfyLswMT8zkOHsljxgxrYt3rFLKGhE=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJmfWD9+6ery51i6vb/jRt7zQ5M1HZtduJ6wsx6Z7BQau
 fm13redHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjARbWZGhsMnzUWDjH5PeLMo
 Z4dvxhOBk+eu38k8L/D13nG3+pNJJ88yMqzJVPQQ7HvqdSst9eWB9qXMBgEnp257uF962Z0ZR06
 t3s8OAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

After calling wmidev_evaluate_method(), if the ACPI core does not return
an out object, then wmidev_invoke_method() bypasses the min_size check
and returns 0. Add a check for min_size if there is not an out object.

Fixes: 1aeded2f55f0 ("platform/wmi: Extend wmidev_query_block() to reject undersized data")
Closes: https://sashiko.dev/#/patchset/20260406203237.2970-1-W_Armin%40gmx.de
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/wmi/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 7aa40dab6145..5a2ffcbab6af 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -411,6 +411,9 @@ int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method_id,
 
 	obj = aout.pointer;
 	if (!obj) {
+		if (min_size != 0)
+			return -ENOMSG;
+
 		out->length = 0;
 		out->data = ZERO_SIZE_PTR;
 

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260429-invoke-fix-44f026f90c56

-- 
Thanks, 
 ~ Kurt

