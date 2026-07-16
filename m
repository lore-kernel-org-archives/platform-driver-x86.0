Received: from mailer241.gate86.rs.smtp.com (mailer241.gate86.rs.smtp.com [74.91.86.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032441F7D7
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.91.86.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207100; cv=none; b=ipAIgeMEblrSq7MaWT840CneT7ddq8GErYsIa1Jx0CyYgMDcx3xkVmuL15eFIFoFMhE/7Y+xxTnwsSavvx89Yatn1D79VZ5Tq2m4ujcX91rMOccgev/d5OQPRUh/iFNR1m+LLj5xn9xbDpZ65TTbHHPj9eM9YGDGCKdBRBpmNQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207100; c=relaxed/simple;
	bh=Rn89dfL6FWPUehEVjmWIx5moDiRsrqTA+wfW2mcNVN0=;
	h=From:Subject:To:Content-Type:Date:Message-Id; b=fzePQKIDMKgxatsCZkQtzwM/NVyjebeq8ATKJpOY1XGECZhGZOwVuQyMRaOcx2HQLDj8K7t5+uePwjVqtqvRoBxWu172ehbrICqjRfIJsHN7HGosyxfZ3uU1t9bNAQFBOjEBeoltC2dcs6qCDmV9e6YeLglk0pnFG48ImFHCwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com; spf=pass smtp.mailfrom=computergamingpc.com; dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b=CV14ZM1b; dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b=eDbgP21f; arc=none smtp.client-ip=74.91.86.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b="CV14ZM1b";
	dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b="eDbgP21f"
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.3] (unknown [10.138.12.189])
	by mtl-mta02-out1 (Halon) with ESMTP
	id 50894ba2-97ef-46db-aee0-589a0c7a3f77;
	Thu, 16 Jul 2026 13:04:58 +0000 (UTC)
Received: Received from 10.138.12.169 by Caffeine
 (s0-aws-app2-swarm-manager-1) with SMTP id
 eb086329-5684-42e0-9848-472cf0814f13  for
 platform-driver-x86@vger.kernel.org;  Thu, 16 Jul 2026 13:04:35 +0000 (UTC)
Feedback-ID: 9194450:SMTPCOM
Received: from ObaTech (unknown [191.177.193.228])
	by s0-aws-app2-mta-in-2 (Halon) with ESMTPSA
	id eb086329-5684-42e0-9848-472cf0814f13;
	Thu, 16 Jul 2026 13:04:35 +0000 (UTC)
From: "Computer Gaming pc" <sales@computergamingpc.com>
Subject: Current Inventory Update: GPUs & Enterprise SSDs Available
To: <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Reply-To: <sales@computergamingpc.com>
Date: Thu, 16 Jul 2026 14:04:35 +0100
Priority: urgent
X-Priority: 1
Importance: high
Message-Id: <163520260704140E00A2DD10-A9195ADB05@computergamingpc.com>
X-SMTPCOM-Sender-ID: 9194450
X-SMTPCOM-Tracking-Number: eb086329-5684-42e0-9848-472cf0814f13
X-SMTPCOM-Message-ID: adc8678e-4ffa-41fb-8d24-b2662bf2aee0
X-SMTPCOM-Payload: 
 keq4AaoTChw0GOKjvU8Gs3_bYrLKDjvv6gqJaJ_8FX223R6gI4BLSfvfLYFoZjDYXTQhwoQJbnWCu6iARoLunX8C7i6_Vd9LU_otMDrmBvLKGMzU5iuWXV9xa8x2ONMDm1TUgkxE3cISAm3o60JAjMKVHs6AP7aWSTP0uv_i4c0gwDTOu1wGsweWo4CEdb00lCor1WUNimZnsdco2klX5g==
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=computergamingpc.com; i=@computergamingpc.com; q=dns/txt; s=smtpkey;
 t=1784207080; h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=Rn89dfL6FWPUehEVjmWIx5moDiRsrqTA+wfW2mcNVN0=;
 b=CV14ZM1bITLkj4INA2sXcT/3Mq/1kWwbdoE/EXYnVezAPeyup8vH5MTbZGGxYgPZyhoAq
 wa11ZtyeMtW+5k+JyGPFkgCoaUa/WF1mN14RuRXIAAp17K8u+sceMKiGhbeVQS/Vby55p7y
 tCkgH+00aZ4inzmCnXkxvVxyS23TVuuFMedtRdGYrD0LKcpP2EL9mE6hrIeim/l1O64bsoU
 /m0onzrpvo+psJBp2BhZ08HGXhid4BhzMu7UadZnOF+T1Bpvs2nxucxVsN928bOu82lr+0u
 pJTacOriCbQELokbLKDorSTOegNrBVpL8WcB49HTcO6fcugeFqnY8gFDvNTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpmessage.com;
 i=@smtpmessage.com; q=dns/txt; s=smtpcustomer; t=1784207080;
 h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=Rn89dfL6FWPUehEVjmWIx5moDiRsrqTA+wfW2mcNVN0=;
 b=eDbgP21f9xJzcTo11nT3uQ51q6vSrNfBkyQyX1/hnYHi5muMD/1eG229GCF2PoG8WazSU
 /onsmNE5b0TtmPHXTTsmbOgB9TMUF1Sj7aXauc/QJuxe1dwGjg9+OIbbL49xEYVpCtiWUW6
 qZcqEuJC0F0FmyyZE1NnjT6EfwiYaVrBqmnE1O5+DDuD1j5TG3WywrwDMWcGvK5zOX/Ow6F
 m/vIPJafimVSCR1RecMX6T1kKJp5N5YoSkO0n1OrCRigQ6hXWsnlfN3DmnaNY8UnahwnYQN
 8mZuUhllSwznVZDWGiiQpHLyc4fYxTRH2Bd+Gk7aIdNXMUjI4Dmc7sBb1aaw==
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Hi
Quick update — these units are in stock and can ship today:

Memory Modules
* 128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (Qty: 980) – $140.00
* 32GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,500) – $140.00
* 64GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,200) – $450.00
* 32GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,500) – $150.00
* 64GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,100) – $450.00
* 32GB 2Rx4 PC4-2400T (Qty: 1,500) – $45.00
* 32GB 2Rx4 PC4-3200AA (Qty: 1,500) – $45.00
* 16GB 2Rx8 PC4-3200AA (Qty: 1,500) – $20.00

