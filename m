Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873322;
	b=mp+/7roCzkVx3wPeaCGVdBC4Zmie/5Jk3M5Hn/ftLuUL6w0fInHjl+3oYnr9TxoFQ7qP
	 eXJ3q0BSy540SIAe6KU47K+3BvJJbHxW83FMq26WEtL1dfm4aQeY3zi6havFPGGeD18Gd
	 um0vveLZ6jmxvv8fg1gfx9gRa2QHzCzdbobGs2pQh8QMlgXObMaJ3crkqmyAEd6cYOTcz
	 Jzl4tkMBC3E8YmdEAhzocnv8YXM3y3gdwoC57dpyCtqobsisUt0s+Teg/xOk+Yb79+6z2
	 wNy7GiKWv2dc78zKmr1CXivg/PVfKT7YDCgc8MAq1BZzByk5Jce0iGfQElJ54cQ0o9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FbzjQTovINwnwlgeMgqF0PgdCsEzocSOLs1S1n2iACM=;
	b=kRJE/sPejNEAicqf6l0o9DXfcs6B7OKaxUCpPvecRTmE97ZbPSrECUdAu4Ezq3fpuhQe
	 JullhiHias409aYihjAq6lMBUjBgRbbvzlXwegGSYOIgYFCio0j1d8N7fIj7kuGrR7DzU
	 trpRGVO8fVyRCaGmTWPZ/KGAlXkoxzbrQpKxA+ZAItOWiKzoJkQE4l9uLexIxKE+/33dZ
	 UME5x4PwO4MIQFRCl+Eo6kanDv+Rj24trXYlMQz1ayI22iN3jJThv8n2sF9znxE+5fiMM
	 ZqCOreneNcigjV9AYOqzUz6ytXQ5u/vREkX0RU+JHDsRIjSfADA3+9KW7xpoIVfReQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQI3p9h2;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D117606A330
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D117606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQI3p9h2
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so11203258eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873321; x=1795478121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbzjQTovINwnwlgeMgqF0PgdCsEzocSOLs1S1n2iACM=;
        b=BQI3p9h2BvFbLuVwTex2eS+mG65H5Sqx1Am+fdbGMvRk4zKzLLTNlK8jeUeRln20OW
         hCeybHOdlNZWTrTNI9tuAO8gf5P+y3rs5OaFfWrRCK19qls95ktw0k5MPzxLQoy8zWUG
         u4DVdrwxn3Gp+PunuZTPYG6TAiA5MoiHmaSAGUET8tpPAf7ObrDrkTpel5tncyNdfJpX
         ggVwiVgmxrUbuHrdgfjYkC2l3tEIfa3CgZONUTd+Ex28fwP9/covEBuGvQWJeMg7UcFU
         SPOf9wFflsXZLRmof+bPGrpELRua0j8HsnbTqolJvdC5m4FQNObSXz2VbIkpQ7RL1xYZ
         Nl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873321; x=1795478121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbzjQTovINwnwlgeMgqF0PgdCsEzocSOLs1S1n2iACM=;
        b=XGUroEGFIFx9mOL4EQ3QAVR5JpS0wYeq4pEuVhmsh17Tc0n3NVSAcy+EIydGS4rYYJ
         hPLqteAuYSw3QAKkTD9JcqLUXG7iEKKcAqQSDsY99i61lY5sUcCBnMototQm0Ch9To0e
         k4mPzBJXGmfOhSuZibuwNmamdqQXnbxHskJ0FGDQXKMXdq/ybom1lSPHSeKBJ4vWk+dR
         BfF01QpQa9IXJ5+ig6YL0kYfmx5POiCFHNXHZZyglY6niDv4UA8bylP7gNABuTjHjzKe
         h25lyHqe2zWAQzlMiWhdEihO5nVJShrgONIFUXmdDiJZhPPXLlkt0udNXIJy2OtKBQkg
         +oWw==
X-Gm-Message-State: APuU4Z9EV9m2bt8ZK1VOJjyzmkEC+/GrVJ/ReQNOU0zz2tjVZF9c7Tqp
	g3Jqr2JQzT9ziUjzRst+HWelmrP+YyjrQqBTEGwSmd1c5DqwUdmWXBrx
X-Gm-Gg: AZFdTZd8KohznTvlGK9rp2YhaimExEaTzWz9yH4YZfzAIMRmruHLrkDyJhyMX19OoV2
	tUOSLEfEVqE+/+HC01JMbczGl+iDqJD6s2jGuM6nr/+YkHn3hWzMQieF1OSNXnWkqq4gGus88a5
	qG9LhvjCee1sfF0YcrCxynseI8+di2gAsKb2aXWYWlO6UOS9i2oizUu+525wxPVGkzDOBwoCG9G
	l+clq0F1nz5+8YvEjwhRArH+Lbs5HxMykOO3tnYWfij7bQZXELIgYzdyVSfgS9Q3NkPj4RE73tA
	7gQR55udVUUeMW10IPVYmxpWHr0VTLoIFY7ru/k/Vn6YAyEiLX+oMvZJ6HHAytNgi4H57+Mtk4x
	nsBoKlL6E9Ar0XYDReLo12BPzuHbhRbQXeEndMqQqfZrkB1yT592vTC/k6citYCow0Gs3m33yo9
	irX6bXGTMIZq/HpTw5Rgzu62MVXlyKabmmhKwLxkTt5BlqoEb8MPQY1NYS6A/e2b1p0u3nrK7zJ
	zqhbry+qLUsCrHKUR+SevCDI2J6Q3iMFbPE9gu2f+F2nshCfZqTQQ1+LiwYJLwpheKIZsBGjs9C
	pZ4P+PoOw8GENPi9qnG48evCaw5H5P3gtHkjI38Aj/tVFU4p5Gko4rVuay/c+3WBO5U1YjOc+fj
	7Ge2epsbl0XUA44BDbrLK04hijlUiW9azrQ/VasiB+186hC3H/5KGvZAzCiMoEKyxtF34/6KEe/
	Eh3g==
X-Received: by 2002:a05:7300:478d:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-379681c6a08mr17220967eec.39.1794873321553;
        Mon, 16 Nov 2026 15:55:21 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:20 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 05/16] platform/x86: dell-smbios: Use dev_driver_string() in debug messages
Date: Mon, 16 Nov 2026 15:54:49 -0800
Message-ID: <7b6431744b2b80f8cf0b5697515bccd3a2e97cf3.1794871007.git.rosenp@gmail.com>
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

dell_smbios_register_device() and dell_smbios_unregister_device()
dereference d->driver for their debug messages. The device is not
guaranteed to be bound to a driver, so use dev_driver_string(), which
handles that case.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index 4da19f7da81e..5a9c28ab25af 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -160,7 +160,7 @@ int dell_smbios_register_device(struct device *d, int priority, smbios_callback_
 	mutex_lock(&smbios_mutex);
 	list_add_tail(&priv->list, &smbios_device_list);
 	mutex_unlock(&smbios_mutex);
-	dev_dbg(d, "Added device: %s\n", d->driver->name);
+	dev_dbg(d, "Added device: %s\n", dev_driver_string(d));
 	return 0;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_register_device);
@@ -178,7 +178,7 @@ void dell_smbios_unregister_device(struct device *d)
 		}
 	}
 	mutex_unlock(&smbios_mutex);
-	dev_dbg(d, "Remove device: %s\n", d->driver->name);
+	dev_dbg(d, "Remove device: %s\n", dev_driver_string(d));
 }
 EXPORT_SYMBOL_GPL(dell_smbios_unregister_device);
 
-- 
2.56.1

