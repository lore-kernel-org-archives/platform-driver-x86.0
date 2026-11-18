Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974211;
	b=KN4uDBu9B1qdbnq/fMsG5eJGJ+dX+iKo3uQ29kPtvPHQCAkMp6skZ97VERaRMs3n+LU0
	 LQV3XyB83e21JknXFxUeBeXMDuNWeJAJtNG3bkqHexBAku/lJNBBSWQaVo9VIGyUutvI0
	 NZhuqGrzLEYuqug7dPJPbNxZGiS47zyx5CrB+YYj5pgpJJSOZAVw5Ue+2tLddvWZuMBQV
	 FMTcJm398704RsNWoweSAh7yEKVaHo3J3Fewj3oErhlm15+9oak6S5YeguYPT4IVXtIe2
	 LS7Y+wSwaClEPYGfzcIPa8k+QHc7yqQATPGkjpUPqndkIoa0q9baZ4GEkv94NUEALDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wBYhC98lGgyZwfCdqc/0NpvYQ8xNJdgsZQ7BBTKHb/8=;
	b=mgxFOmcETfWeEwdAuJrQFyMSU3P7Ng4QJKRl9bzirWsbaR26S2x37CdIM96co8hEUseo
	 gXLctwAHSmHR88wxfzjI6MU/hGtIu0JWNw5ma9FSGydV9UYvKHzxm8Lzf3BhKaVVjx733
	 zlE8JcuWCLkvtMONDBQSOOJylSzEgCowhM6JQV6WBHzQWWIiT837pVVp+cXkIrsoEvbfL
	 P6Q3s6WRFRyDX6tN4osT6xb1JJgUyGFSJRvsPDyOQf35FmByN8JkIBF9kQlEfvafDpT43
	 m1s+wTx+4aldQh3lIrJJ0/LDGW2LH91jFYr61h9+cc0TYcWkplbPB9dF/vW1+x9fo6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uxS/HoqK";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92185606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 03:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92185606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxS/HoqK
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso276182a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 19:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974211; x=1795579011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBYhC98lGgyZwfCdqc/0NpvYQ8xNJdgsZQ7BBTKHb/8=;
        b=uxS/HoqKDCPUE1RYWpqkTWOmHiicUhQIQRroGrZ0qvyRW1envs1IoaQHKwghnEPwxa
         BQXIHeaDbcig7Tge4Sr6b2dx0Mcgp6AiEUbvnjuntF6JmoRtztAcoKH/Aptn0tQpb1tE
         KiiY3IceS2/SX5UT5F1Mb9e4/DfONwR2r8OIye/aDgPaHSgEDPc9C9BGCAp5m1ulBoGG
         KBgzzUPYxDwgbdzsfrW4gyt1jCgD7YkjbbIWlk5UISMN0cF1iwMrtmeRzLvna2FR33mB
         1OYKiSlW6F0tH0g/skIGONkdIGfFAwuLy5+OX/k/5QquoQ3RgyLC97OkIZTcK5weRND5
         ov7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974211; x=1795579011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wBYhC98lGgyZwfCdqc/0NpvYQ8xNJdgsZQ7BBTKHb/8=;
        b=Zta48bTkCHulrFr/yTL5SFq+KnF/I6GzEdf+2Kqj+XioSL00tuHlM4E7zwqjQUBDxU
         VntngiNxOjLo1jrKRm/lN28EpGSgYCooqHx3522wOcA2wZXc58nLzuiKJYlfwVJkxYa7
         Y3Q773CQHfzcTgEMWPZB5u2LG/g4ZiQ85cJvt76b9V9zikjcIgMSlBzDsmMYAIwi6sx/
         dukgRBWNo31ka8DabBgtVuoax8GjVFX6dSZ4IkX1Ox00kCoQ91e9ztizOrROoQSrHWh0
         mdH4Lp7Pm77TnfUIlRKIu/9gBwp9IfAXbguh6pcZOaBVe45cQaqczpaU7bg+uF+oTuKG
         Cykg==
X-Gm-Message-State: APuU4Z9UiBovnqi/UfpWMC78kZPIGOCbD4p/xoY73je0ByadpqDX2P+d
	Qa5awXUpNi9Qf72/Q72XdecWFW0JUcYVkC9rSz6mkZpAN+BBBGKAJeLx
