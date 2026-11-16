Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873332;
	b=rKqUI0kU8fnS8EgVJoN+tgC450ufIoAPcKtZG0wn5e3K1m1XwZ7AZf8NHsBzufCCNIue
	 TdFKY+XJCPerYi40GIWuSOHhCFFMBSbo5CwFDup41pZVU1Vf7Gb4UuJqSIaEfc6PXxKwo
	 brI0wdmFvgsh1tlz9CnOZMmmZ5RmMiO3hilHc9xjQj7tpwn4uMC4oW9zsZLt1Hfp4TneZ
	 1AljvPayV9GP97fnvBkyPw/xDmL8j/riasWsIwSZXbv5FcRvj/7gUC18DmCnr6LBLrHyO
	 Galo0+/svnwOCgLIM8FpCPzpSV8uaCbwgb9JbyljYonKmvHDiDa36ZUHyyIftMKRxpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GwConIlDZBSvZFxb/Odp/XbgJUv7bn8LefwTM8R8uZM=;
	b=WkeRvihYtN7pwqd2qOTDOOsFmtgDrg6COuBdP/XErX0dTtdkfdWCPq3W7LZSxizI/zYU
	 ZX9Zhf8cVDm64+6hEvQej66ewdfuJHcw4mgH9IQGk7c6zaBkUp0hUSYr8Xpmxzk0zq45T
	 sS9qt0m97HAzjMV6VjRiowlGrhG00Q633SaLyQJ4HBQdCUeISo9pnaY153zITx7mufPHa
	 V3l/VtB8fKrTzX8ETGYbKMTbGPht7QwvaCR4ZlFuaIdpqRxjzCyWPmpTXPjYS0FD4KAOk
	 KYuoPO5CpmNgPDFtM6DkG3AQ0npoF/X1BTVOYkb2rzYrNkJygsNHcWBa2CdS4ZkfxRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lne+b2Es;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E660606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E660606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lne+b2Es
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4920905eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873331; x=1795478131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwConIlDZBSvZFxb/Odp/XbgJUv7bn8LefwTM8R8uZM=;
        b=Lne+b2EsCxF+3BTwhEcN0PQffsa19Lbosp4YXjPI3zWNFfFoTwj5B/iRprL68ulM8o
         rqSDWzKWyZPo++UMRGSGm0ck4fe5AOh+QMqjRqon3DU/c8oX5yP/MR+axbjPRwEYai9f
         mUojmH8FNPDXUtPdE8Eo+o5ALGCfbZ+wSEIl8T3XTWgRWHQnbc4kDFhS3LuVrP+WhCud
         1OuCDQilVwy/Vy5Bv6RTt1NtWbEkaigiga6oKYb9XvMnYnvVf3Fqr91hwyS7LRKxbjng
         0jltTjgtgZdDM+fRjqt4t4zT4cWuI2oTfCHKcy4YcY7CoVCiTC7BsBb3skB/x58LYQ9X
         CVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873331; x=1795478131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwConIlDZBSvZFxb/Odp/XbgJUv7bn8LefwTM8R8uZM=;
        b=tFSDi9UI4KFBUm6DEaciZ5M5RKOq7oMBTDOPt1Hs783OrYRI3+J3GpEh20+WgQ9bSL
         XZEKD9lpoxILBavkOxSnnz60CuJA3nQJilFC0lPaPStTy4LTWo1sXMzzKCUqOlcH1gM6
         6qAnhLgE7L6NiuqhdkpfJuryEj+pJhusqATZ7vaVrJSH14U6OYTLctLb79DsRqPOaeOn
         NkPNLCJfcMYgZEu6gMRtfRXAkUMiYDS0SaiuvAQ7ZkWE1IP+7UtrvT9BgYlDPOeg0GBv
         +2ksnAm0HQKc3qbZlSUrmRigrhGloTPrgg3xxTY4ndblYskcRyeMvRAXCJXqEorUNoo7
         Oq2Q==
X-Gm-Message-State: APuU4Z8bxXzcjASrpI1EvzJFp77p7+vsfJcQ7+2p3rYSa4AIXmzzINer
	BEQ7IoY6s8aYYLzMKaaXadDhuQHm9k7tLc9pA/u4MuxyGOQXAsYVDNv8
X-Gm-Gg: AYBFou3Q/SoV4HnO1O3ICjLuTDiYz59qt+y1J7bzillX8KDHZFgPZlvoPdqawfehOxf
	06mgifeKV6CQlClfY8AK7jkd+0RfLHjPBrBujYW4L9ydbLyInSkdOTH8ttKymk0mUFinDPquh5N
	PdXsqaNrA8l1cmOYNfe2qlM9wsVyvpE/31x2BsV3DPqZjLJgckB+mTfXRlozXxSimBuS7tnbHXv
	el5XnDbaV7SSJSVfnpWr6FMlS8gChLmsxwGo1JMI7a4h/sqMP1Zs9NB+qVjv3fhcBYIFjxKR3y9
	Vsy1UUvHLEE5q+lRpYxUYoVfF8lhm0Bo6FHd3YxC0OGpJ/8qWxuExPL7ZjGI5TABo6s1kguO5nM
	zhIvPWn1xzDpxH8JzQ91jHKr3ZD+lYBi1L4euZFxQ8FiAbuLXe/mvQ8FI2CmQRFY2+UY2OX0sLe
	qlohYt8cU06DgFzXbAnJBhwMP8W97Htj7bTl5+zpbVCxfvw1f5ANmJTJdQyBqWlKDWdwiJmCQko
	UK8FdhK1IbRq9slwf2ISl43dkeCzuKM35KWyMGpE3v/5s1Ve+WguNWF+prU3qgolbmVWCaWC1za
	m7Je3qcBOHOvRK/EMWIRt3vhI3Gd2jyOLoVAIzd2eVVIOEoO68y4fSKP48oilOiqTXmBSkWFA07
	CIb+olQalikv5OE7bpajmH+qrccHazxrYVVTcY4SrFqhr+Q34gVVoPd3xAtCPJo7Dm0Y9JJMdvS
	p4BQ==
X-Received: by 2002:a05:7300:c01c:20b0:36e:b05e:9a74 with SMTP id 5a478bee46e88-37967dd6078mr11332826eec.30.1794873331213;
        Mon, 16 Nov 2026 15:55:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 12/16] platform/x86: dell-smbios-smm: Set the WSMT test call after clearing the buffer
Date: Mon, 16 Nov 2026 15:54:56 -0800
Message-ID: <03ac526c7ae2971b5959117f514b2414b073b8c2.1794871007.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794871007.git.rosenp@gmail.com>
References: <cover.1794871007.git.rosenp@gmail.com>
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

test_wsmt_enabled() sets the class and select and then clears the whole
buffer. It only works because CLASS_TOKEN_READ and SELECT_TOKEN_STD are
both 0. Clear the buffer first.

No functional change.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-smm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/x86/dell/dell-smbios-smm.c
index d9c41ecaf90d..8d1e7a14b112 100644
--- a/drivers/platform/x86/dell/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell/dell-smbios-smm.c
@@ -92,9 +92,9 @@ static bool test_wsmt_enabled(struct device *dev)
 	 * - If WSMT disabled it will be overwritten by SMM
 	 * - If WSMT enabled then dummy value will remain
 	 */
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
 	buffer->cmd_class = CLASS_TOKEN_READ;
 	buffer->cmd_select = SELECT_TOKEN_STD;
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
 	buffer->input[0] = wsmt->location;
 	buffer->output[0] = 99;
 	dell_smbios_smm_call(dev, buffer);
-- 
2.56.1

