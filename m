Received: from 7.mo582.mail-out.ovh.net (7.mo582.mail-out.ovh.net [46.105.59.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A5713DBA0
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.59.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092508; cv=none; b=SOITXwjX2sGOrnP4s2U6F5/jZ3fon+QTCMaxamqGygvEeRDaoKN/DAWvQFKU1gUx2Gh0ouR66uEYC0KlOpr5Qijjuq3v+tRLkftAMnn1NRgd7kLnZPETYN2HjEnBvY9FDxZrB8M86J81xOLWOx/SBJghA/xhSH/er+FiblQXsnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092508; c=relaxed/simple;
	bh=eSctgonx8toWB3ATfaZcPCqjyVFvv/bDod10ih1B7B0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TcFHkbS3XrNqnEgCQ8/FdCd9ariNimeuCs+q5Hz8N4XwIycyhO022Hty+Nd9zGYP5dkPf0A2wmUDM3GyJyO9Wa8xU8jVGwkL5Nv+9+ZSGr7NX1LAIjQfcSp0KuRHSwF8JbI0KnTtbNN8Pg8w9bK00ralTslIMijR+rgQrrMYXHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=Q1jOp/1n; arc=none smtp.client-ip=46.105.59.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="Q1jOp/1n"
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.17.58])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZNpnd3T2Cz1Ymf
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:21:41 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-q4c9d (unknown [10.110.101.246])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BEE021FD4B;
	Thu, 27 Mar 2025 16:21:40 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
	by ghost-submission-5b5ff79f4f-q4c9d with ESMTPSA
	id qF9+JBR75Wcm7gUAzBdejQ
	(envelope-from <michal.kopec@3mdeb.com>); Thu, 27 Mar 2025 16:21:40 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S00208a83488-e6ac-4ebd-a58a-7d4681c6d6ed,
                    05DB09BA71DD90540B36DFBD267885ED49907206) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com
Subject: [PATCH v2 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Thu, 27 Mar 2025 17:21:12 +0100
Message-ID: <20250327162113.571940-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8868995043632942349
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=dusM831Tr3p3jfBI1jowUV1SP1JHB+9S1CA3ZpY29RA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743092501; v=1;
 b=Q1jOp/1nB6ovLfOwl5aj3xYyw4vtHros9gYSlnSUFHbOj8usKB9bQvVS4i94EfaAXTf9a4+e
 enEzVYpesS+2pimzoQ1P8ZCUcXfIQT1XYgLZ4eIAhzAGCe1myVsgOkJrru1oaW0DWKfIV2oqRcY
 Zg8D7HSNfFIMc7SIMOGOFNFNsVHNvaqHyIpVyXorw95FZWky+Sg8wnE8uYG52KhJ6hkd3PVgqU+
 97G1rKOjz96m/RoCF698kXz7KCUS/BOkD2VqVui+ReDI4PXzEQ53BjEKXIOEccf0JRC4+kP0vWI
 ASn7PyQEuBkR90A8la64qcA2FUDdofCA+WL4V3JAW7gaw==

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

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 375 ++++++++++++++++++++++++++++
 3 files changed, 388 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0

