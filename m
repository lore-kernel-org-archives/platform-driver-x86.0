Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92D25229E
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464547; cv=none; b=skP1JJa3gBalAt+3urX6+uAZaSbyB7Y7ExpFOpRt/fD9lb+TrDvUi2AkX0/RZOh/NuKKqfspRTOf0/4AptAn2P+SugXRTGdvDPCtaUXVWmKkuMtmpxBfj8Cc4yDrbulMJWwiKf0do5uzrpvhsWgW179GK0IkTIEu+Gri9HwfXKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464547; c=relaxed/simple;
	bh=wtCsSMhAejvWCRcIc3c5W07mI0mSNXoPVwufLpcc/RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coWs4vXlds5SzshLZx5qmuyrxaueD5UatxZN+3aGkGxtF+qXxXu1fcM1cI0DVmFvxTmgr2Q7cWejgWEZCoVzEhiZAJGDxXzsli6/2avj0mMMVdaV2FZPZ7tmpsSXwdGyEpmvVDP90YyUp2dXoIMIYsC3lLPuYbQKtYAlESMJOuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVRn4j8a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVRn4j8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749464545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/jQgD4i2WAXusPnoVUy2SL4SYizfRKwwtcUs1oG6yw=;
	b=KVRn4j8aghaU1CnlcmdcNH6DoXsNi+A9CXfQH1jT/lzB1RcyMmDTieDjk4r7H6gzfQUFxO
	a01vXxt5Wfa9Ry5QCRw9FCeL/iTj7qf0ssR2UIigUxuqm0LreYEY1fhzkWeEfRcA0IoLo3
	JveeYaIM9ap07NvUG1/nnVNQ3MoAy5M=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-MDVbA16VN7KUhhLM7aHSRg-1; Mon,
 09 Jun 2025 06:22:24 -0400
X-MC-Unique: MDVbA16VN7KUhhLM7aHSRg-1
X-Mimecast-MFC-AGG-ID: MDVbA16VN7KUhhLM7aHSRg_1749464543
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E7CD19560A6;
	Mon,  9 Jun 2025 10:22:22 +0000 (UTC)
Received: from carbon.redhat.com (unknown [10.44.32.119])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 008D130001B1;
	Mon,  9 Jun 2025 10:22:19 +0000 (UTC)
From: Jelle van der Waa <jvanderwaa@redhat.com>
To: Jonathan Woithe <jwoithe@just42.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: fujitsu: use unsigned int for kstrtounit
Date: Mon,  9 Jun 2025 12:21:13 +0200
Message-ID: <20250609102115.36936-2-jvanderwaa@redhat.com>
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

The charge control threshold value ranges from 0-100.

Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
---
 drivers/platform/x86/fujitsu-laptop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 162809140f68..c8aeb28a783c 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -180,7 +180,8 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 				const char *buf, size_t count)
 {
 	int cc_end_value, s006_cc_return;
-	int value, ret;
+	int ret;
+	unsigned int value;
 
 	ret = kstrtouint(buf, 10, &value);
 	if (ret)
-- 
2.49.0

