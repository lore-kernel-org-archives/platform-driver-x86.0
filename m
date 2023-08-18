Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1A1C7113E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Aug 2023 12:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356486AbjHRMkQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Aug 2023 08:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376979AbjHRMj7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2023 08:39:59 -0400
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7540B3A9F
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Aug 2023 05:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692362389; cv=none; 
        d=zohomail.in; s=zohoarc; 
        b=MUB3OJbn07mUDDt6sdkyMEZC407b4shfRr/CME557ojj3uHAq4MFDrEJWYc5R8eOQ+LGQQ7jYxcA6CnyGancmUzRiPw4kJLqadIwbt/skUITWI/qCCaKizSRFLDxyV4GPjd5kJtlzrTkx8KXdO6KhtF9ftnCxbAmLzlAZ8pNpjM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
        t=1692362389; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=kYJeZcD9Gi49ZbBz7C0TKyuoqCDRevywo6Lwn8961Bk=; 
        b=VlT8Jdvgln/0fq629skZIyI0/KK85kJObAh12Q54YVwtZZyDbvwjEHOOnT+9R/SGF8d6PoFNzGyodaAYUbsVpRoa6cfMVbcWSJr6A7AU7rzr+kpidBV5AKUQjfYrrFKiR7nMMC/aoZ+Kto+pZrM48kOmx+aWjbHmpTk6I9Za2KY=
ARC-Authentication-Results: i=1; mx.zohomail.in;
        dkim=pass  header.i=sidevesh.com;
        spf=pass  smtp.mailfrom=me@sidevesh.com;
        dmarc=pass header.from=<me@sidevesh.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692362389;
        s=zoho; d=sidevesh.com; i=me@sidevesh.com;
        h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=kYJeZcD9Gi49ZbBz7C0TKyuoqCDRevywo6Lwn8961Bk=;
        b=UsgDyraKDPeYavyntnYRt5ugge3pW8IBKMqxlBAfvpAl2r3GWreik1DNjJfvinSe
        Uo4jJwCoZG6i57/WFl+Ky/2uVrxa9Ng6xVANChIBLvFxWn+1m4OeP9i7MaBTstpiNIj
        07ufqL/YzPUy7WbX+MPe7igZyas/8n3+womd+oaY=
Received: from mail.zoho.in by mx.zoho.in
        with SMTP id 1692362387877109.92929542480545; Fri, 18 Aug 2023 18:09:47 +0530 (IST)
Date:   Fri, 18 Aug 2023 18:09:47 +0530
From:   Swapnil Devesh <me@sidevesh.com>
To:     "Platform driver x86" <platform-driver-x86@vger.kernel.org>
Cc:     "soyer" <soyer@irl.hu>
Message-ID: <18a08a8b173.895ef3b250414.1213194126082324071@sidevesh.com>
In-Reply-To: 
Subject: [PATCH 1/1 V3] platform/x86: lenovo-ymc: Add Lenovo Yoga 7 14ACN6
 to ec_trigger_quirk_dmi_table
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This adds my laptop Lenovo Yoga 7 14ACN6, with Product Name: 82N7 (from `dmidecode -t1 | grep "Product Name"`) to the ec_trigger_quirk_dmi_table, have tested that this is required for the YMC driver to work correctly on this model.

V3: Updated the subject to mention the driver being updated
V2:  Sent again from the mail that is signing off on this and the previous push had the tabs removed messing up the formatting of the patch.

Thanks to Gergo, the author of the Lenovo YMC driver for guiding this.

Signed-off-by: Swapnil Devesh <me@sidevesh.com>
---
drivers/platform/x86/lenovo-ymc.c | 7 +++++++
1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
index 41676188b373..7d38151a5b27 100644
--- a/drivers/platform/x86/lenovo-ymc.c
+++ b/drivers/platform/x86/lenovo-ymc.c
@@ -32,6 +32,13 @@ static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
            DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
        },
    },
+    {
+        /* Lenovo Yoga 7 14ACN6 */
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+            DMI_MATCH(DMI_PRODUCT_NAME, "82N7"),
+        },
+    },
    { }
};
