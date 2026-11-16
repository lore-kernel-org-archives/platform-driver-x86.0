Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873330;
	b=EJmb75nSJbbzBm85WjAlgqlU4jm89jbqGbo4gmffojb80JoMa9L3p4Ru1QlkrFUQt0av
	 bjoi2UFQ89SQEbBAENPaIKFnwdsFfrIEhk7JJE9HrX/2u7kWHqKfcJPIoT49aIzAU2Yjv
	 pOh+BqYmeZoSOYKZGBFnwzJB5iGujrZHsFBPjFhy89BmQUZZr2mDLtzWq0ZR1r6yY8wok
	 kVEjEPGhkgbraje3WfNJ1cybzJjU7UQPLwiDHb9bFr+8XGnVDF+tkY7lfrG1pNvN8nkSJ
	 9HtRr79p8O8obO2bdiGrVrcNFph/Mevd4O/Fw69wI3n545yXAocIMFVxau2mc6xF2JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BqqSOODTxtHdsJ6rQmQsIqxQX8CySgI2i5t+pkQzD/s=;
	b=xqklUowxEZOeSmEyRz93wLQMA84mWQLJlaqAQRzorXeDQdYijVcyFnr9SwPHc3xTkafd
	 zY+sF8ao1G53laVCon5YWg2XwiQ4sdr3TPLQhYc1cX6pNq7A+0EfxYY6nBSU+kXuQoeTj
	 g326t9QduRiRc9wDdE+zPUze7M2pSAMGoJNKSrghS5o/Sxt/rFRqEJzByrBNgTmdGjKV4
	 Vl7XXUwbQum92YP1QjNFX5oju/1BijyPjl5BHTIcygEFsij+HccyR/QqsbkHtnyaKR5GN
	 k5cCUDJWdtU2ZcaINnGsVIvkmZmSoOjR+iAdjIoLAxzCwVvQvwcmx7l2cvrHYQKFkvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkzRQqnf;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ED7606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85ED7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkzRQqnf
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so426867eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873330; x=1795478130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqqSOODTxtHdsJ6rQmQsIqxQX8CySgI2i5t+pkQzD/s=;
        b=hkzRQqnfUq3PpKBDMi46plZZFkdj/kHCPRVDNSjMLnyFKiLA8FTey7l+9cnbyHeW0T
         QJ2ikjGnhqbvyF+/2ZEeEsjLJ1BJrcEn1tTmpg3yPpYDDXAJRDe7jFyiak4Dv/v/mJWm
         0pIxn+aq+nxHrl3hCCXay+O3jSnohYFfvjv4CiZzU/dd9mHOpQoWuV5JtRSKBmpzke50
         nLsLdqfdAg1fcTTJkrK55C7r7t1jHeiQbH2gs9NLp+Hp13zy9NuzvzQxEpouHu7Hc/VM
         ZXGvtQqZn8Yy9F4RDNp3fNmWBiTKV8yDGHoqpCewDVF6Y2tC5vrJbCmRlN+V4nWn4Wvw
         bchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873330; x=1795478130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqqSOODTxtHdsJ6rQmQsIqxQX8CySgI2i5t+pkQzD/s=;
        b=hjkV+avrn1+NdeZoqYdx2ClfWR+KNyCIsLUe3xVCBcmtMW55W7FNBs6PXlOGNabjqn
         dozV32ej1kvVU/Q66yNjCpW+CB+EUTyVv79Y9d01j5ziR/eYdKesEcXx3D0vHud2FLAT
         exq7+L2/7ukTK8X+10S8FpTxPdH/IT6Yn7kz5G+V/hVgSJzXnOWxJn9ipdhJibXc0I63
         GXl6QDrbBWi1Po1EoBzrnJuGED0wGbl70858zO7WmF+pxLQUltbH5Fd4WZvvXsgD+X1g
         P/x0HPpDyaoUCNataAhWIboVTUfwZcIBVbIJq8GnOGzspOeBol3W7BdGVh/vyNzttS4y
         zWKw==
