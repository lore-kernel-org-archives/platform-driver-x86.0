Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975949;
	b=1/PnusRL5sTk8HiNHKCboGZrUVJhyqfJhNO6wmHYRFq20X7DHbyU9FGikMuK3R3NNIN1
	 PdstZouwR5/DNuuSyQvx5Vwib9FIyvD7qycLppmq1AccDVLo9WL9icrtHqL/oqCpssD5F
	 nQ8Tp9g8NSOcRQW6EZkmv9K6rqbWWvjwJ7C/xQCwRxqMllBnBrPcfYxpdKEgrvMF/Cptb
	 dHujJbFI7PeC2yA4r4vPir95F3YgYWrxTNm8D56+GKSvpyON8TcnvtburQ+NMVyhIvSk2
	 sZ/JPkH0RczXWXHsRFwCH/+RilOxCjUXlF2MG+YRfmDz+SsSWfnBBX6YQFkIwQspV+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2lImc2o/v31RhlXzk6sK2iSl+dnOK/jYFaM2abjOWD0=;
	b=KybBk1nsDZTslTjXSZzJyh872dKruwshVhGllAxLClTe3oJNzQyR3fz+Y0FjoYIYdVuq
	 LsHIxFjfwia/eSSfvf/VY/rA9e3OHjHhezYkpc6+/Eu14x+oYEuuhRkE2YvcXqq6xO2M5
	 OOZpFmfz7oIROx9h+iNe61P0fazFoHLr8zZIL9XHOPR2G/CBH02y10sGBz9bgoAOJJXsk
	 dwlyeJXy0jCt9TIq46PV2s7w0OT8uzYG0x8k2vVywBS5MxajmpE8g1uFIkPEOiqV9Scqa
	 4rAAOX2OdHNyaByHBoqAQ0yP5oJPtX2IYep4cSjVMkuubeXR1kkgC70KTxbWxfQN0Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xm2Vj7IZ;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B1F606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B1F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xm2Vj7IZ
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed2bfe3252so2164005ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975948; x=1795580748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2lImc2o/v31RhlXzk6sK2iSl+dnOK/jYFaM2abjOWD0=;
        b=Xm2Vj7IZTrRo+Zu5lPC1/v3gWMkHSduTeqVxGPpYEEnIYoy7aBCU9C4HJ/vZ9vn3P1
         NN39VrSvTIXs+t9ZCewP8eJ3K/UYtHs6m+h9PCJtDa7K/BHpjjRvBAO0FZx4GIvvJpYM
         SUTNZp5rnek61WHI7NZzs0MXXszDdmMi4H0lPPCUn8t9YnoK2F4+TTRR/u/WNLyuxjVn
         7rck4PTy/TVPsS+cxoph9anjC4PA82cu5sLDwduXX4BVMtVSMqspaJQbCpusu/Ajd819
         ILEhYnirlJaZ4NmAhFLgrVfyFSpTJOxesECXeX4sudt5qlBJSgpSe0Gonw/Mq2f55JFd
         WitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975948; x=1795580748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2lImc2o/v31RhlXzk6sK2iSl+dnOK/jYFaM2abjOWD0=;
        b=2uDPkWt1RsQuKIf/9GJl7127YhEnAJZU0t42X1aUhBixprLPe5INZeCI3SRx/hPt7b
         AOk0l+XiJo5ANrv1whGViJX4GTLxSmSwOYeQ9Nu0nM6uooA+9XisomFa0TvnsCzCK3T+
         H7QZgeWS96gVwepf7d3Ua2kKjKsO85Bj5JpX0dhw8REQz4bPHh/md69da2ufrAzIGwmR
         rKzZH6sp7qa7U6hi6Iar8JczCY7qAv6QJmBWCFm0ojfvwZuJxCXI45dY36/sHl+QU+PI
         gf+uzy4ThJC6YySseOwx0AcGV0tJ/y02sJbeRR726fzGZa/sec1xjImV8DKsjOa7zot7
         qopw==
