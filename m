Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622080;
	b=XXKz/XlbwnCJC1cx9JyXGdO5Tg7kuEyjH+/+ReBdYFbJjR0303NCTrQBThrGwd0fjRVM
	 Xk8AnMZm2ZpzZAV3RuV9PcB00yb+KI4VtEEbZeHDj/SUt4AJACjDwY6D5JTi9OO1mo3Qi
	 82i8Cv5iamFkgI6ORaftNJYGBIi5RMsVlDYKtSEImZ8EjkGyRfemUigfSEa+9UbmMkQu+
	 XQJ0m5w/bIxZoYLjEu3A0KAsp56awXJeVgY7rjQHFoKk0sNDs8kk2cD92OVBLwbWgJlYF
	 IjnYxjIRBimP61FVctHneyLZEBj5lUJkFKotpXt3vvdTG/9f81zogVuALT1ibU1EJpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gZoi50CU8duaJY0qeyDAUF2hNEQ0g+BDDJdFh73HKoU=;
	b=iLsAu2eHnfD3qXEzU7FLH8F71lSsiKeLhCQg3dpVhlOyQEpr3LbDnfM/ljus5idraiC9
	 A8lzJ4qGclfWZvFbsHmKKZ+9kXD/vp+PcDx0596cQ0Kc/5ibYXhDE89tnxRAGSRaXqOnP
	 QRdghTyjX0d7Ml7tuImuhuGclq+cRbR247qbbQniZtQNeFiPGWqeuSAbTCBwHihSkzMMp
	 NHMC+WRYNj/ATBeSNRZvvumDEhhbmL06tMZESShdefwqkvXJei6MWSGkDCPF6LEJz81aN
	 HPoot0zYxQTReWIRoEClniHgmAAR989zy++084lYmNp8bbo452Y7kps28kUYHMs5Sow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TqyyZwxs;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D033606A319
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 22:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D033606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TqyyZwxs
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1114466f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792622078; x=1793226878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZoi50CU8duaJY0qeyDAUF2hNEQ0g+BDDJdFh73HKoU=;
        b=TqyyZwxsrH3FM9EerDE9wCxSyDymTB3iGm5QLWBZ+qPbpQlpFjca43QK+9c6ioT8WF
         IcJBQy7EeLkHaEzmEab7d05RJF9vi6jDxdpS2a+bkqhaRalWGiTEL/LcABClHcxDjESZ
         KKF2t+DZSlYzfFHL8QFVboA4HGlL9alUlt+z1Vgk1lCnsyr3srd+rdwG7hI4VCcm0zNg
         NdWqvgsGKE08tOBTkqsXcpZ/QAYfH7eOnsk9V8Yp65B1xAGlVaqUASu63ulnG7cCMwek
         GoSY6ui8IECYz1UXyyn9FBRaNGylEZd5MwotX5i134uF27VshLh97ut7Mcavj6zvpG1e
         An0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622078; x=1793226878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZoi50CU8duaJY0qeyDAUF2hNEQ0g+BDDJdFh73HKoU=;
        b=VTtJOOCNPQFZq9WmyiNCVHU4gzFmnEEeVDo8oMbL1TDuQrmpuZF+Dy10hh7o5dWx4J
         F5Dm8QhawswV5aDSgKHkN+IJn6HDYDhTIPZY2k6WaBiIx8C+6hIwhZDyBqP2ve88oFGQ
         7SgG1IjvAIFeZgxt1tZuYcuU0WfazVf1vW69K2WrbECkR1aWj5K8BdNbuxuBbMA0TrUC
         XD6zAcCW3KyGRuNYRmikITnYKkmHChLFi2bN28Vb+W9q602zPs4ZIQj9X5SmxOLXfvED
         MAe8WcQn6UF6vSrXv4meUU8AeoklX07K+oxqzUkpzG+MMSX6cZp6EvHFGczwK0+IPdNY
         6kTg==
X-Gm-Message-State: AFq9FYIVmCToHE5laBco/Q/txL9mIxlAaffySMfhG8GQiRIH4lF5Q42Z
	983JDGxdeqwBMcfv0n7nPOnRS3Wr3qUaGv3sc7EPT4nC3vkUbbGj115e
