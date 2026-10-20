Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505682;
	b=g/WLo07kTFjXMNGl3wTFtzA78GdxeeSrHrIhmSI0ehvIB60xjS25RJdDOwZ6C85S/ziM
	 jwC+pk/WsHIXdMiHP+KlxPhsm7VPShddLO6A6szl83bx8ELm7r/4ZKYFW1E7ZN5ktbAER
	 /Iyq3l+3uP0x6NTjgWjORRfGFaiWPygYceWlli4RiNjmyn//v+8vPUwgn43i+b4dp/P4u
	 q/6+ZG7P/Cz9M6F7HGp9Pvyym/FETecL4e5MLcQUZEII+wNzXiDmSr1m3ZPsHsHi51kdT
	 2cDOMw+H09AKm5Ko3C5wqDS70dZfZWjR9ELLVNJYROHlZzdACc2DyhzX7JJ0WlmpiaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zEsuZyfDjSWj/BpGeHEM3jz4WjCMQaIiWWeMu5F0b1c=;
	b=p4CHE1lwBeVCjl5IqbH++OMTCjJDFSJ5kZQ4ZKf7767aJZUkhHjXWfWh0szE6YBLnGIG
	 yrB0ejKasKQPuN0s/WW+nF9wH3nv9f6o1iEaTNBIIb3VLkHDqrdGM+Tx4EER72/Vdqn+u
	 ANJKZtpZesuEYSzJGAWN+BPc0tnRE0qxuwDcE7KMiIgu6tCW5Ni3CCYiQkhSN/oIU7zPJ
	 /9+rstw+1MTU69hkiGMsTd/eCtBEy4PUkpXWo5RNSDXmk1mq+6+HCd9vwpTJUvj93OR/v
	 PaGnHLDSzohSUFMYoCCfn2f1pvtkDQxmPmS9/EkRkJsxpmD3FMeSaYJL3l3sRk2Xv1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="QMLhtJ/y";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9798606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9798606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMLhtJ/y
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e011d370dso2692314f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505675; x=1793110475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEsuZyfDjSWj/BpGeHEM3jz4WjCMQaIiWWeMu5F0b1c=;
        b=QMLhtJ/y4NSHZItSc7srqIghcCaAhr1j8x0Vht0rNppW51Pi2HyvVi6N5v4pa8B88t
         a9D/o5qoeqwerLUcMi0Pb/ppeU5kgXepX+fODjMW6ycDPzeB4ssxaurLYS2VOxVOQQ93
         WbBezIojpi3KkdhXpoy3+2I9ZoVtkQV1iCUcwzBSpw9FAv7V0t362ZaiBXjtNwarT5EY
         2d8GvoqLcBmT98zj5jGSMoiuvTVH30/ZboFvzV+UiLpLhcADD3TIa00bwRaQNKQC+1Ym
         st7Fmk8XILZlG6xA49W8lBdoaY/upgfdFjK9dxMfFlcEre0J+Y2A/2UjnfC1bmjoeGXH
         527Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505675; x=1793110475;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEsuZyfDjSWj/BpGeHEM3jz4WjCMQaIiWWeMu5F0b1c=;
        b=w9EnblfiBHZL4578MmL5mjHd525et4/SyKW8aVDiXszHCvw0oxSRG3F0u41P9qYwOQ
         nO/ei3sxYKrx8fAMlTGcitAmr74lwmTTIxSce1rG/FN2bo1teMyIh9djtbzCJxe/yrpM
         yKfgh6LQ+so+JwjdvBRePNxBfJkEe7MzrOtTaWGb4MQE+xUdMCREpHD8Mom+67Om7Irk
         5VSkABpi9RZyTN+2oOrz4P3zIIJ2OOxs0VS0oOC9AyCA2CQjskRmeXPSU44Bib7/MgAS
         WozZ/L6SNCCdO0UL6yGMLhpKTtEDCogMotopq49UyHvejYRiDtKpct6mTNZOD2j17Uya
         cM3A==
X-Gm-Message-State: AFq9FYLPlQ7Ghnydpnc8n8e5m4FY8GuiDb+hUCmIEZTeHy5+rTAHqpdT
	NuzenMs3bNPiB0XxHRk3GFkGnfLKgnQeHpoU1KFFvNRgB5oZrzx46Yeh
X-Gm-Gg: AYBFou1iKsu0D0svc5rE+jCH8rwa/BWDGuXD3aAIPeqszNZasqAf7qIU/QEYx//diEY
	Mm7IaUqKZ57X2zQtSpJJdjAadi+FFeN2LbeUE52vXTgYiciACM1d8a12YxmIQ/97toeVNKNbbSB
	TBF6uUumMppnJwXP7lzdpOdhYSxm6/geWYdBEFrYs6gJ7v3bTtgkEBqgtydXXmR/LBuPw1e9sME
	8lG8Z3HA0V94kvf7bXVjg3te8pE9gsqW6FTTEQ3EP3gtU8PZp1cbDPLioqeeGWydul33McK7/bR
	EAPRSNn/875HLP3G6PE5ebYi3HVt1+uk23AC4XkJoUI7DaHOc/Ws16+xUXK8SzbNbOPrU40jVFu
	GKpT8HUxUwDOq5newqxnwWESmSp20qradmKdqIGTYuozHOpWmNuhOOxz1+5TrVSDxwXbF1NaVAR
	P/XYIdyc8XZA2xFzRrC1d4QOaeXdFr611T9JUdUoZ7WEhtaHIMO3ec+zC+PxKjyVowEsOdCwb49
	yEGF3AHOOdJtoHgGJ1iAOqj/jNISycha1NVhqihXzPHSFI+gd2aFi3KC+t3PXBNecKfR+EZsWfa
	ILXDa0HUFS2f1opaqIIaElpYZoFVq+0wdMKzXvho2xw=
X-Received: by 2002:a5d:528f:0:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-48e07fa94bemr15933068f8f.43.1792505674826;
        Tue, 20 Oct 2026 07:14:34 -0700 (PDT)
Received: from archlinux.cern.ch (ppilicho-1.dyndns.cern.ch. [2001:1458:202:228::101:227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9cdsm6256287f8f.11.2026.10.20.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:14:34 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: msi-wmi: Ignore WMI events for keys also handled by atkbd
Date: Tue, 20 Oct 2026 16:14:25 +0200
Message-ID: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On MSI notebooks, several keys send a WMI event through the Wind event
GUID in addition to a regular AT keyboard event, and each press logs
"Unknown key pressed". This series marks those codes as KE_IGNORE.

Patch 1 sorts the existing scancodes numerically with no functional
change, as suggested by Ilpo. Patch 2 adds the new entries.

Changes in v2:
- Split into two patches: first sort the existing scancodes
  numerically, give every entry an explicit value and use lowercase
  hex (Ilpo)
- Add the new scancodes in sorted order

v1: https://lore.kernel.org/platform-driver-x86/20260926165034.94254-1-pat.pilichowski@gmail.com/

Patryk Pilichowski (2):
  platform/x86: msi-wmi: Sort scancodes numerically
  platform/x86: msi-wmi: Ignore WMI events for keys also handled by
    atkbd

 drivers/platform/x86/msi-wmi.c | 35 +++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)


base-commit: 893018d51f27ec0449155b0afe371aaf65380630
-- 
2.56.0

