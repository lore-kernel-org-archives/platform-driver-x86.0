Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF03242D6B;
	Wed,  1 Jul 2026 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924231; cv=none; b=FAUH7akS8Uvj9ByL7AbxlbiWzmJanhUBwNMnm7PbycGyREHHI4yYtoDXOW0gGYTPK/LE0iij/kJlpd5vWmj2uk2fWEisrpnI1jvY+C+O/IksaEUD6vE7d8wJavxl5OWD0nbz+YwG3mXQmFo/8TRp6vvRf03rf5IenhfOMl0Z1gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924231; c=relaxed/simple;
	bh=0AzIZOzgF7RVj22PBzyWfjLfvCcQfsd3dzPmZbsPwTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZjrDiHWk2BpTMA+NkTnz2a9rgMzhvf35VFY+BIP2vacLSt70QrbW3qI6zifLiMxGc7ETg/NBYQ18sJs69CepXVa7lp82xsFjgFpcpHfGs+JaN5cl40XQiINr9DNgnJqv4o9PDWRs0ATC025ZuAMNow5OQ6tVxqQgcw26I3wK5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Ln7bd8DR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Ln7bd8DR"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B40C2840E1;
	Wed, 01 Jul 2026 18:43:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sD_kGt2uLFtQ; Wed,  1 Jul 2026 18:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782924228; bh=0AzIZOzgF7RVj22PBzyWfjLfvCcQfsd3dzPmZbsPwTk=;
	h=From:To:Cc:Subject:Date;
	b=Ln7bd8DRp7zVOF15Usa3iOGgMp4IO+xo2eaA6cOG4jvlbxfws/m3V14QAagaqXmBh
	 Ol8mtGE3YMrCgjKueJ+l3UXuudOQ4dk2imXaa0dVHfRf0clPFcVmT4Dr4FZB3r9Tu0
	 Eczb+wO2w/MCsidM5ReignAXLfHT3EzsX8KsmeN9XZRN/f5XxIh+altaF5LIS4tZjS
	 PB48j2wKX956eVYfqCY9wki/h5w4Cx1vYJET0UxcqyXZ8+pEPEgTslTttUZzZ3DJCV
	 tCufAPklB+DoAM77tALdRAUeAvtrrhkCoRdebaCijHCXmli6M7ZwB8xVWmh0Y2E2kZ
	 ZF7G4XXcV77TA==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 0/1] platform/x86: asus-armoury: fix Use-After-Free and memory leak in driver init
Date: Wed,  1 Jul 2026 18:42:02 +0200
Message-ID: <20260701164333.5219-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a Use-After-Free (UAF) vulnerability
and a memory leak during driver initialization in the asus-armoury
driver.

Changes in v2:
- Restructured init_rog_tunables() to use local pointers
  (ac_rog_tunables, dc_rog_tunables) and only update the global
  static asus_armoury.rog_tunables structure once all allocations
  have successfully succeeded. This removes the risk of exposing
  freed or partially allocated pointers to the global struct.
- Removed redundant assignments to NULL in the error paths. Since
  initialization fails and the driver is not loaded, cleaning the
  global static pointers to NULL is not necessary.
- In init_rog_tunables(), replaced 'goto err_nomem' with direct
  'return -ENOMEM'. The 'err_nomem' label in the original code
  printed a generic OOM error message, which is discouraged in the
  kernel as the allocator already issues OOM details. Because that
  label did not perform rollback cleanup, a direct return is cleaner
  and simpler.
- Replaced inline cleanup in asus_fw_init() with a standard goto
  rollback block at the end of the function for cleaner error path
  styling.

Marco Scardovi (1):
  platform/x86: asus-armoury: fix Use-After-Free and memory leak in
    driver init

 drivers/platform/x86/asus-armoury.c | 38 ++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 14 deletions(-)

-- 
2.55.0

