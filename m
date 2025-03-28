Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net [87.98.172.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00DD18C322
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 14:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.172.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170973; cv=none; b=LBwqOBEgedskyycGzutgw8WiwLg/ytoxKAC8xasYNVxZ0doy18Gt42d3jIn1Q3W7vP3r4P23ENHCegQ2m8Fh//zDRTATat63WUJzRdCzQbvtcNwWLIWkAjiIexWaryjiqaeWnHf4iycfwiVeE01usgNtHDmk9ACcB+H4FkHYfOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170973; c=relaxed/simple;
	bh=oaeF4PSL9pJrT5nCEtpIutiAM3jBpBAF/la/vmlBwJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FSpP+XvopwPi51eQJRAQ1Xaoc2QYLnRpnjIdtN5fzOGttlEuXI1y8ABkBbnQNXw+q1uzjBfqwuYzURzpz97Tc37OCXOxRytS0LkBZD5WJXkJX7j3MWOP5lr9neSHFCgh2nQKopyUebB+TxJ00qA/jyh+886zEC+aBTR6AzXkcT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=U4Dcov7Y; arc=none smtp.client-ip=87.98.172.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="U4Dcov7Y"
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.9.185])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZPMh40H34z1f7r
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 14:03:48 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-9qz8d (unknown [10.110.168.82])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 372F31FE05;
	Fri, 28 Mar 2025 14:03:47 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
	by ghost-submission-5b5ff79f4f-9qz8d with ESMTPSA
	id 7mNJBEOs5mcCDQEAdUo8nA
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 28 Mar 2025 14:03:47 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-105G006105c1940-2545-47e1-b4d4-e35806fde9ef,
                    A89BE30734CE273C0743E56753A14E38265E1AE9) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	tomasz.pakula.oficjalny@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com
Subject: [PATCH v3 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Fri, 28 Mar 2025 15:03:43 +0100
Message-ID: <20250328140344.1304995-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12413046474199797005
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedugeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=//aJP8q/mJxcNNnqF4b+YzeNrE8e3kUw3e3C6Yt7lsM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743170628; v=1;
 b=U4Dcov7Yy9unTBD4CXprhVEA9mYpEQ/FOwWB+4M0v9XTxaEvMXgsDlEoInQyYI92Bsm46dIm
 LvcGp31QpU9XkPueYq9hsZ0ZozwncLmi7lz7oKW7fmIi/5eDB0GXYCAXNT86fi1m581lsDo+eNY
 geKw9Dn+WTXj4EtBTTU1HsjffejFRLQrkzIPdVzWnzuaOHadLzwWqVbdtMXqhHmTqiBWJOLUbZf
 mW5y43NySlxACPuHt3YtROSA0bc5sXSOm0JxNlnKQCDdi5Ib7lyarE5mh++w2MKzEbiFw2mx+q+
 HaTL7yGrDlbKYPQZoVxv+kzKVZJ9dzjixPwIprdAF0xeQ==

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

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 375 ++++++++++++++++++++++++++++
 3 files changed, 388 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0

