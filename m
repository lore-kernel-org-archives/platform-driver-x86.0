Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62C1531E8
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344968; cv=none; b=cH2krfddwVxkQm7uq7y5fZGi75wWY+IxH7Sf8C7kn5H6LUZawEN1kRLA0qTdUzm4j/3uqnn/bkw1Zis+QZS4K8V5X22XOUbRkvHRSO3gtY7UTGy7S/Gepx/vkLtq39AX8nCiqtUz+FBeEGoKmUineQSHRKhai//ylhkSk355kbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344968; c=relaxed/simple;
	bh=jrc0gqqTl7M1bm/LCbBqwPkT5Sn4uPHJ6VDYp5zaiHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ReR4+VCJAbHhRpRuqhw3/Gbz4VL5ao0p3QThSP8wKWmVyLzIbAcRJRVY8Hj0pB21BafIYuH+602E1/ksnvcbH50MZn7btU/yVzRvGZLnTU1Ugsu7nbujiLBPXOc2xpwqc19C/UWDE13tX469Q7ft6tjCSEwYn2bM4zyJl6kP71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZHFoY02e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZHFoY02e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733344965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2ScOlisK3jiRMC0FlODLlKWxgLOj+Y6drece7IXSBU=;
	b=ZHFoY02eCWdi48yoCgHutFV8D/L6NFZVR2fDuNLcx2BT4ijvd4JE24Jq2pJXJmA663w3B2
	1tTcJt8RP+dYH/OqTDO3gQeqXH/XMZ9zfaj/I8Disr5iqsoRbiFdw3bqRopTSvTIhIvAUR
	vN69gUwqUAnaOgosu+wj/AEBGKkHa/E=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-185-cQgWmyY2O5GEnkA6Rjka4A-1; Wed,
 04 Dec 2024 15:42:43 -0500
X-MC-Unique: cQgWmyY2O5GEnkA6Rjka4A-1
X-Mimecast-MFC-AGG-ID: cQgWmyY2O5GEnkA6Rjka4A
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D0F219560B7;
	Wed,  4 Dec 2024 20:42:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EFD551956095;
	Wed,  4 Dec 2024 20:42:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/8] platform/x86: x86-android-tablets: Make variables only used locally static
Date: Wed,  4 Dec 2024 21:42:13 +0100
Message-ID: <20241204204227.95757-3-hdegoede@redhat.com>
In-Reply-To: <20241204204227.95757-1-hdegoede@redhat.com>
References: <20241204204227.95757-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Commit 06f876def346 ("platform/x86: x86-android-tablets: Add support for
Vexia EDU ATLA 10 tablet") omitted the static keyword from some variables
which are only used inside other.c .

Add the missing static keyword to these, this fixes the following warnings:

drivers/platform/x86/x86-android-tablets/other.c:605:12: sparse: sparse: symbol 'crystal_cove_pwrsrc_psy' was not declared. Should it be static?
drivers/platform/x86/x86-android-tablets/other.c:612:28: sparse: sparse: symbol 'vexia_edu_atla10_ulpmc_node' was not declared. Should it be static?

Fixes: 06f876def346 ("platform/x86: x86-android-tablets: Add support for Vexia EDU ATLA 10 tablet")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411301001.1glTy7Xm-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/other.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 725948044da4..de5b3f1ce9a7 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -602,14 +602,14 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
  * Vexia EDU ATLA 10 tablet, Android 4.2 / 4.4 + Guadalinex Ubuntu tablet
  * distributed to schools in the Spanish Andalucía region.
  */
-const char * const crystal_cove_pwrsrc_psy[] = { "crystal_cove_pwrsrc" };
+static const char * const crystal_cove_pwrsrc_psy[] = { "crystal_cove_pwrsrc" };
 
 static const struct property_entry vexia_edu_atla10_ulpmc_props[] = {
 	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", crystal_cove_pwrsrc_psy),
 	{ }
 };
 
-const struct software_node vexia_edu_atla10_ulpmc_node = {
+static const struct software_node vexia_edu_atla10_ulpmc_node = {
 	.properties = vexia_edu_atla10_ulpmc_props,
 };
 
-- 
2.47.0

