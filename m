Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCA21A317D;
	Wed,  7 Jan 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767765784; cv=none; b=RB3oX1iWX4u1atolDQlpukCaAdgXN4pRL7dYineHFmKnWvefngSg520Uk6wEkoxXlkLYzh+OrwcSXPiPFdnkXhBmIxOfB9c4BeFFcrplE+iJHQNOV/+G1gSERMWyMA+goaRuQONfuBf5FTUUANGaXZAPvO7ZLANzeSQljotHp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767765784; c=relaxed/simple;
	bh=HuxcXDrBy7au0eucIK9MLD47AIT9nYOsFZvDKxmtDJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8g6ZLXJi8sdVc+7ZeSZYws9aGdd5PTTOZoZJx3i6XX46UIHGHFJzEYRM7IkRYTcCgAAkW0HEVawzVDhRHN+aN7LraqvYWSxmqWsm4TY02YZGScvSUlCrxhR/t5k53sYlOsX2e3g+G8eQqQ09kLqXWDX/53F8L8+uXzXoNiuBlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGkb0LxV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGkb0LxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767765782; x=1799301782;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HuxcXDrBy7au0eucIK9MLD47AIT9nYOsFZvDKxmtDJk=;
  b=RGkb0LxVtxGgXyldhf/Z81TFPQhlG6h/emY2rPVAIFM0efBmq6UfM22J
   bDBM51X8CYu2+XHHA2gEniWQ7HtkNml/1+fhVXYVH9IkvylEB+VY5Fy8y
   jYXEmYEgPHmiSvyl2VqcLOBvHKnRfiPCUHBpc+k9zaQhIYq2C01bCImwT
   0C5Zugpdbk9IRVU/qBfSTXZtqVyGNUisqKNYNiWfWF5G4xdJl/AJGa0MZ
   goE2tI+4uWc5MtFB5owBXzPoKuf7pmPQi837bnVkl5Ug6DRcJsr5muKlE
   izP+ETK5DKd+RuuHYeu9VtVy9BxyTtlk+jRn395IcPw7DryaayHDnLCKE
   g==;
X-CSE-ConnectionGUID: hZ4ND4bYRjCj9OYBUrpqbg==
X-CSE-MsgGUID: O00V90dcShCxK+pY9nQTKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79434348"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="79434348"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 22:03:02 -0800
X-CSE-ConnectionGUID: 26vdUA1BRqiwu+vQehurMA==
X-CSE-MsgGUID: h14tvf9RSe6IIo6g2jg8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="202746870"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jan 2026 22:03:02 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 0/2] platform/x86: ISST: Fix for write lock and suspend/resume
Date: Tue,  6 Jan 2026 22:02:54 -0800
Message-ID: <20260107060256.1634188-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two issues, which are not urgent as the current deployed systems
don't support them, but need fixes:
- Write lock- Even if the TPMI is write locked it will still write to MMIO
- store-restore data during suspend/resume: Not storing and restoring data to
all power domains.

v2:
  One minor fix for new line

Srinivas Pandruvada (2):
  platform/x86: ISST: Add missing write block check
  platform/x86: ISST: Store and restore all domains data

 .../intel/speed_select_if/isst_tpmi_core.c    | 57 ++++++++++++-------
 1 file changed, 36 insertions(+), 21 deletions(-)

-- 
2.52.0

