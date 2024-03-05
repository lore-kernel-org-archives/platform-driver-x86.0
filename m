Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFF152F68
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 09:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631912; cv=none; b=T1v3Rgsa4SzEWHhDBNESDrOs22PBRMHWMkGNu28mZdpBt6r7DQavW+tszkZ13MqNjyEZZMc6r39BKUIIoI56cPAEy41uQyDaIV8wmwNp99h76513vNo+/MzcFIrqTKnMgBJkZszb6TiFdXL+9/Ru4UUpzp00FbXfSZa7EpAcKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631912; c=relaxed/simple;
	bh=Qn3NE74VSHIBuOyGCeV7Teo7xmR5k98t9b8kppezoqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EyBZNgY7IHJlyi0vaIxRyQKQTKBFqTS1J5fCh3yCnzpljPVfJ+TnNknHDt8PVI1v4lAze44L43iibIc+aNQkTsc9dEKK35wOeN+fXJvbKQ8msP5nEwfIw4YAWX4t6URQwwsKMwtRbJDRXw+8tqOtQB6THo3+aDOYB7T/AYDGiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hoKq0GnA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hoKq0GnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709631910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=peF/qImu7reZM0JgQg6ZCZSl+98ZdlulcfQngtPcQTo=;
	b=hoKq0GnAd7xheSw6I4AxohPaT1naCpYO2VtmH044wFRY/jwe7q1gJxgO5QcQQxktbwx7mD
	t9ILMYBtOK79EvUa7veFcqvYjeKplnS1HwC6POsOpeVwuQvevqPyUbYj/33A9oqzItSXTr
	aXkKiS6o86odN9jAchMLNAoJh/smPgk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-L1XUzzaHNV21BiMYJ1RaDg-1; Tue,
 05 Mar 2024 04:45:07 -0500
X-MC-Unique: L1XUzzaHNV21BiMYJ1RaDg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C10A828043E4;
	Tue,  5 Mar 2024 09:45:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBA88492BDC;
	Tue,  5 Mar 2024 09:45:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH] platform/x86: p2sb: Make p2sb_get_devfn() return void
Date: Tue,  5 Mar 2024 10:45:00 +0100
Message-ID: <20240305094500.23778-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

p2sb_get_devfn() always succeeds, make it return void and
remove error checking from its callers.

Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note this applies on top of pdx86/fixes I plan to merge this
small cleanup into for-next after 6.9-rc1
---
 drivers/platform/x86/p2sb.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 3d66e1d4eb1f..53fe96b99ab7 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -43,7 +43,7 @@ struct p2sb_res_cache {
 
 static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
 
-static int p2sb_get_devfn(unsigned int *devfn)
+static void p2sb_get_devfn(unsigned int *devfn)
 {
 	unsigned int fn = P2SB_DEVFN_DEFAULT;
 	const struct x86_cpu_id *id;
@@ -53,7 +53,6 @@ static int p2sb_get_devfn(unsigned int *devfn)
 		fn = (unsigned int)id->driver_data;
 
 	*devfn = fn;
-	return 0;
 }
 
 static bool p2sb_valid_resource(struct resource *res)
@@ -135,9 +134,7 @@ static int p2sb_cache_resources(void)
 	int ret;
 
 	/* Get devfn for P2SB device itself */
-	ret = p2sb_get_devfn(&devfn_p2sb);
-	if (ret)
-		return ret;
+	p2sb_get_devfn(&devfn_p2sb);
 
 	bus = p2sb_get_bus(NULL);
 	if (!bus)
@@ -194,17 +191,13 @@ static int p2sb_cache_resources(void)
 int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 {
 	struct p2sb_res_cache *cache;
-	int ret;
 
 	bus = p2sb_get_bus(bus);
 	if (!bus)
 		return -ENODEV;
 
-	if (!devfn) {
-		ret = p2sb_get_devfn(&devfn);
-		if (ret)
-			return ret;
-	}
+	if (!devfn)
+		p2sb_get_devfn(&devfn);
 
 	cache = &p2sb_resources[PCI_FUNC(devfn)];
 	if (cache->bus_dev_id != bus->dev.id)
-- 
2.43.2

