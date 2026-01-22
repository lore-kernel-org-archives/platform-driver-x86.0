Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06D935B65A
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097331; cv=none; b=G30OKtVPGISUtBlW2crpV2Poo/Y5/cqSUFD0R/qK5fKL1q6R8LvmAyxQ4sdFcihg9kSBOWlyfx/wDDHOR/6dc0rC7zmoPEJJJeDLdj19PTfU2Fr9K3NKaUgug/gw3l4Ck1eHvnpMQhJIcCTnCex2OLDUj6xN7ZmA5egZdhV/iG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097331; c=relaxed/simple;
	bh=V5b8HegB8GRX/lAVl+vWtZpAiWhKdfd1I/+Cxli1x/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbkquxAn1Qd1GxFb2IUytweCoix6SRpbDkArcsyJCL5kSMyP75henMUtB+W5Ci/ITcCL5P5MQR+7DOKDm7v6PgMtTjOyIAmdTlxlcbr7lsPzfPc09JbYH6WdFUPxLd4xuD9JS1oGd/LZhMdIeHKcl2KHnwv4A3zMLYV/cs//JJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br7FI+Z/; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br7FI+Z/"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-123320591a4so1272753c88.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097323; x=1769702123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT7sxUlCTKBw+bxvJar1XKrjKbpL37hYJb8bo9j5S5g=;
        b=Br7FI+Z/RvxaX4t2XCZthxCvicYRTqC8KliAR2khFB9LAapxggZUTiyREzzFL3AHOh
         n9TCgAnr0VSLmZoJJkstjmjkB2/ZoMlwP2v4z7z8ib1v2w1EsuQKCuB7d2EAtsUTJMgQ
         h8uxgitbSqb28MuhMdyXIaB7whECT/EFDvws0cyqN6UvWCR8LzE2abIgBDpKuLtLp/0s
         lfE2hSCzpVTMBzM8LK7jFSLpoT5EA1FmOxxO9P6aYrAAlzo5IGV+j6CsvWSLM3pjNOj1
         zjf4h3uEC16heozXI8hq945rXIxaasheBVIUgg9AXfCKRPfp8AVyxV5krlqcxt/tkHxD
         SGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097323; x=1769702123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sT7sxUlCTKBw+bxvJar1XKrjKbpL37hYJb8bo9j5S5g=;
        b=j+uzgktlnc2C9sbIRoKhN4o0KB95bhXagw6IuyD+Sn3cfeuMC9zNBc6c7RMI2mpuwl
         cNqCw0Xm3voeoBlfFWJmO3ZwtMCSoyaCSNduLJ5YhFwHOTollGbTBUE5B7SoxDsg/Kcz
         LzmrXUGoxEsaL49c9WUmFYBpLxah0rkFkPLDN9279MauaqxJqW6TXvOsN2eBOE3noX3F
         lddeA4Evn5ukztqI6LePZCPRzp/aSCVTCi+GCIV3ZN22tdEjIuP0k9rCcLjuyofKB7tp
         5g3I/5d1psSvchJs4yiD8CyAtynTX2zThywQjuZW08lZU7esJTfKNYpMMHY2iAGkDa/b
         cFpw==
X-Forwarded-Encrypted: i=1; AJvYcCVM2IoPnRXFYdsGn673UfZ/fZRezk9cYBtsOSv0UXdLJ+/7G2rLyOOHhvWjFck8CGKjPvILrhqKP68NRyTWTiUe9rpm@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0ODtyRRN6V5FFwjnoeHj6WAJ5izXAKKfpC0w+lxBxrcVqygL
	Y5tUmVKgX/9pV/caEd+rh+g443QdMjbVAb2y/7njSNXsWQpzNYaNL4ic
X-Gm-Gg: AZuq6aJjCm3kVaAwvsPSg6rP27QVVq3TsZaJKvGoPIy0ykBQu+P+3OWSgKqidbJRH40
	5hdDfdbW1iInuFbijM7OPFP1qrxqrtfqyLQjlz9tiGU2gCLS5V8wh88J5dJ7ajX5XRnRlsbg1pf
	/PQVSnNpQELshlbYivRBBG5mhdaPJMTSEMX0dJ8ZR39P7c7H0pMQghEIXj/kmbwxHplEHewmRgz
	Jd59mhccQw93a9OpYFef1Q6c8hDrJyJ5C4PvVCL3UqHkBDhRTchPN1XqKvLl9TvW53SiH0Nw9rg
	SKYFtKNY7H7RBnRTo2Fe7pPi/FyLsul9nm2xhYtau8z39JTScXQ3tum2e5uYHoQ5BSkCqT5QZpH
	+0hO+4bzTrT6HswJaWjONkjRFiMRVmIDXqvbR0i0/jW4y0JH6eACKpWXz+DDDKiHqSEkvAPdf6r
	xq7iUYm2z0kr3G6+HyNrdjY+eyIs1AMKCnH4t7k5Oj77tNoV2EiWpJ
X-Received: by 2002:a05:7300:e88e:b0:2ae:5a9f:d98c with SMTP id 5a478bee46e88-2b6b410b210mr13103401eec.33.1769097323537;
        Thu, 22 Jan 2026 07:55:23 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:23 -0800 (PST)
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
Subject: [PATCH v2 3/4] platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 23:55:00 +0800
Message-ID: <20260122155501.376199-4-550230171hxy@gmail.com>
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

The MECHREVO Wujie 15X Pro suffers from spurious IRQ issues related to
the AMD PMC. Add it to the quirk list to use the spurious_8042 fix.

Signed-off-by: gongqi <550230171hxy@gmail.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 404e62ad293a9..ed285afaf9b0d 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -302,6 +302,13 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		}
 	},
+	{
+		.ident = "MECHREVO Wujie 15X Pro",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		}
+	},
 	{}
 };
 
-- 
2.43.0

