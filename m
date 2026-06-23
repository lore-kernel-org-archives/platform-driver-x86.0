Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E343438BD
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224004; cv=none; b=XWnhWKXU+EBIsSMoagRkoA1bfXDOSVy7a1JdcxRQ5X7Uz2nvTRghRe7yw82lPApr00p/nz/onYbfqhkFhq0dA3ueeqyVMOCkniHFRMrKBV+EFY9H43Y8GDzFhZdoCN7Rzohqq482hLHTNCh/J/d5FVCahNZ8YA4AA5arCFah1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224004; c=relaxed/simple;
	bh=eisQEfeJ/HvnvTVrOBqfBqNdFBq6+q8S0tv4cbashcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WiLTiN/PI7MiUili1xIKdX6B0GRuEEj52z/cWCMoXL/hxnd4r4yURZn53qfkAz2nivVv8PTrhi0vmGHBwoe6QXib5mxZhAXo9AkRIhVGVr71iAeYo5+31tdY+HTWdpYQem/I6MYFrqSi8DYxZURRictV5xQidh+Gv5k7pwx6EW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBT9DX3E; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBT9DX3E"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8454160043aso4499828b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 07:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782224003; x=1782828803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5n9YuoKYEGmeCkNQpgVyz/eUHDik0ZRvpSPE9Gq8/4=;
        b=SBT9DX3E8nFknL5se4Y/OYnfoLiDJCpeGlgGmSxaph4iH5SpViD+x1inHH4ALu+qq9
         V22XZWBdrDoKfAOFDOuMDJ7H10QUNXk0u3MNrMHs5jxvUuxY5n6zyxGfA9ZgGoOd1oFw
         h1yNjSRctgwaeU6El1My1od94J8ZyjV2gkChYGGgrItQUE1qXlW2RET8sLiFq+pw+Fxl
         EzaB0PDDejHCnfvoLokSW+ezpq/xfmEPTXhvsAGlVFA++ijQ6S2TFhR6l5jOY5+n+sRN
         PV6N0z6FJcaxvRuHZNn6AsqWFE90EslTbxk92JvFKgY3X3bB38GvT/7C9EnmujkrRRl2
         MbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224003; x=1782828803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5n9YuoKYEGmeCkNQpgVyz/eUHDik0ZRvpSPE9Gq8/4=;
        b=BlrMPlmm5D7qy9yAgUWplMz7RxI/Ec9PLHaUxOclqL/fyi4E34FcY9Kmsnrpd9s/wM
         XiResY7L4AJgu+NBq5NAiBZKVT1iekri4UAiEUqhVTcognbAjGIymoFQkasp37oec3kY
         Yy4N6nTu/E1SR7kLN7+9zTJwuAhKYXzmfdKuM6KiCUdK7ia5bViOxUPDwetjgPaCrSBt
         WmoLBPzN0b2mtUA96VeFNJ43wRNDk6nk4C7zX5RHgC8/Pai/c4cklJ6Zm5AfXi0QScYb
         zWi0D9XjnVcjNjGB+4VW0vEKzSSRhYFWDsac+tjeYw7zrHrUSWJd4yPoZp36Xg2q3Pfl
         EtrQ==
X-Gm-Message-State: AOJu0YyMXE2my0pnLIq3+dx4BRSw7uFW1XvD14OmPTsEl/MCHaY4iViB
	dZvarIUs6R6U/Gw9hE/OFGDYOgRDsbWN9vBSDZveHJ3hwLjn5wBofXLU
X-Gm-Gg: AfdE7ckZm/9iQBT88h9/CXUIoUoA8AbQ6KRQb+gJHKVUWjZL1jM69t4dpyg7ISfzhrP
	HcGFvlXRCJ3TdZ/KmoyXJrSdc5Pf9aClhEgvrt5hK0vzVhqZuHKTYwQdhTwitzgvmOcqoJ0g6C9
	l8tqSRVMxpHhvtu9qh8EjcaombsynBlrKHeYvekEC0M8eJDWN/1kyFGlebz//RA3XKZaJb1Ir4N
	6kRppflMleGe62LTesrAqn0PO13/+dFyv9GuCWX0/MgnFKK6u7NKIb0CrbuJ6y/sZLW3eiYsZWL
	2xmytfPBYQH4iE9BZjMHeLIkhL9Dt3Z48WoCKpChdxo1zXwH3HN6M4Il/vNbO/CY71Nk6Q38FBZ
	A9OJ7nZEsooYlvS4nBP+57u0VGA9eSE6ULbB2opeKk0tkZsbOOnBt1oiLk6n2Ij4dIpnS+tofJE
	GSXlmzzcjxXrSRg3nyT9phJqoWVJ0FZSOF3Kq3quaS6xLkXvxb62Iih1cup/NkL7PXq7jTJhIVU
	Nuj1CiHcdxW/o3BbQ4mRfV2IFIUxw1ZWzrYRiyQzEOm
X-Received: by 2002:a05:6a00:3cc4:b0:842:46a6:e2db with SMTP id d2e1a72fcca58-84597044cf1mr3420277b3a.19.1782224002884;
        Tue, 23 Jun 2026 07:13:22 -0700 (PDT)
Received: from archlinux.tailec59cb.ts.net ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ea146asm10704480b3a.43.2026.06.23.07.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:13:21 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Yahia Ahmed <yahmedd043@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8DD6)
Date: Tue, 23 Jun 2026 19:43:14 +0530
Message-ID: <20260623141314.33947-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN MAX 16-ak0xxx (board ID: 8DD6) has the same WMI interface
as other Victus S boards, but requires quirks for correctly switching
thermal profile.

After testing we know that (similar to another HP Omen Max 16 device,
board ID 8D87), the embedded controller on this board does not expose
thermal profile which means we have to intentionally disable EC readback.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_no_ec_thermal_params.

Testing on board 8DD6 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Yahia Ahmed <yahmedd043@gmail.com>
Cc: stable@vger.kernel.org # v6.18+
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Based on review-ilpo-next branch.
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..94147102cca4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -265,6 +265,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
 		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DD6") },
+		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E35") },
 		.driver_data = (void *)&omen_v1_legacy_thermal_params,
-- 
2.54.0

