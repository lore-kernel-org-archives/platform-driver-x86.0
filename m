Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245400;
	b=1V69BW4BCDN4PSTwDfqlFRboMJdgRUFyhsHsDP9ARNss1QF+v5LQEB50Va89SiGCPNKt
	 tPdniWNXpDBNQiGs4puk6tp5MR4SEZvFETYpE2FG4QF2hb9F8TULwjy+rx9Hq9kf+ETHA
	 FCkK1tq3NmkJmg6BKC0+YBXssl6IO5Ro50wn9k18G9GI8zc0Ro6pDxIHrMExvAKj22G5V
	 K6eJOD1W0eZb6c80b2IOc8PsXWpadFZ6BVTSMPHozVMm+KAOpcXVDV78qx3UkDN/XJTnA
	 FEYcMo9ERrsky8PNhItg/1YtmRPoHzjAeb/ozzISqz9CUaEoYYUW+onjfflOBxpInFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tdCP/mypa2/iILqauJ+aqk0pnjBkqNtJg4KvWW3pS9w=;
	b=wRP+t91HfkwItWIkxlKQTWTf/HJQYLgq2dxhRfOd18Q4zb7/fKpb7HupTej1EISQvUm5
	 3kjHgKdF1MHh6WUfXOE2sbbXOf3AxbEd2HTG1t1mdytZVEQmowat6F0+uS6RSCXsk6xhH
	 YsbfrrxQfaBaO1EXMf6bXD7Fc9jmfdA1337wnczEMDQcX9XEVa3KiQ8RgczWcgX8pgXzC
	 z5F4xPpt32e4OIEWs9HsxnkGfPd4kC/BDWBVA3s7gU04CaJOkqU9Ad01XiQAEZm74ACfG
	 Fynk4i7eSQKP49vI26OImu1mm1cj07N4WipntH1SE3eLirZr4I0sSEYi3xNNDNTWAAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALSW9fU+;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A209606A32A
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 07:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A209606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALSW9fU+
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-18818daa3e7so1229085c88.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 23:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245399; x=1795850199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdCP/mypa2/iILqauJ+aqk0pnjBkqNtJg4KvWW3pS9w=;
        b=ALSW9fU+n3W7WmoyLRDEW2909svEnnBqGvBB9cG9yZ/vOis+U7SRVFVylleCZCa8sb
         5ZXoP8fiF+muBQzltTcfBo+UPr7T5aQ/+nWfPEWlBP330dMxWmXMKQhU4ew6M4LVTR22
         ntMADf8QYuojqJBCPE+XjTEjXo/8vsacNLvD1YRpdrkZVVYi+S1yfebpusA3GN3CRW7i
         6y5SyTE4O8El7uNqa1NBQRGTB34prlSZk86bIndJIo2vvIqkp1Yv+jUTu+szuSmjEk0q
         BSXv99fJPcs5EGS5rDZU307/FTMuuC3D4SI1uh0Dqzs1xyU8LprCmX64uDFvE4a+l71Y
         Gnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245399; x=1795850199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tdCP/mypa2/iILqauJ+aqk0pnjBkqNtJg4KvWW3pS9w=;
        b=kJhIheoT8X6Fljwoml95DCo2LodALylYk8SBXSaDer7GvRWz9I4JnGKlkeZs4YCxAO
         A5M38R4gkXFVEc5T11uGq+yxaQz7YFMBWsq8qReeUfMCKhOjlvMEe4NqocjgcZ5zZJYQ
         4UnUN3pvJVnjcoDD7//E8vqSan+6nE0xlR+VAYNuxVCngp/+dy29btprHY4zwWl67Q7U
         jc215OYyNi0FIGSgqKeGH2oM8zxOVL2N9GwilYlDlj6SzaLFXPojBGa+TzXBwp+prPV6
         4prjmTTSbA6EiLauLe6ENLn7nwzuXRkumoBAM4hqGnIId0WmSJoiNmVBV4HRjnguxT2+
         95Fw==
X-Forwarded-Encrypted: i=1; AL+hErFe93j0jwrEoMZACkGCYbvGURhGSYFL7njFuVkUXJw/LokKGMiDpPiuWpSoFhWLbcLiC5HdsvKAG3fRIDZeL6hPUHls@vger.kernel.org
X-Gm-Message-State: APuU4Z8v99VBuQmYXCrmmqgP61WD2q0j+zz/8nb1AB1hoU/61UiYrIal
	8AdT/1HQ7B2JCkirl9yuY14/Ot63kVgxaAI6HzExTacn9zMkryKAsplH
X-Gm-Gg: AZFdTZft5kWM2VG/bVKhMRWPX6twAJPyMpC5lTFWpK0g3x2UxUzVUB/oy9nNcmSOFI/
	Wr3HDXuaOew8TbGw9m/ixoLR//ceOzdmzFE1S4blod/1b2/kqUPSFckUI4o+3MURp+vOAInjAB7
	sNF4nagEcto2lukkQKN5GqITXpmJmmqYpEq7f8EPzLzsl3Dhy4TFReGdKwNMUh12JIjfQzwfGj7
	4aWiU1z6sLu8rCp77gTRYXm3HH2JbCDHqr0mpIoz6CU8nsiGQap1nQEkB8UoS0Z7v/bEPKrLyx+
	TxU/xQbp1NDdjZo0scHWSDGgKFMaH0z4nAOA9xhx2/sDc81/FQUrX7VCwE81F77pkdOibYDwjAe
	0J4VIm/q9uZ+/y8oZQ4EUon/IL1Noauqe3suFKLlzsFKaqLZW6j/DC/j9sE51ADwlNQSuHMGwz7
	SHAJLv7H1f44aryThrOuv5mYMx5epMImLhQyLHbfT6i/oX3l1y8aAXAilg5VQ87UKpW0syVgIah
	UWBXFUEV+K80xiff9Jg3taxjR2FYHHr9lPIEOYDgY7L8kkiGBPvYkVuJTud6uYlZLsoryp/kdA7
	SJjPiL9aGiXBrbFg0zTkW6B7D8b7lSX6DRgLVPD1eABLVs06bzQ=
X-Received: by 2002:a05:701b:4551:20b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5569167b4mr4993441c88.18.1795245398780;
        Fri, 20 Nov 2026 23:16:38 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:2f:4d17:70ef:2f53:72ff:31c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm20880373c88.9.2026.11.20.23.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:16:38 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/2] platform/x86: hp-wmi: fix platform profile values and fan freeze Victus 15-fb0xxx (8A3D)
Date: Sat, 21 Nov 2026 12:45:32 +0530
Message-ID: <20261121071534.28473-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com>
References: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com>
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

changes for v3:
made patches seprate for clean merge (thought it would be better?)

- v3 changes are mainly for fan freeze pointed out by ilpo,
- added a bool in fan profile params struct 'hp_wmi_fan_speed_auto_reapply', created a new 
victus_s_ec_fan_profile_prams with new bool. 
- also made that bool a wraper and re-made the 'if' statement with it

Sourav Nayak (2):
  platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx
    (8A3D)
  platform/x86: hp-wmi: fix fan freeze during load for Victus 15-fb0xxx
    (8A3D)

 drivers/platform/x86/hp/hp-wmi.c | 44 ++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

-- 
2.55.0

