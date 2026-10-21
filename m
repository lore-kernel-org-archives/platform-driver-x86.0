Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586099;
	b=G7aUCPxA9g/EjHC3Mj+p4hV6UYmLMg81gU/qHuzcdSWhyo/goTKxVP/uYFKPmzHWokpo
	 WHpfl1sTmoxEw2l2GCikr4Nm4mBr1YZEm2z4HnzFTQxsRr6jIbmH/+2PI3SBBuw445WJm
	 sS91bAdEP69UatfOgUuarfEcAdVOWtIXcfnsNMRa2ZV4y9TT6iBM1ofxq2s4PY3YzQteV
	 HjSkGD1FCukOSRkUvB+21Xnqm8vWsSZuBS4ImUBuPjaftbwBs5OUs/8vqGZkyPl7CcE0M
	 bI65t7mIrvABGWdiw43vprJ+PBPQ8ZlYx4ceUvHM0Y63QIjWtsDjH0bamrayWmfnrtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
	b=f9vfVxvGRKBh6rPID9OFyMO3IORu11J9UnpDc37UVcuFXooMWF4s2bemWDzky1ld5TWo
	 7CTTSQ6GcymQkppfjLwS9jh2Pi8NIvR4dR4iF9IN/hkVKMfO1HEw0Z/JfryS4WWbNWvJY
	 P1BAtVv2pRp9zD1sjKtroCkthftmkpDx8BHsZWseSNy4jxhFAboxzK0nM0tvkwIBHlXa9
	 LtALnp8p3IXqjoBGB/bEN4NarHaRp+AhNsG0fCYfeWpn4hNRUzkfbtYIJ3enfBAJY+fKr
	 GhIc1eDmyIAp6Me+fsYjlKcg7if/ov9kNmTAeUqT89G7f8XNxT8gOYmb7WCASyUvikw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9Uyg5Xf;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084F760A2612
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084F760A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9Uyg5Xf
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so371513a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586097; x=1793190897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=J9Uyg5Xfy4/jiXw3ziddiNFrGfc5Q5+5dOgPDHw+oRg+GOIEI/Wvu09zCHwbbOUiaL
         mA6T9bE2vjXyqoVg1NMI6g4BRSQmxgL1N6g3uapZsPUn5Xnp0zf4Nl+F+UVGbCuWK4HZ
         9b5aLiUrsXcnTWpo3ynMOIRHjsGWZ9gndwL/DxvO8Aqdeo6v1Gb/BIwwYv9Fb1USMrJU
         OyBNFseBiSThCIWnq5w6t+aFxy6DyDGU1lkAwuS13IS2u9zjdeLAsa/t68m0zd6vzMCF
         M3OBxPwUQXfZSpGtyPcTQzMlrVT45h0RcjeQ0biMBFbaFDIsuYpi7+Ecg8LXB+Eo/Y91
         VNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586097; x=1793190897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=tC8ygXZW7aMDvCumXRfY74Yvci+kjQ2DiMF+UDAhpsYoQj1sQxduYm/VuzswuyjFac
         3HRTABJKPaK/HVsmqDVXl61b0oNyrojiZpIh8lLpprpjrEkg5t3YCZ8iHwtxc2y2rjqw
         RtG2VYOUTknpUEiT40lLz0cQlcrVSndLb11hBmXR2irA0l25tt/U+msv1OxwxRgm25TY
         4OSZmJmmCNxK4qjM8P5cp6Y1Kux+yYLvPrulpMh/H0iNcb1ZnqbJwebcFFVdXOTswGZb
         bwryQC9F/SuO2TYNHYg+4w0oX+KxkktOTsBjDpo8L1cGwO6fHLkiDh5cAIS0BJmYerCT
         +XFg==
X-Forwarded-Encrypted: i=1; AKwUvBw35RyBNhr5NAFll6+doMKwuKUTNHD4axyIFPeoGyVpDbgQQI4LxtqxFHJiFcqGRE7XdTk8Wb3MP0eSSsGXfh2GtVO0@vger.kernel.org
X-Gm-Message-State: AFq9FYKyk+AS+ASBo9ijFzOu3Uj0FQAI/xU+Lc3lJ+QZ4df18QwShqyX
	Kqmx+BcXT8ko2FDkckiBLUC5xzwUpDpYV4eSVl7CukgHqZwaGcxa0UR3
X-Gm-Gg: AYBFou2GsmffyTX5ropotP7KrtgwA7t/igihXQx4/2W0r4L+3CGKmADMs353MlejU+t
	skzG77GpkVEgnwDDs4idE2ZYlnU3FwEBlnYtQaM5FO9+RmJmifOirDCRzI1b0RZ2NxoGZ3TXYto
	IhtEQ2gm5iSily/cOyVsfeRNVbvwpmGZvDHzsCEAkeP2R1h0ZV8BPllDuN54UPdv1dUrZmW66j6
	NwnUSyKVsR/QOIt3cGj0gHhnNyS8YndJ3phSNxlyMCagJvn03q+TbNflG1erwEESRq4nOxxFJ7S
	VI1ytZyCrP3dKXoySb7Z/cWYAKuExryUY8Dc8U8AxMrxa5OHdy79asPPuselxwBwpieKij+D03Q
	mvDKSeuP499cm4vgtQniwBmFVeocy6rhSSFlvlDp90BpgGH8irfBibTOOvKMp1FsS/sO1d0hjY8
	Yt4ugFBJ6vPJvP3oGpu2HwuP4bOt8sY1QxGDj1cGm2vx5bGqEON2jCorGNKv95YLzrADph5iEak
	TxtAPbMc+as0/LrbuEqZu/IbrMzzMzHIQC80IkR19cde8TDcs/zb+rZ
X-Received: by 2002:a17:90a:d883:b0:3ac:17c:6e74 with SMTP id 98e67ed59e1d1-3ad86cc2074mr1452171a91.53.1792586097273;
        Wed, 21 Oct 2026 05:34:57 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:34:55 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v13 3/7] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Wed, 21 Oct 2026 20:34:10 +0800
Message-ID: <20261021123414.25516-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
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

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101
- 0x00012101

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 9afa2e2764b0..0d7815c2faf9 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -111,7 +111,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_CPU_FAN_SPEED		= 26,
 	WMI_EVENT_CONFIG		= 27,
 	WMI_EVENT_GPU_FAN_SPEED		= 32,
-	WMI_EVENT_WIN_KEY_LOCK		= 33,
+	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
 };
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 0, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.56.0

