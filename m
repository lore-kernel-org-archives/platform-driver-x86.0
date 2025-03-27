Received: from 15.mo582.mail-out.ovh.net (15.mo582.mail-out.ovh.net [188.165.39.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964A54782
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 23:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.39.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743117825; cv=none; b=gPYBMvzwCFWlkhezceCRCmqTlY/n421sqFeJVnDWGDV5muY5Dw+dqTdtf3n1r36MBq3UC6Bh4IfPvuW38hE6CJGYZvLgAz9FXg3byJNBZq5XY2WC1to+OG95dh1T+FC+WihzobpFfbnVJ1QjGebmzv/ybgawD5g0iEkAjrnnoZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743117825; c=relaxed/simple;
	bh=9t8eB6nh/mKG2Sff5kkYdBBytwhzgSD06CPzKC3EtWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WCYG6qGPPBDAURWJuIudpXTx5Jl/pHjIFC6NNZIUu6eBJtn1Aq78bihSuXnAGx1JaUTcHeOLFWaCtcBdmyUx2hsczgYGVoB66vOzeFwe53DIHwT3XOZmy1z76Tn4LEzgk0qxeLDnEnkrY/xIVLaK3SKGVaVa47VGV21GK5PelVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=eVDIeT6g; arc=none smtp.client-ip=188.165.39.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="eVDIeT6g"
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.25.249])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZNhSr4Vccz1TD8
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 11:36:44 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6vhnb (unknown [10.111.174.181])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C141F1FD1A;
	Thu, 27 Mar 2025 11:36:43 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-6vhnb with ESMTPSA
	id 7yJBHks45WcSBAAAcBNYtg
	(envelope-from <michal.kopec@3mdeb.com>); Thu, 27 Mar 2025 11:36:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S0015c085acd-56b3-4eaf-bd7c-05016529e39c,
                    05DB09BA71DD90540B36DFBD267885ED49907206) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:89.64.23.248
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com
Subject: [PATCH 0/1] platform/x86: introduce dasharo-acpi platform driver
Date: Thu, 27 Mar 2025 12:36:33 +0100
Message-ID: <20250327113634.314746-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4056617367278193960
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpkeelrdeigedrvdefrddvgeekpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=masCL4F9s4eNw4qEeX+/c3ij1j5tfdCaeZbc0jbJN8E=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743075404; v=1;
 b=eVDIeT6gL7V9wstJUW9HCBbBBrHRGFKuMZCN3olRHux1wa9PPl07ej1lmjU6r3UqJI5lUm3C
 pemCx4nOda8/4YhsO/x2UJAEjJGqafek3IsL32yrjWYbouC5GN/ANMo6Wg+2m25qD32Pqk5M6Al
 EMbImmuzAJgAlYwH3VmSJfz6z7qa6lYVU0iFZD7C23b1/pxSQdBBn86EMnuhl4hIwAaDGROp4Rh
 qGUFVGZO1tzlJ74Pkuqn53Y6MUDMa4mIEqFYTd9KJqwP1+gBm/S/wZa2h6J9RjdG8U3qkrUrj6h
 +klF0V4YjTOdk96Mfea34ICzm4g7Vx8SVU+DWrl+exIWw==

This patch introduces a new platform driver for devices running Dasharo
firmware. Dasharo is an open-source boot firmware distribution that
comes with devices from vendors such as NovaCustom, for whom the initial
version of this driver has been developed.

The initial version implements HWMON support for fan tachometer, duty
cycle, and system temperature.

It is my first major patch, so it is highly likely that I've made
mistakes. The ACPI interface for this driver has been developed
alongside this driver, and the design may still be modified, if needed.

Kind regards,
Michał Kopeć

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 399 ++++++++++++++++++++++++++++
 3 files changed, 412 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0

