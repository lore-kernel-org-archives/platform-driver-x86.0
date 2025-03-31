Received: from 17.mo582.mail-out.ovh.net (17.mo582.mail-out.ovh.net [46.105.36.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC121A955
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Mar 2025 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.36.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433463; cv=none; b=LkjpNdDCU1oZh3brQTizhpU1CjL0zVPBqPSZwu+pQlHFnLWYvmAT2suP+gbo1owqTtaDy2e4erZcZeBbIThNwlxfr1IbW5whD0Vze9aUu0JDOc3Nv1n/Lm/gIxqDbeXsPm22+fiMkU9cuAwg19xIAYbxq2vfvr4wDj5EK8/vePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433463; c=relaxed/simple;
	bh=TjPFzSUnPbPRgTscjsJmd0n4OCJ9hkWeITeAT4SIS3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T/ZovoTdkyHvxfujocOZlsBlBpkwGQSgDMbehbFAHZuCKLmPRMUkJqpllIEvN+1WOHsau3EBxghxXEidVbmVgkNYWVEzB20jiC86GJ1hEqYjEdAMHjew/eSq5Q5wzhNwungbXRKBMq56qN49jq85eyS2/od4GAPM3yXuZzvj8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=k8oBLQFz; arc=none smtp.client-ip=46.105.36.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="k8oBLQFz"
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.176.101])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZRDtM362rz1LMW
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Mar 2025 15:04:11 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-z77lt (unknown [10.108.42.32])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 31FF41FEB0;
	Mon, 31 Mar 2025 15:04:10 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.112])
	by ghost-submission-5b5ff79f4f-z77lt with ESMTPSA
	id LsokNOmu6mczfAAAaRWDkw
	(envelope-from <michal.kopec@3mdeb.com>); Mon, 31 Mar 2025 15:04:10 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-112S0065bc1be9b-8226-4a4d-9b31-578571ccbd9a,
                    022D63F0A2E1D1A994006CE925429A65688265DF) smtp.auth=michal.kopec@3mdeb.com
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
Subject: [PATCH v4 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Mon, 31 Mar 2025 17:03:52 +0200
Message-ID: <20250331150353.127067-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12604167982617857433
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdduuddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=1nyfr4gmsPdJ+V2tJgtrLfho+pZBvZ3IvyLJvPNq434=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743433451; v=1;
 b=k8oBLQFzmnz4gY+9EVqsh3cqYqwcqiYNvQyXQkafoLDE1I8yFR1M4BRxHpk9uLISu64tts/E
 zn5k2odk8xRPOsFbJkz1vVCy22abxjbsP9/Z+eSqyt7gR2rku8ohKUcEfvi3GQArKsnDJjtE36u
 GDK4TZm/kCCagRZbclAubOGtUGamMUdS5pvPWDivWvJTg9//vDqz8mYz8epNBfINRRzcJSfZRou
 IrXvIW13FSz2GYq7AusesEm6iXWGs4WN8l8rypBtYxYg4UJ/PRcwDzIhgVtn9lWKa5gO5RjssdH
 DzTIEsI7IWHqIDhQ1BgJT7m0dRR8V9+x8E7sRbF2ZFxPA==

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

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 MAINTAINERS                         |   7 +
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 357 ++++++++++++++++++++++++++++
 4 files changed, 377 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0

