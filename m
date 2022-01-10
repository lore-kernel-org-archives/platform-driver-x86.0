Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9F2C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Jan 2022 10:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244063AbiAJKkH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Jan 2022 05:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33088 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244040AbiAJKkG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jan 2022 05:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641811206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FiujYIfgcOI+svoVa/+nJUC97lZkGnaU51FHmvjdWwc=;
        b=TD2p7ZX1Uk33VYNQ+6W0p/GLuR1KcVntR1r1GDc4wAmeMCuW+ri4fLngKH9Mpp8gvqq25e
        MkxqkQrcFiUe4hj04vVHmKy9pv+HETTOy1wZ/5cESMRYi1CuveH5mZNlQX+h0zMjnCkU8r
        9PHySXJR9u4Wkt5hckWKuggVTbyaSc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-0D7UroNmPX6VvVMLbanQMA-1; Mon, 10 Jan 2022 05:40:00 -0500
X-MC-Unique: 0D7UroNmPX6VvVMLbanQMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB7E01006AA5;
        Mon, 10 Jan 2022 10:39:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.64])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C01347AB6B;
        Mon, 10 Jan 2022 10:39:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: x86-android-tablets: Constify the gpiod_lookup_tables arrays
Date:   Mon, 10 Jan 2022 11:39:52 +0100
Message-Id: <20220110103952.48760-3-hdegoede@redhat.com>
In-Reply-To: <20220110103952.48760-1-hdegoede@redhat.com>
References: <20220110103952.48760-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The individual gpiod_lookup_table structs cannot be const because they
contain a list-head which gets used when registering them.

But the array of pointers to the gpiod_lookup_table-s used by a board
can be const, constify these.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 2329a5a6c182..e551670143d7 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -146,7 +146,7 @@ struct x86_serdev_info {
 struct x86_dev_info {
 	char *invalid_aei_gpiochip;
 	const char * const *modules;
-	struct gpiod_lookup_table **gpiod_lookup_tables;
+	struct gpiod_lookup_table * const *gpiod_lookup_tables;
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct platform_device_info *pdev_info;
 	const struct x86_serdev_info *serdev_info;
@@ -306,7 +306,7 @@ static struct gpiod_lookup_table asus_me176c_goodix_gpios = {
 	},
 };
 
-static struct gpiod_lookup_table *asus_me176c_gpios[] = {
+static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
 	&int3496_gpo2_pin22_gpios,
 	&asus_me176c_goodix_gpios,
 	NULL
@@ -410,7 +410,7 @@ static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst =
 	},
 };
 
-static struct gpiod_lookup_table *asus_tf103c_gpios[] = {
+static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
 	&int3496_gpo2_pin22_gpios,
 	NULL
 };
@@ -565,7 +565,7 @@ static struct gpiod_lookup_table whitelabel_tm800a550l_goodix_gpios = {
 	},
 };
 
-static struct gpiod_lookup_table *whitelabel_tm800a550l_gpios[] = {
+static struct gpiod_lookup_table * const whitelabel_tm800a550l_gpios[] = {
 	&whitelabel_tm800a550l_goodix_gpios,
 	NULL
 };
@@ -675,7 +675,7 @@ static int serdev_count;
 static struct i2c_client **i2c_clients;
 static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
-static struct gpiod_lookup_table **gpiod_lookup_tables;
+static struct gpiod_lookup_table * const *gpiod_lookup_tables;
 static void (*exit_handler)(void);
 
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
-- 
2.33.1