X-Gm-Message-State: APuU4Z+/oGJtz+jh3R5dzoW10DYl9saMlxuG9ds4TNtHLwKqXR6pHPfC
	uLcCdLfaMUE/YGacFmbLlv8G5IUp4alV+qZO9dd2CwxJv1ckvhUfSG9L
X-Gm-Gg: AZFdTZch96mPcqJxfvRIiIn7wIubb4DDFhXfGYQi7t+GOV/FkQ0sy4DuJUXqK2Yz8gN
	eQOYJ+w6/9kgey1+jASsuVW9rcHOF3zFYqXdWloWdXegJGy93RHSpJWK929SEaTvXMky7tnl7gS
	TFdrJ7WpxH7GMt+kQEGs3opfXEM9C8iP8EYBFb9MMi3Yq2EGXvntVFFb8Ze7FH+Ot4LLLXuV6WB
	cUSU2ESxOfMo2+IGJzYk5K8IDA/7/WEsvE24E0dbJuJllxy0BCn1wCMlWMQFWdyByOqoqw0ChOf
	NXtu8Zbpz2+fUb9vxT7MXtc4P4ZQ0T8mN8hSOvnG49STPn3tmyCKyQbdvnGIRj4p1ko1tb9JOI+
	ggSt2aS2elsZYwjn50NJ52+y2/Ypf+aWHr4+RLXXkh0xYuwg8uyBNcfoaBOHTej+GSmhy53R6ET
	rwnsETxZvKWowT6T9ELwRiKQmq7FvsKSD1eae6NjOEDFll8atbrSj0TVGQVfkrI2HmbhbmF0/eI
	9bCrsTO89wWyrypMfJ20OYl+pIU9Xuc30UMJsoTD0Zo6t4h3kvCsHMZrABvVdI+v5temYbJdfL0
	bHaAFdeOfJ446Mh408r+C+BUG9ug7W92EbaTAjtjg2GPwJbvi94vzBrgv0j/XFmUkTg9GlERz1c
	GdLQcAP81FO2lIac946jKmvKT2llSjTpm/mF10tCgcvavzH4BFGmceoXU+yWQgOCjDrJgLmT9WG
	v0GJS6f3fa54Lp7vnppIYI8q4R
X-Received: by 2002:a17:903:186:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2eff7414bd3mr14133925ad.34.1794975948363;
        Tue, 17 Nov 2026 20:25:48 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 03/16] platform/x86: dell-smbios: Return the real error from build_tokens_sysfs()
Date: Tue, 17 Nov 2026 20:25:25 -0800
Message-ID: <e682af82287f5a136e8cb08685d4ec2e91dd6b14.1794975827.git.rosenp@gmail.com>
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

build_tokens_sysfs() returns -ENOMEM on every failure, including when
sysfs_create_group() fails for another reason. Pass that error through.

Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v2:
- Don't leak token_entries on the out_unwind paths (fall through to
  out_allocate_attrs and return ret)

 drivers/platform/x86/dell/dell-smbios-base.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index ab00b04c6b05..0798e48e9c9f 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -536,8 +536,10 @@ static int build_tokens_sysfs(struct platform_device *dev)
 
 	/* need to store both location and value + terminator*/
 	token_attrs = kzalloc_objs(*token_attrs, (2 * da_num_tokens) + 1);
-	if (!token_attrs)
+	if (!token_attrs) {
+		ret = -ENOMEM;
 		goto out_allocate_attrs;
+	}
 
 	for (i = 0, j = 0; i < da_num_tokens; i++) {
 		/* skip empty */
@@ -576,10 +578,12 @@ static int build_tokens_sysfs(struct platform_device *dev)
 
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
@@ -588,7 +592,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
 out_allocate_attrs:
 	kfree(token_entries);
 
-	return -ENOMEM;
+	return ret;
 }
 
 static void free_group(struct platform_device *pdev)
-- 
2.56.1

