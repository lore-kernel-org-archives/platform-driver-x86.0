Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861667;
	b=dgJliOH72izZ5EgwkQQADudaCUT/hc3A4GqB04ITcdlgHUjvTEJcBvnnCZgWmoHOdqpv
	 oq6VVVCdXFBfC/CL8CStxfPrLiqafjVV3RCSE+WF0VasYklSBIklqAjSexoeFgm0NCdZj
	 sukHynQL2e4BG4Ucgb08k5POgN3908IWB9NXGOGM1gajeVpadllSUFoin/kt9v5U0l75l
	 k7g3qZG+BWzBtN70hNqKy+mdfwjAoFMp1Ens9zLbTbvDFrlOIjX55jWCOzStu8ZWDfQt1
	 +CLm6tVYh2JNseFA8fcIdn74OkuSkkWf5G9on5/p4WG2KUV708wiUrab/Y6IusGaQww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b6aAotgSj2ida9OGwpvLAhTzVh2WT+T+YjpuCGXLu00=;
	b=B5BCjKUNZ8Cqnw4CTpXuifjmQoIxqneVnM0kEWy92Nx+uW01Dl4qHwEO5p17YLfOAqbW
	 AGYSx5kpJdhfifAnHCvqHdfnfi6RfzWSwIAzPon+D5QUrBzDwvPyaW7/ZVOujTcELyySs
	 d/VATqOvDUAIwSOlqdPTUrwnwAetxs2FjjMSrulIBhpC0s6QPB3/+GxRlsYasTY3EO+f+
	 ZFiz1E71CoMXsPYWx7hu6TUydP7AXG63SSoOG5CTuX5mpgmJg/MjiqI9fKC/53ArM67SK
	 nR47YHJKHOxdYtAvYL7zB35SBdooPb8oW7PeCKi3cwuAttKMZNblWG76pFyUgw9aAyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCH9XbpY;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44EB606A8A3
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 20:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44EB606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCH9XbpY
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed1f1a7695so13722535ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861666; x=1795466466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6aAotgSj2ida9OGwpvLAhTzVh2WT+T+YjpuCGXLu00=;
        b=JCH9XbpYqo1mukAvoY8Hc0s2uA1GcBPgf9FDCa5NhK6xVbX9qRpPCEqyb1CBrrRyhE
         ssB/QC2IYCbao6hC4DCZbW5r3AqAnENTkaSvBbrWMfxWIgWMfk6orW2nAh4r9IovUVpM
         BCdLlZoQsKw2fyB9rdIqa/bHfoafMHpGeuQ2AUeYwhTJJl9EVvXPeBoe2Nuk5F8/v0s9
         VEkZnw4XrAEQeUSjFHVhi08AytOgezkn+6yyPPPmAfABYR6Vq3nrG/fexNa9frwFw60O
         k7GhKhxBXKJaFao8wYrCtKp5yWYO8K6vFsEVq+RuSrPVGKoH6BH58hOeuEJSCfdPIjH3
         KkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861666; x=1795466466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6aAotgSj2ida9OGwpvLAhTzVh2WT+T+YjpuCGXLu00=;
        b=dn+vzZoawBjLdhfqOMcbcxMeAVOttipjYYP1GkSV5LN0XJE61Ugrhe8chX1Gi8bQdJ
         0PFROvtjsV6/RwFZ0vrbMjDhr5iuYQlrpnxKp2ub6E+XOCoPgCPtZeWvBb+zam1SD8Ut
         9IOH7hnYRg3ZJRMNBDJXDeEK0Wd7aXMMxSDU1e46ejN9xwy1LqqEMRDWufb43t0xquJZ
         0HYGCiZ/dwKHTHLEJ/OOgmYVWpRKic2tEAlKy4GyrLSVMOgOl6SUPUya+9xTi5qdGVmQ
         lwRZ2exC9Lw9zD6PJw9s20YfycDyCV2z2N1bnnVcKUHt9hAZ+HvJ7Wa8Zitt1gghYrQo
         ejDg==
X-Gm-Message-State: APuU4Z+2SAa5IIoBIx913IjREQbKp4SQwI8UObGU77j49U8uVtothhUf
	dw8Xyx2C38/S+Ioj6qjyUT2rjZepRj9s5p+zEfhHSC4zmQdQgA3ZuxJn
X-Gm-Gg: AZFdTZcrps+Md0WNSFhhqAAGh2B9Qe+iiPMLauYDFLQB8tPfuOh3qASrYZnW+O+aOfE
	gvDAFLQPC08IgVNObT6mhUEaAWWfiI/uI37yBVKlzEVVv6XdgGNH+hPMnCEQsstvT7HTvZk+VJJ
	Xamv92mNG9yBaI/JwJVBgoHZFJxA1XLG5v4XG0iLqYu3n+htAyHuuHKUYIYQ2bGr1Xchfqe9OvW
	m142o47VYaOxijX4RJKeymkGJk9namGFDHpVnZLC44c/1epwlGoZnOTrIw7gjlY4AJR1RsorIB6
	u0zusWLAbvP0pC/gZAEWYAg5JEHSfy952Df1Uzxa7TDpYXRKikFvFnC/lMPjThdwmMdKNNDHM2C
	daZWBt/ah4DvwlElagkduSg3LOjcTd3kkHwVG1J2Juyd1wNdPfGWCyiL74HXsU4t/fO4/h2qjzy
	xBTmdMTLoe2LiE9JUm4UlcsxZW9VotfdPzbbvosIo2Ck1WcLKPziuPWlwHdYGCPKz3Q3sE7FCFo
	RgyKir7c7KqpPhNHAhoiWZHEt1n4NO26gQGKz+fXCu2k/g6wAw/SZsKWju/WykpvN34PDiG3Xv+
	qgUIpSlkj5yRyp2oi2wUGI6w2Fxh4Ki8VKvA9LVK8L7L+gdearJNVXPtWqK+jktuHdBTCvR1pDn
	f3k9br3TeyXN+YL4dO+RD150hhmHYOU/dHMYx7317JDrUTRFUrKzlN4lV8UhFR5quQvx5N6Fire
	TpF0JVLkYWU1kqVmTnhu2HGww=
X-Received: by 2002:a17:903:984:b0:2e6:c39:b25b with SMTP id d9443c01a7336-2ee0da7f5acmr106014125ad.14.1794861666125;
        Mon, 16 Nov 2026 12:41:06 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:05 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] platform/x86: dell: dcdbas: Validate the WSMT buffer description
Date: Mon, 16 Nov 2026 12:40:52 -0800
Message-ID: <aa437d954b48790ef8a3d770c2ec4207aec4d8f7.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794861287.git.rosenp@gmail.com>
References: <cover.1794861287.git.rosenp@gmail.com>
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
index 0db278eed5d8..1e854f02e171 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -538,6 +538,9 @@ static inline struct smm_eps_table *check_eps_table(u8 *addr)
 	if (strncmp(eps->smm_comm_buff_anchor, SMM_EPS_SIG, 4) != 0)
 		return NULL;
 
+	if (eps->length < sizeof(*eps))
+		return NULL;
+
 	if (checksum(addr, eps->length) != 0)
 		return NULL;
 
@@ -598,6 +601,12 @@ static int dcdbas_check_wsmt(void)
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

