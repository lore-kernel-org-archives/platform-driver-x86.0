Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365451;
	b=bj8wtoJixYAFhKzIKf3FIx7kK/C/hkzOc2f8D2iEUhdIhAwX2P54YFygXlkMH63aeNOP
	 Ld4UdNKHH/D21Pkhch08hYJEomxI7Pxy00Onb+fVqwlGCeW1aa9lYW5tFskTsN+G4lReR
	 D2Q21F8PvIcNxqqXZ3OHV7qEKyRN0VvcQKhTtngpYJr/e9Uj1iyMReFx4GQruz6xJgdUi
	 UG7a3hP9mMJkZsqb3gSnc74ekk9geIje8AgTBSIx0CIXPYAaFvw80wScDftP0FALHVtAx
	 1kfowEGI9z7R7ii1JW8TR+eilQI3r5KAv85Ovl4KWfJ9xgjSdgD7+GjspPyAi2Jf8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=MOkNXoWcVUQuxWtPazuDNzLzMLFipD1eLqBUZdS//U8=;
	b=l75k0IIJX3atPHxsrfX2TrQRWVOp5SGOAhECFnkLr4V7OReA7PHD37WGTDvfn1hmv6DU
	 tds6/IB9nZEF0V08Mnzdh/3u2f12ctw6y+ympq+zZlFCQ4e/XHQW5oUdP4yWho4vNOOvt
	 XzXCX80okgX5A2hn5+Jlw02+PmZdCTutOujAtNCfzNbfU9pneIGn1CLKNX29XFMd685Vs
	 dgNmIyJbn6t7mEvYau8qgUENyBpb5iGYYnCV5422LAIdMzCtbytx592R3zUnInCFhANsR
	 TVjhpHkrNlsAd1aRknPNkG7R9tqtg1cJFdzaE4v8z8NAtj5nDg14DJd/IlQkRNRhG2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBNI9Nk4;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65F606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 16:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F65F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBNI9Nk4
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18674355e9.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 08:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795365449; x=1795970249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOkNXoWcVUQuxWtPazuDNzLzMLFipD1eLqBUZdS//U8=;
        b=EBNI9Nk4h0A/gMVmiHfGl9ADDn+IQxGKbfpRP6BHm7Fszib1g0NoaRvU/lhIK+9CMb
         FLJ+PDoUOomPRXHix00pZRXLPjmgPG5lbSPT5B0TtakVy0e/QA5ak3ULKzuzR/LMbApH
         NNXLjGTkEUqVHIIAidC/lMtJ8gRRpQIr+E4jhiDkQsT5pAMpwR/2xf65RP3zp3Ovakqz
         NOjC3tfw1bLy4HJplwPiie79RNWUDYcl1f21xL3aYquivvAcBsf71yr2iWK9bNczvX4Y
         NVrtlAYNLrbqQatJXeyMC/kTdlHAeuP8bMPYJY1uQQz1fDAxhZIwpvaoQJlmk1OeKnDb
         jOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365449; x=1795970249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOkNXoWcVUQuxWtPazuDNzLzMLFipD1eLqBUZdS//U8=;
        b=CYxybxOJz8bvjhqZtDBVB71uK0QbPCPTIMXwjCtz8NNsZy3yK7pBPVdo1pydfoTAj7
         PRVhUHRtubwZHvhxsYBvsx5iCtwDn827ytewx6iCFGHmkSEWUTB49AHe60leut+tBhDN
         TkrkFD6c+l5PW1Qv0gjmftphRgMGyTZ1zPINKqRaazpNTfnIgZY8kwEiFwdBzjjLOCTV
         AzEylDz7kCsBq3aDePWDBQo+5zUyu2ZDgQ57w8cbdQqbW6gGKLxB5PCnUXhHOL2T98d/
         YRL6tdWPhEdiU+P9EYMOIYl/v6xIZxB68Zj9ErZ3SQCnu+L1b/zboDTO7o7J3u0+lrh1
         LKsg==
X-Gm-Message-State: APuU4Z+TT41Y3BZ0GTzxaSKvhSuTswyh2QtlOh7Nt52MVhi9xIPmeXDG
	vU2jQ1c9MmFa8V7BeGr3H2RguMdhCkXqflT8uDa59l1S2b/309rOxlHanY9HK+7QPl2KIHbu
