Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873326;
	b=tV4IDDM28L8T/gTy3GSncsyaM0r/8m3Z4u/2srummSQFcAEPYEcVJy/NyxF18PZZm/Dp
	 5DEADYIj2mncPhWJK4rUO90YiQXaqM10V+3hZidAs4cS19xUo7D8JQeIpGypRLscNxNO2
	 tGdgGV1kQo6zeaX9490EP4CUu5jYuUQjAnLZ1fuaCfslnrlx/qM4C5WZl7hC/hlOeGqJD
	 HPZfhTZNdzxEm3YF68ZzRR+3CsG0w2juONfL9osmbMeDIS1uj8s/WpropsVilkDrK7c5k
	 lfv84SAnBh3UqyZH8GC3mtX3NWbhT4VCZNd6Vz4uQ2vkYAR+UYGet6f7F/d84PaiPwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o0k8km+RlrAzwCDIglHBreyk3uk3Elyguo4XLg0KncQ=;
	b=R2nQIhHJacDyH+Bg9hblSy6IsOMYX2h8VVTazCO1YEYA+1FocU1JWNp2zwVPpUm9cDUl
	 Rn0H/eA6HnRgyr0kQUs2xaTz8yteg/LB/1WCWh2n98XdoILGKKmbMVe3zC5YBiIdphibc
	 wAWeqnS5wTFDcDyfdoAKuNLFtKWPec5LOi2LyPSKd3CnDSpqEYnqe3wyLr1jDXhMdnHRP
	 vjz7Ydn3MRC0ks/KilK2hrhGyP2OKC38evoD2N7dTCEuOD6o22O5lB6eHkJ4kRYlBDGoH
	 RaOB08rNPJPI7RBu7MB1hAJcnGiDz4kSSJzzkZGJ7X8lictPYEJDSzaSDSBSMZStk0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOaIe8nR;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D191606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D191606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOaIe8nR
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so10480603eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873325; x=1795478125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0k8km+RlrAzwCDIglHBreyk3uk3Elyguo4XLg0KncQ=;
        b=iOaIe8nRvBoqCbiF/YT4E6BeAvgKJjNLcgXgbhb3LFTrnyvCaV4wHklvI2BQWLqN8z
         xhwTzdLu91dJwPPcADRoljMWnPD6emFIRBWHpXWjHuOIeF+XSIIpswNxtuFQuqJuSi9H
         yLi7oK+LA8XtRIaPrO1DE+ZZ9P0dk7g8ej3y3Gf31A7+QKYjUnPLI8YbrPZjfArO3USS
         Y/MaKu2MWU1790uP8Fz0tyhbjIKbab1DBb9dBQ4MBPAv7Wgpxf6h3SiQarJMBUIpJqju
         KVrGoLSfD4btuBYJlLSZn8JIGu/CPwRTil4MpnO2XE76o7qOQCC3gRdTgKdQ/3W2uv2z
         MsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873325; x=1795478125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0k8km+RlrAzwCDIglHBreyk3uk3Elyguo4XLg0KncQ=;
        b=Sb9l//dmmAndFo/Mzg90XxyLniRx0X9hs5s3lOAcjd79r0GzmnQzYBocxwuztsr9JL
         DZeFgKM4QhTEV1cH2eXcazwvyBiCl7NoY8Kcq81aKcXN+vRZH9D8x5cOupNxzxec0nBM
         HSi2QAypGDtwyVUpqDUO/VmLhs8uR+HzOHjquoKIjs/ODFbY/Ver+Pws41rIAcdQDSZ0
         MMROpZSKfNYLMoy4h9Mp7q3Iipja548Zq7ca4+XM2V7uEbpxvlIcWrVWIVpN3TkWCisZ
         rjJpKKpe+F27fldgFAjIFQq6gA67pvWhRt6WwGr3lIoc3yuSmkEUyD7YQ6nkd6KrsfNN
         Cgqw==
X-Gm-Message-State: APuU4Z+w5FB1yYWp6QPE2d3kCSHRA7OZXBd99SYPJeKFeWzDNPEkQO0c
	zbKrLmDsoibW2kQcyKAPFohb6hnaRVmdXD0f0F1NmXR0YkwPblAtXOr9LD+GMw==
X-Gm-Gg: AZFdTZegxsk6tu+3NYsTZRKCKfUI1zu8VIRE/wlufvrxKdn5qqOjYRkrX/Lh7Nygfm/
	xH1HaprrNyB5iee8ShCIQzVnhSSVyq13gtGXyDLyrWRNKKNqUdYSaprgc4Ky87H8qc4pZJH7uoZ
	L32TG0I/drULJLQw3f3u4i/YIg/F194g2k4aKJebKn8mlOjvCYyDzuK73Ng6mah/n+qXDWwp8gT
	zjFE6hFl1Uc+YzX7POkd29y8kdZTw+Ci+lC7qSsonugtjjXLwVhVaEjrqi5KIlw3WrYNdtVoHz/
	Gg3taljtayO+sRuS9OVh8qCxVwCjYWVOgCkc1dgoHpGDqS5X4JXvSYDzwnbR1XxDOtAoexdrn63
	vn1bcZffB/EW6tXp0N8F/QDxzUiKfUyLOzXEApwpVb3dGkWYPZKMaPy2LjOZ68S5qtgpCmYHnpS
	CnabC2Cbh7jBij8ihrs3fUuwNUb40+0Rxm/Aa2plXS0TJBvdwYBoKb4IYb73gpL/D/Nm09kw1bI
	ppLFUJX5efHzMVuP1juH6MD891rrBcZeDOWbNiwwH/yZgD72B/hCWjNyxQqWUcAcOxiEcnBDNQT
	TwSGCdwyH/12YeJPYUeG1uxKso9iU/O7NigAXsmrXqhwcXcQLyujU0We5EcGdZRLUki89b8+cRJ
	Q63lh2WxYv4TPX+c7yCQ86BkM1IX9seaj2oWhyyhIcjHegJ1Akk1YKotYlugZOYM1LjICfx0HCS
	wU+w==
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr14163751eec.34.1794873325492;
        Mon, 16 Nov 2026 15:55:25 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:24 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 08/16] platform/x86: dell-smbios-smm: Clear platform_device when it is released
Date: Mon, 16 Nov 2026 15:54:52 -0800
Message-ID: <d21db88fea859b59945af6c0e63d281a3c2d8140.1794871007.git.rosenp@gmail.com>
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

If platform_device_add() or dell_smbios_register_device() fails,
init_dell_smbios_smm() drops the platform device but leaves the static
pointer set. dell_smbios_exit() calls exit_dell_smbios_smm()
unconditionally, so when the WMI backend loaded and SMM did not, module
unload unregisters the freed device and frees smi_buf a second time.

Clear the pointer whenever the device is released.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-smm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/x86/dell/dell-smbios-smm.c
index 8c297732f351..d9c41ecaf90d 100644
--- a/drivers/platform/x86/dell/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell/dell-smbios-smm.c
@@ -150,6 +150,7 @@ int init_dell_smbios_smm(void)
 
 fail_platform_device_add:
 	platform_device_put(platform_device);
+	platform_device = NULL;
 
 fail_wsmt:
 fail_platform_device_alloc:
@@ -162,6 +163,7 @@ void exit_dell_smbios_smm(void)
 	if (platform_device) {
 		dell_smbios_unregister_device(&platform_device->dev);
 		platform_device_unregister(platform_device);
+		platform_device = NULL;
 		dcdbas_smi_free(&smi_buf);
 	}
 }
-- 
2.56.1

