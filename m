Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1093D16E7
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265398; cv=none; b=qJNKLuF+DZxkwiD5HZYH/xQkGqkvj+eVE3X55DzsvQGdusMDymHR673f/n2QUhki2HbjjF1jasVzg27SVThiI87df9QE1eBjdzBbEMRJf34CBm0cvWZH/jgTPziRxFzkM3r7ro0LLii2OMFTvNxLnO2vvrFEbl8vAFSbT4b8bJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265398; c=relaxed/simple;
	bh=Do1cuLbhsxfG5NCWRz35OhgW44WWb42ACm15kmXDGgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/Bhcu7WJzA28MJi3Hk3Sp++17N0H+VF6gPViyFDs4VxnJYrzUwrALKUAuM6XBaUktCFg29exPFQoM0evGMJ8iAyiAacn58HrFXPyEyyUvAMqy4Z0H00Htj72mfbHg6Jt+pSyU8NG3GG2ipzJAB9zNB6grwAQPGpBG1vlXuTabM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QYpOT9ES; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QYpOT9ES"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781265392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wqtWg0yAuDd7t/RO+IN2TlwZgVQguiKLIAjw8WmMrak=;
	b=QYpOT9ESzca6UvWblMo1CnhrltMmfwRS7FYIUopshdHTdgEG+mlcsrJeDvcdRa0m+W3tN8
	ilEhQ3dpR3+Gwuob5Eqc1EoKkZQd/JRoWw7OmcL5k1VN/HqNEnsqJty7Ott9t72X1gLv0R
	7BiHeDPDfXym9sEp4jK6mCjIHA6qTWo=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/3] platform/x86: asus-armoury: more ppt data
Date: Fri, 12 Jun 2026 11:56:24 +0000
Message-ID: <20260612115628.964152-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

This patch series adds support for three more ASUS models to the asus-armoury driver:
the GA402NJ, GA403UM, and FX608JPR.

Cheers!

Denis Benato (3):
  platform/x86: asus-armoury: add support for GA402NJ
  platform/x86: asus-armoury: add support for GA403UM
  platform/x86: asus-armoury: add support for FX608JPR

 drivers/platform/x86/asus-armoury.h | 92 +++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

-- 
2.47.3

