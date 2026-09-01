Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDFB43303A;
	Tue,  1 Sep 2026 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275066; cv=pass; b=XeJHUdD9w4LcF53edtzkdyllHSm8Dh3NjFiIjD3ae0Eh7zgPcWq1ioATletYIdTIl7dJse6+t7uwExejj/UM/PNRmvU0e1OQCeSigLpxkOZrJ2sOteDKd8DLdGS74iH+ulJnpKO29oPiyP9G12BYWg2YnQ4L8vXEt7Wy0udrl1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275066; c=relaxed/simple;
	bh=F7moDRHmgcrCFaI31fq1GSro0n8+n/cL9R0OXgy96WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iknDhLOGjXt2bht0PorydCL3pKFBB1XVKtTkGDGpJFXO6N7vhTseyhcspea4b0T+u/9GZI/pvpQOG+AvBgpGoW6NYtcqcN0Eqe207nFS3iEjhSFg5y7VsvRVK59Ki1wY6cj9Qkk73ZxEU2DdCsOMvwqxi8cXTPR4Fw+tKB+mJ8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=q3igSIie; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="q3igSIie"
ARC-Seal: i=1; a=rsa-sha256; t=1788275031; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ajbqiLrctn5kzUWPRbkT+jc9WUkXaVepbz3J3mU0L4xO6qzkv01KugvZpIlZf9lulqoUzJFOhYBKh7Thd5niyaWySRynqnHsHypCYWZpPbsDdQk69cDSqVSg5juB3MRlmQsBXWznJPMKiMmaC/Tg2TDa6Sz4SFnCcvoFy0OeDtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275031; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SUY6EOJnZnFcv1uEIhIP6eS4WTnuITEEM6F2QiUbMXs=; 
	b=FtHAyMJPO20S7htXTHW2pPADQV7PIVbJ5hluAyj8cSai4BXQbIRlV1CFBxQdjo/vvc50Pp2PyvzHLTHgs6+BFjeQ14gmzS/bygymTsN8cbfeLbV2hR1lNjzJQDI1J5K98+O52C/UmjYGheMBWKFPnEcv+m6hyx/WRWEt9UMjm2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275031;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=SUY6EOJnZnFcv1uEIhIP6eS4WTnuITEEM6F2QiUbMXs=;
	b=q3igSIie6WdXIzo7r+eNPV4Tn+Z3ZLBgQSQbAEBOwFRrWDQSKYeJX72QSPEHalUz
	rBPFMNrm4WEKrcxMn9R7fMuCp43Ht6pRuuuRFcTSEu7JUmDHMLuTF0cYljmkCql/X8h
	a0N4+bSlBYM3OELMJZ4VmAXWxWsFsKqAfIIf9Ye78NMQmC+wEwoSIGkB0c3Yp+X0+RL
	h4IVddwa28wWBDKU5FBjkRoBhlbqhwKANtYnpFF6CMrId68sY0kEUePU9PSXxFGTeQz
	wkfz3ykpNPywK4P6XRQVTpxjnby1JjiDckohnexGChK4F98SLCrOXqVh74B+BFOUOTr
	DAlNgwzuuw==
Received: by mx.zohomail.com with SMTPS id 1788275028591684.5357465166041;
	Tue, 1 Sep 2026 08:03:48 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 01 Sep 2026 23:02:15 +0800
Subject: [PATCH 5/5] platform/x86/amd/pmf: Inline wrappers of
 ap{mf,ts}_if_call_store_buffer()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-amd-pmf-fix-outlining-v1-5-b54ff94d3d45@rong.moe>
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

There are several simple and dumb wrappers of
ap{mf,ts}_if_call_store_buffer() defined as global symbols, which are
heavily used by multiple layers and become symbols against linkage. This
bloats the size of the module.

Since is_apmf_func_supported() has been converted, convert the mentioned
wrappers into static inline functions to get rid of the overhead of
function outlining and linkage, and shrink the module
(!CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT) size by 515 Bytes
(GCC 16 -O2):

      text       data        bss      total filename	(before)
     26261      31264       2768      60293 amd-pmf.ko

      text       data        bss      total filename	(after)
     26046      30964       2768      59778 amd-pmf.ko

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/amd/pmf/acpi.c | 65 +----------------------------
 drivers/platform/x86/amd/pmf/pmf.h  | 83 +++++++++++++++++++++++++++++++------
 2 files changed, 73 insertions(+), 75 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 6a2c11e75eea..4392bf0bc0bf 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -50,7 +50,7 @@ static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct
 	return buffer.pointer;
 }
 
