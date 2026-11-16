Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873318;
	b=aV26KK+BLmQqEZufyNXJ326QDSqtEXzzVLvWmxTNvFGwn4xfN2dLLm0XuLp4402K4jFc
	 AIX9uKde/rj04b01erX+RR/7Hsm9IG87zKXHlhEBtKh3RB2n9wkBO/58zlM4iDS791kI1
	 r0X1LEUxSieki8dFBbncK9CLe+vpqIC4hT/C67xcjfTnQtZXp/sM/w2SC0QMyqZi2p65y
	 zsPrz9+cw8Ft7wxKRJj1dqV7L0OixJxRVq2hkCat0NEAWqKcHaIXgbSZrf/0TeLVDhTLh
	 Cvgt9nqdwxH9YuWokBktn2Fk969P8pK7Yhp9dhWUIMQUcsL5thFoB2Uq/1xugZMGzVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qEYkuTRa7KdxPi0WF8rfjLA94KkLMCBVrVUKvelNEF0=;
	b=yNjmt5JaaTOmfvkZ0TU2zbrPWwF1CXya2h3b62XTf+b5eb3p8WvObbuwO6JlwELecChK
	 TB3/bnSmGvRBH5TEpN+onBBMsiW/LPBWuwQyw0rtBwoOL347TxBqzQx+hjvsrP6xuK/Kk
	 DV8FvQAP0jSuneCsBkcC4zyF103Ob1mTx8ouaHZY0JFfkn45RhnoGT5WKy65MMU7hfFLb
	 3kyk26RaJo+GeoWIrpOct5FMmBmn/oOFoby1viZM+Rs+levqIQ3vj6DQHdIhzl50/s3Yn
	 93e5GZc0EKRq3F8nhiopIl8OADASH8M0Lo1PtqKiX343x8ldrWUxl1+mLL4CfcWhTiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oU3GjumC;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C4606A330
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6C4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oU3GjumC
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5272491eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873317; x=1795478117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEYkuTRa7KdxPi0WF8rfjLA94KkLMCBVrVUKvelNEF0=;
        b=oU3GjumCvx9RcQcdHrrLVgAFhhtDInDJh8A7VRCilGkqsoVHgNoyEeuvdTvQmHndu3
         jO3BZv+HsB580a9YbRrpcVp7DhqJdXUeCq8QRabIprlH/dMwjIOkNRnx+P/X36e4Ehq0
         srPVeAJ9VzxMMK2aBilK+2uJXeWbZRRx71YvBXWtAxZwwzFgrz139+7rMTcf54VSKt9d
         eKo4xqnpI3DO1YhbaCcPQH+L/3o7OgWnhj8Ao3TKP7AqoPyH8c6T7GBHO/UF8t/qVdgZ
         /MrAKCZ3VMB7DLAaPBL6b29M7BufqtoicCFMFeZdDid/Y3D82TNHAEs+jS+2b0qhbN28
         mMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873317; x=1795478117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEYkuTRa7KdxPi0WF8rfjLA94KkLMCBVrVUKvelNEF0=;
        b=dt8fSCz6S91KXedZg4UlbzbxyNtqDjBKLRcQO0E713VPS62KXSmjhtx6pUmeijk7cK
         TnYhESM0crKW6FII/eR2pyC9gspAaw5xH4clMvzC0DbqBcqHVlWRDJBQm+2Fl1SZFWUJ
         o66HDbesCzNZSfjXQdby+QDMmRLyohAyPcSaZ+SSp9lyRLFyx2aFPdBDBOqHu/gO5n94
         IVfQHVs4cPeAk/M7vGvwkYL5RT+NOWcdp+EZF72n9vm1TnbBdEUDXZiH3uF5lD5wmJ/W
         0Mbu62tazLkzsNXUtoBX8yUPoa9+a/V+NDmBDO1hVlqOtL6Zg3pNCKSxYBC9Jfe2ERFR
         6zQQ==
X-Gm-Message-State: APuU4Z/DXI+jtEAFs+6er+SqBtNPxvUnCTTsrfJt0+6WGwbnq/QSpB28
	tN1xcVHYplqvRFFBfFPY/OEraydNAHvI9frEtG4ZzO6nh1gMEC9YmJ4A
