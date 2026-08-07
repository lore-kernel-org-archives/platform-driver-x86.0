Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB63FD137
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113660; cv=none; b=GPVuaeNyYU74BbB+1OPHPTD4gbwWm/0HJsH39/TMogbabGkoB8LHlGg59EQof7Spj1AX8oQrlmDNLgZKz9ohcDp0rpfWffDrWyC/9v8VndIANf9cT1dyii5z685qU51/GHj4N3r12FO38JN5HitnwxCrHxf2AALySC4pzh0EZeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113660; c=relaxed/simple;
	bh=1BKnXr1/MB/NkXRWCaUFR9AAMwMUPnEGjKZQWbfUj4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6Z3PxF8WILgwJsDXzcXgJtAuA/mS51uy6HP+grWM97TZqG9px8aqqv/k5Nmc2CoBpbbFPVtGytluxajMV/LdevHRPgJQA9kXPbRkjKxiDV9uayYjKeXzbK0oLfbEA95Xc3EY46k5iwnSdacBObvLDRtsVOfSk1bTJsCbLznjfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFcjkl1q; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFcjkl1q"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d01663d816so31651185ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Aug 2026 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786113636; x=1786718436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcJguZmeHN+kiaiUR9y3o5cAga+xVBYwoL/bbx1DrYw=;
        b=SFcjkl1qgfOns3w0nr+/XbYj03NBnXnnsbuQEGg6rYrgUTtuyORcmUTV3aX3XoTiuT
         +fDhJewSSZaBNyh9G0pohSQEIA19st6qd2lh6UMJthxyQ7Cc4nne0qWrNxpAEEeYpY4H
         6rgdU2iLGxKBvxIyuRs4816CtRm5GbVmSSXkZo6nc6BaPTS5Q6FZbnBdYlaB8naetxKy
         iIls3nsoYkoAUJ4JIfQXtHkAiF62odW/l/BEc4zzOBklmOk0GNkytsBzahuxJC3t0aBU
         nLuvZpJ6tcQ8ummmY3oicRJvQDPpCjBDzp03cf5YVMCCXhgB7wb7H7oWJ+v3Yof2+/EX
         JyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113636; x=1786718436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CcJguZmeHN+kiaiUR9y3o5cAga+xVBYwoL/bbx1DrYw=;
        b=n/FEq+bGNroZBUJ1BTiS1cyPI3mTNQ/f8DmyA/roTTh0kfx1GCKegRS3Wqya4FX3hG
         TnIjueLBtJ0jqatwTWclNYq6CZk1Rvm7AmPiBCFWiYIC5c0B5zq9r2MrQNa0mBQmqio2
         UQ4XsTBwR/aBiTJmhwYxMyhQF0HeQCurWL0LQ9KsBYQGoLquJBJQPiyWeqfVaeoVmVPu
         mxVHDPIHfNkORjCajy7Nb6fKysjT6E0IzNpY2uTOBHMknt4od5XN+0KtwNXaZDU3D5xJ
         qmXygoksUrIK/z/ChWylnUEaLMtIXrGTXeqyoqP2YEHhO5RQW+E23+BaRzY8Fc88Esrz
         qMcg==
X-Gm-Message-State: AOJu0Ywv6WSXVs8nRj8RKCKpn2O0uKMyhfNFqgIh/rSG9sqU8i6ylBLC
	zZX9D+7uzkL8UhVd1gMyZQtDI1QjkvKWZU7hm3bzI+qH+PB7KXeEzdWD
X-Gm-Gg: AR+sD11h0DzbWIhHypt1upPcUxE0kpCPP/sFze+iAJRGp38bgQ3oG1XXZNkaK1xlhhG
	aTBFVAGo2G+074PWUtFz2LjkzL1w2tOhFyQeFu7sG97meiSDDxYKKej4Ws+BLiP/aOdY+BIog1e
	oY3Nve1nEO4RLlggoRzG128ygn1DGeSkda/u7n2xrL7lYjaeyA8vOOBmrJ3QKPy1GYacvtEyIiN
	Lzukft/qpq+SJ5WubiQc3lrpXjpThq9HfqSU0fE/iEmqylZHSEj91rH06zoKe+LUiNAnaay+gud
	/wOyQmvOKtSRloIWKO+HW4iqt1I++WrI7l7dvPd4qLVnlq7uFMYedMJtrpG9GR8CNaYhVCS0kid
	nRo1PnNxr/H5PwRToaFVS8PFB4f9XPmx64RlT7U/VWuqMQS6sdm9d9H4yNH5blsCIKVtjumKPWt
	1sA9w0mALp5c9nm9v7ctSPb6sQq8djiKlzDSrFb84VvPYL/9Oa4WrSnWZRZmCKd/HOXpR4HQhHL
	wFlWDV/kAdOAJr3eUK0Yf25+sqS26locwfVCTaeP/8JaDlinLJ01Q==
X-Received: by 2002:a17:90a:ec85:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3909d8075eamr10896910a91.7.1786113636367;
        Fri, 07 Aug 2026 07:40:36 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff24b91sm2917026a91.9.2026.08.07.07.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:40:35 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] platform/x86: ISST: Validate socket ID in clos_assoc ioctl
Date: Fri,  7 Aug 2026 23:40:02 +0900
Message-ID: <20260807144003.3498972-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807144003.3498972-1-sammiee5311@gmail.com>
References: <20260807144003.3498972-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isst_if_clos_assoc() validates the user-supplied socket_id with
'socket_id > topology_max_packages()', but isst_common.sst_inst[] is
allocated with topology_max_packages() entries, so the valid index range
is [0, topology_max_packages()).  The '>' comparison lets
socket_id == topology_max_packages() pass and index one entry past the
array.

In addition, isst_common.sst_inst[socket_id] is NULL for an in-range
package that has no bound TPMI SST instance, and the pointer is used
without a NULL check.  Both the out-of-bounds entry and the NULL pointer
are then dereferenced by map_partition_power_domain_id() and the
following power_domain_info access.

Reject socket_id >= topology_max_packages() and a NULL sst_inst, matching
the checks already performed by get_instance().

Fixes: 12a7d2cb811d ("platform/x86: ISST: Add SST-CP support via TPMI")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 24334ae70d82..b2965baeaa36 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -729,7 +729,7 @@ static long isst_if_clos_assoc(void __user *argp)
 		if (copy_from_user(&clos_assoc, ptr, sizeof(clos_assoc)))
 			return -EFAULT;
 
-		if (clos_assoc.socket_id > topology_max_packages())
+		if (clos_assoc.socket_id >= topology_max_packages())
 			return -EINVAL;
 
 		cpu = clos_assoc.logical_cpu;
@@ -747,6 +747,8 @@ static long isst_if_clos_assoc(void __user *argp)
 		pkg_id = clos_assoc.socket_id;
 
 		sst_inst = isst_common.sst_inst[pkg_id];
+		if (!sst_inst)
+			return -EINVAL;
 
 		punit_id = map_partition_power_domain_id(sst_inst, punit_id, &part);
 		if (punit_id < 0)
-- 
2.43.0