X-Gm-Message-State: APuU4Z+cH3NyQnhZ4tA8tsnPtKJ0J6Mj3Aj2wXhgYKRcRKJSooS/B5fw
	UX67weojEA395hnXG3KAnPNVaeNT/4TSN+XBqQlouLrvCHp6eccDt6ZHIa3Adg==
X-Gm-Gg: AZFdTZdJXeT9WrJ9WsXNi6l58/KnxAmxCEK7yu/NYQu8QcGlar5o3C4OMDnnf4im4rK
	BKhUvw9nj8mwu7jOTOF+a/baCA+ZPgrpJH/GvetV7k7Ty1XPNl2gJLYYbCCpdGUWmaaSq/OOyPN
	8wiVAi3ORByYhWYtc8u3cPVSTAc4SknO253hkwrcdnU35612WlfZDfC9ul10T3TMlbtjLmVi8nP
	PvT7cDHdg0pRqGOn++yTbLFJ5bs0lki/pp2nihpRZy/hKbcJJuj+u90II3cAtcL568NxW4h/BFU
	pZzuBXZQ38tZSQFdC7Y7JTJwDqEU9ftQMAVsv4qLlnrDAdIpcVUNPYC1rJo3BXc71zab0/y8YT5
	sppHwdybT58UbcI1c6RJKIPQI2sNmm5/pJWhf2nOwwWnZ2bcUarfheP6GIR+xa9euupYSXixx66
	Bg0vgkmvjZj+k4dIUSmGr5/SzJoEnCkHBP4FnTsruanFxF/E0CpiDceufVT8XK03wiJ2m5VSrbh
	rsQtWDD3OUXwFCe4H5mcUBE7ITIw+9s8wEAkVUTKNg1zAkdSUxecWZ4fBOThE8qp9uwlda6CqIi
	l9pXEv1H6m8blQbY0xgHI6lgz7UMVL5f1BeLuxwuMnOZMhWuOGiFdcdDzUBEvohMeCw+sC64wss
	rm8dVkKj7+m+gw7SYXPHx3pWYT7mc+E5mLXSIqaccrNJIN5AYknmdL1i0RQ++21pQWgkqQm9pU8
	hN/D0Z2PJ5wnowsA5IxwAoVCE=
X-Received: by 2002:a05:7301:a08:b0:376:7640:9668 with SMTP id 5a478bee46e88-3810f6094f2mr837415eec.19.1794873329712;
        Mon, 16 Nov 2026 15:55:29 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 11/16] platform/x86: dell-smbios: Don't tie dispatcher entries to the device driver
Date: Mon, 16 Nov 2026 15:54:55 -0800
Message-ID: <449f9a1052dcc26b0426efc597f0bc56d8562be4.1794871007.git.rosenp@gmail.com>
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

dell_smbios_register_device() allocates the dispatcher entry with
devm_kzalloc() on the registered device, so it is freed when that
device is unbound from its driver, whether or not it was unregistered.

The SMM backend registers the dell-smbios.1 platform device, which is
bound to the base module's platform driver and never unregisters on
unbind. Writing dell-smbios.1 to the driver's unbind file frees the
entry while it is still on smbios_device_list, and the next
dell_smbios_call() from dell-laptop, dell-pc or dell-wmi walks freed
memory.

Allocate the entry with kzalloc() and free it in
dell_smbios_unregister_device(), so it lives exactly as long as it is
on the list.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index 5a9c28ab25af..9105154fbb92 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -150,7 +150,7 @@ int dell_smbios_register_device(struct device *d, int priority, smbios_callback_
 {
 	struct smbios_device *priv;
 
-	priv = devm_kzalloc_obj(d, struct smbios_device);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
 	get_device(d);
@@ -174,6 +174,7 @@ void dell_smbios_unregister_device(struct device *d)
 		if (priv->device == d) {
 			list_del(&priv->list);
 			put_device(d);
+			kfree(priv);
 			break;
 		}
 	}
-- 
2.56.1