-static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
+int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
 {
 	union acpi_object *info;
 	size_t size;
@@ -121,8 +121,7 @@ static union acpi_object *apts_if_call(struct amd_pmf_dev *pdev, u32 state_index
 	return buffer.pointer;
 }
 
-static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
-				     u32 index, void *data, size_t out_sz)
+int apts_if_call_store_buffer(struct amd_pmf_dev *pdev, u32 index, void *data, size_t out_sz)
 {
 	union acpi_object *info;
 	size_t size;
@@ -158,35 +157,6 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
 	return err;
 }
 
-int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
-				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
-{
-	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
-		return -EINVAL;
-
-	return apts_if_call_store_buffer(pdev, apts_idx, data, sizeof(*data));
-}
-
-int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
-				       struct apmf_static_slider_granular_output_v2 *data)
-{
-	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
-		return -EINVAL;
-
-	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
-					 data, sizeof(*data));
-}
-
-int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
-				    struct apmf_static_slider_granular_output *data)
-{
-	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
-		return -EINVAL;
-
-	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
-									 data, sizeof(*data));
-}
-
 int apmf_os_power_slider_update(struct amd_pmf_dev *pdev, u8 event)
 {
 	struct os_power_slider args;
@@ -302,27 +272,6 @@ static int apmf_notify_smart_pc_update(struct amd_pmf_dev *pdev, u32 val, u32 pr
 	return 0;
 }
 
-int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data)
-{
-	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
-}
-
-int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
-{
-	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
-}
-
-int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req)
-{
-	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
-}
-
-int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
-{
-	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
-									 req, sizeof(*req));
-}
-
 /* Store custom BIOS inputs data in ring buffer */
 static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
 {
@@ -484,16 +433,6 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
 	return 0;
 }
 
-int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
-{
-	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_AC, data, sizeof(*data));
-}
-
-int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
-{
-	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
-}
-
 static apmf_event_handler_t apmf_event_handlers[] = {
 	[PMF_IF_V1] = apmf_event_handler_v1,
 	[PMF_IF_V2] = apmf_event_handler_v2,
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6d9963677a46..9f64ab833c08 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -17,6 +17,7 @@
 #include <linux/circ_buf.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
+#include <linux/errno.h>
 #include <linux/input.h>
 #include <linux/mutex_types.h>
 #include <linux/power_supply.h>
@@ -1075,6 +1076,8 @@ struct ta_pmf_shared_memory {
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
+int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz);
+int apts_if_call_store_buffer(struct amd_pmf_dev *pdev, u32 index, void *data, size_t out_sz);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
 int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
@@ -1124,17 +1127,43 @@ int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 			   struct amd_pmf_static_slider_granular *table);
 int amd_pmf_init_sps(struct amd_pmf_dev *dev);
-int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
-				    struct apmf_static_slider_granular_output *output);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
 const char *amd_pmf_source_as_str(unsigned int state);
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
-int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *dev,
-				       struct apmf_static_slider_granular_output_v2 *data);
-int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
-				       struct amd_pmf_apts_granular_output *data, u32 apts_idx);
+
+static inline int
+apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
+				   struct amd_pmf_apts_granular_output *data, u32 apts_idx)
+{
+	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		return -EINVAL;
+
+	return apts_if_call_store_buffer(pdev, apts_idx, data, sizeof(*data));
+}
+
+static inline int
+apmf_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
+				   struct apmf_static_slider_granular_output_v2 *data)
+{
+	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		return -EINVAL;
+
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
+					 data, sizeof(*data));
+}
+
+static inline int
+apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
+				struct apmf_static_slider_granular_output *data)
+{
+	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		return -EINVAL;
+
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
+					 data, sizeof(*data));
+}
 
 static inline bool is_pprof_balanced(struct amd_pmf_dev *pmf)
 {
@@ -1142,26 +1171,56 @@ static inline bool is_pprof_balanced(struct amd_pmf_dev *pmf)
 }
 
 /* Auto Mode Layer */
-int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
 void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
-int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
-int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req);
-int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
 void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
 
+static inline int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
+}
+
+static inline int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev,
+					     struct apmf_sbios_req_v2 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
+static inline int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev,
+					     struct apmf_sbios_req_v1 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
+static inline int apmf_get_sbios_requests(struct amd_pmf_dev *pdev,
+					  struct apmf_sbios_req *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
+					 req, sizeof(*req));
+}
+
 /* CnQF Layer */
-int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
-int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
 int amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
 int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
 extern const struct attribute_group cnqf_feature_attribute_group;
 
+static inline int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev,
+					     struct apmf_dyn_slider_output *data)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_AC, data, sizeof(*data));
+}
+
+static inline int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev,
+					     struct apmf_dyn_slider_output *data)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
+}
+
 /* Smart PC builder Layer */
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);

-- 
2.55.0

