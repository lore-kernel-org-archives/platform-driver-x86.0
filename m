Received: from 8.mo582.mail-out.ovh.net (8.mo582.mail-out.ovh.net [178.33.42.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B061BF58
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.42.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170526; cv=none; b=KRN/k5dvxAGwQqel6xUWPfhjmBmlKb6pN1laOUfvWOzepCkPUcWgICb3+3ppw05fNWHxtSr5++XZPjEluHk6y0kzaufPbF1KRq5Greg7ZUWjuMJ3G1YVaekKEGmyLgaSVrqPWLG2YvcYPMDmuLCXzudCWWgpkTexIvtxGnIkTKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170526; c=relaxed/simple;
	bh=oaeF4PSL9pJrT5nCEtpIutiAM3jBpBAF/la/vmlBwJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CU4PgzKuop+Bt2G/FGKRrqrtu2FN+dYPSwNqHPq9Tx5PKJCHQ5n9WVg72/z2aFTFYgI5cPFiCZCOmugcY6l12Quha5gso4jjmaWeNNtqYN0XVfQz8VE6HGymotf31xPpeQnlmnADH50LlLtbbG17MGpV6gv51h4gGAavzZKVTJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=AfUTVqXD; arc=none smtp.client-ip=178.33.42.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="AfUTVqXD"
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.148.200])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZPMdr6KGWz1TQJ
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 14:01:52 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-dt6n8 (unknown [10.111.182.240])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2E2F11FEBC;
	Fri, 28 Mar 2025 14:01:52 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-dt6n8 with ESMTPSA
	id qSp9L8+r5mfPyQAA/S+2gA
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 28 Mar 2025 14:01:52 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S0017ee9eba3-2fb7-4d11-936e-8e6b35aafc31,
                    A89BE30734CE273C0743E56753A14E38265E1AE9) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com
Subject: [PATCH v2 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Fri, 28 Mar 2025 15:01:31 +0100
Message-ID: <20250328140132.1303512-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12380395376205958413
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedugeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=//aJP8q/mJxcNNnqF4b+YzeNrE8e3kUw3e3C6Yt7lsM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743170513; v=1;
 b=AfUTVqXDP2oElY7UndnOAI9u/0AebOqG8agmDEGAQWIqUVyAUCL2pchJL2tMFJQN8xAwPEof
 iFuTc6TJ+h2VhWRWYLqWTN9OL2MyODRp76zXKVgE+qGZAY32MBDm1c4O19xtkAQrSJTWFzbUN+/
 Nod6mjLMQhPQeVJjNcS1hKSFSv6xN/uIfF5kfhDFHyqVZcgsFDMIkU/h7/v8bT+Cf5fbr3yJ6Oz
 R/htKMz0oRDKdmFGTBP4saDLKFBsMgCihdUoGkax3qENyd8Zd6SujS+a4NgegyuNaY0ehupcoTv
 IHu1IsLFoEzjADgT+P/9NJH+rFsSirmhpBDymFI+1Lnhw==

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

