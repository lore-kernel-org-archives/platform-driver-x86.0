Received: from mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7556F4854F0
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593936; cv=none; b=EkBPJNnCdnvHbVv+e4QoBoY4ItGxqKvNNivnWAMGNWDYJ1uKvt4+kpH3cPCCy+zjbGueDx9LIfR4vjtaJpBihKTz+bDCUzRi1IIwWLPX+6wuzZPACjuo1+JNwOpOnpo/P92r3Od6Zhw0nGtfgXjz7iwl+xvxZJKtwGWgGw5/4dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593936; c=relaxed/simple;
	bh=hmKfVCLen13baZ+o0Le6d7BN5zcAvr0TjZzOdGbyQ1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klFC59/PT1W3eLQkHgPwjNCyC5MPPrhHqdEbte4RBqyDn0rR122eGMe7LUIlOUF8gMl68UszMZWQizKNs9DEGhkfhG5kTR8l1Ju0lnYUSvDlVoRP3ZAG4QkVwWHuYpIgvBMTkpkdlpPdVIIfPGuW38PGLKJJG9CA6EIRxe02plM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jimenezcarrero.com; spf=pass smtp.mailfrom=jimenezcarrero.com; dkim=pass (2048-bit key) header.d=jimenezcarrero.com header.i=@jimenezcarrero.com header.b=KOnT0/gU; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jimenezcarrero.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jimenezcarrero.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jimenezcarrero.com header.i=@jimenezcarrero.com header.b="KOnT0/gU"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hmKfVCLen13baZ+o0Le6d7BN5zcAvr0TjZzOdGbyQ1o=;
 c=simple/simple; d=jimenezcarrero.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789593917; v=1; x=1790198717;
 b=KOnT0/gU98JSnvnA855IUEQ9iqQafxrHbA/uLbGbck5GKZFKeL6YKO89padINqo6OzWA3VDz
 zXRJj+86vLsqp7rrMLBdWPuaxbu0bh1kHgl7ckjxsYTFBTm9ntiaBQBjK6wFKMRf10bDbRDwMQP
 UYwAVdjhcWyt73WNYnfArrFK2b8iJ0zsJ4yNmay93HUebrhH1muKqJg3SA1cBjhxTIYv41mT2Ee
 fgxGsyQKElysYvBidYQA4m5wc3TvqG+BtiR3r6I1HUvOWLMLyjCc2JdBQzhSn5Q7AmNp68TLgeZ
 9NhDVnOPAt0jWiVaX/zzEEg+CArfk4j/1338fejI0L0Gw==
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3a560847db53b00c;
	Wed, 16 Sep 2026 21:25:17 +0000
X-Mizu-Trace-ID: 3a560847db53b00c
X-Migadu-Flow: FLOW_OUT
From: Juan Jimenez Carrero <juan@jimenezcarrero.com>
To: khalilst@gmail.com
Cc: khalil@rentman.nl,
	rf@opensource.cirrus.com,
	broonie@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	patches@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr
Subject: Re: [PATCH v3 3/3] spi: pxa2xx: Handle clock gating for GPIO chip select devices
Date: Wed, 16 Sep 2026 23:24:28 +0200
Message-ID: <20260916212428.7293-1-juan@jimenezcarrero.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901192625.1497791-4-khalil@rentman.nl>
References: <20260901192625.1497791-4-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 1 Sep 2026 21:26:25 +0200, Khalil wrote:
> On Intel LPSS SPI controllers (Cannon Lake and later) with dynamic

Tested on an HP EliteBook 8 G1i 14 inch (DMI board 8D8A) with 2x
CS35L54, together with 2/3 and without 1/3. Details in my reply to the
cover letter.

Tested-by: Juan Jimenez Carrero <juan@jimenezcarrero.com>
