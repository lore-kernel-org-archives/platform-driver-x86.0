Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428574A8A29
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377985; cv=none; b=Tx8oXBYNxq9k1oA2Q6n5Zdes4CMlMPPaEI7S1c415UQSuwjDGUOpQfp7RLtQYJfCJrxONfHVe28qdU5b4OaQvUQgw+uFZFtWH/rUoWtiEm4cAB9ERxAPqyg8GycT8rQa5TVIJdkHbz9/EGJcvS8o0okHFIZdAeTcutBvSpQyAqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377985; c=relaxed/simple;
	bh=w9+dbflpGrP5lNfDxCYItkizUPQnVZj6g3uERwIv6gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbX2BGGXYNN65wT2a8TFSxJ/C2FLHjb5hp0ACFWsjxrgv2CeZ0rtbLfvWh1xGAL7jYpfH+geHOqs2uzOK5iqXPe+1MzPLd/qx9AdyPb6wkwFdf5PwbL2J80RlTwWLmWBefvz3GjIxzv9k4Le85kCccfIaBjiCPXMhSmM8EXXXUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHPtGfX4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHPtGfX4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so15283285e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791377969; x=1791982769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9czbEOZYdKU/0Bo/8kPwWGE/910Wk4cEmK2RLuZ54k=;
        b=mHPtGfX49XxbRO68poikFH9vXs3bRd+7ak5tCAFXenggYxhWkLiX3XB0bWs2MvH2nq
         iAHWQXJjnOi12Q+1n1wjImg57xVSVH0LAijXQa2ca0trFshvVdjYf9F6NGYZ65Bmbbu4
         9JMMC+0sxbHuB9K31jkKkZIvn8eGYX9N9vN98Cc0QIiyvW+cN6MTfsSrYKRjesKpZf1J
         iHBvsTsuEPmCnyyN3ZZc+Ne1P6PfvX/y7CtK9GlOFSsuGqY3T0o5x/PYujeE0iqOGvzr
         D5ue7DilGnSquw9CkitnA1b4kWvMGhkBAndP8HgsOSvE9/S1FVa/sfkBi1ef5UWE6nJY
         WA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377969; x=1791982769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/9czbEOZYdKU/0Bo/8kPwWGE/910Wk4cEmK2RLuZ54k=;
        b=hjUtbmCmq7i8nwgsg4bXdJCpkLdy0oYIntcp4GSS7leibWIsoX1NebAmlgJaxQngi5
         y6xd9eoBB0trrpH3WW8Gi57v3aB094+cY+PLqf/IzjuUryNx9J3Dq3/Bvy8Dq2uCL20U
         K3qa+1xZ72Rw8rXYpkbEDnWWUe3Rljj+Gjez8WtFqRxS4nlQbFRyOmhrlbCCznZQCyX5
         i6UULkSfA/D0BImHyIpyLsiz0+i2WurGKxe4NzRzFuomlqywRFMTCCbe9LfQOuSiK1Am
         +ImbYAXz7qIik4jbFzXHS1yCC5yvJwUlB3V4+0kaLejGoivXXeXxMc5kf0gF1NPVPEAX
         LIYw==
X-Gm-Message-State: AFuF++k3B6eqBLvOdp1IZFlDbTyngXtzBHnLjqlHQwdzt2DRvP5Aevle
	CzM+GNHa597r08MtXCTQSzygSOKj7c4FJ8JJdBkm8IHmS+As6GYdBjE/JQSivzGf
X-Gm-Gg: AYBFou0ZBTdOCPq+JMmHYKAeRHTVqewQJsOSgRLo/2hu9KCSCabCij2+8eqwk1JOyR/
	K1H7bAYDL0zr6mh/wN8sfD50SJWYWVCiBghzlvOnExn1PGqC39opnEIAXCISV8AMxe/g/7eeKHJ
	Ffvx6kTZazoCO4+yIf9lUuzlUof+auT2N2UHNZCPtfwj8pYliDgtLD6pGDUNXlNqpEfpfUzN5rO
	jZ/3rs4lxlcZad//Eopuf5JBdmu0JJNyxTlAGK4z6P+L2zIcLYaC6Hlt3cMIn6K5+WXV5Mtm0DK
	nGuO0+p9FJs6dhCmq6Kz+Tfil7Succr9GOmySrgUrZBtCqRWOOsipXETB9aYszRlHjsXBK5GoGQ
	/f3KyYbpe8N6I1JI1tEB5oISer/q+LF7bTkq2y2Lzh7Uhfc1sCH39odjRSF5kBdU2vhrJ7HBfoZ
	jAEbJJuULP4e98qe3/2XjchH3E3QWEFfA1yX+aCBkypQ7qSB70mDMEC1rHAXwIKSK7sayiLVpAB
	eFQo5MmlOBCTPlnh4np4HBUpFRV20MgQlcAd80ehOQ=
X-Received: by 2002:a05:600c:1d0e:b0:4a1:7703:e549 with SMTP id 5b1f17b1804b1-4a18043b9c6mr32320735e9.26.1791377969328;
        Wed, 07 Oct 2026 05:59:29 -0700 (PDT)
Received: from PF5R4XJL.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm105304145e9.2.2026.10.07.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:59:28 -0700 (PDT)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw
Date: Wed,  7 Oct 2026 14:59:08 +0200
Message-ID: <20261007125908.321186-5-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007125908.321186-1-erwanaliasr1@gmail.com>
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erwan Velu <e.velu@criteo.com>

pwr_current_active_freq_limit_source reports the active frequency limit
sources as a list of names, one per line, which metrics exporters have
to parse and map back to a value.

Add pwr_current_active_freq_limit_source_raw, reporting the same source
bitmask as a single hexadecimal value. Exporters only need a plain
integer conversion, and its interpretation can be centralized in the
monitoring stack, e.g. with Grafana value mappings, instead of being
decoded on each server.

The bit assignment is defined by the HSMP specification and is stable:
new limit sources are only appended, existing bits never change meaning.
A given value therefore has a single interpretation, whatever the
platform or kernel version it comes from.

Assisted-by: claude-opus-5-5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  4 ++++
 drivers/platform/x86/amd/hsmp/sysfs.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 954e938eea3d..66dbf506db05 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -109,6 +109,10 @@ Following sysfs files are available at /sys/devices/amd_hsmp/socket%d/.
   in MHz.
 * pwr_current_active_freq_limit_source: Source of current active frequency
   limit.
+* pwr_current_active_freq_limit_source_raw: Source of current active
+  frequency limit, as a hexadecimal bitmask. Bits 0 to 7 are, in order:
+  cHTC-Active, PROCHOT, TDC limit, PPT Limit, OPN Max, Reliability Limit,
+  APML Agent, HSMP Agent.
 
 ACPI device object format
 =========================
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index e9e91b640b2a..fa1cf8dc3b6f 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -274,6 +274,21 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
 	return len;
 }
 
+static ssize_t hsmp_freq_limit_source_raw_show(struct device *dev,
+					       struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "0x%04lx\n", FIELD_GET(FREQ_SRC_IND_MASK, data));
+}
+
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
 	.read = hsmp_metric_tbl_acpi_read,
@@ -307,6 +322,8 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_show, 0444);
 HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_source_show, 0444);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source_raw, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_raw_show, 0444);
 
 static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_c0_residency_input.dattr.attr,
@@ -323,6 +340,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_clk_fmin.dattr.attr,
 	&hattr_pwr_current_active_freq_limit.dattr.attr,
 	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
+	&hattr_pwr_current_active_freq_limit_source_raw.dattr.attr,
 	NULL
 };
 
-- 
2.53.0

