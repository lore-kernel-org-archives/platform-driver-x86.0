Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED22D8791
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Nov 2025 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762516415; cv=none; b=QeoWE0bi5wHDWSQE7xRafk8dyWrfQFcth3ImPEHn1zjf/Ew2FgLcCT07vYhGBji2kjbi9umc9aOu9vzNETEjra7Vfe2t7pQPDWX2N/LQz3djW7+F5C/7mm342SqWyybgCNt+KwhQpZPzZ7HIv47Whd4XqlBRPIy9ixwn3VLrqMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762516415; c=relaxed/simple;
	bh=1uPytD9cNXILOzbFqyP1ntfxFWFE3K2vK34d+qbZFkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUJ2wlbdx56JXRNZs2mWYvKKg2arcMkukbKBYWiFJVe3QIW5KuJwBPINKRWeylA9ZeE0w+/STXJykkKzBdKDCG18P4Mhbm2/oWHMa2OFAX0TiGVAWlByvJtTrBU1FvL/ucCAiw88HXy8Ixwof6dRDvBiZe9cOxBO3UPaSAte7Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcNsv8tr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcNsv8tr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so3352045e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Nov 2025 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762516412; x=1763121212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8r8f1qu/iMBIK0e1tyUt5/U+CjeN6Py2r6FC9iGdjx0=;
        b=gcNsv8trIUJRibDmpOgB9/n7filrQilafkOW859fBiALJ0aQy2ay2WYFDk/kEJ/S5p
         j96Td3VjLBMgEv0RbI7D70GfL4aujklLqxzjmoJMe7Jgp0FL5uAdjhZckZrkG7LKODN6
         04aIL33CWytKHns3b+jWGqVOz+8zHagEX2MLQH77pqMbb17kStbDflbPGuSZfFefM1f7
         K20hoI1ZqTSHa3zN6t9B1GJDqeXNXJ07XCdWu+E7679uyJ/QFG7qw/WA/9WJjsEF9CF4
         l30MuUUbx8dAxj/L+igA6IxDklBzJjDqef+o9uqGCb3r13PrCMuUZsQz6JF/FcYCWcKh
         +VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762516412; x=1763121212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8r8f1qu/iMBIK0e1tyUt5/U+CjeN6Py2r6FC9iGdjx0=;
        b=WMFbrKqAqLd5tyyRk72D5BDpSY7gKoDJRumIurANRXxniRg/dJxhG53kxVpiwJxwq2
         M/fMWJxlcYLuBSaTtOcyuR+OvsApWfUs9HboEl+J0EZMWdaYtyjzSH5fJRiipvCBAPsm
         GQdmz+r+OR0u0dzBUhbgoikkYF9Rxc/5QVQvbQ19xctRC4aG+SuVEtsqLfJadrb9zMp2
         ejiwFsq861HsJLl07u3K+tIagruZ2FXnSu88/qfKH837/LiZhKAFH8MHuhn/Dsq1xyWY
         cQ+/QXnXjwJgc+kgU6Zen9pwCmqoFEaqqNubkwO4HZXr4cbxOR2YcruER24OMChZPio1
         m54w==
X-Gm-Message-State: AOJu0YzrQIhSILgCCd816CYf7bzef74R4yvt4XBYKIcGIbfi45uOiRnF
	hpZCL+IDnnE5dGmT7/SrRFssOtsHs3IrwBpbuVqwiaXaWR/AZ4Y/PJ48
X-Gm-Gg: ASbGnct0M+T0ywzs+Zmqg9ps708wsVDdWVckXbOgYSa/A1bN6CiFLhRBRJ0i1nOpNj7
	PwQDv0Db0Qz1n3fcVUypG7Yz0zc8opT3uQp9/j32I3UqDTj/c/MSoJ819dMz/d/CvDwbf3x6Zum
	752CDOBN58fUtOM1ZbIi7RkW68bumZwDIZ8+8+rUVXDHkC+lRREBsmppFDJrXFFIUnH9xY9RXXc
	FfGzNC463xyPPzdADaT8CXfzrI8YgsBF9xJreyLcevRRQLMoiHabuX2rP0egeKdzYk6uo2gNcJt
	KxMjtEbxzXduxwM0k45vyQLgcmpL0yMWzV6nRRw+JLwuO2A2WlRHdXn1U+BTrFX4fLPdodAfa7t
	4OTxFWqwAiXQk+vSpZB0JhhulltFJSDAbPI9ZWaCmqIrXLox0zCcX4QALB1cqhdGv4NAmDmPJ1E
	jmqTmVbJkKx1/pPCZcP+PCw83UYF7i51JyeXhehnklTz3wttnE
X-Google-Smtp-Source: AGHT+IFWKADxiyQRK8XMw8urX99fnaTBXKiKvDJ4GU3ZZiNzGs554m++E5HS9HHRIqK6ssi0vxgiwQ==
X-Received: by 2002:a05:600c:1f94:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-4776bca7bf0mr21320125e9.16.1762516411907;
        Fri, 07 Nov 2025 03:53:31 -0800 (PST)
Received: from cachyos-x8664 (202.red-80-28-106.staticip.rima-tde.net. [80.28.106.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47767749916sm81206805e9.4.2025.11.07.03.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:53:31 -0800 (PST)
From: Marcos Vega <marcosmola2@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcos Vega <marcosmola2@gmail.com>
Subject: [PATCH v3] platform/x86: hp-wmi: Moved Omen MAX 16-ah0xx board name
Date: Fri,  7 Nov 2025 12:48:53 +0100
Message-ID: <20251107114853.80838-1-marcosmola2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <f89e0a02-91a2-e98c-d06a-6b7060bb2848@linux.intel.com>
References: <f89e0a02-91a2-e98c-d06a-6b7060bb2848@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed placement of board 8D41 so its categorized adequately in victus_s_thermal_profile_boards.
Rebased to review-ilpo-fixes as pointed out by maintainer.

Signed-off-by: Marcos Vega <marcosmola2@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index e10c75d91f24..47989f6a1753 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -96,6 +96,7 @@ static const char * const victus_thermal_profile_boards[] = {
 static const char * const victus_s_thermal_profile_boards[] = {
 	"8BBE", "8BD4", "8BD5",
 	"8C78", "8C99", "8C9C",
+	"8D41"
 };
 
 enum hp_wmi_radio {
-- 
2.51.2
