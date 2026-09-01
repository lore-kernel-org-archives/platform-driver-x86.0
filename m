Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C0A415B9D;
	Tue,  1 Sep 2026 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275051; cv=pass; b=ZNO+LQDVml6yapqo0jN3eeyvgdXe4RTgSotXnM0sgTtexpoYBzqDh8pAoL9j98tR8uipKABbZ4U3wwqaWeY0EMJ1YbldVrixiFVyZZeSW1CZembg5Opi3++XK4+0RqzNaH262LyPyILnvIA3hS4/ZX54FisC54Nfk0K3vsU9ua8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275051; c=relaxed/simple;
	bh=OMXZu3E3UxhcoQ57y1ryjrRYaclrOU+PFUDwxtbl0fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M26NA4gdNaC8l+5cpmq8rH65bLOubqs3fNGL5HBiIa37qckPfQHDF95z+AarIoC1NQeuhZGidAqzXuYUSac9eEOBOquSH8E81qLdynXVYeFkzIAKcsk9McX0zpJGbtOWR0eNZ5DZCDa4WHs/YGXnlTskGAZ7+7mhO1VmCgbkhLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=LW6q79MW; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="LW6q79MW"
ARC-Seal: i=1; a=rsa-sha256; t=1788275025; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BuZXoV2MgmIS4tzykeBupEj2o8NVwttlbwaxhfwOG4qbmBy8zksWYpk+A7h3bqxMsF1JgV9M56rxOVlfDccEVO1GqKjIPZ9jh7FfNm5hCLI/1qb2/is/mWtwwH5mAnsbil73GqsXbK2jrru6hISzaXFm1/+OLtO7UkstTjhAnAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275025; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kK2oWSrEsr0qP1KdXzPLSJ5VL3KbezLhv7IaZeT5Be4=; 
	b=ce1xmQn8g0S4NXkLbZb8lcpNYJLa0UOermY6ZWMHsnBsDBUGkaOy6n/1puvI+S6zrTYbX2wOGoYgwd3dSrEAcFCE9FL1K7txj2qhG4GyQaV9zTpenk9w3fWqNqPe21QN8qUiqsLThUzrcOybdlo4TA8WVZXvEuyDNZ+Qp9JfsNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275025;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kK2oWSrEsr0qP1KdXzPLSJ5VL3KbezLhv7IaZeT5Be4=;
	b=LW6q79MWmuaI+nLqCwteMS+BJtWPwyx8pRfKdhtwv4cL5mshgn1K11VC89jh72eG
	pr7HqdFHP5oqqqn8LdAzKy+dGKuYDOVn1OQvXEVsRppZorQmWFM89GpzA/pCNWUOULf
	edsqDSZ3mAFDfd/zGYZG1imweMr17PQnrKphxnBXPVxK0iM2nHef+e44+2IJoNEDXoD
	jULYZSWBNyEOzb08/hzaegm3Hiw56brg8ZCkR43E5F5RKeqqEw8LvQZvqBRxA6K4kdr
	BcSpC5aSrJPInDEB43vDkoATOgv7tmTIqCeuvdPn0T/oLlFAAajVtbee+o34LNhNJ7s
	g0tX7Qoeog==
Received: by mx.zohomail.com with SMTPS id 1788275023140997.9822206727858;
	Tue, 1 Sep 2026 08:03:43 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 01 Sep 2026 23:02:13 +0800
Subject: [PATCH 3/5] platform/x86/amd/pmf: Inline simple helper function of
 SPS Layer
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-amd-pmf-fix-outlining-v1-3-b54ff94d3d45@rong.moe>
References: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
In-Reply-To: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sanket Goswami <Sanket.Goswami@amd.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

The SPS Layer has a simple and dumb helper function defined as a global
symbol, which is heavily used by other layers and becomes a symbol
against linkage. This bloats the size of the module.

Convert it into a static inline function to get rid of the overhead of
function outlining and linkage, and shrink the module
(!CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT) size by 252 Bytes
(GCC 16 -O2):

      text       data        bss      total filename	(before)
     26533      31452       2768      60753 amd-pmf.ko

      text       data        bss      total filename	(after)
     26341      31392       2768      60501 amd-pmf.ko

There are also two duplicated prototypes, so remove one of them as well.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/amd/pmf/pmf.h | 8 +++++---
 drivers/platform/x86/amd/pmf/sps.c | 5 -----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 024f20306e11..4a4c3aeadecc 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1126,12 +1126,9 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 int amd_pmf_init_sps(struct amd_pmf_dev *dev);
 int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 				    struct apmf_static_slider_granular_output *output);
-bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
 const char *amd_pmf_source_as_str(unsigned int state);
 
-const char *amd_pmf_source_as_str(unsigned int state);
-
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
 int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *dev,
@@ -1139,6 +1136,11 @@ int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *dev,
 int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
 				       struct amd_pmf_apts_granular_output *data, u32 apts_idx);
 
+static inline bool is_pprof_balanced(struct amd_pmf_dev *pmf)
+{
+	return pmf->current_profile == PLATFORM_PROFILE_BALANCED;
+}
+
 /* Auto Mode Layer */
 int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
 void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 0b70a5153f46..035272d37867 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -281,11 +281,6 @@ int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 	return 0;
 }
 
-bool is_pprof_balanced(struct amd_pmf_dev *pmf)
-{
-	return pmf->current_profile == PLATFORM_PROFILE_BALANCED;
-}
-
 static int amd_pmf_profile_get(struct device *dev,
 			       enum platform_profile_option *profile)
 {

-- 
2.55.0

