Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.26.1.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568239;
	b=yIZ0TIkWEzeSWBQmHrvwNY19psMDIipF9tNgbBtqNQyqs3EgQWgB/G1anQ5uFRmsEjo5
	 43wz7bCyVO7KIyBVRQ46C7aMh0ml1MqIHSAeD4jp9Ff3bfd0WRFoVHijzKVDJPSgD3+65
	 E+o2jkaToRGTjSMOvK7/8rTTMSQKlwzHrOtPT5gr4imP9AC05+hvf48pNw0VS4lemmKSq
	 dYx8DoNNeagWmsH3mbGRecXC1lpZgSf9fZjAFdJscat8URIwVeWGpf6Y1Sp54khw2Gf8V
	 VTvbtL839CW69J4u4Iu71HEDoVEODuTfBZkG4qRbdrz2W590gbhnqnstL4x6s3haggQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568239;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Vz8zzO+pbP/JF+uMRgI6d/03y9BDYJeIS3sGQ4sLnXE=;
	b=3M7oXtqH++H1VAtLsdV3REPuGsdd6UKMIJGngPzesm8jJQzhEQxISZCxu8lPVDm9IA06
	 TeKJnuprc6QqQK5m3IbNVJ7xmlzKLKbgZrJsnLkFP7yf24I3uwUYrCXsmIbIrvhmIvlYK
	 PfqCD2j8wABOjsTy9sOZxnoZK+lPJebIJDfcLQd1S3ySynTCGrqtUCeUfEFnOw8ib02Ep
	 sf89m7uoj9Jdxuu04ODe8MVL8SQbUF8eQpxMzrQnsMs7zUOsKlipUeeob8JOoqAUBCCQ2
	 1rKbL6smlyDo5/cFCWM/NLzsdBeCMJrZ5wjq0Abq0uZjYNc11L+RST127DmEjo0qwWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=cF1KOV4d;
	arc=none smtp.remote-ip=52.26.1.71
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54414606A31C;
	Fri, 13 Nov 2026 11:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54414606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=cF1KOV4d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794568239; x=1826104239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vz8zzO+pbP/JF+uMRgI6d/03y9BDYJeIS3sGQ4sLnXE=;
  b=cF1KOV4dMz5XK3B1fGxd4nsTUphuUiXpMJJ1d/X41W21oqSSGsSWagBh
   e7/PVHqZLQgaK4lJv998MUNJt6rhhw94YlV7si9Lo8p8oLKeDSgOIgWH0
   thQPlsmLoUa8697d/FfPcJJxBr0XkeniATRLAT4+8BeWBLrVk+2SCvCl5
   XyLvHGPn4tqFZfZcRzSXLSQnvAbIo6/dPhu4T7ml55qNTc8hwzG17/qy0
   pEQAbsDm8vlYwZkRCbOiQxtWXPGMv/C+m/NpKRkH9aCxDbU7nI9PF/v5U
   u3nzMS9Q6FDr35yFV+4uDSR8YDSm2h4xdsiTiXrjGoMOxBeDvdy7tZ2C9
   g==;
X-CSE-ConnectionGUID: Ele8y9ppQEOlE9qIPEGVUA==
X-CSE-MsgGUID: 3KXpxjurQmKHNUCiASgw8A==
X-IronPort-AV: E=Sophos;i="6.27,211,1787011200"; 
   d="scan'208";a="33904360"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 11:10:36 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:20861]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id 0aef0347-fa85-4826-ac3f-b310689a5e78; Fri, 13 Nov 2026 11:10:36 +0000 (UTC)
X-Farcaster-Flow-ID: 0aef0347-fa85-4826-ac3f-b310689a5e78
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 13 Nov 2026 11:10:36 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Fri, 13 Nov 2026
 11:10:34 +0000
From: Eliav Farber <farbere@amazon.com>
To: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Eliav Farber <farbere@amazon.com>
Subject: Re: [PATCH v6 5/7] platform/x86: uniwill-wmi: use devm_blocking_notifier_chain_register()
Date: Fri, 13 Nov 2026 11:10:31 +0000
Message-ID: <20261113111031.35665-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113104459.35839-1-farbere@amazon.com>
References: <20261113104459.35839-1-farbere@amazon.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

This patch is not in the series thread. My mail server refused the second
half of the series with a submission rate limit, and the resend went out
unthreaded, so 5/7, 6/7 and 7/7 are rooted at 5/7 instead of under the cover
letter.

The cover letter and patches 1/7 to 4/7 are here:

  0/7 https://lore.kernel.org/all/20261113104218.32566-1-farbere@amazon.com/

All seven patches were delivered, so I am not resending them. Sorry for the
split thread.

--
Thanks, Eliav