X-Gm-Gg: AZFdTZdFFIFoGcsmMTn25od+hfre1byu+4CRR2wlSGjmG9pGQQZQt812MTeoToFqPLT
	EWJRYKl9i0WsH2jecDNb3OCtkywWQkqVklByOrIwvJijHDdIny8ancT50bsR/8DKiRr3Pjg7cES
	Deqzg4o9K/LOkqI3D9hOCEHiI5AGchFinnm7F4S4BOcH+AVx08/nS7eyQBHR1wHeJaVVA/quj7x
	9ZKh9l0wR/V+mD/rLogq6rWcMKyt7aEOw8+gcTJasxHRw0X4XZctrHmK0MC72ll8QueryWTx1Wr
	qcDJzOGHuJ6cQ5l5BMsR5zwzey4FujtwwovbUwcT5wlKa07UA1hPI8tCOJwTMFXUPRgZyYP40r1
	eTeUbY+nY+GLNW4A4cY3YHObbekEbVCzffgyzV74kmmveZbg8c3vbngjsjBs6Zpu5yWBmgEplYS
	cyavxqxrCrVPZ67eTaMAJQncpfNE8l+/P39lDKe3w5/RQsUVCYQz2sl4AdKicABblPEJjJtgmM5
	oLxCEBsFDWaZ2GLZn4EOz2Jh+4KYLv2s3gwzO6P9GjUf4xnrxwFnsNGRQs3+f96H6WN7L4j87j7
	tW6AulnzWxYt2wr7SEGIEmgVUxRVQ5dCinueUoowpd3iDB13o1gnCnW06YH1V8ChmbS+fuFpHLS
	dbRTNvvNlHe7Z9Bn3cUpbcVhGrIkxezJ5nNhpaPbE58Fs4LT+j0WwJJseKJNR+XC+8X5L6RWpwU
	4NYQ==
X-Received: by 2002:a17:90b:1fc7:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3b3d0764959mr1419011a91.26.1794974210893;
        Tue, 17 Nov 2026 19:56:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm598227a91.0.2026.11.17.19.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:56:50 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 4/4] platform/x86: dell: dcdbas: Validate the WSMT buffer description
Date: Tue, 17 Nov 2026 19:56:38 -0800
Message-ID: <20261118035638.11773-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118035638.11773-1-rosenp@gmail.com>
References: <20261118035638.11773-1-rosenp@gmail.com>
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

dcdbas_check_wsmt() takes the address and size of the firmware SMI
buffer from an SMBIOS OEM string or from an EPS table in the BIOS area,
and sets

	smi_buf.size = remap_size - 8;
	max_smi_data_buf_size = smi_buf.size;

without checking that remap_size covers the 8 byte semaphore. An OEM
string such as "30[addr;4]" would make the size wrap to almost 2^64,
and smi_data reads and writes could then access memory well past the
mapping.

check_eps_table() also accepts a table with length 0, since the
checksum of zero bytes is zero, and then trusts the rest of it.

No firmware is known to describe the buffer like this, so this is
hardening against malformed tables rather than a fix for a reported
problem. Reject buffers smaller than the semaphore, and EPS tables
shorter than struct smm_eps_table.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 1f64f707744c..7fa6faead7c3 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -536,6 +536,9 @@ static inline struct smm_eps_table *check_eps_table(u8 *addr)
 	if (strncmp(eps->smm_comm_buff_anchor, SMM_EPS_SIG, 4) != 0)
 		return NULL;
 
+	if (eps->length < sizeof(*eps))
+		return NULL;
+
 	if (checksum(addr, eps->length) != 0)
 		return NULL;
 
@@ -596,6 +599,12 @@ static int dcdbas_check_wsmt(void)
 		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer address is above 4GB\n");
 		return -EINVAL;
 	}
+	/* The first 8 bytes are a semaphore, not part of the data buffer */
+	if (remap_size < 8) {
+		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer size %llu is too small\n",
+			 remap_size);
+		return -EINVAL;
+	}
 	/*
 	 * Limit remap size to MAX_SMI_DATA_BUF_SIZE + 8 (since the first 8
 	 * bytes are used for a semaphore, not the data buffer itself).
-- 
2.56.1

