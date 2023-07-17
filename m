Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA30C001DC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jul 2023 21:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbjGQVBR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jul 2023 17:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbjGQVBP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jul 2023 17:01:15 -0400
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A2A9A10E0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jul 2023 14:01:13 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id LVDvqk82e2ts4LVDvqgmhS; Mon, 17 Jul 2023 22:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1689627221;
        bh=gH/CT643ZS5ZguiPFDy4NfnRiWDoPJy5TfU7apbBTY4=;
        h=From:To:Cc:Subject:Date;
        b=EUxW+eBqx0/fwJQ4mgi6TBoMfh2JIImC5lXvo4ECT562e2t/Pe25+tCgrwogyu7TW
         34f6skb/GVFv9oRX95oCPkM0o2XzJilSzDsFzjB1pxM5q5vqzomhi3fAB8d11h4DZZ
         pCrsK4Yfm2hSz5L8D6b8Jr7olrJgiBMFaG7u3OwMHbV6O6PJB8A20qLxtd1W3gb54U
         HZ2WLgmx7vG9PuCOHL8HjbZA+ROG2YNwNWJ3W3vHS9FSaWu12UXGVvMhRKND0vNznj
         swWYgfwcqIjMRk9ADNPg6mER/KqK0vCheGn94fEkkwiHqm/Bfi53yE+gW5QQarZhCa
         TvcXmXOrFSYaw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Jul 2023 22:53:41 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Jorge Lopez <jorge.lopez2@hp.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: hp-bioscfg: Fix some memory leaks in hp_populate_enumeration_elements_from_package()
Date:   Mon, 17 Jul 2023 22:53:37 +0200
Message-Id: <9770122e4e079dfa87d860ed86ba1a1237bcf944.1689627201.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In the loop in the ENUM_POSSIBLE_VALUES case, we allocate some memory that
is never freed.

While at it, add some "str_value = NULL" to avoid some potential double
free.

Fixes: 6b2770bfd6f9 ("platform/x86: hp-bioscfg: enum-attributes")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
/!\ Speculative /!\

   This patch is based on analysis of the surrounding code and should be
   reviewed with care !

/!\ Speculative /!\
---
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index b1b241f0205a..dd173020c747 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -224,6 +224,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 					sizeof(enum_data->common.prerequisites[reqs]));
 
 				kfree(str_value);
+				str_value = NULL;
 			}
 			break;
 
@@ -275,6 +276,9 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 					strscpy(enum_data->possible_values[pos_values],
 						str_value,
 						sizeof(enum_data->possible_values[pos_values]));
+
+				kfree(str_value);
+				str_value = NULL;
 			}
 			break;
 		default:
@@ -283,6 +287,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 		}
 
 		kfree(str_value);
+		str_value = NULL;
 	}
 
 exit_enumeration_package:
-- 
2.34.1

