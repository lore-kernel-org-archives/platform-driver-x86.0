Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873320;
	b=ju+U/gUlkCci1jvHK1CLFjp9//Av5CLnPbD7Rdq3CAHHz8kdjF7VRN8wvhpfdK2wy4Mu
	 zLbie44BTfU03pCl7EM/G24IMJCRtLMXKBxvFQAua0wwmfkLgBqd+qbXPpKS2drQEziCo
	 0KrFruVXtMya77PwfLHUejdJw7Lexq12yDwNA09UWw5Frnnzrkg3Il3E+d5/04nb0hJW/
	 8qOWbLaBfwD8p7/GLOLmX7nLCJMXQUPUkrYGmLvLmtR8UmT4PMqFGVWa4rmXqIyp2iGw4
	 nNvivhtkTwDmYypUDX4x5Ozj7biDGr8jnAkMguUC0rWTdibNGSqicyp/xY/qhOtZ6BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xsqvWOM4mB0Z9M6Vhl6aGiRtruMJ3QRVgpkRGFAzhac=;
	b=y7xFaYKaAx1NFkM/eDbN0imrPM3AjIc4kprOzh8Bzuv3SLwApZqGkuPGhTZ/YpkIr0Zk
	 RC7zJ3P2yl9fHaBA021VnZLajUr+2akadED1WpSpyl4JW75Cw8fGaf+KSVDvvEWNmdXlG
	 8h5b9BCID3tv3U5ubt440EIUwk8mlDmTtW9XVxofafSbVEBdVS+6lfLmqj+H/UKkiJsp+
	 rzcRP2xJK4t2yUT5xVmDPlXBzFG62qigFbkbbHaRIzUJ8sTg5zyX6d5TBdH3n3EpB1eoc
	 beQ8Pq41wmJ2qWYDDS7FqNDBVTse48pkytJ+knD69X3ofrFabtUSF7HLkB8OYHtMwRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTrwRvNj;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD2606A323
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AD2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTrwRvNj
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so2143728eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873319; x=1795478119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsqvWOM4mB0Z9M6Vhl6aGiRtruMJ3QRVgpkRGFAzhac=;
        b=nTrwRvNjFg4OaUWhRHbRAJ7DHUk20uHAp5ZPEEkC0j9xO27JzaAfns/xuxDawHX20l
         8YNTTd8zGVnK28NjXZMEUdz7rVf8kpkWHzjDJ6Vy9nmHzQzqMrP6Er1wzS17XlJ7yfw0
         T5MQUmhRBkC3bx7MNjBZz8FUP+/eRm8RcybVtTi6awfq76/gLv0D83bLA36JUoe5XZMQ
         IJnuqoD4g0dYFlo0MYnmU3EMKnue0ZNkx9zMnOkNRoJN0/woDDpgvorzU+EvRc906OV6
         p+2OBOHVLVuBd7xaYkMfXGdfEI4l5Sff6cqHs4xTw3JsXwfimxGDPWTTo25ZDKdJX1LZ
         vUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873319; x=1795478119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsqvWOM4mB0Z9M6Vhl6aGiRtruMJ3QRVgpkRGFAzhac=;
        b=L5k20ZqRJl9htvB5Czk7E3UZt96cKay2+1H+178i0zJkNDVHXzWH98AQJ4I/6/LUpQ
         JmQ8bNvj1piApTlA4ZlVbF+/7jGtxGXGU9uQZL68qvYb2kKxJmoTfBUlV+wCTLIMhl3E
         H5ZM1uYsOGGJRLr6Ebx6/MIYG14ukyCm7jlkiaxQu3KMwcq5xrMhuu3/96Kt7PIHc7Z6
         RbHRC4KHAWwyL2RsOGU5GBGbX9VM6tSqVuPuzKMf1mrzs0mPycEUzJvF8q0E6jyt450v
         phQFZnP2MIlLVHTkajlwp305nqCkH+0EHOtwI3wQJdsGeBkxSyQ0WG33fJn3SPINKXjf
         PaCA==
X-Gm-Message-State: APuU4Z/Uh/a+rgvMRiYGoaRVouM1nmjY6cRIb7s56gHC14KOQZAnAm1Z
	4gJ4iaPHX2wBmMAREFW/6EbrrVCi9ns8HVrkBesvhIDIWxkVusxRY7m+
X-Gm-Gg: AZFdTZcfkb2uB537p4hw4u4FA1tiO00D+36mwf3t5DVjNgz7Wkv153QPkbmMEzHEtwn
	wMiKxRDJlOuVUnT3yv+dyUUuK8KKYZSaCU2FWj10I0AbO3Ibq1GFQmagRQySdNT/WZdhX9/LNLw
	Q4uog+wxdOvSYs+ahWjXWAbNDJ4/ZfxgJug6XX/JqM3CkhIJP+wT/JBRBouPyItorFqT/24eFX/
	xKVUmUXoO8oTyWxieCbulJh2zdNvWo192958UojmXIhAsuu2Kuc/mAlZq8e2bW18+pAtifCTnVL
	0DD75m9TlTV6O2nOR4MJp5ksyJd4mP1l+KKIr4133RMdNbX8HUkYpLR8CgxPKzx8FEAbYBMBtrB
	OoKU3D0g6Ye1NQV/VstpvN9rjTYvgYBUGHZqbhg3C/wfmRJEFrsIWNP/ymgiUgKr6BX1WDh7f4d
	YZiUqMB0ywer7gW///UnFq1/hZrrdOZkNGUYEAp/OY5KgA5mnXRpAWz//Y0ft2CIqRSFwWA5NQe
	CKHQ/GY3yi9RZAwE7OtUY8P/8JqxNhyhODifqN8lacL+2KI6XsBvVRq4JLNOdfeJhelvIirNLn6
	YHlwGqn/EvVl6YxHnwuGjabLKJYjyuVpZ9ORB0K/m0/pXvZK2KzpZJa31OYJHXQRNtS5lAY1hXB
	2ekufUMYN1OLCidpmfsaJHYaHOhdq06FtW0mlyDMt2O3WLaegf0lT7QLv5Knb066+jUrjbAkbj1
	ywaaSuqXqsFT2WRIgSVPz5eAQ=
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr13419527eec.11.1794873318824;
        Mon, 16 Nov 2026 15:55:18 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:18 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 03/16] platform/x86: dell-smbios: Return the real error from build_tokens_sysfs()
Date: Mon, 16 Nov 2026 15:54:47 -0800
Message-ID: <7de78ad5e035f68bfe2e84913846b778c8532908.1794871007.git.rosenp@gmail.com>
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

build_tokens_sysfs() returns -ENOMEM on every failure, including when
sysfs_create_group() fails for another reason. Pass that error through.

Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index ab00b04c6b05..be68f6a25b41 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -576,18 +576,21 @@ static int build_tokens_sysfs(struct platform_device *dev)
 
 	ret = sysfs_create_group(&dev->dev.kobj, &smbios_attribute_group);
 	if (ret)
-		goto out_unwind_strings;
+		goto out_unwind;
 	return 0;
 
 out_unwind_strings:
+	ret = -ENOMEM;
+out_unwind:
 	while (i--) {
 		kfree(token_entries[i].location_attr.attr.name);
 		kfree(token_entries[i].value_attr.attr.name);
 	}
 	kfree(token_attrs);
+	return ret;
+
 out_allocate_attrs:
 	kfree(token_entries);
-
 	return -ENOMEM;
 }
 
-- 
2.56.1