X-Gm-Gg: AYBFou0Qq/DFjQ/b6JGy/0uJk0a8k+8CpiY5gx2CzDmLBe1aUwgGLitRYcAqEiIOGsA
	NLacl/2U0k2TK635IylLE/PVVHookVkMjhPcd6FTy3+g5qRNRJw5/UFLLW1SGP/LcvNtOLutLxM
	U9hQ1cgE0qQRhTtwmOc3pKFBqOneM+rKGf+tgagQW7o60MxzBfOCfV8qvWBTlikGS2oHrXIhc3W
	+Zoxd0xTyq7d28UxGywtanP7eRYQv4FyEx9GGK//7Zez+ZRlYBpqv1CywFVCA3eSqWPFfKzKqb2
	5y+bzjJwfQHAbdDD3hbOzj00jUoyUQHHl8aLbIvNtGWzqhP46MmNN2o3bd8UTai87Om9yY2bJKx
	I/A0mDBvSJjUmmlp90Cho3Py1YCjLLbYvk7JCnNXfIW994nTPeKISKU3OK/3r2SMYLbOIqoiFNd
	2FwSyaeayAT1/YJTdIraNNzQ2dxnv/3deTn1mEM85ujw4TwS6B+PDjCK+7GKMHTymN20rIVL7lX
	rDYfcvXa58uXRRm3GvfUtaGKvkjZe6oZ7OGhz6Hq3S/cD4aQJRfBptQiZBROXD0BLt3iHu8Qerr
	A8RmPTpCPjp2o4dK/GoRNtYrUXagdfEuN74=
X-Received: by 2002:a5d:5f92:0:b0:48d:eb6b:9d0f with SMTP id ffacd0b85a97d-48e2647cf56mr7748471f8f.11.1792622077705;
        Wed, 21 Oct 2026 15:34:37 -0700 (PDT)
Received: from hp-omnibook-14t-fm000 ([5.112.131.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254efb2csm8744742f8f.2.2026.10.21.15.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:34:37 -0700 (PDT)
From: Alireza Ahani <alirezaahani1386@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	Alireza Ahani <alirezaahani1386@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Ignore status bits in thermal profile query
Date: Thu, 22 Oct 2026 02:04:30 +0330
Message-ID: <20261021223430.26229-1-alirezaahani1386@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On the HP OmniBook X Flip 14-fm0xxx (board 8D9F, BIOS F.20) every read of
the platform profile fails:

  platform_profile: Failed to get profile for handler hp-wmi

and /sys/firmware/acpi/platform_profile returns -EINVAL.

The firmware handler for HPWMI_THERMAL_PROFILE_QUERY (\_SB.WMID.GTPS)
returns a 4-byte buffer: byte 0 is the thermal profile (EC HPTP - 1),
byte 1 is a set of status flags and byte 2 is derived from the EC MODE
register, which defaults to 4. hp_wmi_read_int() returns all four bytes
as one integer, so the value never matches HP_THERMAL_PROFILE_*. On this
machine the query returns 0x00041000, 0x00041001, 0x00041002 and
0x00041003 for performance, balanced, cool and quiet.

The same value is passed back to thermal_profile_set() by
thermal_profile_setup() to sync the firmware's OEM variables. The
firmware's set handler (\_SB.WMID.STPS) only accepts 0-5; an ACPI method
trace of STPS during probe shows none of its cases matching, so that
write is silently ignored.

Only use bits 7:0 of the query result as the thermal profile.

Tested on the machine above: /sys/firmware/acpi/platform_profile now
reads back each of performance, cool, quiet and balanced after it is
written, the "Failed to get profile" errors are gone, and the STPS trace
during probe now shows the matching case updating the EC.

Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
Signed-off-by: Alireza Ahani <alirezaahani1386@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0eac5e1d9..8f8a1165f 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -110,6 +110,11 @@ enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_QUIET			= 0x03,
 };
 
+/*
+ * Some firmware returns status flags in bits 31:8 of the thermal profile
+ * query; only bits 7:0 hold the profile.
+ */
+#define HP_THERMAL_PROFILE_MASK				GENMASK(7, 0)
 
 struct thermal_profile_params {
 	u8 performance;
@@ -2116,7 +2121,13 @@ static int platform_profile_omen_set(struct device *dev,
 
 static int thermal_profile_get(void)
 {
-	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+	int tp;
+
+	tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+	if (tp < 0)
+		return tp;
+
+	return tp & HP_THERMAL_PROFILE_MASK;
 }
 
 static int thermal_profile_set(int thermal_profile)
-- 
2.53.0

