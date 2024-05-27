Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5D5FEE6
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799027; cv=none; b=FPX3DuwX9ZfbEYaZWCmIJNrk/xK+qFoq0EgBBe3wsZMPLS55Zf5ElLaZJ9pIDHn1k2Hb8lsFCfYq+Sj/pZz3o+gkNcObYpf+E4E4/9xlV1196wERDvb4V8qeo5HT3j0bS83Fts2y8l1k5uoEIjy1yZY51JvPwucEFBV3pbnsdiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799027; c=relaxed/simple;
	bh=RbipRVg2tNyaG/cNib+sJw6bO31urPkoIZPQqa/oGQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayYkETkOcd85cjXio5rMZxY4RslUq0jcRzfb+7jsRtgwNjnbe50ejlBhHYnbRDNdTHk2J0VNwK9rKivC1JdvQ9e6JHBK2h257GFQ2CVHGcfPIIGz8rcinEKJRJa+ec4ZwiVFoJuq8fPnNW7gBC9c/hfR8HjeI9A1SBArhRK1+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=DOoj805X; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="DOoj805X"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6265d3ccf7so350108066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 01:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1716799024; x=1717403824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ewc2LUQ94iYhmeL+MlQNu0aDN9jkcSs6LpUL6X+zlA=;
        b=DOoj805XSVFbKD3bZVlHXVl8s32C7iAYJCcCknY/L3SNIeVgbM5YvY9q6fuOkl4N0S
         Ia/23DbBjbuhibIq0rAadV99BO2SMFXQaD7sL1CrI8h7n8d+2H8Amm/3Bw2oInRoxMKu
         8f+l83vPRHrjaBDT1x3ceLWHPSXhy8U4zXb1Freno6koiRkPG9ryFTnScaIMO0kNOi7W
         yx0vU6cifcDLlUW/Nd45FT/QycyQcbFgtVwmhXdEia0zN8wofoB7G2PXP7PX6L/4Mjbh
         Ebc5riB/8hqyq7JzhzcIsVe2dyElc/T6879XDZNChMhDSvWV89O0qmCSnmbDgLGmX+3t
         UggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799024; x=1717403824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ewc2LUQ94iYhmeL+MlQNu0aDN9jkcSs6LpUL6X+zlA=;
        b=AFfHxdHHXUj4lo7IwcN3nGwjosfqL8zjhfaiRqq+12qTQYXyUn2LDpO8J9J3GtI0kv
         2GOZ4HV/x2xSmErCedepelRmBNkzz4UZYsuhRrtxUBD05VTOWjhOggQb+NjKT/1H8iOW
         TFY0dNVZ7KCWANVeFg1WZeK3zhyai7AB6Q+1KQlfJTYXWM4xzRabTZXdlVmkvWkwxA+d
         Bv03KqOZil0A0aJvzzsqZR1oK9a4LoHO9LacFGcknbNEBk6LIpQyctPVYC82NX9JOk6I
         ap/FFyY4O3UEw/rscbw7RvKyl9WuWKTytgjS8AO6zINlu6durUb2YFq1GOPSKUJR6kkJ
         xBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAu6qzj+9044q+oE8eRz7uYAZLy5aWjKTB4hO8igo3I3MK+mSoigJGJQfxeH8+WD7iQx6r8tKmawdhmlxie1pjlDfat9u+P8Q8h8a+6HU+adqRQQ==
X-Gm-Message-State: AOJu0YyXBzStmMBRZEbm2HYemRkBbLax8GkXsXcXuy8f0EVcM52B73+U
	Xb/MbbdmozS1KW0uZvQII5Bzi44fe4nOU4MbsVpEBMfIVhLPxpl7PVeo1AY8vNU=
X-Google-Smtp-Source: AGHT+IGZ58gmMolIHMHhK1a1HogNCuIa2Saz0HAtP5KiJLECmvcEN4FxWyc89b3s9DUSyiyQJ3gt8w==
X-Received: by 2002:a17:906:2a8b:b0:a59:9b8e:aa61 with SMTP id a640c23a62f3a-a62643e1448mr582253266b.35.1716799024362;
        Mon, 27 May 2024 01:37:04 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-100.dynamic.mnet-online.de. [62.216.208.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a62f546025esm91292366b.56.2024.05.27.01.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:37:04 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: markus.elfring@web.de
Cc: Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	thorsten.blum@toblux.com
Subject: [PATCH v2] platform/x86/amd/pmf: Use memdup_user()
Date: Mon, 27 May 2024 10:36:29 +0200
Message-ID: <20240527083628.210491-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <50d10f0b-d108-4057-be9c-a90e2398e810@web.de>
References: <50d10f0b-d108-4057-be9c-a90e2398e810@web.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to memdup_user() to overwrite the allocated memory only once
instead of initializing the allocated memory to zero with kzalloc() and
then immediately overwriting it with copy_from_user().

Fix the following Coccinelle/coccicheck warning reported by
memdup_user.cocci:

	WARNING opportunity for memdup_user

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
Changes in v2:
- Update patch description after feedback from Markus Elfring
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
2.45.1