X-Gm-Gg: AZFdTZc+oUdmKbtJfVdoN5Pp3D7YiO/J7Qih9njDds5alr0IpVbfotVTlWs82uvX0l8
	zSvhlfq6eaG3BNXpDn4YKZZaNiFGGvzsDBtMmXXh3uSfttqf7SKSIzdRtjXfP62rK7IsQDLkuEh
	/DdaBJc/1DAloHWvXD97YkG9RDo6UrbVYlblRJLTeACyn0aAvPTT2Wf1NnyiHydkIHkPDfCcfZY
	QpxHpdS9ASuEwGkVuSvvNJuOor+WTYoaf29xw2FJ24B9RgSBBJvOyEcgQnkQQppS8FZID0BtUzj
	Ta9kN/AqEAenEont3r0pM6GPU9InwoyarUamkf0/j7zGLOQUCTnz1L4ARxlniMMkebvRdERgjok
	S2xIfbTHpC3cE6K7oYKzcNrqsCnX3CME3N4pVzZC3ActY91PlIKJLiJoOXA2IV3/N/TnEc/sm0W
	aVsfFzOuFOxFf/8dBL7Uxlh7HWREaPaQ+m7UIWrV5/dK66E0BZUm3pKMQwmE03NFVepXiNRx3o1
	fIIezw/tQKpumR4bzwDs9wj1qJpLMNPtv66Khl3a0MesXtH6+j40zEkedMky2Ni9kqFOJGp/OH+
	ksZe93f4nQMe6teOYlHYm2Zbj7uUV1SWKJ7VWCKs1hAvg4HMHGnreHkUSLlJnOoAjXu8R0wvBCd
	p3eop5G6YveT8RjpUigr+QrfB5OaGi2KJYR8GogP4uOxcpXslNLpmNL/kazYIPzSj8p8y48+ZCc
	7Zg24mGu/eMaQFDmuzfKXPO+OT
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37966e3abf5mr12838653eec.10.1794873317474;
        Mon, 16 Nov 2026 15:55:17 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:16 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 02/16] platform/x86: dell-smbios: Filter every token at the requested location
Date: Mon, 16 Nov 2026 15:54:46 -0800
Message-ID: <63d6644a89fcd4161089ee4f3325a4e709ee6197.1794871007.git.rosenp@gmail.com>
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

Token calls identify the token by its location, and the filter maps the
location back to a token ID by taking the first token stored there.
Several tokens commonly share a location (enable/disable pairs, for
example), so which ID gets checked against the blacklist and whitelist
depends on the order of the SMBIOS tables. A blacklisted token can be
reached through the location of a token that comes before it.

The lookup also stops at the first match even if that entry was zeroed
by zero_duplicates(), so an existing location can be reported as
missing.

Move the token handling into a helper that walks every token at the
location, skipping zeroed duplicates. The call is rejected if any of
them is blacklisted, and only accepted by the token whitelist if all of
them are whitelisted.

Fixes: 1f8543a5d602 ("platform/x86: dell-smbios: Add filtering support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 133 ++++++++++++-------
 1 file changed, 82 insertions(+), 51 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index d98e1fb1deef..ab00b04c6b05 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -182,10 +182,86 @@ void dell_smbios_unregister_device(struct device *d)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_unregister_device);
 
