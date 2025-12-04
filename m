Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64B29D268;
	Thu,  4 Dec 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764856294; cv=none; b=Vw1umsj/eW2bvPqr0MuwRXREBLbN51CgNYRihlCfmGRKp6eXd7k0e9VrWPEsDHDK7gKGX+EPP+uc1JENiOrumGKJ4+SqzeAgpeDxBulLZKtO48+X2Ac8VYOpph/qMvKhBhDcCZ86NOVFDBOQ/RKjL0qEoh1faNoF0J+LFHdEiSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764856294; c=relaxed/simple;
	bh=ydjO08ILoei/tpfgh9i8ZkNaJHq12NHERTEv3sE8epA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbhtTXTDQY0uZmslao3Yp3jypyRk90U/D/tCa4w3b01f5O4ymN8E6uV692ke5cKtCFrjM1gIW1MN6D6ww1sXLDygiyuwFPAzKA+gbMkejV1Bvj62ystoD4SC0/sx86DnQjt+Qr/srA+CMrt5ZXph0aiVb+cLB4gjEiW+EUU6tsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=KXXiK71d; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="KXXiK71d"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 9BBEB2FC0093;
	Thu,  4 Dec 2025 14:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764856284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=luKvesMgTKBIcSLFGqgzDdEzveIX07CaVsZ2/nrYEyM=;
	b=KXXiK71d31zkOX4EErSHJ5Wout6uxVVeOjx5OR63lOTpTRmvcOY6K94UuF/yN0terdWN1U
	byQ4QU6flej7KaxdNnXnTlqFYHRKxrJaYrsO24gsZ8CNNNdG7ayj6s/yun2jTYvLfQFhQ5
	ZQeDrRExPpedL3HJDLD8GWYDZcvZJjk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 0/2] platform/x86: uniwill-laptop: Introduce device descriptor system
Date: Thu,  4 Dec 2025 14:50:02 +0100
Message-ID: <20251204135121.435905-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch is based on a PoC by Armin and extended the be able to
modify feature bits based on readouts from the EC Memory.

The 2nd patch is a new feature that requires such a modification.

Changes since RFC: - more flexible uniwill_device_supports
                   - minor cleanups
                   - initialization of cTGP before activation

Sorry for the spam, accidentially still had the --rfc in the command line of
send-email.

Armin Wolf (1):
  platform/x86: uniwill-laptop: Introduce device descriptor system

Werner Sembach (1):
  platform/x86/uniwill: Implement cTGP setting

 drivers/platform/x86/uniwill/uniwill-acpi.c | 284 ++++++++++++++++++--
 1 file changed, 255 insertions(+), 29 deletions(-)

-- 
2.43.0

