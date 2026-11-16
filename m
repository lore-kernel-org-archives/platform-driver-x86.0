Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873336;
	b=yYAYrn/JiNn6fB3CRGCNpJT6yE4yXkplr+ZF45nuKI0YaJwRuXxjd9pMlAojgqF4CgPn
	 hNTCcmL09zy+/7wtcqctZ6dTQxUDQNsG0JsUrzQN/4KSoFXGRVFLBYj+XnpUQcXixTwTb
	 gEcRVlkJvLlxRfPkNI+FYBC78ZsjPln5F32MfMuDkHxsfQcbBzqNWLPtteaRg8TQJkTHE
	 Ets17y/Al5/xa/1F0YAGf6jfg3JuPW1ofoQuWu3aJsbsdTsDFEUVCqZvmxZyePH3rHpUM
	 6KyWokinHZj9xnpsoFaevwOuPlWAdbQyJanTx1pEPvOMmabpAKQ7QVxqLYiRZUInMBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GedATl4Xp24BCW66YiTApcESjLg+Gg1tIeGY8zP8KOQ=;
	b=eQ0w+hm4AhNH/vMVvhkanV7/Kp7CS6nCfI1ijyO+dl1WVhO9faTGwaGXBvV2AY115J0N
	 rq4/DY0Izpn7rj/gnmI716umCYH92UeDzoqu85zx2ATtThewI2v0fhZRFoyp5zWCtkd17
	 v3CVhS6SZTgdjUq8nOGcIA+KiEr/Fhorrd2DzFKJRQWNGUBTysrrYY6NAFBhQjlFhK09K
	 760+b5Nmav0jA/1bq4G5kM0ve/ZIItV9+OIwRn4ba5jY7ylUPednMI0o0fK6TlgyPAEDg
	 BY8JU5OCoHD2hXVGdyY6eANrl2T7GWUf6UwSLVt73v4JeltQfnRdhDSEJW/4WT6O57g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJPB56X7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39888606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39888606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJPB56X7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1789931eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873335; x=1795478135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GedATl4Xp24BCW66YiTApcESjLg+Gg1tIeGY8zP8KOQ=;
        b=CJPB56X74vMr5aH3SFNJ+9oQL3BNn97CzZPGSly4XHZHkul22RdJePVEYbXzLRGSzt
         dDpvESV0VmlCi7xB8Naz/Ke8nKBJWOA7q8YL71YoKckXAKZQ93Vc6GOLv+AV6l/kORMc
         lHeH+/dcVxJPhytV8v7fasTeWn9d1GNNK3x0zAptFb13DlruqWElaVcK2pRY6mBBhgJl
         q9JuLC2feHR3ePVZEAKAfC+K9ldcbRKnjMBeJU+4J5inOXg+lNYYRfobuQwUmuPLB87T
         p/KZMtJTcukzgL3b1vuay6gVuxihY/uF/a/HgtoUSnV7fAHMAah+7gO4ch5enp4HNiDn
         0RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873335; x=1795478135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GedATl4Xp24BCW66YiTApcESjLg+Gg1tIeGY8zP8KOQ=;
        b=fwT+sn2i2S/w1xZFOAiTOyF6CMm064Hj03YdbIMhPmSGTLbVv4LC3ZR+Fa/Vz8kFcD
         ecCHnEBkOptxii7EW23621AmBo5rbyJ5Hs7auCqbb9PayeaLrOW4v0zmgABfTlrlNhal
         6YuSlrvbKkLJ5/cKJuPN0KCAhYTmC95XZDKLWib0at6SPc8sDOjP0bedQl6pToRQmedu
         Fq7QQOgVlsDSBROq2xc7HHdunScgSFk18sIBA+BMj+IJr3iY3h9ZbbOFnoOEkU4iAxGp
         sS7o3siSBpOTgt1+LtKkYpBlbrIbTmVxLoybpOYlRDeypFVV0NfyHlTiN7zVEcbKEPE8
         WNPw==
X-Gm-Message-State: APuU4Z8SpRH8D52zvpbx+vOsAT+RD9zcsBghajkOFqPnzj8Gc7YUvSS0
	KsZkDhql+m3DqDOlnt7ow6Tpyq7uB+kB4vauhWfIdkeLxuoa2AFMki7YJITauw==
