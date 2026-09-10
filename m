Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68943B14DF
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 04:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015513; cv=none; b=F1z6BmH1NFFz53x5LQMmFFiP/bWHGLS+p1QqEtodi4ZnxGVM3EVxZ94Y0BPtZKjbkkxeS+vjUG375/b42p7AurBT/sTrhf1UV4fEtcv8yNySXqR4smVXD3YxATRdwuqWEA332ZaAl0ajsYf9d3RHicRU+/vkTiRBcWjZXwXINjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015513; c=relaxed/simple;
	bh=XiUM0pRwU3xo5xaP2pWGBHjzB5UX/LCROmEOmQMbA4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hggCzkUUigpNo8dAWUQJnAmkIY4ADj/XHmYLWE/MV9JXb9z8m6qwTQto/5LkZBaBuuq6haUYs9OqucH9779VuLDSWEGBXQuCuOLf6vCWSrV9cHl3a87CN3bZbtPADmTuHcMZutzIaxFYXqMOsghytUmxbpVIXRpAfRCEOF82NSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ep5OUcd5; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ep5OUcd5"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedf433a99so6183842a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 21:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015512; x=1789620312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmxsfa+TNdlnTgsp+XfFN2O1d2BArkuJDOPXDPvoEYw=;
        b=ep5OUcd5F0yikl1u9KMb9iI2ruHlBED0UwVj7msnFMd/5QGieVbtLxOlJIy5SpKosS
         QivEu4tzSOqHKImyrk+BOo2haIcniAlz43oII3EUC2h5yO0w1rf3wUZD5rn6tspCpL9R
         SRwT7V3UNir6GDBcZrNNBpNn219W4duTvg7jE189bO4ygOlyBpMMD9WY5GiSGxEG61wI
         IfVbJB1WRoUDkPA1ytOxRRDt3uJ5th09kNIAPuvh0thF/Bb54IBkYfJDNzg21swCddzY
         jULemOl7t87sN0euQ/GWxYeUt7846UaC5NJbgKpUTEhlXRgbtXJzEW0sDaU5rtCkyq3Z
         JJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015512; x=1789620312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rmxsfa+TNdlnTgsp+XfFN2O1d2BArkuJDOPXDPvoEYw=;
        b=fLXONatk8v5Djt/93JccwyyEEP2W/g/h1C3drR9RGFxwNqH+RExCIftpqQcGA/ECax
         OH9EgD0jMmT53ksxVRqzLWIX6Lck99oQBYSoaEwjXOtkkwLGAV/Wbx8g0YtiYCMo70bT
         Te2av64PGh8yaIFcBPL+b0AqOgoQtnWhdnCm3U/HHgMqYzRwm2okZDFto59jx64NWmb5
         uqFeWHbVltGWTFwxjo625APIxEkfMGQYoKtLWquyAXj+gZF2aEta3nvlBdftCEQilOA+
         ElgdOY4Ox5wBcPa0P2CyjIDKWO4gOX8JI+Keqvs68gHdLjcSSjT5jA/cO+0whbJRTC5c
         rZUQ==
X-Forwarded-Encrypted: i=1; AKwUvByQSTbFIwkiTav8NPPSQTRfyfyjoiitK45Jr3tZkgt1KfgXU2LTzIDOf24Ah0JTKjnc8N++UtsM5b5HezywXK6RoKuF@vger.kernel.org
X-Gm-Message-State: AFuF++mMmxB92D8gHKvirhAc8yyIjiXMmqiWsY1DRdYNEXUV6mSfRQeP
	co8m512woc8vUyrDIwvRcGivHJAA20dc09S4u1w9fFP8pkJv42ErYYWRwk8MYTec
X-Gm-Gg: AYBFou2XRpv5fSMFMfB33CcsObiS0cyTBu0o+kwhVj+L1CPNKHN+gvKsFuFqWeY9o9I
	oEfffxOn85p4AlRtRvfxFCDivww/JHWFVDANiI8zPUwvKxdV/8dW/kkvZKadi7nmtKCj2zuO5A5
	Hn4Eq0eXb6oaH9FrcmNedpEPwWRZE9r+4SHIG7+gSflSaF7eTlXYr1sCI8tHTJl5UQkiU4q9/OO
	H+lO2kWZSwy/6jL7QrakMrkpugh2hmlqAdziAsvktIA+QvB2rQEoVAL70VgbnQW1Ux3OgfbhN7L
	fnFZfDAo1hafURJNv0Ace4eHQHxGbP138D/CYKlWu/xJngdPl9qZGgAx7JU9z7sCwqhzhfQ+Vqs
	B7cs9wS8zKPCg55XXdV8X80Jt2kPGW4GbvAuqsMozW71JKXGceRYU8pcSLIqgzHbsHpN3Y+EQuh
	iI9ySrahGC2oxl0j3oDuY9j/JkcwIpWPmU68/qHQ0pUDRLHXdGSOgoJpjJNkkfg7/HVxj2YVvpW
	OAziKZ+DBGnLOH6xoGzPAY5lg==
X-Received: by 2002:a17:90b:440e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-39b261e1011mr55218461a91.13.1789015510908;
        Wed, 09 Sep 2026 21:45:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] platform/x86/intel/tpmi: Fix typo in TPMI_FEATURE_NAME_LEN comment
Date: Thu, 10 Sep 2026 10:14:39 +0530
Message-ID: <4c84e4fd734d7e1aa70e045e6c51f8bda3fff5ba.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to".  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 0153dd57838e..fbe9c8af4aee 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -597,7 +597,7 @@ static const char *intel_tpmi_name(enum intel_tpmi_id id)
 	}
 }
 
-/* String Length for tpmi-"feature_name(upto 8 bytes)" */
+/* String Length for tpmi-"feature_name(up to 8 bytes)" */
 #define TPMI_FEATURE_NAME_LEN	14
 
 static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
-- 
2.48.1

