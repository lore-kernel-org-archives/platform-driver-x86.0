Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E6142317C
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 11:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537506; cv=none; b=IbrGNcL4KRgJcJ0o1LUfcf6b0RZDmv416FEmMk+7zjLsOEhchsYslQ2w1Zct//rqxfrpYVnX/alSG+45VAQEoKALso66mkSkH1flT5XB2lld2nyOnW5CA10+Q03DTRN7MKk6+4Xmk4RwuYka7WQ/Lx9sfMNQbPzTSnMIj8Wr1qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537506; c=relaxed/simple;
	bh=Ibgst/L1Fo4GbyqPy70gjaVUXW4LFZx6SMpY2X9tvo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vAoAXNN0vfBBapyEPMrDb35HeKA/tp6u9izCS2scIC8qR00C8BFQfF8m4RFQdxVVhMunPqxu1f+j/Ojyhwcr84irj3v8pAOGW1ugyxYqrEPviGJD0auEhcHfAsyeIDgep+kqXXV192ollMinJqb4xVIpWb7QwPsLtqWqWVUZN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b+Y/9C1Y; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b+Y/9C1Y"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772537490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lnoI14OAszKfuEmOjinBmrBd+B1TYDm3p3rzS5UvZ4Y=;
	b=b+Y/9C1YTcXd8QgTPPjpc0IHoeu/JG3tNXF/iiKpP2Kpj+cnReLN62KzMQGYe1+xYeNxcH
	tBDChNUTU89Dc9m91wFUlpG2oNh/RQHZ7ECOpq4Vc2nnQWAR3pWs9o1XvqTL2yqoUoRPDD
	CA10UCKFXsCmwMcUAMbAYGwXgQmREDw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	Divya Bharathi <divya.bharathi@dell.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data
Date: Tue,  3 Mar 2026 12:30:51 +0100
Message-ID: <20260303113050.58127-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

set_new_password() hex dumps the entire buffer, which contains plaintext
password data, including current and new passwords. Remove the hex dump
to avoid leaking credentials.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 .../platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
index 86ec962aace9..e586f7957946 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
@@ -93,7 +93,6 @@ int set_new_password(const char *password_type, const char *new)
 	if (ret < 0)
 		goto out;
 
-	print_hex_dump_bytes("set new password data: ", DUMP_PREFIX_NONE, buffer, buffer_size);
 	ret = call_password_interface(wmi_priv.password_attr_wdev, buffer, buffer_size);
 	/* on success copy the new password to current password */
 	if (!ret)
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

