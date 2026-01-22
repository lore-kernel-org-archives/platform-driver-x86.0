Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8135B642
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097325; cv=none; b=mTVNE4+ynpZxJz/Gi0dJr73b5ywu3ThtX0TmBEIFQqSuCKfPB+/KVyZ3XBKAMj7FVeJOsK0qJPf6ntyhNklJQDhw+KRjHogaLh2UEi/4c7tuSDnWFRgy3n0d6QEzlw3QwvanNNrj+1qLG60yx1ieivj8ILTtZKz9XU8RVgTqVZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097325; c=relaxed/simple;
	bh=Fv4eY4ZAe/ifk4I9BIo/tRFyO/cE+seyo7xdkN2ocJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnM/TfERubPvuJJ4Xako6y2grhlXBHnWFFeIi2Qes5MEe86M1s1tAnwusYQeTleFgt7eWWz9nXQAVglhI4ZZZK26HkcbzUbpdhEX6u83yl+caCuZtli/px38TUDDCrG+OQvMwcnuu3RzBgnoG7KwTAlA/KIQEYeoxuZqxF72uyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgpIKp3R; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgpIKp3R"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b73112ab62so452339eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 07:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097314; x=1769702114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Oz/tfZRKv6Pmtw6Fd2KxgTHXyb+JusOVo4ZtSAS9YU=;
        b=XgpIKp3RyqAtUQnEI1VgojIBbEKGSn1FCmb0nBTEhArp7RPFqcbKvqJB26mL7PiLn9
         ts/pEuqTZHjZHJIzXmOp0Ryo3y7oInx9vYUksdfboWe++0wQDv+Ux9Od7yprE9BtiG9k
         CfQITGotcM6Y6wX6Z98ksCBUGnQ7pAV8oi+AtE5zYDOJ/P86HOQ0jeOB5Aml+oG3Eam6
         t6dNhemOKKxl2GuEdXW/S1TBCwTkmbw5Cr9WvOKdq2+vPezegZPagrKw2BeWpe47eKdy
         23MByUxAP5nAxs8FjEkaAXcFA2BRJc4ZSchN3Fuhds7IVXquhdqdvKQ/bdf1m97LNMas
         Ytcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097314; x=1769702114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Oz/tfZRKv6Pmtw6Fd2KxgTHXyb+JusOVo4ZtSAS9YU=;
        b=vsh+7gyOqjGnFacuGBMInEBO7hxiobKqB95nmdaaNiUMP56LzE8wkCpE1BB8ftWnDr
         hbPbHRc2mqgQO8R/BC7tyUn314r1zZENBw1hQtwyPwSwTDEfw3lRSEz1m9Wd77u3gahc
         CHkh0UhGpulJOAyJELa52fHfU1hCm89i4AO861OcNjkkqNdkrx0Qw7tfrvDYs0w16AbC
         UWfcmehXKtYtbXy8H6vYZdITTjjx2NW4fjSe1WB8vXHF6NV1WebW89QqWxyAetE4C3Ks
         TuWZliHrDfLxBcYVD19ACugyrlMNQF8VWQ6bF6TGUDmVLKtcgEdMWS8UEf4Ra6zOgB6s
         jiMg==
X-Forwarded-Encrypted: i=1; AJvYcCVC0MSj18pEKgKozizhpLUey4D0EHEvKoiNTgrOtVpcIW2pof4vUs+Uy3ZNR5hFH3RgQDkfbfH5KDHgIdjz03x/wuDx@vger.kernel.org
X-Gm-Message-State: AOJu0YziETp8m722r34sT9PVkCmAI3zGsaD+qy4vW1rFb1n2MoaWoS3P
	pOyJ8zbXVGf0HybzqGoRIHXPwx3V6Mus5UJ5iASYOtoFrcU2ZxEjPt7P
X-Gm-Gg: AZuq6aKQUBRoKAVmuNWcJWoYBS6Pjmz5KEvGvRBKau12RUom/tFdsPefiyq+192MMXh
	vgEBEUR9G5vxNY9lRcC4368jL86k0RlR1v9hnGv8swomadBxyB2p7cn+tFlx04Yj7jzKEgzZVay
	gwnDcRGBtiF4wpYhxg0dzFg2U3vSl4LBqjXvpJ3qAh0aib5Y48bMxvSMo5nGOi98pWo4XWrrH9Q
	AyxL8jMkN0HwOPNfjvMEKMTPLdTGoqeVzhhz3t1Ff95UrPoVWdrqGCdopIG40LTNqC6BupOrAg2
	xaKzK4ozXbCREXCHKxIXtk/aEwUwq4jPxTRP7MbyRXByDgqqKHZ+uUiKP3ZJFixR0oHSPovlsS7
	zjX4JCk/Ks9WD+EX92sv/qVu+HLLqcLItr8h/HrfTtYXz7iI5OLjOqOS5vmWWLs+WmVRDfiJ1pF
	cnGDGdYP89K/ukSwVtWsZJLV3H7nhccIT6e2UdKWkbyV0u3gOkMLGzpCGyF5ac2OxhuDhp7zZXa
	A==
X-Received: by 2002:a05:7300:7b86:b0:2ae:582b:db80 with SMTP id 5a478bee46e88-2b6b46d2ffdmr17440533eec.9.1769097313706;
        Thu, 22 Jan 2026 07:55:13 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:13 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 1/4] ACPI: resource: Add IRQ override quirk for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 23:54:58 +0800
Message-ID: <20260122155501.376199-2-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122155501.376199-1-550230171hxy@gmail.com>
References: <20260122155501.376199-1-550230171hxy@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the MECHREVO Wujie 15X Pro (Board Name: WUJIE Series-X5SP4NAG), the
keyboard does not function properly without an IRQ override. Add a DMI
entry to force IRQ1 to edge_low.

Signed-off-by: gongqi <550230171hxy@gmail.com>
---
 drivers/acpi/resource.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index d16906f46484d..2ec5472aa0763 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -674,6 +674,12 @@ static const struct dmi_system_id irq1_edge_low_force_override[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
 	},
+	{
+		/* MECHREVO Wujie 15X Pro */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		},
+	},
 	{
 		/* MACHENIKE L16P/L16P */
 		.matches = {
-- 
2.43.0

