Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98914F70;
	Mon, 22 Jul 2024 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644134; cv=none; b=g5m4H0zLFws63mFKkgos0f7agn2kxN9yFbqD8Y3NZ9UEzfSrk3I9L1HqtQ4X6EbafuI/NNMSKWEJfOZ0kP8E4A3DJtdgkQdGX1koODbQ5m1CzYxE+eaK0mwfnkHf4gFiJzuXAgk14ANGiO6NZW2i2SBpyzkIbeU4lvY/UDXqqz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644134; c=relaxed/simple;
	bh=vbqw1rhwKEBipFQr77dq1GtSuMncujER1heBjIgNenI=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version:Content-Type; b=BUKCUu0kRFsvoDeX85U85ZGxgUg9lD8IlxAXc2L4ODoW29UM2Ze+mbj7LvmOq7FcDSONkhvCnnleMpx0e651aKXfU51hUXuRYFB4G0m3Bc9cLPYWxfkNB7w5X6oLQBH2dTzqnl2230sX4AOTfA/v306W1Hm1i/jvT8XZb1hqeO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b68624.dsl.pool.telekom.hu [::ffff:81.182.134.36])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000738B1.00000000669E345C.001898B3; Mon, 22 Jul 2024 12:28:44 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Hans de Goede <hdegoede@redhat.com>,
  =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
  Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v3 0/4] platform/x86: ideapad-laptop: synchronize VPC commands
Date: Mon, 22 Jul 2024 12:27:20 +0200
Message-ID: <cover.1721294787.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Hi,

Sometimes the Yoga mode control switch did not work properly on my 
laptop, and sometimes even caused a platform profile switch. It turned 
out that it was caused by a race situation, the lenovo-ymc wmi notify 
handler was running at the same time as the ideapad-laptop acpi notify 
handler, and the partial results of the VPC calls in the two were mixed 
up.

This series introduces a notification chain to receive YMC or other 
events, moves the EC triggering into ideapad-laptop, and then introduces 
a mutex to eliminate the problem.

Best regards,
Gergo Koteles

---
Changes in v3:
- use devm_mutex_init for vpc_mutex
- Link to v2: https://lore.kernel.org/all/cover.1721258854.git.soyer@irl.hu/

Changes in v2:
- Skip the already merged "platform/x86: ideapad-laptop: use cleanup.h" commit
- Based on the WMI driver development guide and the dell drivers,
  introduce a generic notification chain
- Use the notification chain to send the YMC event from lenovo-ymc to
  the ideapad-laptop module
- Move the ec_trigger module parameter to the ideapad-laptop as well
- Mutex changes go into one patch
- Link to v1: https://lore.kernel.org/all/cover.1720515666.git.soyer@irl.hu/
---


Gergo Koteles (4):
  platform/x86: ideapad-laptop: introduce a generic notification chain
  platform/x86: ideapad-laptop: move ymc_trigger_ec from lenovo-ymc
  platform/x86: ideapad-laptop: move ACPI helpers from header to source
    file
  platform/x86: ideapad-laptop: add a mutex to synchronize VPC commands

 drivers/platform/x86/Kconfig          |   1 +
 drivers/platform/x86/ideapad-laptop.c | 282 ++++++++++++++++++++++++--
 drivers/platform/x86/ideapad-laptop.h | 142 +------------
 drivers/platform/x86/lenovo-ymc.c     |  60 +-----
 4 files changed, 275 insertions(+), 210 deletions(-)

-- 
2.45.2

