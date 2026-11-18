Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975950;
	b=4wMitmY08h9dVRmbkJ3Qa1L08UpHVVmbQ1oDUExqhiKEx22z8rbblM3o6F3N5TyaRDQa
	 PUHlYJmQE1dJDDl3b3kSnUukF0X7uzhRAK2TrBjDg8FDS7eU7lkN0Svn+qN+A97k38Gu1
	 yRaBwe0V19AGD7qzDw0PYnxYS8wpSW0D349bive3cNLyttJBDbAz7yviCrczasuBfhjjJ
	 nhIDTXwvvDGZRrIikCRL59mIdHIsq23SqrbmXT3VemsBrq8vuZseO+daezbobSrsLGU7q
	 X1pX58cVpcIHnawo0NYgxXMog3l/wjo/wJ+DkQ2dbD9SdeLGr0FDHHqShw4wIX1Uy4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uuDVCo0frm6llyW8KTWR7booJKYAacIVajz2n+Pn21s=;
	b=dKFBegWpp8mkby/6FaW73/jsKDo8pz9Zew9VwRXDqaDLqB22QF9kH3BQWpgx8oAxdvRR
	 EmJfQ94I62GKbJVIR3srtdJjlRTgyDL4Koj3BUfjQQWhhw+3/0cA4TNBePN+hlRie2aDG
	 hSFFIyGKBPc+KNiryhVhDAc1PIUZTwypWopvOqOLuFo6UQ6YxkZgVNDHvwd/46XLXcSKZ
	 Xzxd/MRIcCZuWndyYVJb4bJ1xzK6AQ8sXLDWMW4k9axXhoufYKDMCj0kxV4T/RIcO7PaG
	 3aXDfnIb8jJsr3yDJCyYMz19ivjyq5fRy/aX5e5nfgZM6QoPzLE5hlExp5p76aqUMVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tP5ptDjl;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D7606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tP5ptDjl
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2efd659464fso1808925ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975949; x=1795580749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuDVCo0frm6llyW8KTWR7booJKYAacIVajz2n+Pn21s=;
        b=tP5ptDjl4ghDTWwyHXxqjrU6T7lnG9zwvrnKIGQLVNCgLAjKNt9uD/9iC13iPGVj2S
         0dnIPj17TpfUrL+np/7FMt+i/kKpPelDA+ctcl0Y+HK1dffsesan2FSsngmi/5fClFc/
         fZV7qHXwUiVW62eChexCL/RXdosRy1VNTuAc0K0JQ730egweto3vPqYhkqwSvRqT7RPE
         s7FP46aTG8L0wFmk9kVXop8Ac6BmuqgPJ8aw2574tFXg0j0QRG/iSx/lyFoo1BDxLPN4
         zS5EW5tu3WNBuZogzb6FWZz6Vku7jL9yI7om7xMwJ1fljfDH8o5sBEsyG9PwFyQ/wYFH
         9Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975949; x=1795580749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uuDVCo0frm6llyW8KTWR7booJKYAacIVajz2n+Pn21s=;
        b=a3JsE0hwpOzQEtfTVp38tKR2ksXeholG6HX8nIlKiZ8iATHvKCMnovqCRzoL80nYub
         ErXjpZYnl46OXIXYOePMC5kmThRIFvIsaxKTDKqa/Gc79jI2gdFngyiA2B1VVPP68l8e
         jyg+Sp8byzFDG9EN4cx4xSNeLcBoZhI7nm+1h61e8qKBB3yrFjhSebkIjoZQDq4TN5DQ
         bLMhnzFxpPA/QyytamihkjcXEUJcqiZuxvWR5K+uFOMODMtX1JLOaiMK+DKFgoqA8IbZ
         K1GGCXMDAcNSDksFjPp4ceZMWtGz9HEOVR4pfX68IPpk6h+U+YniVFMG7yYBasdjYQjo
         htgQ==
X-Gm-Message-State: APuU4Z+a2EUGUwAIpy/NG4cmRwxbd2VvUv127s8h91dKRS5C8MWttuCh
	6qvskAvJwCGWi9AkcoPQUKogN1IpKa3HFupDfBbQ3I204+J1iDb78TSi
X-Gm-Gg: AZFdTZfQC57iibDQr+3M8Ldot4lGU/Kgs/6jITDmpKo1pgijHXteM72Tq27qbKEresD
	dxflb433+/KPh54uqrhI8b10DBsAeVTiCCAKRhvE+oQ/Wdy+JihaL1QnQDXE/b9AN748gmEGrxx
	Gi4sueNOdgE30mysCVlVVNX0R3yxx6T53mE/LpFSgtt8KeX0J+UntWJJTkCyZSoDVsQSK1jy7S6
	QBMFhwycaFB35oK5xsKepuWk4MCRIB6B4yQLuGiN3zpUybAzQ/IZN1EboXnGY4eR/1ADKmbHI6b
	ZYCIIZymRK0mQWQ21/oXktM8wEECyJitu9m18hFxwKgHze+SjKkz3FZ6zDejO/4LnT3a5jCqEPQ
	9UjoZbwwTZYafRDCyrtjWXmz9FGTXdEYrFMdsPWiWs0lUnkkd3BWKe3S2Bu2RlYjTK1y/24nE7f
	ry598SZCtiRFXxZhtmyeddokvhN4J51cU+z8cYmxxrYLmtMl2hUawII8OFXfVfnOqPExTeNL3az
	jpqC29dmIoEOpDpoqT7mS7OsjyTKVbXnkK19gc+lCT0MZfZMGpQxdqt024Zjvrn+sYyWdGyLD6Z
	LGQKVy18a6NGwBinytcuKdJtmis+7ZGRDkZLVmSVKOLU3eRgeiNz7jlIbDikOOAa6xONE7p2IMU
	ndWukeWdSroQIk6lO/8XTD0Cd54NmiqM5jt0gw2V5ldkn5uQvtyipp0Nl+q1AiliQnbo+cMR7rq
	eH3g==
X-Received: by 2002:a17:902:f611:b0:2ed:18cc:d3a4 with SMTP id d9443c01a7336-2eff758de8amr13302655ad.46.1794975949522;
        Tue, 17 Nov 2026 20:25:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:49 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 04/16] platform/x86: dell-smbios: Skip 0xDA structures without tokens
Date: Tue, 17 Nov 2026 20:25:26 -0800
Message-ID: <2cbbbe94ac16aa5c59e930423850b43fd22a79d0.1794975827.git.rosenp@gmail.com>
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

When a 0xDA structure only holds the terminator and no tokens have been
collected yet, parse_da_table() calls krealloc(NULL, 0). That returns
ZERO_SIZE_PTR, so da_tokens looks valid even though there are no tokens,
and an empty "tokens" sysfs group is created.

Return before reallocating when the structure has no tokens.

Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index 0798e48e9c9f..9327f9792b89 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -443,6 +443,9 @@ static void __init parse_da_table(const struct dmi_header *dm)
 
 	da_supported_commands = table->supportedCmds;
 
+	if (tokens <= 0)
+		return;
+
 	new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
 				 sizeof(struct calling_interface_token),
 				 GFP_KERNEL);
-- 
2.56.1