X-Gm-Gg: AZFdTZf7kMo8nKll/S5xKHqRZYbgIhN2QJNuvCelioTBrsDIcgTmGXWrAxHL3mEfW8d
	7j/kDGxNKvb7N3c/yneN6x+i9t6iZVcjBNZJHuWcWwkVk8TyHi+imFD/bR48um1EYlbzO2gl+LH
	VNyvEf6ERYAOrmIBerldZ0aqKCmdGD/zdmTQm3QxUCJYYabBuR70N8vEXDs5kpUyE91XbSJA04N
	jT7XwklCMpaxkaPoIiBiqGtI1kR/D8jd5LSLEoLdtfN6HMLFgxHEQd8ZB81UpQV3E110uHH5QLI
	S7GeIs7ZWBPxl3s/qFQYtaYA8oIxF0tY7RRdck2eYt/xUjY4DDTmHBivqtFVI7Z/dExVzI/1p3Q
	yFqaDvehb2ktvNw0pX1q5lUmmnKkVb355E7eelumg2zju3MXSRREKbRzL3AWfNPGMDxNtwE7dvk
	6kysGXA5kStBcYaUqsdKxdr4OSg+HTeNq1hPXTCLSDnB+PYHry8gi+y9VbxD1zljr12xRH/pDSd
	nVOm7tme2zs5zij2hNxdRKA8UYmX5VObLEQj4dKzcVgKSpJDw1KbvwYXZ2bp/BYTfkD5zc3TlrF
	u/AizDF1/nb++BfcKmuGW5zEMA==
X-Received: by 2002:a05:6000:46cb:b0:4a7:f35a:5f97 with SMTP id ffacd0b85a97d-4abb4b85b7dmr13240054f8f.52.1795365449499;
        Sun, 22 Nov 2026 08:37:29 -0800 (PST)
Received: from archlinux ([84.233.195.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm15813953f8f.18.2026.11.22.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:37:28 -0800 (PST)
From: Martiya Aryan Mehr <martiya.ar@gmail.com>
X-Google-Original-From: Martiya Aryan Mehr <Martiya.ar@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: [PATCH 1/1] platform/x86: bitland-mifs-wmi: add profile support for Xiaomi TM2309
Date: Sun, 22 Nov 2026 20:06:58 +0330
Message-ID: <20261122163658.23920-2-Martiya.ar@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122163658.23920-1-Martiya.ar@gmail.com>
References: <20261122163658.23920-1-Martiya.ar@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add platform profile support for Xiaomi Redmi Book Pro 16 2024
(TM2309), using firmware QFAN values 2, 1, 3 and 4 for low-power,
balanced, performance and max-power, respectively.

The firmware can report QFAN 0 as a stale balanced state after
resume. Map it to balanced for readback, but mark it non-settable
so selecting balanced writes QFAN 1.

Add a battery-specific performance entry and skip the AC-type
check, which is not implemented by this model's firmware.

ChatGPT (GPT-6) assisted with analyzing the existing profile-entry
implementation, interpreting firmware observations, proposing
the TM2309 profile table and DMI match, and drafting the changelog.
The submitter reviewed the changes and tested the profile behavior
on the device using the local development driver.

Both patched and unmodified driver objects were built against
linux-next-20261120 without compiler warnings. The exact standalone
patch was not independently loaded as a module; full modpost and
runtime testing of that isolated patch were not performed.

Link: https://lore.kernel.org/all/20260930015058.3076905-1-uselessfire@gmail.com/
Signed-off-by: Martiya Aryan Mehr <Martiya.ar@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index f71c93a..53c5a14 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -153,6 +153,22 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
 	.skip_ac_type_check = true,
 };
 
+/* Xiaomi Redmi Book Pro 16 2024 (TM2309) */
+static const struct bitland_profile_entry tm2309_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   2 },
+	{ PLATFORM_PROFILE_BALANCED,    0, .no_set = true },
+	{ PLATFORM_PROFILE_BALANCED,    1 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 3 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 3, .battery = true },
+	{ PLATFORM_PROFILE_MAX_POWER,   4 },
+};
+
+static const struct bitland_mifs_quirks tm2309_quirks = {
+	.profile_entries = tm2309_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2309_profile_entries),
+	.skip_ac_type_check = true,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
 	{
 		.matches = {
@@ -176,6 +192,13 @@ static const struct dmi_system_id bitland_mifs_dmi_table[] = {
 		},
 		.driver_data = (void *)&tm2424_quirks,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2309"),
+		},
+		.driver_data = (void *)&tm2309_quirks,
+	},
 	{}
 };
 
-- 
2.56.1

