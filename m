Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBF46AEFA;
	Fri,  9 Oct 2026 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550562; cv=pass; b=fsGphzHIgfNHWOzO8JlqbSA8SwEdNBpwVFfn38bqUg8gq+YxZkkmBTVtC8s8mdUSxfLpDenmPzr2O2SiIcBbHz0n7gAMwMoIFsXGH7op0z4qOIAinc3qKR/K796ZGYd4fnrTj+9yzMJv6QyHr2Ags9cKPHesb0jmNV2vMJl7WYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550562; c=relaxed/simple;
	bh=5W9zMmIN5qzWT77Mwo4uy4xKgqD5PH2navXxaM11mfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEX+BtJuXZSlqbLEv6RwXdPk6AcC3AYEpfgqDX4ev9Wvm0B6e2m74iSZqcd882UXfSbmZyqqTt4yYggHLYmBDs74nbZJz/0mvApEEz+kMrluhgxuRLx1QIRfLCANS7oeAG4s+vWsbeByhwhfkn9gXWYXvzs71L+C60ybPBQhs58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=XGsBltdO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="XGsBltdO"
ARC-Seal: i=1; a=rsa-sha256; t=1791550485; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nrck+hwAySEFfqfibJhJdcJNJR4CQtPDJlE7yQPNqTe1e37NnJIdWhB3Um5/oY7Xb8fOSVu4vni+l53cMV2lLy7iCMnjCCBMZ3S8KVSGB1039FVkZ5egDATmJAOWNdI52mSr3TQZBOPKkEzroZbctfr8rKUSN0oj9zX+YoEWtkk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791550485; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1q4nUa9ky4iT71RSC/IPyq2LjNbY5O9OiPFjET26Roo=; 
	b=gOhgVdu5IcVgoLpI+TVk9aYgOFDERz0Lf4LwnfdFTsIH2k55cxJPjzL6y2igLFV7Jj2dMJheWFB/5cEcKev6OL6qQSXJF/ujGSrXgA1wk8xaEp5P6AGP8boFBT+0++d1euQqP+0oWiqXyAiywayeWduh6JfGxca/I7nnWtROaCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791550485;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1q4nUa9ky4iT71RSC/IPyq2LjNbY5O9OiPFjET26Roo=;
	b=XGsBltdOS9JnXBEMvmn0Sv3I7RlkvgsRFIHzyS4oUtMOYryjmrgxreB+n7bVDr1g
	9c1yaUetwqPeai9MFJ9UDxHMXLIJHJ3+/jXH+qZQ3hbDQYM+h/YbL8LBkm4Bg37RksE
	zv7cGD3Yk8jdmXmxUOTbiZgflXjcENv2RXDpVw8P7ZQwI1lBkKnSM76LgKUpWSzjQNT
	orrrJ0L92yV+/vTU5PM8lG11DKQDqk0cXbjAzOMCcGsc2KNp43bvHbJgRfzo8cs+fxh
	59kiYKDOu4VhbSdGoUTfvDOO+++6wmCpbflQ1EM/pOZl283YsfCrjbwvvR8IQUxrPcK
	hDtPovf0mA==
Received: by smtp.zohomail.com with SMTPS id 1791550485040103.19696209012432;
	Fri, 9 Oct 2026 05:54:45 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 09 Oct 2026 20:53:51 +0800
Subject: [PATCH v2 09/12] platform/x86: lenovo-wmi-capdata: Detect stubbed
 capdata device
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-lwmi-wmi-new-api-v2-9-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
X-ZohoMailClient: External

Some devices may stub the capdata device's WMI query method because it
doesn't support the relevant interfaces at all. For example, most
ThinkBook devices doesn't support GameZone or Other Mode thermal tuning,
so capdata 01 is useless and stubbed.

Keeping the capability data list with empty data is meaningless and
causes lenovo-wmi-other to call lwmi_cd*_get_data() to retrieve
nonexistent capdata in vain.

Therefore, stub the device and release (or skip allocating) needless
resources, e.g., the capability data list and the debugfs directory.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Replace the term "poison" with "stub" (thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index d913176d2061..79c72717ea40 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -693,6 +693,7 @@ static int lwmi_cd_stub(struct lwmi_cd_priv *priv, int err)
  */
 static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 {
+	bool got_data = false;
 	size_t size;
 	int idx;
 	void *p;
@@ -727,8 +728,31 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		struct capdata00 *capdata __free(kfree) = wbuf.data;
 
 		memcpy(p, capdata, size);
+
+		/*
+		 * A valid attribute always has a non-zero id. IOW, a zero id
+		 * implies a stubbed item (or the query method being stubbed).
+		 *
+		 * The stubbed item is still copied to the cache slot anyway, in
+		 * case the firmware dynamically stubs the capdata item after
+		 * switching Game Zone mode. In this manner, the previously
+		 * exposed capdata can be void.
+		 */
+		if (capdata->id)
+			got_data = true;
 	}
 
+	/*
+	 * Some devices may stub the query method because it doesn't support the
+	 * relevant interfaces at all. For example, most ThinkBook devices
+	 * doesn't support Game Zone or Other Mode thermal tuning, so capdata 01
+	 * is useless and stubbed.
+	 *
+	 * Stub the device and release needless resources.
+	 */
+	if (!got_data)
+		return lwmi_cd_stub(priv, -ENODATA);
+
 	return 0;
 }
 
@@ -769,6 +793,7 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 {
 	struct wmi_buffer wbuf;
+	bool got_data = false;
 	struct cd_list *list;
 	int ret, idx;
 	u32 count;
@@ -811,13 +836,21 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 	priv->list = list;
 
 	for (idx = 0; idx < count; idx++) {
+		if (!block->data[idx]) /* Ignore stub. */
+			continue;
+
 		list->cd_fan[idx] = (struct capdata_fan) {
 			.id      = block->data[idx],
 			.max_rpm = block->data[idx + count],
 			.min_rpm = block->data[idx + (2 * count)],
 		};
+
+		got_data = true;
 	}
 
+	if (!got_data)
+		return lwmi_cd_stub(priv, -ENODATA);
+
 	return 0;
 }
 

-- 
2.55.0

