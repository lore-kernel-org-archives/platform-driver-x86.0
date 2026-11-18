Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975948;
	b=hv20G42rOgurnA2pydWmJ1AgZ7YDeMIlacRYbW26RQ0hUZU+XQKshH1QOWT9TbT7Arxc
	 wDPhMN5DPhgVQI10xpEQHPQUDSnZ2XSZDwnyuCVw9u5z+A0jfBuYhed8mX7jDTO8V/hOI
	 mIqxQ/Pj0pYSvCO6hqDWW3iFDAE5uw1jxgK8go3sDV/U2qdCNzmSsOczn3L9K+D1GlZLT
	 mxrWPDrld48lBdTx4nq8OD7IfVMWMJCj2AWMrYMds5kfmWmsy+Ke+qTMogdb5cO46TfRr
	 +k+L6AhB8blG0C2fNmg6mzk/bl5SjAbcPfgTgDHOJTrmeKVrEliw/1GQIpbiDdqi9gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qEYkuTRa7KdxPi0WF8rfjLA94KkLMCBVrVUKvelNEF0=;
	b=pZm16sGMypqxUtLsFIw5X22igxn0UtFJ2aUKo3vB5YwA3mRjeYKcXm9k5FOlsfo3ehBa
	 2hofu2W3sQBXhbHj+b17ujCICbPbHSUCqe5nKyuiQYM5mwhN+zRdk4txrUQm53GKGZY5W
	 KeTeJomLkAUYjXF+rtmvO9yyIaK6V7dkwAQAsSaARW7RBh5TKLBV5lEgsLWZnk9CGlOBU
	 SXutlfyKoigiVd8k2eCv77+LDbnmqv/ezEwixQqUTFP45FAnTYcjYPjOn07y1dTdbux7O
	 RMC4+HOrDxk841rX5T60q02SY7dRulK9VDl4FCw4gr6WKZ0nvUbSMbw0oZ1dq5zv0UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HIqpWgmY;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6296606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6296606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HIqpWgmY
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso3741315ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975947; x=1795580747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEYkuTRa7KdxPi0WF8rfjLA94KkLMCBVrVUKvelNEF0=;
        b=HIqpWgmYMDvHZNCYTneiMv1KS4Hmlsgs8PjCMG0Ti//gAUhQ+8dfSFkRTz/iSC1WBM
         +wCY66D0aLM+4PRNjJebWI0ybA/p2hVXirKeNIZR1JdzYhLzq9AMPJRzSeX86UBMlMTt
         PKwGlu8Bo9veC3JYt1ZL5Aiur0StbBvuQGpMX2YUclq00EhGa5ofDiWaEvBArXVlPx2W
         /1KNp+G/bO0z1In8hYHRbUH4aGWvT/Z2mNOQxVxxv925Fz2yGDI3kKX39ZOC7pABr+8x
         KEErtg4xIeOf6Ewwo5yImm2eHuQdyU/b9gBAJn6TmKuYFAgq2JHo7f/CLYQ5JTpRgZNo
         EVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975947; x=1795580747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEYkuTRa7KdxPi0WF8rfjLA94KkLMCBVrVUKvelNEF0=;
        b=DEhrA0TZcy9xdf1xYmNEnKvx6bVOj+lr17pU3LmszGe2y30A0lz/QPhOhl6EWWkfsg
         a6QmvcZhGJWRdtiiPpIa2JISBK1xzlZWfn0Bro5LMm9bvFJjkMSzfJ9mFHQS2rHsSaZi
         zCwTerz2zSWnbaMTUd+psiuukT/jW5B3Q9wgbmzG956+uJYCqHxVxBmnQgQo/ef1tSBU
         tt/YgfYtU/0aumtMYuKbx0ahmrAgxWS7UOA2Qc5EHvCk0PrfRx0melVzKVyVonOaitAx
         v0C+C8LLOf27lw9yBQv3chYyNwZMcnTrzZbxn7kHNZIw0nZbBEOyfxiWSDqlQ63LNYg3
         58rg==
X-Gm-Message-State: APuU4Z/0JE0E258v9J1It/T2kpzH/Nn9QkclBMp51CmG25VjmdmGZa5S
	t4tXzSJAmUaiE7ss6bVJ8PbP1MIiPzhIS0M63W0q/sDgziLqH6dxOeal
X-Gm-Gg: AZFdTZezt4NuCRSSKdx5DFcKIBli4K9JFwsNxNDL9G+yRF57OHdSsz1H3blGSE/kC3J
	Xlrfu35hGlkiLgproRaPeCoYOo+IG7KYdmAvcrd+9WS3NqgZfn6Cy0D6+hBugLdSXM1OzE4FK4v
	jqNDqcy/3AJ8bHY6NcQ7TVX3vEm9IiEmQ+agjWZL3k0khM4YLfSEAZAYOQur/+7OQn9WAza0NAx
	JtNa9WMnGWVbTdaMFiFnNDuOg2HTDzyUrIFZhRFpiAYjlP0s5riVbO5WTIkb6nst3vdyZh6ByUp
	FQ29pNhRFKia7HFh8qjT4gBvFQtD6hD2UuY1EPvMu1Pgd2+PXkmy2o1swqV7XNna2gWLtg18AFs
	Xk9F449qUj0VKewJs3D88EBrVzCjFTKweuXRO9WyA97ieHGPaWt6c2LpkWNhHAqNVbSxN16JK9Q
	Q480XDj2MzmeF45hLPgfndxvYXqqq6c8VqFonbjAMoCQNaAhHDx0pD+ZXen8aXPURHLRfqh0R/L
	tQzk9pwtNzvBfKlcMGUXuniyCxSuZnN8rsKLCEdvxZea1+4wvHIQrITzN8USAoApBfBj4bjm6ap
	Vslnc39jrkEPvaX+LGBh/Ag0RtC58bWF+90ciKfP9IKw9P2sIvJdsEodFXThl+FGcJj0xuFjOY9
	csI6svfJ7jJxAM6PiYEi1lBFpmtjs9+NikCQsPJs/ABKoW4AWNkLStgEvQ6WBWQc4nTI3ci/gmT
	qmrT8whWVgKhwLHQDe/3iA4nY=
X-Received: by 2002:a17:903:1b04:b0:2df:9057:8bf4 with SMTP id d9443c01a7336-2eff7525a26mr13187335ad.43.1794975947150;
        Tue, 17 Nov 2026 20:25:47 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:46 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 02/16] platform/x86: dell-smbios: Filter every token at the requested location
Date: Tue, 17 Nov 2026 20:25:24 -0800
Message-ID: <e153bd955eabf8d3e6256c5ce3822b687d203fb0.1794975827.git.rosenp@gmail.com>
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

