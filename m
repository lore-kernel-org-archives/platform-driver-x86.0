Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975957;
	b=uof9nLyibyWous66KTRwYgZbclh/dqM0qoSXFlSf7kWooI0PHwoL67CaPulzI3Iir4hB
	 4fWvKTnOHMKHU2M96TFiZxv6DBpIAEHwwgjIfoa3TGo2qK9YidMWgUhE6zPXjs/XUAoYK
	 DfDF/tXh9jqErUOF919mr54o1XNEf+kJpg00csVKdMFAw286b7BI0COzys9kDGX5NthZ7
	 LqQXdewnbrAKqPkY50mAvRK+yps+8B/uk6BsKx+Uwwa5tsahIaR7wc3jAbhUiCjFUyBz8
	 eNCb/S5U5dkIS5caJGTASx+eUrMtdB6eGeP5z4dokDuYcnktZOIpvUKIvPvt+Ctlj5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/TF893wmZr/16BsSIkBX/d9aTkd9UKZnzUtb9EAvAws=;
	b=xCmEftrGqPhAN9h+OYbUr88xIp/Vd54LI2eSsbcnSZpmRoyB2gSpUxDUNn7HizDBpZf6
	 z8vcQesK7x+Imt9f56HF+LDQrkHtPy0ASfowXQSe5WeHJmNgNO5FMxrFvc+0UZ6MH1Mue
	 Pvp8rpdlbbKxKVrY4c+KEIJ8TITKBzdjje0brVKi6TuPC7Dff4j6oZBYfmgMJIqJuafwg
	 OgfKJxRVtX1Lk3q4VvPWXNIFKLEaz0x+gFxT42a/caKX/8tKZOJmfSuRhnynAF1sSHE0s
	 sPgqZG6MwTUd2DlxwpXkKVKhexn5jsH0cK0c/66saNZTX9zvlGL0CzJNDShY+i+Gz1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLxeiOQ6;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A959606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A959606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLxeiOQ6
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e95bd1c14cso4313095ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975956; x=1795580756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TF893wmZr/16BsSIkBX/d9aTkd9UKZnzUtb9EAvAws=;
        b=WLxeiOQ6twCzZ63Pm6MvWDh50p0vWn6Xn4WOj0rIKba1JbZVNU0Y5T3MP2Dw17JECx
         C/LyAeu+BGNIrgHmWkJYwvmLoQNMkLDpH5wq+Srklo5ldxjM6sqm2ceK/D141nsurSQ2
         3HQNSASkOtj+MnJ//I76pLRzEpGd7KCyQjs3vCLimk5ijWkC4mEBmij4mjaaZ2wTpHWx
         GRhsHq5vmMomjNuLPO+b0554suh+4BI1yFZ4O9dBsuMZu4bp2sCqCZMFiO7ilVMMXLr0
         5XIp649xyvNyrrsMVQ4z7NgwZ5+fBxFRKBchfquw/fEVpJ8yleOlSX5hfHc6beqdaHQE
         TxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975956; x=1795580756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TF893wmZr/16BsSIkBX/d9aTkd9UKZnzUtb9EAvAws=;
        b=BXmq5EvU60FpN8fiBfEF9kmuFThMiZQuKEOmaHuJQJyc4I0qs0tNR68jttRkR+6MiT
         0dTRVtE4Wo0ccfvfi8gdpZk67SIxpzlML1vUeVQKSDkTKotQbR1Ph3CUtUkqFxgtb23S
         hKbUg6XYdXylDHU9NvzsOAqIM6qia6aHFMG04ow9YWb0q0tPUn5cuCPZUht5ZBaNqoYd
         yxlRfwu6iPbejAV7eG+9xYC+LtetpjrNmVdecrw4Y+TsGy5+v7/xNFvvoPKsFBcl2h8G
         sB4qiO4UHktV3ykQr2DsvPd4hlQ4aW/09KzAi3N/krDjKg6gdy4VVaF8UDfwK656yiFu
         FmTg==
X-Gm-Message-State: APuU4Z9rS731ud/Z5vBaF5c9VRadlC3GfyXQNSy5AGH3j1W8T9R1zJFz
	kQnNeyNwuuyiD1NyqtxAl+t0P535mkMUJz4MqpzqP38qCTyUUFfo6k8A
X-Gm-Gg: AZFdTZdZGKQtO4eiI/cbR52gB5ouJlrg87OYBESZCCcnKv/S+o/5DUgRBJ1F3OkwfbO
	iOiydHt+USXHIOr87K9gTahgGSmJOS4IIteuCSuriE4PKNB7VlcoRF1u1ofvuLytRPftYkTiAJd
	UPgsZYQ7eWZDOeZvWqM46IcYt5AdKnDfK5TXfYWZfhJHGK34waoGOngK7qzw5ZO0CbAH+KE+rU1
	6pBB/8AAOReYoTEIJQTeNL+Ce9CjcI/mBBLq0Nt9TCqlyxDpV8S2zqx+mcFtYAUifIJYpBlMJNd
	QDyc+e9VTojMFbq9bwyGfPZ27h/2DlDXtMJE+BX3wks4xaVIkKyjWV1riLNrQRNHV+Db6rGy7t9
	dTeHaVrJg2DCTXylRW6qIIWXK3+okrnJyMlctBL2J7bNRQFa1YTTaTULo6xxP+aaLx5u6XQGTrz
	TgLB//uh8x/V7LsO98yIQKI8WirkPllCWPxdkmYTNbWC2v3/CXUBGYuWNktp5NOlaQkijN5p3UA
	VriOWGWy92BJvij2O2I7hCP/AJq6sbTcMMexUYATVhqSZH5IlgILfgXS9rWIgODEvv8tnKs3q2k
	KBBgPKt+50KcfWURWIo+x2kJ77XVdoxlie1l8SZlN63SzMHStDVf9lLXo9lKZAYxUHSMGAlRdIc
	Wbg0f+8Q38amTPa9cmAS7aL1AWJhVxTx6aWOecW0rDmozMkE4F20Fxh8DMejry6q3pr04RnfstW
	oxIeM=
X-Received: by 2002:a17:903:26cb:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eff72f34d6mr12902725ad.13.1794975956420;
        Tue, 17 Nov 2026 20:25:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 10/16] platform/x86: dell-smbios-wmi: Reject buffer sizes too small for a call
Date: Tue, 17 Nov 2026 20:25:32 -0800
Message-ID: <34665cda5bc1ad052c4b25142eea2be6eb3375fd.1794975827.git.rosenp@gmail.com>
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

The WMI buffer size comes from the firmware descriptor and is not
checked. dell_smbios_wmi_call() clears the part of the buffer past the
standard call structure with

	difference = priv->req_buf_size - sizeof(u64) - size;

which wraps around if the firmware reports less than
sizeof(struct calling_interface_buffer), and the following memset()
runs far past the buffer.

Refuse to probe if the buffer cannot hold a call.

Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
index e126fb4f048e..ffc8bc87a86d 100644
--- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -233,6 +233,11 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (!dell_wmi_get_size(&buffer_size))
 		return -EPROBE_DEFER;
 
+	if (buffer_size < sizeof(struct calling_interface_buffer)) {
+		dev_err(&wdev->dev, "WMI buffer size %u is too small\n", buffer_size);
+		return -EINVAL;
+	}
+
 	priv->req_buf_size = buffer_size;
 
 	/* some SMBIOS calls fail unless BIOS contains hotfix */
-- 
2.56.1

