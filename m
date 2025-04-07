Received: from 7.mo583.mail-out.ovh.net (7.mo583.mail-out.ovh.net [178.32.124.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46652140E3C
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.124.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039285; cv=none; b=G9ghGNsX8w2gtMODa8TTfdh+cxHjELyiB8Asiab7KmAYJiOfmhD9TQf7uwv1TFWHiq6iU5Y6QGBwFG7poYdymUL7fYRliZdD/ThixX9hJKu735XLfNLgFeDWwwIe1/7P7jn+R0qU/GF5BNXV544kdF2BdRJQ6nrDX8crxghJDiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039285; c=relaxed/simple;
	bh=ri/Q71c6p0NfoGvBcO9l27Ztt6As2I80kAoK2yHHV3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a8+XPciHjl1aOLi+7iwET590dlUIVk4kXt7JjYPr5KYq6xnSzBaBkUY7VIDOQLGp62HjA45J4r8nupR/GJSktKzGsuPSnrHZvWU//oZYdI6vu82XXKiwWF9IechtjYy9HFtk33VUbprMjIQ7AtEtmrDxhGbBezcd4vqyHyEw6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=f9U1/uqC; arc=none smtp.client-ip=178.32.124.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="f9U1/uqC"
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.25.23])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZWTdC3Yfhz1Ryk
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 12:52:31 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-kfbdm (unknown [10.108.42.198])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 090071FEC8;
	Mon,  7 Apr 2025 12:52:29 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
	by ghost-submission-5b5ff79f4f-kfbdm with ESMTPSA
	id v4jKLY3K82fdGgAAEArC2g
	(envelope-from <michal.kopec@3mdeb.com>); Mon, 07 Apr 2025 12:52:29 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G00366dd81de-80f8-4d6f-ba43-ad97daa944b4,
                    49FEA267915985A1F78C17A329F0406DF60E39EF) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	tomasz.pakula.oficjalny@gmail.com,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v7 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Mon,  7 Apr 2025 14:52:09 +0200
Message-ID: <20250407125210.215794-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14595884920276716953
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=aA5fdCb3DjkZEhHkgEsxx15UGiq5j/wbfgoVeM7TrIM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1744030351; v=1;
 b=f9U1/uqC/Np8G3fAEdN6Rd/1cVl2u7OeIUbklA+aw41bx2AWY5FSTSw0L9fa7yZFy9S8OUpm
 eWxevyP8hGoZezhRHeOPtObXl7/b4G2DN5BAI3x7nyeRmdCVXsB0jlfieLp2oHF02Kb2WaDBdhs
 qJF/TTEFdWNbel/xk4GAuPPM1VQtd0cOI0fIh7feW0SXXStkyY0B1Hq9fqd18kJW4Gfo6sCZ0Jy
 26AvhjOkmnolxX3HslVcDREnGXcPtn9wagXNCh7Ac5ONDf3F5Z/h4NWhAZVqpu3PuZaaUTKPK+n
 cJvNnHdgRzKZtKBRk1uAlkwrebYEouHYy1x1CIhQyqTIg==

Introduce a driver for devices running Dasharo firmware. The driver
supports thermal monitoring using a new ACPI interface in Dasharo. The
initial version supports monitoring fan speeds, fan PWM duty cycles and
system temperatures as well as determining which specific interfaces are
implemented by firmware.

It has been tested on a NovaCustom laptop running pre-release Dasharo
firmware, which implements fan and thermal monitoring for the CPU and
the discrete GPU, if present.

Changes in v2:
- Remove redundant copyright information
- Turn dasharo_fill_* functions into single dasharo_fill_feature_caps
  function
- Code style fixes
- Turn large if / else blocks into switch / case
- Fix possible positive return values in hwmon read handler
- Change while loops to for loops
- Add local variable for data->sensors[data->sensors_count] in
  dasharo_fill_feature_caps
- Replace snprintf with scnprintf per Ilpo's review
- Keep the "ok" path silent

Changes in V3:
- Simplify dasharo_read_value_by_cap_idx arguments and rename to
  dasharo_read_channel

Changes in V4:
- Remove unnecessary linebreaks
- Simplify naming of variables
- Constify zone lookup table
- Remove unneeded includes
- Switch to platform_device API
- Remove unneeded driver remove handler
- Add myself to MAINTAINERS

Changes in V5:
- Fix up the MAINTAINERS entry
- Use PTR_ERR_OR_ZERO for the hwmon pointer in the register func
- Simplify if blocks in dasharo_hwmon_read
- Use ACPI_FAILURE instead of !ACPI_SUCCESS

Changes in V6:
- Validate input parameters in dasharo_read_channel
- Add default return code in dasharo_hwmon_read
- Return error if invalid channel is requested in hwmon_read_string
- Add missing include for ARRAY_SIZE
- Align line continuations in dasharo_probe

Changes in V7:
- Use cap count for bound checking in dasharo_read_channel

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 MAINTAINERS                         |   6 +
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 357 ++++++++++++++++++++++++++++
 4 files changed, 376 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0

