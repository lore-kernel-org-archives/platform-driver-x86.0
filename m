Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4732BC71132
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Aug 2023 02:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357201AbjHRCL7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Aug 2023 22:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357247AbjHRCLs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Aug 2023 22:11:48 -0400
X-Greylist: delayed 906 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Aug 2023 19:11:46 PDT
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04F03589
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Aug 2023 19:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692323795; cv=none; 
        d=zohomail.in; s=zohoarc; 
        b=WNlLIyjWEIgYU9l0wbhQbbMDjcnI/dDkUqqHTqhCF12OFttjfIcoE0HjA/8m32GXQL9eXrDxhDHPHcXLZHAtWOD8hC9pqEiPAvDIxER2CE63kOVQXSL7Blywp+nPe50ZoW/0JEdAEAkgtPrLkCJ2V4h3PWXtNo6QArCm5qNJum8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
        t=1692323795; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=YukD4xbZtNpe66y7+n8QIlm39jAnGeupD0q/0eYyuqY=; 
        b=WdLZAWBg8MvN1V6bkqXCOoy1BsFWBRWb22ukMmqMYVqzS1ScQylvtHx9Jl52zaq7F3U67M46TCK1zCDOff4PSKmL8vUVV4DvJwCGoh5r3UrjJuFw5GqSG2baVudqxrhtwXbse04v0ngT8sq+nHg7QBczsFSDMUO+QRLJBQHsXhg=
ARC-Authentication-Results: i=1; mx.zohomail.in;
        dkim=pass  header.i=sidevesh.com;
        spf=pass  smtp.mailfrom=me@sidevesh.com;
        dmarc=pass header.from=<me@sidevesh.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692323795;
        s=zoho; d=sidevesh.com; i=me@sidevesh.com;
        h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=YukD4xbZtNpe66y7+n8QIlm39jAnGeupD0q/0eYyuqY=;
        b=K3we/tUwkEam25AnSm+lYc3FXqx/OJGjOJapX+vsmF71V6cPGU83hjPPvu0lvU6l
        /ItIkkhKefbz6NyozHSY+8rN9EjZ8OWYf2pbFZqawieV1X/RasBK6vPA4mkUF/pJU8N
        dwNpz6mpbNUsTKS1y+FpbwPltIQXXSXOQ1Cut9LU=
Received: from mail.zoho.in by mx.zoho.in
        with SMTP id 1692323794814913.7014078018179; Fri, 18 Aug 2023 07:26:34 +0530 (IST)
Date:   Fri, 18 Aug 2023 07:26:34 +0530
From:   Swapnil Devesh <me@sidevesh.com>
To:     "platform-driver-x86" <platform-driver-x86@vger.kernel.org>
Message-ID: <18a065bcf2b.8463a18831891.1434329337528931605@sidevesh.com>
In-Reply-To: 
Subject: [PATCH 1/1 V2] Add Lenovo Yoga 7 14ACN6 to
 ec_trigger_quirk_dmi_table
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

Sending again as V2 from the mail that is signing off on this and the previous push had the tabs removed messing up the formatting of the patch.

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
+	{
+		/* Lenovo Yoga 7 14ACN6 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82N7"),
+		},
+	},
 	{ }
 };

