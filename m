Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB041C31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980739; cv=none; b=HHHRmgD4gX79icmcwUU1n8sdfdkSJJr6ziEKcIfVRZ4L1O9Ep1Qr2184405u4IkEVYrCRulyLTPu7cCQF+bVAhP2Qdg8TbaLZh4daHVbPWhZs89/fRS4cHOp+As126oVT8/nP4Q4wXMqH5qUPfixhitGahZvRnPvY/pPKa2EkdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980739; c=relaxed/simple;
	bh=J2zxJ7C+GNkXVIUXkPrHuyFtscPSA93mW9aVv7nagRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmJQYpjc3UzCYL+Smk9NWYV6tcFw+Qzs1y/NV1UwCWelK/rAXLirWf2HC79Ir+eTh4tZaGIKtT3xNHaHpmadQb5UQjnjXuG86umMhGccAIFNocCoN0gXrK7Uh5OldPa7Wf5oeyJY8OurxtU2NGCyGTruZvFUhKBnyIa5j+3UX0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7AuMC8G; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7AuMC8G"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12a80c36350so6400931c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980734; x=1775585534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3641lkktESWwCBSxjQBD8OEf5aGYYIhQ0zHdhHKYoI=;
        b=J7AuMC8Glh+4yNJWxX/p8vLrJ2l20Kr6mLQb2cEDi7B7x9CPprME5jQSy6jM0VlGlv
         JMcmC4Vfn8WIyyBMRbv8z872EOFZcBO1x1AZOD49wCm/mioh31lXBbz2IaZYu1r51b4s
         nO71NxPBS8WCIYueHHVzw6qGj3g0gmwas22/X56w0JyS0Md+ARm6MCGtl4I8KsgXNZaT
         TNm75af6fZ0cojRWUahUTO6MR1BnxgLbDzB2l9mYE9hx/YsPagkPVDCK///zKJcjRUDe
         tPFFK64JXhfjmoXijo7WhPMoGM6DcS0gl5doFItI0cw09H4tvo/MZW8IHflJrNRgbTV6
         QTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980734; x=1775585534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3641lkktESWwCBSxjQBD8OEf5aGYYIhQ0zHdhHKYoI=;
        b=NZlksuqQbboD1Y8z4hQgZQZuzYSQsndyKej8lmbZ8E51N5ULZ+EGe3RyAoh7uktmnj
         xraGzTImdDYmQ65lZWGhGXNutESG5Jpge4APtqSYbpcB+QAhUI88haG3LgWA0kbQNQPv
         r0znczLohikrB6WJ12bVQVqsEVb+7GvJBMLweTIt7jIUbKk+hlIY8oiUaRSNXL7Y1pCI
         gb9+TjaNG3sqKimaoZNr8eadezDXlnOLZejeCxNg7MzPO3bsG9xdRZhgVl18BiahRL79
         FBe9ddbUS8Ut6jOW0lDsgtAAtsqfAf9B+8bK94dV6CY7VaNYFrcOrVY9Q+SLAdfmRz6i
         G2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZywtZ4esO0r6UKxCwy8uind699amIV/CZLmIp8WqgGO8Z9CvQQncUenpbYXWS6rLAQ6zVdaDeN+fEPPjPdc5UVjd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxej9N9RhJIblUq06W3vkXvSxD0hizqh1pAc+2DQod1OLt/h/NJ
	cT76iyQ1NmGRwDog13i+Hacc8PGJMgVX5arxu5spHDB8THKA7U6YInMH
X-Gm-Gg: ATEYQzwzq/RvaVei27kTeqQ/5fHS6aD147KDcGB+Lu3u3V5KhxnTWo5v09iJKMUH25d
	tQQFNuPzmJq3vdYoOISX1w2E5E43Sfjcp/7HwUQ7kpAEtTbBbljuSA+qE5gqtEME/32jxPDo/fH
	uRkdtJYq1UVASmKDOjJVwMWDKUMQLJSAum19cqqfhqBVFBZyYjQI1n+Wq3AKnFJaV3D27vrlxU+
	z0KaG1ISJjASQ8E8O+qeua16PKgozPOjx1jHpywVPFkVl3eHz0oJ2l5fpM1x0H6aHvzjVay/9nQ
	XbEsbA78j2JsPW9MiBCo62krbcMneb30UcGsx3Zf1s7Xo2WgiZEbyQGVLhY687+bxALWdxxeFp7
	eflpuDw2VdafflqlC/3tuZhyrnYvB/Nx1irB6QFv9hYWiDsOJ22qX1eHS7AnEgCq4Ie5Bi6PRpe
	ke8cJeP+thv+p/DxMJrMhcB/qisaYVNh0WusyJLdWr+Kz6lkGUXaI89Iwhykd9nHWHtGQ9OnJVD
	hHh
X-Received: by 2002:a05:7022:684:b0:128:d1c9:3633 with SMTP id a92af1059eb24-12be6438028mr305733c88.13.1774980734014;
        Tue, 31 Mar 2026 11:12:14 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:13 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/13] platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Tue, 31 Mar 2026 18:11:57 +0000
Message-ID: <20260331181208.421552-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331181208.421552-1-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In struct tunable_attr_01 the capdata pointer is unused and the size of
the id members is u32 when it should be u8. Fix these prior to adding
additional members.

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index caf360b76fc5..c1728c7c2957 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -546,11 +546,10 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct capdata01 *capdata;
 	struct device *dev;
-	u32 feature_id;
-	u32 device_id;
-	u32 type_id;
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
-- 
2.53.0

