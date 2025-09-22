Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A7A2D780A
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Sep 2025 23:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758582508; cv=none; b=pC3SmRoYWxgx1unqQ+Et6+1nyn+Dp4pOPH+p94uujyGc2ZbXeTgg///31R8c2k1jbNdVjWyioChB298pRiBVLnSq45Wz5WoEuDMC/r5ruFsvK6Gl7VYIQ3KXroFUFhfbruBlbPV9RJs+Fufz4uh4c4EsTqKXMtCztC4wrJ3xXxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758582508; c=relaxed/simple;
	bh=kCu8FkHWTf6KtRUZFjNhTgMBEHbxZ4bedj1fAVnTVLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DYZiRTzDM48WAspdsu74LRVuEI4C00WXoH+rkPoEmO6DPZoKr5rMgyRGoh3lG3CRrHdam/VS9Ntg05O2aGmbp3rXKeO7SPNE/FTXBvsQhuql6sA1aWLVln0nXEduYE2yM0eh4kWdFHrUE3uQNE7h7zoS3S0L0OY3kSrxEpNdhu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZWM6mZpd; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZWM6mZpd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8JZo6qty6HkvdOVIcf2W7aTmtTO3x1JEbIlW2H/+xtg=; b=ZWM6mZpdgeU7P40Y3rREVuHtQW
	byhq54Tj6lIIAJz4sJLliZpndIX02YXwkfKqZadzCaJg1D80W0aDjcMMIw9/nBWkcTXsRA3O2Wb0D
	HrTgi+7yNCpCBUH6cvTozgXWCznVPtzw7W5oXcvrdqL7qVKQ9nsKaZYSFB4WZloonNZfMSS2qtUuM
	8oM9l8rFy9u188BzItIiCopJOpHoVEdtNG5lxBSKw6e0zNLCcS949382U10/AvvM7c6PRK+5ZTEJO
	Qb9Dhjo4UPcpuZKB8F41ilNcp556eeDo94CKg0mmB/U4UMziYse3Jb4bkoEUkE23Ur4cvk+TOscd4
	9A1iUk7Q==;
Received: from 201-27-133-184.dsl.telesp.net.br ([201.27.133.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1v0pdr-00FwtM-N1; Tue, 23 Sep 2025 01:08:20 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com,
	david.e.box@intel.com,
	xi.pardee@linux.intel.com,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 0/4] Some TGL and overall S0ix debug improvements
Date: Mon, 22 Sep 2025 19:52:31 -0300
Message-ID: <20250922230812.1584253-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this series, we try to improve a bit the debugging of s0ix-related
failures, specially on Tiger Lake platforms.

First patch is a simple clean-up, while patches 2 and 3 attempt to dump
more information on failure cases. For patch 3, it would be good to have
maintainers' validation that we can indeed dump the LPM registers in both
fail paths, as proposed here.

Now, the most controversial one is patch 4, sent as RFC: it effectively
reverts a commit that previously dropped SLP_Sx_DBG register dump on
TGL s0ix-failures. It mentions sub-states as a reason, but without
details. Questions that remain: is it the case that all TGL CPUs have
this limitation, or only some of them? If some of them, can/should we
filter them instead of suppressing this debug info for all Tiger Lake
CPUs? Also, what is the con in dumping this register, is it just
potential bogus values or this could cause an impact on successful
suspend path?

Thanks in advance for reviews!
Cheers,


Guilherme


Guilherme G. Piccoli (4):
  platform/x86/intel/pmc: Fix typo on CNP register name (and clarify comment)
  platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers and distinguish between them
  platform/x86/intel/pmc: Always dump LPM status regs on unsuccessful paths
  [RFC] platform/x86/intel/pmc: Re-add SLP_S0_DBG register dump on Tiger Lake

 drivers/platform/x86/intel/pmc/cnp.c  |  2 +-
 drivers/platform/x86/intel/pmc/core.c | 37 ++++++++++++++-------
 drivers/platform/x86/intel/pmc/core.h |  2 +-
 drivers/platform/x86/intel/pmc/tgl.c  | 48 +++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 14 deletions(-)

-- 
2.50.1

