Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D23E92B7
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968506; cv=none; b=b4P5L6bAdP1ukRURX+YrRHkMRZ0SeIJgGk5DtkgSBBW1+1KEPE3bQ/ULKoV1cMLtKdeW2NIHoS3bvKaGsFBvtOembFEOeg9TVOQYPoGxHJf44s4YlscTbsoa5NKwAS4JdHSv3X6XC/dqIc3QntoSJ9l7ylnR8h9D3REfiZO5vDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968506; c=relaxed/simple;
	bh=bcf4TTKr4xiw+q9mkTG25UPtKmJvg1MPHgWdyQGIkG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRdMd/ZUVHphWPnz28O5Oi693QmhpHr+ZxxBWdoXr9eX6wZoy2bYX3vPLXKbDU9xhaK6q2jk+H3Tqc12ZpeouRFI+q1H3o0qCO37EasFsH4QqNLx8thge2XX8d7JXpwvKyfxlgi/V5HpacI64D2bjsE4t0HkHsUtGGwbpR9acTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8X0pt/F; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8X0pt/F"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso2256075e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968503; x=1791573303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/jEcxkavN6IpLXPNJ5kYWQEIq0m0VhLgxkkief1ksQ=;
        b=O8X0pt/F0l4o+0r5fHPcvjxu9eBpuFOx12kt+qq/WCqOx8MM7w+3Kr83mipJeZ238X
         mTQRgPDMWkbIMkVXo9sSxxtKlrq7c6AMnqOM/1Cn2rO+z0sFWQhlkbKxeSmRhbDOyM0f
         6Hr/9RDR5hi65vQsRvuqPcd3eLPJBcet0qJrj1Iej8WGoBPjcNUGf/85Qsw+EF6zqDT2
         vbkZXs7WLrGctYIrELnkta4tFmPvxZBLvVK1O7K9G1pRCzM2KQ7ugdb0qcM/Xgo4VtTg
         Q6qGYWmkRNbz0PC4xW3R7IKANKJ0OM9CZ2ZWEnmlmEa7oxv4AzES8l8wcFDmmhyRgSYH
         TEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968503; x=1791573303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/jEcxkavN6IpLXPNJ5kYWQEIq0m0VhLgxkkief1ksQ=;
        b=ampqi6cv4rxGzTnGwgY7iq5e+OUB0+7BPiacerXFsLQSIpVcUF1PzP7+IhUGSokAc6
         fkaSzbQxxoGGzU19Kds01tWbyEBpgCRJV0svb0+V99gz7q4UqEY155YFJpgZsJr4nC8M
         EsEUIkH2MygnaCDw4ayKM4+qdwKbihiqpuPFaIkpgaChigEzN61h/uYzWMaaBAKutJbs
         FwfP0rU6YtPERdIsVpKrq8yKrc9Yd76kfsVu3m62shQ+Yjq8T5uCtKUZ9h/Ef3BTYOL2
         d/PUugrxzXoW6oQ9Xz5xaEep0FGtVqOHB8EZx+i6esArmgF7B48uwk8lD7zwVvL9a31Q
         OmAw==
X-Forwarded-Encrypted: i=1; AKwUvBwmofK4FiyKiGb1jjp6XEw62ikxq0kUJRVRtFgoFv5/cAR57Ty3yaXpgFDGbelKk97mlBD3gfCYtiemZbh6UA13Zg5c@vger.kernel.org
X-Gm-Message-State: AFuF++kU0ctLl+6r/RkvVCx2q7N31br1pj5kVvjS6RB3JVjGn5BI5Erh
	OxzRGsEZo9WuD28unp0De5JfyB25Ldg99UyUDUfgz+rGCxfEX5MEl5It
X-Gm-Gg: AYBFou1v/+ByyiyD8zHnom7xmbkTh47/lpBB5p5+ZkWAFTf+Vd6B9o+CKRnyi9nSEUj
	kOkyx/36Kf6cipHC/XJxsmcemJVgA20mnVqkMiWCtoypOfPRKyWQbrwVikPUv+KNXCcZvslPh1t
	fFeQpKAMDqqJ6xVKdH2Bnuel8t3hv/VYUVsD908WX80+BAyZUCWrFzyVKoRXbjjwI+hCPHplNZm
	P0KYBDrVI/FcQmu0aDMFA//c6tvbE49qfWxK2TcuKapy4JDwo0Y0LOoSB9lpSxQltAjMwaUa6LQ
	03P+NtwlDwWOyelTAkTgxNS6SPYPOaB37Ib/Ny9URtHadQOv5jULrANobH7BLWlHUj426rX/pWZ
	iafffFnupzmdzQjB4sFyaE9YCG12L169aryHva/zLNajX5VhzvkEg3Ig+XVUuHNlGfoOM40XCFE
	WoSnxhxK1mh78x0y5DvhY+ZorE/tLsooYRRMpLVuDuWlM+teE37d1cZYz7Sgz1VRhIPhBKL3Z5r
	QnoBk4LRYaII239Q27DD1MJlSbzUY3V7KUNzgEPK1wFVMdJWUc69g==
X-Received: by 2002:a05:600c:8b88:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a02757ebcdmr64585175e9.16.1790968503422;
        Fri, 02 Oct 2026 12:15:03 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:02 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 3/9] platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
Date: Sat,  3 Oct 2026 00:14:28 +0500
Message-ID: <20261002191434.58529-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

validate_password_input() returns the positive INVALID_BIOS_AUTH on
rejection. store_password_instance() skips the store on nonzero ret,
but its final "return ret < 0 ? ret : count" treats the positive value
as success, so userspace sees count instead of an error.

Return -E2BIG for an invalid password length.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7): writing 999
bytes to current_password returned 999 before this change.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
 - Return -E2BIG instead of -ERANGE (Andy)

Changes in v2:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index a9e178637..3f4c45d9b 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -70,12 +70,13 @@ static int validate_password_input(int instance_id, const char *buf)
 		length--;
 
 	if (length > MAX_PASSWD_SIZE)
-		return INVALID_BIOS_AUTH;
+		return -E2BIG;
 
 	if (password_data->min_password_length > length ||
 	    password_data->max_password_length < length)
-		return INVALID_BIOS_AUTH;
-	return SUCCESS;
+		return -E2BIG;
+
+	return 0;
 }
 
 ATTRIBUTE_N_PROPERTY_SHOW(is_enabled, password);
-- 
2.43.0