Solid State Drives
- SSD SATA 6G 3.84TB SFF (Qty: 450) – $120.00
- SSD SAS 12G 960GB SFF (Qty: 470) – $300.00
- SSD SAS 12G 1.92TB SFF (Qty: 560) – $350.00
- SSD SAS 12G 3.84TB SFF (Qty: 560) – $150.00
- SSD SATA 6G 1.92TB SFF (Qty: 450) – $100.00
- Samsung 990 PRO 1TB NVME SSD QTY:410 - $150

- HP (HPE) P43331-B21 64GB DDR5-4800 RDIMM QTY: 390 - $750
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 P43331-B21 (Qty: 500) – $750.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 P64707-B21 (Qty: 500) – $750.00
- DDR4 64GB 3200Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $450.00
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 Samsung (Qty: 500) – $450.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $550.00
- Intel Xeon Silver 4214R - QTY: 420 $350.00
- Intel Xeon Gold 5220R - QTY: 410 - $450.00
- Intel Xeon Platinum 8380: $450.00 QTY: 410
- AMD EPYC 7542 - QTY: 490-- $380.00

For quotes, availability, or inspection scheduling, please reach out 
directly:
sales@computergamingpc.com Call or WhatsApp: +1(774) 559-1248 | +1 (641)232-
4364
Thank you for your continued partnership.
Ann Kamila
Computer Gaming PC Trading
2500 US-6, Iowa City, IA 52240, USA.
To opt out of future updates, reply with “REMOVE” in the subject line.
