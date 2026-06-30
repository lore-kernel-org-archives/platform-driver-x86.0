Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54161472780
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782852416; cv=none; b=o4hoSoIy3wTxe6Fd5MYskHcY/o08firQN5EjZSa9o+k0fM0XX0H7ZEFIzTY5rYiQ58hEd+kT92kZ9lnqiHTRB/FiAoLAkXr+eGOad1YiGfsoaLzSQH7eEP7k6YTALSJgeiS4CdK4R1LI5FS/qO88AUVkNRiknxco3u4jukwJAFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782852416; c=relaxed/simple;
	bh=QQpg4iUdPdMN4uuK+8LV4SNU+AOFx19j+6zEKC6XYmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4uQcwLLSyNCa/aB6VlNVw+i6eJueopiBm7DY2Hy2jh4YLZpTItzEAbwx8rSNA3GvQEKd4TC/dM+GXtbntag/Hn5315SWoAnI29lPQ1F8jF5h+to4tRRlpTt41OPQ1qLpdJ9vVBOZIu/COYf7jP8BndgkuGUNORjE60VDy5Vrks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNA0uQkL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNA0uQkL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so35512365e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852414; x=1783457214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h81U+RnNJgNeHG66A0kpiht96iCRaxgsG3cmkL3L7RE=;
        b=GNA0uQkLXZHXYcTIsY45VzwuuLXCctj+R454rlXMZfSLvl7AgU/Zll6WKxNjTtQ1ni
         gHReXOWqazFRkfCs6ZI9Aog+OrjZWZqpoRG2hQSHWOjW5dPXogK5i2bJS9LJdL1akMfx
         CEsUtX+4BoRBq9joiN3rwyr6oN3apRDTAKgvEQmZc/652URU3t24SakhI/RLQtyLoydw
         wpPZPpb/4idxcoV5F2KuseR6txFOoxcfZQdLYVcufuJCaLpfSPkD3EgUO0gaM2BiCcT8
         zOGebq/cNtjMrWZdG8TlrKKvH1eHRAyfOID73vuUCR9CO47ybR3fjyeJKssniNa/vX/a
         n2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852414; x=1783457214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h81U+RnNJgNeHG66A0kpiht96iCRaxgsG3cmkL3L7RE=;
        b=kM0WxBEqrdkdRM1TwaJmLrjJ/HLlFH+wTq+lQCqjFyBY/eriH0C6wMbsMllf4D7HzB
         f3nTgKCyi818Hl7PWIbq1vR3yoVnGWzPBUu6Z1C5VhbKGoIONe6wLR4RnLOMH09fWEdk
         HVzWlgRSg/+WZiKGpORCCNGCSC0F0mJoLi2L3CTrWIuAdV1VDlY57rLTvmFe2Jg3OMWj
         DcW2g+v6dAzxsE6H+dPQM3TqVSTEcYHb96yKDBU3+6DVfergoo6y68Din4kpMaJzVSRo
         oOVtLx7BzybuPe+R2pdlvjqv65bONcLHlaXgAQTGMsrmeltrs6YlEJpjTlJBl/VydbVG
         zklA==
X-Forwarded-Encrypted: i=1; AFNElJ8+g++tBzJ2hfTTo48cGdFYiDiBAC/1uGaTLmniV+20EkqtsjZ/zz7LdUh+F/LakNqE/h3MUI1Rq1K/pkX3figRQSlj@vger.kernel.org
X-Gm-Message-State: AOJu0YzTk9EpzabBl4DfKXIygsCVBySg/+qeQWQORNnRiW8itUa9AzPq
	LO/BOltuW0lnX3hS2iQP5JXQxmY2We7d8Kt4NuiaPifNmX76h2UqHI2L
X-Gm-Gg: AfdE7clWIhtrKm3eR/6djpFttTxKGntM6cB8Xpq0syY91AwPNYgMYHjh1HFpI/WoWQy
	hl5/+7yP7nTZaX8jE+o0JtTGHql4iu2SHDEOopKu9VPlBXoXTMKGHtYmNcM/xnjme6NrbwPbX7N
	9fU/7S8ABSMp3mtFDAyiAkBO/TDD6vw3ScN7uiSE4APT7bz5bNVkAd8RtMNvK/Wcpe+8A0+CEKU
	Nzn7gskHJzhvyNRmFvzrPQgK8OhvKuhNUquTqaYB5nDKzuoicJ9SNMCEiPVUWTQM5p/U/8gtM19
	KCHK2/dzOmapdRK5vUNG6vr0oQqj3OiEbLDZ5rrmbg2NhBLPgSzxJJ1Aciixs+t1qzL/Y1a4JXd
	qyOsT/I2mET2o7T1g9wwZNfkVRmQIiOMXczurUNJewg6SD40UFtR6DwEF5mEz5lEnzF4IStgGSW
	SQ432FWJfVtkN3Vqa8pljOZ8BFDFJLkoGCMWiM
X-Received: by 2002:a05:600c:6088:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-493bd7f1178mr32144775e9.0.1782852413498;
        Tue, 30 Jun 2026 13:46:53 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4cdesm11408153f8f.13.2026.06.30.13.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:46:52 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v2] platform/x86: acer-wmi: reject missing gaming WMI results
Date: Tue, 30 Jun 2026 22:46:45 +0200
Message-ID: <20260630204645.18124-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260630105033.53967-1-alhouseenyousef@gmail.com>
References: <20260630105033.53967-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WMI_gaming_execute_u32_u64() returns success when firmware supplies
no output object, leaving the caller output untouched. Gaming getters
then inspect an uninitialized result value.

When the caller requests an output value, return -ENOMSG if firmware
supplies no object. Preserve a NULL output pointer as the supported way
for callers to ignore the result.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
Changes in v2:
- Preserve NULL as the supported output-ignore case.
- Only reject a missing firmware object when output was requested.

 drivers/platform/x86/acer-wmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0eaaefb13d0..61ae622c93d9 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1581,7 +1581,9 @@ static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
 		return -EIO;
 
 	obj = result.pointer;
-	if (obj && out) {
+	if (!obj && out) {
+		ret = -ENOMSG;
+	} else if (obj && out) {
 		switch (obj->type) {
 		case ACPI_TYPE_INTEGER:
 			*out = obj->integer.value;
-- 
2.55.0
