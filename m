Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0833D4EE
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566721; cv=none; b=LCUtuXCChFsY1xRVoMZ72bzLqUp/mVOxgJpCmzs22w4kneHHqUw6CKZ6HlHI70cEFBAI0/+FQaPTiJ3Pt9OT+w/cSOLgxFwOubXQOTB8MXEAN9TUgCSkWPErGzfiUkSVFQgHHFxnWEAwg8BO4MCROHHQecKVOpkkDq+nJesAuM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566721; c=relaxed/simple;
	bh=CHLw8W8no9w2IzF23NQVWCWYxh7Byp+1DM71Jw8m5R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXaR3pduTkkvm5j2fmJRtIJjsbCjGSXspdSKdLd7nn4tLesTuUtx9WFoYQgj/IDdPN9+yDm1kRyZ6tLG845LHnXKzhS2ol5cVayZUHTtusYRBuqVoZtI7o6aDE1rOg327QVfJelZn3afd3PFp2rjRUJiSn7s+7UuFqF9CqyXQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE4T8ipD; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE4T8ipD"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79885f4a8ffso15323637b3.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 16:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774566719; x=1775171519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFkIExd9ilK/Mb5afUnvkOrSHhNZHUt6VUdY7xzMApc=;
        b=UE4T8ipDl9ay8ShOO0Rmtoiv6KQyydjAhopHr/s2Wrqi+FEsL8Hqwi0fSLPkQHOg27
         QHmobEgUxMlTAUTukhqHGp+1xU0HWRaYgGjCu6dHk8lAViJBDoMTPz9U+0bRmLiwJYCI
         NybRIePrBuQ//lw38fYQEXdWCdIetK+PRAZqoo9sRXd7dc4jzR4CXatYqc9O0YaAisWT
         G5E8b6SCO6nI+Xhu1OmRBGKKqGj9ZWCV0ceS9RI4EbZOFznCkdTyMpTR3FojJQSiey4u
         4JUZ+dnxTs8LgkKCLCgZlDmxVeyQXnz+SX884qVhR1r9RhA/bvEgCECLK7Fr6iGKSzKy
         6sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566719; x=1775171519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qFkIExd9ilK/Mb5afUnvkOrSHhNZHUt6VUdY7xzMApc=;
        b=HkFkFq5UJosCYpklbRaIeRmYTAx7F2sB287ICqV0mYKaukljcdA/G+8CoguYsXZ1XF
         XsKU4DCwKLHMMrCyp7a4lGz/Hx5+w5rvk5YmIaMahwYRpSoxbnDkpKq1Vc1WS4bsMect
         eSfYrzJzgv/s9N+TtgUd4XWkeaHjHxHdT3xMpxVppVT53sec2cetwSdUvObGgFPuyczu
         qf+i6ooNI37RAdvnMDtgq/DuTh/mowyMGIUvQkwMT+b6OJ0oF2DXXsrozARLOYBEH1u3
         QJzkn60RHM/uYXlJ9lbtwHZgBpDiypZSh5/7wTsnjcI02Mm4XnQ0MEkRKRBzz1wU9RMR
         mXmA==
X-Gm-Message-State: AOJu0Yy4vtxApLVI+Qy/sbmhlFbTs+Mdxf/ezNiYQ9Pl9ZLlmYIoo0Vj
	3qhiOjUd2Ejh6q09ux5LqblgcrCcB7hA1PVr1wEhjGb/caEWRt/MzOOy
X-Gm-Gg: ATEYQzzEnriit5FgaxnFYQwGaiSO6SqgeQl0D+PFZyoZe5CAMZE3IYwjadDx8MjJDF/
	UgJV61x0o2F+GwQh9GEeQj3zwh/pNVxzKqVJoBQARO94EFYCgIKSxHeC6sL0ssDhDZzHi9EXn+O
	AWo+LorWNfSg3MW+K+32qSTHe7E/maETdrEwSFNUsEa+1lTQn09isdIBASJKcLg+ZAhU4r+TrSx
	USlBUtfX5LJQHvkxNMnF+GsHJmEDraPvs3KKU7bKsBEotRCDcHs8V/F6FOWaAVm/BAQhAfDplao
	sH31wAzaHc6ALVsxIh2cNoAKy7G5Y0As09NSgLfBFSAuMyLTeCd0yz/FxdUsgmfr4/PyQ0umNED
	zI/mAvy4U19tb11qGpIXW8n1woMM+pCpjkYw6tl4ufgWXAfdcKslTKQgxr6WGvuL0W+o7kRNz05
	SLE/PwShKlqAp5oiUIB5kzprU1RHf6Sp8kzSgYMHuMjTexkQvkTr4rJTY+hR0E1f2sAcOWkFL5Y
	k2EO92+suLmG2BlwnxTr/Bt
X-Received: by 2002:a0d:dc86:0:b0:798:bbc8:bca9 with SMTP id 00721157ae682-79bde010a95mr1447217b3.31.1774566719323;
        Thu, 26 Mar 2026 16:11:59 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b1e3fc9fdsm20925527b3.38.2026.03.26.16.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:11:59 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 1/2] platform/x86: asus-wmi: Remove redundant condition
Date: Thu, 26 Mar 2026 18:11:53 -0500
Message-ID: <20260326231154.856729-2-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326231154.856729-1-ethantidmore06@gmail.com>
References: <20260326231154.856729-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The condition (ctrl_param >= 0) is always true because ctrl_param is an
unsigned integer.

Remove the redundant condition.

Detected by Smatch:
drivers/platform/x86/asus-wmi.c:4427 update_screenpad_bl_status() warn:
always true condition '(ctrl_param >= 0) => (0-u32max >= 0)'


Fixes: 034f5efd362fb ("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 0b87214ddd1b..80144c412b90 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4424,7 +4424,7 @@ static int update_screenpad_bl_status(struct backlight_device *bd)
 	u32 ctrl_param = bd->props.brightness;
 	int err = 0;
 
-	if (ctrl_param >= 0 && bd->props.power) {
+	if (bd->props.power) {
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
 		if (err < 0)
 			return err;
-- 
2.53.0

