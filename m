Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2221FA17E;
	Fri,  3 Jan 2025 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919613; cv=none; b=oYLYzCnwwrnam+uHyrfSkWPRuBwffD/jVGny0dACXEbsjGCnYqIQWnk0X2ssydzrLRonns5t7moSOSWudM+t4ECfzPdNRoC3H9o7uYYTqL5o18ww5Irpxapcc42qJqazRmuyQtBa3jXVLnqyVDfmH0p3Vk1Z6ZAa1mKvunG3NLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919613; c=relaxed/simple;
	bh=PY1JL1lm7JzZjBFOh8RgsxyGeeUkXqbr3qzR81WTN+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5jgmpbyy/1IChAYocM8iC7eh7qZRkKhdLNo5OfOj5e4DFb7wCIzcwCydW4GhsSAgo4x8oyJ1OVxaZGEtPzMuvcPXceJDH9iX0p+hrbR+LUjHUG21QAqyuRXB8iPZbeV30QRzQ0Zdx0/1OOW2IauOsv1Dq8EdtfDAS/LAuCj29c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5R1dJwF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5R1dJwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735919612; x=1767455612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PY1JL1lm7JzZjBFOh8RgsxyGeeUkXqbr3qzR81WTN+M=;
  b=N5R1dJwFz81ZlTNFLu3q5Baxe3dyUqxemewTh3N3TIqbgklIZMY0lLjp
   oryfJ1v7K+vL5OvIqigYwGcdMZ+J+ZaaV5djgipMzlNRXfjiB0tCUOz9P
   gnxMgIW5ynm3dZmvfg1IEQZwE7eHmdou3ED3CPmT1HnH1jkz5Q8a5oiTm
   R23z2C4MdkSvzhamswlnLjFzTdf8kzmU1W58TW4mqXONFQa7L8eIR0myN
   SeTyLcH0E8vljVDmhd9/HZRi8cuqB/T5d3zE7alBZ4dOol6gnJSIRgD48
   OM2LJF2KKwCJ5d1/7yPyWjFaFEdLcsA4pe+A+mMfClQpQAUR4lXa2znUu
   A==;
X-CSE-ConnectionGUID: hZkyBCQHQpC4lQ9npChiUg==
X-CSE-MsgGUID: 0pJlaQksR/+eqe+ubEvZzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36392097"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36392097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 07:53:29 -0800
X-CSE-ConnectionGUID: UyuQIq4sRlas7CgNlNBaUw==
X-CSE-MsgGUID: m8CHZHFVTOK5jc7T8tNtTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106868356"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2025 07:53:29 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/2] platform/x86: ISST: Add Clearwater Forest to support list
Date: Fri,  3 Jan 2025 07:52:54 -0800
Message-ID: <20250103155255.1488139-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103155255.1488139-1-srinivas.pandruvada@linux.intel.com>
References: <20250103155255.1488139-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Clearwater Forest (INTEL_ATOM_DARKMONT_X) to SST support list by
adding to isst_cpu_ids.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index 1e46e30dae96..dbcd3087aaa4 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -804,6 +804,7 @@ EXPORT_SYMBOL_GPL(isst_if_cdev_unregister);
 static const struct x86_cpu_id isst_cpu_ids[] = {
 	X86_MATCH_VFM(INTEL_ATOM_CRESTMONT,	SST_HPM_SUPPORTED),
 	X86_MATCH_VFM(INTEL_ATOM_CRESTMONT_X,	SST_HPM_SUPPORTED),
+	X86_MATCH_VFM(INTEL_ATOM_DARKMONT_X,	SST_HPM_SUPPORTED),
 	X86_MATCH_VFM(INTEL_EMERALDRAPIDS_X,	0),
 	X86_MATCH_VFM(INTEL_GRANITERAPIDS_D,	SST_HPM_SUPPORTED),
 	X86_MATCH_VFM(INTEL_GRANITERAPIDS_X,	SST_HPM_SUPPORTED),
-- 
2.47.1

