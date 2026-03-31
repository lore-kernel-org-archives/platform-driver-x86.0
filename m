Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A0544CF37
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980742; cv=none; b=SyF2+ZzhQVV8vsawMu4ZCGhU9YeabBT2DTXgTJ7QTFwwCUyUCUA5QTq50ZUnud8VJm3pPki1va2Jv14+JxueYCUDbgopKePvVmS7SOlRp0s9LMigxnxybpM4BKKq14b7fhPmTuR+cYLz46nY1clTrCebb8WuZ2NOdXCFEEgwkko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980742; c=relaxed/simple;
	bh=rG0RQv2MuPbBhBFZtR5wdNoasAYFvFw7xH1qvGGsPyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YX/N46Q3YjZ5bdg6AR7alKrJ7XN6a5yIjPcFoE0o7LHLwHxVe/uDRqvWc67/vNcaWBBktf/vd/YJYm9NteW2hJSvzqgI9OmcXuPfMxx3w0cmcGhLrR9+1Pp8at7geFqRqgW6Qs9oG1iTr9WV9yhyHKyZ4oXw96bsXWnujvmzwkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adm9+2HZ; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adm9+2HZ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12a74039dc6so4834049c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980735; x=1775585535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnQ8hDDXDr6abxthuWEWU6YIYcBA9dlKD0mrsjPgMY4=;
        b=adm9+2HZMXbJ1AXq8LgFteWfqCe4CeQSDMJSMfKgi2x5a3IMZeN5I73kkRT8g3BePJ
         UF7M/5kHSSsRUTitE0U9HpPAl+4RpZbYnWLijA05a9jRX0tVAv7jA9FKxYzCe/Agu8gP
         lA1uIhifRFESyOEBqC9H+CI0fYX65YMkZ++oAKjCPGxpcM4msqhHLM0I5dgQ34T4jp9k
         saC10fver18GcV9I4DkSCujK+t7ADc71diiBAwLieLIhCmN65V1EiBSGgpyBsxzc+KCo
         eed8Pz4GOeHMv/N/owlisy7S9Knf1uFuNER5+5AalxJ3yCsrxKUWPL7m1HnV2gOAw6WI
         ikPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980735; x=1775585535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lnQ8hDDXDr6abxthuWEWU6YIYcBA9dlKD0mrsjPgMY4=;
        b=e+LbXik6jl6QCwuXluNGORH7ytAn3gy+QieYo28BCvBE8nTHT9YN4ES/O78UitZ2i3
         bNf7/eCxz7Tg1vxlBHZsoyAk2FhuK91Aio03h7i1WINkXcyfHuWzeg1wJLCrjbyDmNSV
         zjzRZobg+hpHOiZnNfeFgVVCcc+XLs9seKj7ctBcZzaBojykQV3blC9tPApJdsbWgk0z
         S7+gkWQiWLLux0JU5i0LdRMFJ5TSjgwfC4q+X92GpBmlt9bjnDf53U2BZJGyaS7fmxdu
         +JtAQA17yDrulEHGIcUDKuW6ntnY12t/VywPgZXwOwe2Qo8JbR23F8rg7wO26Tio0ts2
         2xtg==
X-Forwarded-Encrypted: i=1; AJvYcCXPUdqCIh9I1dd4bW7xk3Ehmk/GpDbz0w0Lj+zetMRz9B01S14yDhOU60bMfuKnce5iEQWL+qVY4mh8RtlFLMBzCAnq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0q3ANo1HV1t+pltCKsKCQNB+yGuro4ORrNQ8Ncb8aXKgwLQW
	P2l+4UD6NntSLVG8VowN9MFlVLDWxODTXAtsOsLrzAQi5mWECJaFlpmH
X-Gm-Gg: ATEYQzx4BcxK8mC/isgjB9Y3KYA9WEkFV+pglZ5wdJGj1tCd6Kx3v8J77l6bxqIeSNM
	EvUP5/PeObpUirepDLL66oueAR20FRDsz+Jits1M+UUaQfSrNIj240qblCpaqr8XXFGF1BIJ276
	jxV3knzpqr5k/QE48lEYerlVxoD5iOD3bG8hictbkqydhXMaQ1mfzVk3F4gNGfthTZz2CMLfikW
	T/S8ItrH1ZQkwMhSupR4tqzWjwqlPQ9cCQbpqRMMiHxeCr678KNh/Q+PeQmX+Y2xJBi8T2p+0Ij
	IWQcYge5ikyDQUGV2EybY13p8jsOeto8AIiyJuAysI+Jg4E0LCbxBnQncnKkfzbZThF2a1BACQW
	vA2PD01zqk6+kB69xGsptAgS1UwZPr6zX/yIYKEzQIMc7wTMfDx0lCyh/Xx/MW8w/i+8oK8LZ9h
	Dh7Rrg5j7enobDDxwF2YXsRglPZ98/YRxqt4cN6FSeTRK6rZx1L27rzW3Sg3KtbGIiMVwbAOtLO
	Ae5
X-Received: by 2002:a05:7022:6288:b0:128:ca83:5aa3 with SMTP id a92af1059eb24-12be64552fbmr301829c88.1.1774980734977;
        Tue, 31 Mar 2026 11:12:14 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:14 -0700 (PDT)
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
Subject: [PATCH v6 03/13] platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
Date: Tue, 31 Mar 2026 18:11:58 +0000
Message-ID: <20260331181208.421552-4-derekjohn.clark@gmail.com>
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

Adds explicit initialization of wmi_method_args_32 declarations with
zero values to prevent uninitialized data from being sent to the WMI
device when passed.

Suggested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index c1728c7c2957..c3614bc4f90c 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -166,7 +166,7 @@ MODULE_PARM_DESC(relax_fan_constraint,
  */
 static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
 {
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = { 0x0, 0x0 };
 	u32 method_id, retval;
 	int err;
 
@@ -772,7 +772,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 					struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = { 0x0, 0x0 };
 	struct capdata01 capdata;
 	enum thermal_mode mode;
 	u32 attribute_id;
@@ -835,7 +835,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 				       struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = { 0x0, 0x0 };
 	enum thermal_mode mode;
 	u32 attribute_id;
 	int retval;
-- 
2.53.0