+static bool token_in_range(const struct token_range *range, u16 t)
+{
+	if (!range->min || !range->max)
+		return false;
+	return t >= range->min && t <= range->max;
+}
+
+static bool token_is_whitelisted(struct device *d,
+				 struct calling_interface_buffer *buffer, u16 t)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(token_whitelist); i++) {
+		if (!token_in_range(&token_whitelist[i], t))
+			continue;
+		/* tokens needing no capability may only be read */
+		if (!token_whitelist[i].need_capability) {
+			if (buffer->cmd_class == CLASS_TOKEN_READ)
+				return true;
+			continue;
+		}
+		if (capable(token_whitelist[i].need_capability))
+			return true;
+	}
+
+	dev_dbg(d, "token %x not whitelisted for %u/%u\n", t,
+		buffer->cmd_class, buffer->cmd_select);
+	return false;
+}
+
+/*
+ * Several tokens can share a location (e.g. enable/disable pairs), so every
+ * token at the requested location has to pass the filter.
+ *
+ * Returns 0 if the call is whitelisted, 1 if it should be checked against
+ * the call whitelist, or a negative error code if it is rejected.
+ */
+static int dell_smbios_token_filter(struct device *d,
+				    struct calling_interface_buffer *buffer)
+{
+	bool whitelisted = true;
+	bool found = false;
+	u16 t;
+	int i, j;
+
+	if (!da_tokens) {
+		dev_dbg(d, "no token support on this system\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < da_num_tokens; i++) {
+		t = da_tokens[i].tokenID;
+		if (!t || da_tokens[i].location != buffer->input[0])
+			continue;
+		found = true;
+
+		for (j = 0; j < ARRAY_SIZE(token_blacklist); j++) {
+			if (token_in_range(&token_blacklist[j], t)) {
+				dev_dbg(d, "blacklisted token: %x\n", t);
+				return -EINVAL;
+			}
+		}
+
+		if (!token_is_whitelisted(d, buffer, t))
+			whitelisted = false;
+	}
+
+	if (!found) {
+		dev_dbg(d, "token at location %04x doesn't exist\n",
+			buffer->input[0]);
+		return -EINVAL;
+	}
+
+	return whitelisted ? 0 : 1;
+}
+
 int dell_smbios_call_filter(struct device *d,
 			    struct calling_interface_buffer *buffer)
 {
-	u16 t = 0;
+	int ret;
 	int i;
 
 	/* can't make calls over 30 */
@@ -213,60 +289,15 @@ int dell_smbios_call_filter(struct device *d,
 		return -EINVAL;
 	}
 
-	/* if a token call, find token ID */
-
+	/* if a token call, check the token(s) at the requested location */
 	if ((buffer->cmd_class == CLASS_TOKEN_READ ||
 	     buffer->cmd_class == CLASS_TOKEN_WRITE) &&
 	     buffer->cmd_select < 3) {
-		/* tokens enabled ? */
-		if (!da_tokens) {
-			dev_dbg(d, "no token support on this system\n");
-			return -EINVAL;
-		}
-
-		/* find the matching token ID */
-		for (i = 0; i < da_num_tokens; i++) {
-			if (da_tokens[i].location != buffer->input[0])
-				continue;
-			t = da_tokens[i].tokenID;
-			break;
-		}
-
-		/* token call; but token didn't exist */
-		if (!t) {
-			dev_dbg(d, "token at location %04x doesn't exist\n",
-				buffer->input[0]);
-			return -EINVAL;
-		}
-
-		/* match against token blacklist */
-		for (i = 0; i < ARRAY_SIZE(token_blacklist); i++) {
-			if (!token_blacklist[i].min || !token_blacklist[i].max)
-				continue;
-			if (t >= token_blacklist[i].min &&
-			    t <= token_blacklist[i].max)
-				return -EINVAL;
-		}
-
-		/* match against token whitelist */
-		for (i = 0; i < ARRAY_SIZE(token_whitelist); i++) {
-			if (!token_whitelist[i].min || !token_whitelist[i].max)
-				continue;
-			if (t < token_whitelist[i].min ||
-			    t > token_whitelist[i].max)
-				continue;
-			/* tokens needing no capability may only be read */
-			if (!token_whitelist[i].need_capability &&
-			    buffer->cmd_class != CLASS_TOKEN_READ)
-				continue;
-			if (!token_whitelist[i].need_capability ||
-			    capable(token_whitelist[i].need_capability)) {
-				dev_dbg(d, "whitelisted token: %x\n", t);
-				return 0;
-			}
-
-		}
+		ret = dell_smbios_token_filter(d, buffer);
+		if (ret <= 0)
+			return ret;
 	}
+
 	/* match against call whitelist */
 	for (i = 0; i < ARRAY_SIZE(call_whitelist); i++) {
 		if (buffer->cmd_class != call_whitelist[i].cmd_class)
-- 
2.56.1

