Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DFF25229E
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464551; cv=none; b=OGOhst+RgV50w1ET//amELR5f9J0LOoC83qUEyv113M6VLsUJrBIFgXWMj6ss1Yz6nGoE4PdcvffFFj6BOF65BliJVsaUPs8SKtlh9jCW+YgEAl7isIFO8pij8lM6xyKqgz/ERX0DnBm97eNjS5V2xPariuFrl2JV6BQe6uujCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464551; c=relaxed/simple;
	bh=E2t3DevI4p3VQr+FVvYzxqj4jM1b43kyTYomfMPIPNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmpOIWakDw7zhuAUzCpo5lplIviAcTi/djCylKOHDP334+fIImMuhWwgCC5I+V9mAdyet5I3g7X/yTakYWUfIdxkG8a9igVbwhHimBiDFZ9HMTx2089Tm3+d16jxLeJvf9hN51A4HQPgljbSOqJZwy+WJ3Xj88E/u/tYxEUnifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MolTWmAL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MolTWmAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749464548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ImBELjKVNxbrw3S5VaAfcLyexpOQIxIgefx79VaNC0=;
	b=MolTWmALBPE8+pCAxm230oSTOEVMERcvEZTfdxt7jjOGOmXWLrlHzBcD3bvSIFLpneSFj0
	KLWsbe7Tfk0xwKOJpNQmYH3cda49H3VFcVDrKUwhSfFUJMR9niuXxxTfD5Alx/UOa3V1fB
	zTsSR3UzAzFo159KJe4ATtOw1LY1xoE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-P_8W7T70NMevbKYE6wCrjA-1; Mon,
 09 Jun 2025 06:22:27 -0400
X-MC-Unique: P_8W7T70NMevbKYE6wCrjA-1
X-Mimecast-MFC-AGG-ID: P_8W7T70NMevbKYE6wCrjA_1749464546
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C7A7B19560AD;
	Mon,  9 Jun 2025 10:22:25 +0000 (UTC)
Received: from carbon.redhat.com (unknown [10.44.32.119])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5ED1030001B1;
	Mon,  9 Jun 2025 10:22:22 +0000 (UTC)
From: Jelle van der Waa <jvanderwaa@redhat.com>
To: Jonathan Woithe <jwoithe@just42.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: fujitsu: clamp charge_control_end_threshold values to 50
Date: Mon,  9 Jun 2025 12:21:14 +0200
Message-ID: <20250609102115.36936-3-jvanderwaa@redhat.com>
In-Reply-To: <20250609102115.36936-1-jvanderwaa@redhat.com>
References: <20250609102115.36936-1-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Follow the sysfs ABI documentation that drivers should round written
values to the nearest supported value instead of returning an error.

Tested on a Fujitsu Lifebook U7720.

Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
---
 drivers/platform/x86/fujitsu-laptop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index c8aeb28a783c..f6a4a02e8d44 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -187,9 +187,12 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (value < 50 || value > 100)
+	if (value > 100)
 		return -EINVAL;
 
+	if (value < 50)
+		value = 50;
+
 	cc_end_value = value * 0x100 + 0x20;
 	s006_cc_return = call_fext_func(fext, FUNC_S006_METHOD,
 					CHARGE_CONTROL_RW, cc_end_value, 0x0);
-- 
2.49.0

