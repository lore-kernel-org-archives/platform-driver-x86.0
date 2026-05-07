Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1456364024
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177124; cv=none; b=JbHgQKlYXtU1N2EkRrZj0qVMGzyaQsHhwPKv/Rd4VCbCYKJQGcmNvYI4dh6+/TaAU1CPJFYHU4smTytXvzUlitkpgyMi4obotFiqO0q7NHH9Wo/LULa4BnyyHbW+5fga5tHRNHpOW7zFnVjEGMMVPqp/nlHo0Q/jNkYYwMKdSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177124; c=relaxed/simple;
	bh=as/Y6rgrCLbxvFJK4woRt4WCiXpZGU5Bmcl75dpz1Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8vAAAvsqV5sx1maRg8GMORh2Ugkf5H+j/IssMW/hlDm1a3cgJ0wWuVK5owXsjPqgraBf/KTv5p5UZwOp80FAcZweLrc6Y6lZqeusNQfV6wjg/v77cSN4QwsbHYK1vW5/l+ohdjRibPjaRmHNEWmpponlHIkIsg2hwdV5Ygz3Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4sr41SQ; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4sr41SQ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f0ad52830cso1761623eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177122; x=1778781922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Epvlpqxnk7CA+C9ymJCfGqy8SHrtqDJZ4fsM6TY9RM=;
        b=X4sr41SQPF6gq2J2TXbUY/C1NKf75OUu3x8t5VPcC9gHvOHZOpAwilembEyz3Bi9qP
         2TX+A2YgxM7T8pKKRPcFfXrwtBgPSCFvVKpYdr58CsONFbIh5+xvtQ3kWF0jJVVmvrUV
         IJbf1BZZ6iSNwvhjlyiSqiLsNiTWFdF1ez4USxUPQrkFvOKH+7svAoIeHC8MOmSoTYms
         MAlJuzRFfroHFxnXD5bhRmN6SesZobjkVs39TNcMCPBkx8CU9eDnrR9zwOqfzKW07jBB
         DyAplEsAfdN9kFWjAvPcekD8670suArcjaptjIqWBBlDJYXG6w5jCWlhEZb8PdSDpCZR
         ZPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177122; x=1778781922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Epvlpqxnk7CA+C9ymJCfGqy8SHrtqDJZ4fsM6TY9RM=;
        b=O2zWnNQPMN8UqTEvrfG5ozqxdgqWAHa3jSyqgHNHOWuDuEzT58xYNJYfowLyWKmW9X
         WfRwc12YLqo1NO1PYxT8fb4ZV+UgtSXauPCKxQlP6yQwbVKweAwZ7acyo8CZD73WuBVt
         dxTc9OgvhDlOJAHFY4ZOwJKCV2kISBAB5fGuWsvZmFKQ5QD5U5gYUS4olEdC6eUvQ8dU
         qdQO7qCuwXeSmX14siPW00eKlv6Ff24637XD7Trb+bxw9t1ikEV5uqvlT7gZlgwb1mm/
         S0KjOlQtYhulIgxm0buXCYB8xKbIQgogJg11W637I7RNG3NS67SWMC2dLalLx0CP6Cr9
         dVSg==
X-Forwarded-Encrypted: i=1; AFNElJ9NZHlrEQWDh4kOxtAoTsWW94p87h/Nxv1QGhmmiH+yfwcuRNfeSpsfIrKjxoDsAVulxFlal+2Xmpshu2bt3laKJY+u@vger.kernel.org
X-Gm-Message-State: AOJu0YxTo44bGcrA8ayqIvmenbci5XoMzJRNcVe9FQVpF0+luIkqhIpF
	eFkLHZSQapyKGsLnNb6gwWH4iSCaAzlcaPW4HOIy8uI4Tm9Q2tOd2u1S
X-Gm-Gg: Acq92OEt7TAvBqF5jeTT3IXsMT5P0Uh+b42P9qdaahaNZMZ0Wpgoh+BFcWr17f9B2xt
	QkPOjBHKEWl5Kliuo8gsu1OijpttK6ZVPtmkPD+9XMiMTzpKOsM9HvhK7Sz0HFYLT5f7G4zoDd9
	rVFOy503JcMWIaH3O1Bg1ODnMNKHPGQS/+JIAYvfx9TMrftK8U0uCDEkXENtWr1oj6KVPtTUOT+
	mmkeTP/v2rYu0T+cTQklJB3sQIG9HhHMc7YSQqz673vr1j2UNPVmGdsTrvTZBvgmjtUxmb4lghD
	ChfT9Vn9DXOz/XFdeM7aFb2cE3WuoK/UJKr/6XciTeIdNuqkdM9I/LgPz/o+gLJruHnVLrMKOrz
	qSBZCM3SrnlsT7bZUPsEJ+SmsmaYZWPU/ZAshnHkhy7zKMe7wbfgBsDYb/Ek57VXddYyF+bCJqd
	hI700FIHRedzJERWp2EqKgXwoJxaNAMCEeG5o0j4meNJv5ISwiQZ819N7DUEtjz++liUKFjpyAm
	h8F
X-Received: by 2002:a05:7300:a987:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2f54a77f55cmr4538191eec.18.1778177122069;
        Thu, 07 May 2026 11:05:22 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:21 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v11 01/15] platform/x86: lenovo-wmi-helpers: Fix memory leak in lwmi_dev_evaluate_int()
Date: Thu,  7 May 2026 18:04:53 +0000
Message-ID: <20260507180507.912966-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507180507.912966-1-derekjohn.clark@gmail.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

lwmi_dev_evaluate_int() leaks output.pointer when retval == NULL (found
by sashiko.dev [1]).

Fix it by moving `ret_obj = output.pointer' outside of the `if (retval)'
block so that it is always freed by the __free cleanup callback.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: e521d16e76cd ("platform/x86: Add lenovo-wmi-helpers")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7379defac500..018d7642e2bd 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -46,7 +46,6 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval)
 {
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *ret_obj __free(kfree) = NULL;
 	struct acpi_buffer input = { size, buf };
 	acpi_status status;
 
@@ -55,8 +54,9 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
+	union acpi_object *ret_obj __free(kfree) = output.pointer;
+
 	if (retval) {
-		ret_obj = output.pointer;
 		if (!ret_obj)
 			return -ENODATA;
 
-- 
2.53.0

