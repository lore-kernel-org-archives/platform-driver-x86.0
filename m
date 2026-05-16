Received: from outbound.st.icloud.com (p-east2-cluster6-host2-snip4-4.eps.apple.com [57.103.76.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E915418DB1A
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778915236; cv=none; b=h7L3Xx0zq1QwDcJZYQ6osWN8gNEM+afpH1U4wdhj3+ULx7BeCYnlnhBPrkHrD/+m42xQh9dvQ0tIEC9dwjBWwDmyscRfSwEsh+37uc1zP+J4PxvK6EpWq4utDQv+kqdwC614JJ2uFkSSrX+wy9FmogzBMekIJuFprYvMikcaTrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778915236; c=relaxed/simple;
	bh=73insC5T0AeVlaEyZnP8POsvpSIMoEvhr0e71OpkB+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=su6uKfrWTBXW4oD/Q0AM5GzR5gqWvZtLtpVhOs/QH70LWhXQ9IaM4SHuXy60Z2dZW3gql7hO4mql+OhQQAcRv5Hgaxe5X/wIIBBvzsLRfF0YMMeuP1kwHJ1yyvgZiXxPEXRJuHaQcm8/fp/t1NpYpNZuiq0Pf9B6pURgAqrx9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=OYB6ySIp; arc=none smtp.client-ip=57.103.76.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="OYB6ySIp"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id 5883C18005A4;
	Sat, 16 May 2026 07:07:12 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEG1sIUhhXE1gTVl8OXQIwUBtfAkIPHBNWFRMLU1ZRGFwdQAhUClkVC0EFXXcCURxWDVdDVARfUEsbDloXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BeCF4fTBwdDlgGEh1QHA5RBVsARglNAlsHXAJGDEgdVANeBl0IVVAFUg5BFVoZWAgFUgRAeRFQAVgeVl5aF15TFx9LAFxFWg5bBEcU
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778915234; x=1781507234; bh=cnwn2KMhgJMjHIBc+zqe94/lk6fW6pUCJCcxgef4qAU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=OYB6ySIpevBN2FPgI4FNm/pqcrRG1/47F6OCi0ZvA1eARkZsdLQ3jZlKJUKqay09xUqbLK24eo8RC/FHsRPDn7FzcHXwlcsnGxv4UQPzm0qiWtNl4dsVL8I2stosaIP8HKWerLgibASH7m+p3DqlSOxVryzvQIrhmTtX8u/y7QNU/62Fy1SZSKJFqbkamMHf6gcody3ivoOn31G7BEM7R43Az71qp3tubUPth6/uo5QwhX6bRc2Qo3LC+/M6ZlXGrDfDj+gRqwVcnoORIx5fq5FExl2mdCkKVC/fVvcmmcisFKsp8OQVwmYqclaUxX7o0sBVHpSnZkx/FVSvs8HklA==
Received: from localhost.localdomain (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id E7E191800348;
	Sat, 16 May 2026 07:07:09 +0000 (UTC)
From: Cheesecake <cheesecake2960@icloud.com>
To: corbet@lwn.net
Cc: W_Armin@gmx.de,
	skhan@linuxfoundation.org,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheesecake <cheesecake2960@icloud.com>
Subject: [PATCH] docs: fix typo in uniwill-laptop.rst
Date: Sat, 16 May 2026 16:06:50 +0900
Message-ID: <20260516070650.9454-1-cheesecake2960@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _cxffX7dRJAOLSoIEQcndxFqpTPlQ2JO
X-Authority-Info-Out: v=2.4 cv=PfzyRyhd c=1 sm=1 tr=0 ts=6a0817a1
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=sIGCgqHK338A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=v3ZZPjhaAAAA:8
 a=qOMYXKSGN7icZ86_DFIA:9
X-Proofpoint-GUID: _cxffX7dRJAOLSoIEQcndxFqpTPlQ2JO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDA2OCBTYWx0ZWRfXxJR26vZ2KklV
 33j3lbos/6Iu955eVPvDOMeRjCO0rZrmtBIOXsl3kQJTPQPrP9ga8muep8i9/JxnqArSbyS/nOS
 dVKCVmxKU+6AJUIY88diwP1ka6USdIXmkABMXX5j5gyi23vFOrlsgpF/kHd6l2KWuPwtTelVY1H
 Avn0kmYTcSEWl9nwDYvNLwlHOqslsWosqcmzhTgdseGhzo8gEp2jIPEmqsOSxu6/rUQhZdcEr89
 wNfgxs2njGSR77a2CHr03gPS6wwgARr0yP3/Ff10LQHTN+RUw33Yc9i369Q6HpIwPR0yx2hauI9
 19XFeqRnh9lkK2TDqxp164kt/VRbLDIlK6yAvZihLFiXneBXlYzl50J1G0+2gY=
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Replace "benifit" with "benefit".

Signed-off-by: Cheesecake <cheesecake2960@icloud.com>
---
 Documentation/wmi/devices/uniwill-laptop.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
index e246bf293..65583b239 100644
--- a/Documentation/wmi/devices/uniwill-laptop.rst
+++ b/Documentation/wmi/devices/uniwill-laptop.rst
@@ -189,7 +189,7 @@ Indexed IO
 
 Indexed IO with IO ports with a granularity of a single byte can be performed using the ``RIOP``
 (read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are unused because they
-provide no benifit when compared to the native IO port access functions provided by the kernel.
+provide no benefit when compared to the native IO port access functions provided by the kernel.
 
 Special thanks go to github user `pobrn` which developed the
 `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
-- 
2.54.0

