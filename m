Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0622C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jan 2022 11:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239099AbiAQL04 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jan 2022 06:26:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39221 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233787AbiAQL0x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 06:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642418813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9wjpitEP0Knf6ZqTuGVWnk1F9sWthVVurG9CLLNIatE=;
        b=FwzZID56A6MQxLbh5Bto3keu54sLL3MO3Nn4H17FBKtAgY9io17Hls1hcIOQvq+pVp/4yT
        skbmFq4kxh7hi1YIyTuI5nUJw32lru4nOZnQotAJ0DtpBVKJu10w7ZAzGRyJd7OKiKfjij
        bJaS181VrjV/OvtTxFsYY6fWo8oWwSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-Dp0y5-1OPwOZAnVEOa5new-1; Mon, 17 Jan 2022 06:26:51 -0500
X-MC-Unique: Dp0y5-1OPwOZAnVEOa5new-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A95761083F62;
        Mon, 17 Jan 2022 11:26:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.194])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 14C30105B1E0;
        Mon, 17 Jan 2022 11:26:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] platform/x86: asus-tf103c-dock: Make 2 global structs static
Date:   Mon, 17 Jan 2022 12:26:44 +0100
Message-Id: <20220117112644.260168-2-hdegoede@redhat.com>
In-Reply-To: <20220117112644.260168-1-hdegoede@redhat.com>
References: <20220117112644.260168-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tf103c_dock_hid_ll_driver and tf103c_dock_pm_ops are not used outside of
the driver, make them both static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-tf103c-dock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
index d4ef8f362ee6..6fd0c9fea82d 100644
--- a/drivers/platform/x86/asus-tf103c-dock.c
+++ b/drivers/platform/x86/asus-tf103c-dock.c
@@ -250,7 +250,7 @@ static int tf103c_dock_hid_raw_request(struct hid_device *hid, u8 reportnum,
 	return 0;
 }
 
-struct hid_ll_driver tf103c_dock_hid_ll_driver = {
+static struct hid_ll_driver tf103c_dock_hid_ll_driver = {
 	.parse = tf103c_dock_hid_parse,
 	.start = tf103c_dock_hid_start,
 	.stop = tf103c_dock_hid_stop,
@@ -921,7 +921,7 @@ static int __maybe_unused tf103c_dock_resume(struct device *dev)
 	return 0;
 }
 
-SIMPLE_DEV_PM_OPS(tf103c_dock_pm_ops, tf103c_dock_suspend, tf103c_dock_resume);
+static SIMPLE_DEV_PM_OPS(tf103c_dock_pm_ops, tf103c_dock_suspend, tf103c_dock_resume);
 
 static const struct acpi_device_id tf103c_dock_acpi_match[] = {
 	{"NPCE69A"},
-- 
2.33.1

