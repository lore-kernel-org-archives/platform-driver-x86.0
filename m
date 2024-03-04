Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB3C3F9C8
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 13:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709560170; cv=none; b=aIowL76STRHkHUyk538p0rggLg2BZjBY9mOsAvRQxppFTpEpky7RC6coL9EwpP3vixf8fHet5IP8h/HJxveCR/iVu+z2HlCKL/pUxVokvor7vlrZhXlWJF1qGiIQxga2XYnRLBrUE5UONzzcElLCCXJwdvW9Bnry8LAcqhRWZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709560170; c=relaxed/simple;
	bh=XzBFPtcYjNJXtjg0Wzadn9f+DSNqfYHzcC7qrx1+Xb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0vHYvKX8vRK5yjwqPT76dSnNfqb4HfixlDoLiVz/cm5nLXC6MBK0AqWVhpyOv7fEA1yVMAHSvHTp6NR+Q31U/8DsiyJQ/R9QkhoKZTUjB9VVAVkOqifVxDVQK9ZW2/aGZh1RvHDdtGLubISSHSMNQGsVJ1dEBfAFQIaWSUm0NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnFt4enY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnFt4enY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709560167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9u6AToYTQf2tJqDq9bY6TAQun4eeJEUw602xX3pzvdY=;
	b=cnFt4enY/ywov8oU1p/yVXtUQQehmNDpFIDacJXusm2TvSGFHO+fd7RjcGqHDBMWT22rM5
	XEwVNTM21ZRe5L8Fj2V2eP7d2POlmU1t1KANFq3+MMPr/ClIwrQKSzF8NqXwblWE6fBx3v
	aShW/6rIdypDmE018vFQf8l0v3YQeN0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-YirU68xvMimvQI68APaEBQ-1; Mon, 04 Mar 2024 08:49:23 -0500
X-MC-Unique: YirU68xvMimvQI68APaEBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09C8F185A785;
	Mon,  4 Mar 2024 13:49:23 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C307940C6EBA;
	Mon,  4 Mar 2024 13:49:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	danilrybakov249@gmail.com,
	Lukas Wunner <lukas@wunner.de>,
	Klara Modin <klarasmodin@gmail.com>,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC 0/2] platform/x86: p2sb: Cache SPI controller BAR on Goldmont
Date: Mon,  4 Mar 2024 14:49:19 +0100
Message-ID: <20240304134921.305604-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Hi All,

Here are 2 follow-up patches to "[PATCH v3] platform/x86: p2sb: Defer P2SB
device scan when P2SB device has func 0".

These are marked as RFC because I hope that we can replace that entire
patch with the patch from "[RFC 1/1] platform/x86: p2sb: On Goldmont only
cache P2SB and SPI devfn BAR", but it is not sure yet if that approach
to fixing the issue at hand actually works :)

Regards,

Hans


Hans de Goede (2):
  platform/x86: p2sb: Cache SPI controller resources on Goldmont
    platforms
  platform/x86: p2sb: Make p2sb_get_devfn() return void

 drivers/platform/x86/p2sb.c | 59 +++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

-- 
2.44.0

