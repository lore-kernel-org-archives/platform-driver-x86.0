Received: from mta1.migadu.com (out-59.mta1.migadu.com [95.215.58.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190686329
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 00:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790124436; cv=none; b=Y0cHjiYNo1JhQbzIluSIMnSeNBrolMBwoMupK6RUlsdWQWdv35U5g+bbmc7Ssm7VNgQzo8FnJaD5yo5ZaYo9MPWmU1usvecBXwjj9J0aoRCoEyqnotRaQxdvEeiuZzQVtObxEs3YpcfavoEGYhhhX1bp5Tp+ZAoV8wuNM4ouM+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790124436; c=relaxed/simple;
	bh=0D9ZWYXFf1dq9IifcE65i2/4kH6wGVj4nlhyX8uBOd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdChZ+Q/nY8D4UBSYc9Gl6y4nI5cnETXHVI74dTnyo2FtpLDldVv/SO7QOYL2Ni9dEBQGMMCYBFyv7wqbMMmqtj4+lPn7GAgbmnS8YDttbQZp62h/rYwnMxgx6NkJk1XPG/UNSqHtcVFVYkGciAdXhzDLBaOXh9fPv0qJvUBRMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AFoWqi63; arc=none smtp.client-ip=95.215.58.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AFoWqi63"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0D9ZWYXFf1dq9IifcE65i2/4kH6wGVj4nlhyX8uBOd4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790124431; v=1; x=1790729231;
 b=AFoWqi63qwIRf3n1HpxKWvNAP5UJ1zBqQnaVMItBrT93KtU+t5KvccY7KSm956c6wQdNcbHg
 ACEpfeu+kmQO9E2+xqpxLFK1/w9kVDlid64NUluXrMjGWI5X4+V2ViaTnQHAezgQvC5V3YYsNsw
 74JVIhWmz9LoBtbepfX6pTD0=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1c20460528d8374e;
	Wed, 23 Sep 2026 00:47:11 +0000
X-Mizu-Trace-ID: 1c20460528d8374e
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"busybox11" <busybox11th@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 0/2] platform/x86: asus-armoury: reorganize visibility and extend dgpu_disable
Date: Wed, 23 Sep 2026 00:47:04 +0000
Message-ID: <20260923004706.41256-1-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patchset reorganizes the visibility of attribute groups in the Asus
Armoury driver and extends the dGPU disable functionality with a fallback
DEVID for the ProArt H7606 series.

This good idea comes from Ilpo and this patchset is the result of our
productive exchange (link below).

The original author of the patch has stated that he/she wants to remain
anonymous, and asked me to respect that, therefore I will only reuse
the DEVID information from that patch and the commit text as everything
else has become irrelevant anyway after the reorganization of the driver.

Link: https://lore.kernel.org/all/20260810-asus_armoury_dgpu_new_devid-v1-1-0a5c845414e4@gmail.com/

Changelog:

Link v1: https://lore.kernel.org/all/20260916154210.181441-1-denis.benato@linux.dev/

- v1
  - platform/x86: asus-armoury: let attribute groups decide their own visibility
    - simplify the .c source of the driver making extensive use of .is_visible

Cc: busybox11 <busybox11th@gmail.com>

Denis Benato (2):
  platform/x86: asus-armoury: let attribute groups decide their own
    visibility
  platform/x86: asus-armoury: add dGPU disable fallback DEVID for ProArt
    H7606 series

 drivers/platform/x86/asus-armoury.c        | 282 +++++++++------------
 drivers/platform/x86/asus-armoury.h        | 124 +++++++--
 include/linux/platform_data/x86/asus-wmi.h |   3 +
 3 files changed, 218 insertions(+), 191 deletions(-)

-- 
2.47.3