X-Gm-Gg: AZFdTZdJD0nNG9fkpZVU27K9qKsKEVSCSp0V8ZDo0mBWmCgiTn2aMQ6rL3zc9Jdtvso
	4GljtNRbC1su02hmE5EM/YZPYQZsyF4RgDd6rRaBdiLiIrPbjvtllg/DCMLpc560RJp2NzDkopg
	fpCL6OELQs+SiTS7DT64zfysamBI6F3khO0eM2QDmsVV3R87y1m4Cb65kHjSVss8HFrRmhH7b5f
	3dpL4scoJHCoRnXaeAC2Kny2UEsJjSxsJjdOZ2ZZgDAo+0tTW+OIw7tm8ho2sVXFAyUW1hba932
	i8rWrM33256WV4vgo7BO7HITe4YblvY9yAr07/4bvNBPH2LzpPKB+4wN9La8ILzF3eb1ksv9uEE
	TiA24wOM3t1/zeuo7YIDOmaUnHz3lWoW7JpxzrSjnU6PwIj1ROrfQh8x6pq70ymcrQrwo/hNiU5
	NQduG2483vZbmZ5jrQClDi4yVwEGCSuCYcn7gkQ0jD9MpeIIwLjzUjq2Ht+v2YrkpjMUl9zMx1/
	9t6OumkI2sq9ODIRc1+VppvNNUL3uJ7KI0dgBhzME0vnY9ARsHCeG8GAtVjGn0lihzv2jjltqAI
	3pdSZ/WHEePmcXLEWGxEtvTM7wyShfP2wkBreYikpbN/rWV00CQTenWeq4VUh7vmQ+PgUQwdLTo
	sPsL1YJ6/gNGaHHY0dnzZrEGKdAe6m/W0kBAW2tyVVQWFu9mYaosOjZNcKKNgLMfvP2xOWG753W
	rhf/GFajH9nsYbkQ3VxXvDDOU=
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr13420156eec.11.1794873335305;
        Mon, 16 Nov 2026 15:55:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:34 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 15/16] platform/x86: dell-smbios: Restrict token sysfs files with their mode
Date: Mon, 16 Nov 2026 15:54:59 -0800
Message-ID: <931f6a0e9b0171159b84121de9f7e5b72e0af5d4.1794871007.git.rosenp@gmail.com>
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

The token location and value files are world-readable and check
capable(CAP_SYS_ADMIN) on every read. Checking capabilities in a sysfs
show() callback tests the credentials of whoever reads, not whoever
opened the file, and the permissions shown by ls do not match what is
enforced.

Make the files 0400 and drop the check. Only root can still read them,
but an unprivileged open now fails with -EACCES instead of a read
failing with -EPERM.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index 8f48a8c4b9fc..8c70e173866a 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -500,9 +500,6 @@ static ssize_t location_show(struct device *dev,
 {
 	struct token_sysfs_data *data = container_of(attr, struct token_sysfs_data, location_attr);
 
-	if (!capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
 	return sysfs_emit(buf, "%08x", data->token->location);
 }
 
@@ -511,9 +508,6 @@ static ssize_t value_show(struct device *dev,
 {
 	struct token_sysfs_data *data = container_of(attr, struct token_sysfs_data, value_attr);
 
-	if (!capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
 	return sysfs_emit(buf, "%08x", data->token->value);
 }
 
@@ -559,7 +553,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
 
 		sysfs_attr_init(&token_entries[i].location_attr.attr);
 		token_entries[i].location_attr.attr.name = location_name;
-		token_entries[i].location_attr.attr.mode = 0444;
+		token_entries[i].location_attr.attr.mode = 0400;
 		token_entries[i].location_attr.show = location_show;
 		token_attrs[j++] = &token_entries[i].location_attr.attr;
 
@@ -573,7 +567,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
 
 		sysfs_attr_init(&token_entries[i].value_attr.attr);
 		token_entries[i].value_attr.attr.name = value_name;
-		token_entries[i].value_attr.attr.mode = 0444;
+		token_entries[i].value_attr.attr.mode = 0400;
 		token_entries[i].value_attr.show = value_show;
 		token_attrs[j++] = &token_entries[i].value_attr.attr;
 	}
-- 
2.56.1

