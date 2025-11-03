Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3048B1AF0AF
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762196526; cv=none; b=Io+jLFQ3WLnVM1xeGfl2hsVXHzyChznYJ6R30sP86UPRRGh01i2ixSHzwL26150uRtE3UjXz02mzKfPZr2kCA1E4vOpqoEVZNNIhTYw9uIPkrkMq2152WZoY5HroSiE76g9v/n0hgvL/RR8+AGqio3pKbSUOYdKqsPAseTTlgCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762196526; c=relaxed/simple;
	bh=DbFAwez0cjMr7osbfexuB3kDFZnSvUx7kQxtUW3PIsc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JurunK2R6s1mJqluwDGzWyOOF4Wa26g72AVORBz/hmJQV4JBd5JG3jgzTdLiC23Bv1dENcglaLfdNyKxCZFMot3ZeSIE+ssG5mqieNmhOjWvfUSnVtPUpwurgtx5Ey7pJC2/U3zaj/Lql0Svfxo34WtEI/WSwLoIzNcxYbIiYaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7RcTaat; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7RcTaat"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-932e6d498b2so4262297241.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Nov 2025 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762196523; x=1762801323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCgyYYl17212afWq0WmdVNHdmhfE4WpVfwvlvWkdR/I=;
        b=N7RcTaat+sbzxC9Umtmn4+rvXHFsVIoj/FJ/zTHEKLmoLmxdoFeYS9RDheteD6khOX
         2KQChajtn9cnBzWKlrtajuIxjgJzeSa9NI52+nVuzgV5xbnRbX/g7/65F+39HreoF8IZ
         WKb2qF88Dl1Km3jspNDf5erwdt6ydN90mQdwndCkmgYohsJ5JUqunieSd6gxbxFUWnb6
         ZFhRCvISnHkXllWrcB0G1sc1/JR4JTJZbv2BmBlJ1R22wbKdrVVMeCEwIPHn7ULfARB1
         PS3o2bvu9RrpSA3qh+durUZvt9+2yif+pMrIW0peRatXwvPc//qo+nlvarnnGevj5KEo
         JkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762196523; x=1762801323;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCgyYYl17212afWq0WmdVNHdmhfE4WpVfwvlvWkdR/I=;
        b=TgCSVQ+bskMXEoTgcZMNit49AKshRy1oRqHVJQfEzU4066GBahK+tI7LQ6zCcswQD9
         jULEh9cYXq7kyNlk1NvtkCLNtP/CbBzOvudpruSgQOeS8UwPCNwK0ee5mJc8zyfeaqg/
         YG89Ox2Ib2Ou7j4MkFHUmfTuPCygRcMRqz60zWMRbNohVf43VrqBdGJSyeDo1AsxG1Ql
         sv+LXzcAniIbUWdFW/ZkByZHhM7hPB7/stwRpfwcT2/TM15ixUuLlPwcA9bX/7rmB+kV
         zCaHZ6p6fI2ISXGmjILuIROsiOeXwdkY6aK7FMQFumQupFgJHfvCcPXHfxljXS/KVqy1
         qO5w==
X-Gm-Message-State: AOJu0YxsNP9mlN3IAIpvHDB4t5mqAq7wYni6L6f0r9c/K59iHZ2fXGW/
	TSQLOxsozRybIexMBiJhi02/04uAzncGhrFjWYanibJgVPhe+/6N/Fti
X-Gm-Gg: ASbGncudIUfOpgoudN2yiMryzfuAK4lAuXkz7KiXobaOybNQ/n0p5FTYVS4oCYvziCG
	3CZJWQesWzmG1WvMgcTFaNpwE9cBSelbVhg+qSo7g8mNKtMYlrZ8zJ9pgJmnPODT0rhx0O1ySlI
	DOmFU19SoKtOCNWm1vQMuvood1K1w5BvzzHpWmVU8ky7EwvTD2h5qy7YbNUhonKRwc3oX1RbVuO
	RmkeqGLyH29zpg+Cpa3bdTC8pNXIJeSImomMMeEjY8waHyE7vnCu0ygAKJMcVJRXPCJvY9U4GL5
	4wlU51Ww6FEBpigdGhiJHvqejMzgQdgERYckzwNanx5Y1zzQu4ZAf108Nf0Dv3XV+yehB1nY+5Y
	NwDyFsXe/PVG6BWJJnTD/2BYkDi4eZXhtYkZqYsYw2QIVFnyQsHbi7seC5Gk36xJqARIzTWRrjT
	0dag==
X-Google-Smtp-Source: AGHT+IF6ZrnGeB7r0RyVBzECaRGawNu02DZMNOtb1XSlboch2JDalhSDF7ll1MdUkogMoDYfu5R1OA==
X-Received: by 2002:a05:6122:250d:b0:54a:992c:8164 with SMTP id 71dfb90a1353d-5593e404ef5mr4706586e0c.7.1762196521682;
        Mon, 03 Nov 2025 11:02:01 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55973c834e3sm358469e0c.11.2025.11.03.11.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:01:57 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 0/5] platform/x86: alienware-wmi-wmax: Add AWCC support for
 most models
Date: Mon, 03 Nov 2025 14:01:43 -0500
Message-Id: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABf8CGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3bTE3MycSt3i0oIC3UTjxESLFOOkJCPzRCWgjoKi1LTMCrBp0bG
 1tQCitVuzXQAAAA==
X-Change-ID: 20251013-family-supp-a3aa8d3bb27a
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 Cihan Ozakca <cozakca@outlook.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=DbFAwez0cjMr7osbfexuB3kDFZnSvUx7kQxtUW3PIsc=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkcf2QaPmz/etjZoiJ2e5P879lyZ5g6bLuqbQNPnTxsd
 GvixoTAjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjI5DKGX0y5/8XlvLrZfqpn
 Wn4KD9fbGWHfIsP287keg9qReZe2+jMyHFXv8m3y3L3lRosPV12jKMuEOW8/HL5ac21rndztYzb
 CvAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

This patchset adds support for almost all models listed as supported by
the AWCC windows tool.

This is important because the "old" interface, which this driver
defaults, is supported by very few and old models, while most Dell
gaming laptops support the newer AWCC interface.

Thanks!

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (5):
      platform/x86: alienware-wmi-wmax: Fix "Alienware m16 R1 AMD" quirk order
      platform/x86: alienware-wmi-wmax: Drop redundant DMI entries
      platform/x86: alienware-wmi-wmax: Add support for the whole "M" family
      platform/x86: alienware-wmi-wmax: Add support for the whole "X" family
      platform/x86: alienware-wmi-wmax: Add support for the whole "G" family

 drivers/platform/x86/dell/alienware-wmi-wmax.c | 104 +++++--------------------
 1 file changed, 20 insertions(+), 84 deletions(-)
---
base-commit: bd34bf518a5ffeb8eb7c8b9907ba97b606166f7b
change-id: 20251013-family-supp-a3aa8d3bb27a

-- 
 ~ Kurt

