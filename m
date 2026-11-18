Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975959;
	b=qO6P4hIQqFJ82EiwLQwSAbL8MYrN+ZWiKJZhICAfGHCYvZX/JPrzQSwqgRnRKgVN1KDK
	 ybeham3E58uAKfcG8TrwKAGe0ndOwnXLrVIs4TehTeI3YOfYsy43e5B3T6/2MDeVXmX7f
	 9yhr2YPsJUYAOWXr2OnnChxx4qPzYG+d+0lt2bM74ZqEBwFFiWrWhK2K+l2D8uIEvAmxn
	 bgf5hLb/FuDPek/NcxWMFHRuqpDiZNbeMfLumxRtBBt27gRhvvgQ3fu+DWGMOB8lmySdz
	 gu41NKNrhq7G00shg+U2EIR/uguzf3h/Z6sw+il+qaDkbsilMBfEj4v8Heh68OoPP/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GwConIlDZBSvZFxb/Odp/XbgJUv7bn8LefwTM8R8uZM=;
	b=WIekV1+guW5s0hkB7IqHZ+Us3E1vcQjqOTCDqRTyJ+t3NrOPswgp8S9tEttqKEcBuddo
	 +v4DOPy50cNa7PK7E4JtFExax0cMaWMPpbBQUz/n98YDdCkdw1RCl9TbmJSl8vio47QzB
	 EPP/d+K0HOaFtG7aNmFl+yVEzZF4A6DSa+PnSYSPeRgNsjf4gCNS332u9EE1riY4RVe7c
	 Ig4J2NgErWn1BqV3jZGDhWOLfnTfgpcudGxo1eG/Ta44fGbiz7EMZptFM8E984oBxS/1I
	 6Wk6IACBhzCcUfFwj4tXsziHdQHFcaDE/ImnCAKAEENJ/sGAnMj7q0S23+Tls+zNQCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YahXf8JB;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D8606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YahXf8JB
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3602985ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975959; x=1795580759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwConIlDZBSvZFxb/Odp/XbgJUv7bn8LefwTM8R8uZM=;
        b=YahXf8JBq+3WmqD1R4n7g5gpMDqdY+zp1s/rXBAq0IrXx7abi0YfWRStNZZvXXFfdR
         2kaYE6bfcrbNnn89m0F+tIoYUzJu4vK6NOXiIrYbtluvX1AB/955fV5rbdNLz6+9Y0km
         QRgmKuFgN5tKTV3Oog/+m5nE4C7Sj5TH3CFqdw677rLkWU0wUCp/smym3wypnFWL3AN3
         EEvzNGlFoxrROUVKq4gguG0YMsRq2Qwk5IEDAtBT7EqN3XJ0CgC/5YBsCMUtyhFzl5+K
         Qag4j1MuTfW0vRXdB9rVCcFzH0mM5EgvQJJzHTc9yF6vDC5Rq9/oT8oZGTRBVblptfXz
         Bm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975959; x=1795580759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwConIlDZBSvZFxb/Odp/XbgJUv7bn8LefwTM8R8uZM=;
        b=DoJ7WHdXdWMAfcFv33EGwxKc6546ijxpGfNfQQtzNAbpCbIog7CP/qKzyxevee0ske
         NDcsuRfdYk79HSCQmCG0ovxzMX2Vei67Ws8SI3FWKpw4H5yzTbVZPCkzC+GiTr7DLnsW
         7SdmEH/7EOTrFLnCRvw7SoRCa4ymJ9Uh6Hjw0no+ocRvkpBS+fZnEUsddPlNerGqE4X8
         FEEUermqbp5E37ZgOp2yoLF3MlYP4197TIiWTtnDlQ7Ce8uzd0Pekp3/9FptoMpl7xYh
         k4tmP5lzZx1qi9Q77SIdLRtQeql/WOt3qEjJ7eZKeV3N27cmqY6HcOQcJtUWqXP5mcQs
         QqDQ==
X-Gm-Message-State: APuU4Z/YrFo/Gq7IoGnxyPPtQxkFH/e19vEzlgRySe50CbltsEXqcT2T
	NlVv7jIAjMhQf1p7z0UmzhEuCwI+OZz/ez4zbFSLzVkpib/aISTiZ8OH
X-Gm-Gg: AZFdTZcwf0SQWgMBH0PkMN5NgxCPJs8YNEK3dVM0czC/2ULZdA9QINbF3tWA5ZBENiH
	NDfc0eYS4wAOyqqofzSJbQFWF8h+XSLpSO47mIm5xC5bJXRBdvgfGOwE2Q1THbsrqHoF/YdqGWz
	fMwYDBIEz5Yga/SrkZTP0sCEYNAYOouM93eI5PiS1VL1dXCuKOlRpKEHtM2GLwghLf4mvqHmVgr
	IeOMDmgThzqT2FMOB+btrf3Vn762zyKofeMTUhEar5TNncC4lMj/mTnKMI+pLy0U8M3RI5moC6I
	izswLl+NqJyq3/9C2Dh7n0UUXggk9i8YMScSALvHo5kGvl6Wr8sMa5wGCHFu0oKDZuMp6HHvIJy
	s6e+labYCcS2OX21E3CMyudT3EWnrYCSCb17md3BjGotk9Ein/l1qZmqtwsS+Xdr3njo3DTw215
	+Iv4BW35zj5uFe4n3G2Y8veQSSvivKdrQVD120VIkXde8gO4QTEOPs8xVdUAra7n08M/byM+ir+
	WTT3GIyNyXsSyaZcM65+8EqV13EIOvoH9nkj62difxqtsk74wRONkuJs5sFfgFZ4KxvC8YlOVig
	2Vomr7Ig+sYvDDfHqdD9ASA69q/7TluTIaUrrsYpi2WTWqLN9g3RCLIJtxzKYhOb3vMWn6F2itd
	snBJBsFy8NGPXsd02N0DvG+dU3uuJtLatcPftJeLIirpGeXdfe7gKkM8ab4DmmRWbSV4Sq3/PZv
	mvQ6JyfjBY0UbY0o7YiJCE39g=
X-Received: by 2002:a17:903:234a:b0:2ef:e13e:779c with SMTP id d9443c01a7336-2eff7100df7mr15119995ad.6.1794975958754;
        Tue, 17 Nov 2026 20:25:58 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:58 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 12/16] platform/x86: dell-smbios-smm: Set the WSMT test call after clearing the buffer
Date: Tue, 17 Nov 2026 20:25:34 -0800
Message-ID: <fe1d63656ab1c27b92fbb436c377e8c28bd6a505.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
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

