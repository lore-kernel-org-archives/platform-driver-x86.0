Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DF1EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun,  2 Jul 2023 13:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjGBNpX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 2 Jul 2023 09:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjGBNpU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Jul 2023 09:45:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1E0E68
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jul 2023 06:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688305469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CQPmY3YgKkcmXgnTKyyGhzbqz5W1ZZqveUHs3/0dmWg=;
        b=jNm37lTfNGBuFevgY2Qr3HN+Gn60GztoxqJOnl0hgdfEoYD6GCw7I9gvX75NH65KBTh7A4
        a4NzYSwp6RGvnrb+6ho2L+IAtFYsvmW0HBB+ZRVOV9n2l56yqBMPaw4cOaAAWfLAZE3fRa
        dd5OyDzJFoD4V8398oY6GsjpCcFGqe4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-6t7Aho5-MUyPXfYkWZxCQQ-1; Sun, 02 Jul 2023 09:44:27 -0400
X-MC-Unique: 6t7Aho5-MUyPXfYkWZxCQQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-635eeb952b8so39048786d6.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 02 Jul 2023 06:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305467; x=1690897467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQPmY3YgKkcmXgnTKyyGhzbqz5W1ZZqveUHs3/0dmWg=;
        b=ELXyUjbVuEJICT+nZih89372l+hTChuchOqRsmSISmyWcQWiEhp5e/u7DULd5znVzY
         2WeziGbluvdUuKUJA0IwOtsG3JRqNOcbJ8gXUzn6P+sk3mWP3a2lyLmO1LpH0auNO9Bt
         gbBMOErwOGU8yMuW0xzpnfoDndeEQUDyth3mdVIfpdm53MjhY/5lq0kpAIG/JZ4WD+Qa
         hM9/WS0rLDcbqtLQy9ElhHovRtW86sDqBzPO6tEX5IjMjLqsE2Ccrjuv3aMoJBkRjz1m
         RACwFlpUBrCONblixy2gwUqOKEH98AFKRrBQ6bAkGgBrtPh7q5Trzj9V5935cp/4hdKm
         VBJg==
X-Gm-Message-State: ABy/qLZZBrLIDTffDwSFfwFBj+yBBxciYZMMbo31PKvIeWqd/ow3C336
        7dY5LWFx7ikBBEXv6W8zZE6D8IwDFZsTxyd0d6IapAq1swIDJtq3KAiS1hia8BIJI+s4hWWmiLZ
        Mp78LtWFixU60zUYmxWzDTkiGepcXPtM/Sw==
X-Received: by 2002:a05:6214:5194:b0:631:f964:7ab with SMTP id kl20-20020a056214519400b00631f96407abmr10042640qvb.60.1688305467302;
        Sun, 02 Jul 2023 06:44:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH9Hw7Cw7EnZSWaMX/eP2Tdd0HP/I5KQYDhe7mnH4i7QSQGHSQxDgxErkRJk4MklEI+1ytGlw==
X-Received: by 2002:a05:6214:5194:b0:631:f964:7ab with SMTP id kl20-20020a056214519400b00631f96407abmr10042627qvb.60.1688305467128;
        Sun, 02 Jul 2023 06:44:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id ep8-20020a05621418e800b00630182f0191sm10227585qvb.1.2023.07.02.06.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:44:26 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     djrscally@gmail.com, hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86: int3472/discrete: set variable skl_int3472_regulator_second_sensor storage-class-specifier to static
Date:   Sun,  2 Jul 2023 09:44:19 -0400
Message-Id: <20230702134419.3438361-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

smatch reports
drivers/platform/x86/intel/int3472/clk_and_regulator.c:263:28: warning: symbol
  'skl_int3472_regulator_second_sensor' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 61aeca804ba2..ef4b3141efcd 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -260,7 +260,7 @@ static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
  * This DMI table contains the name of the second sensor. This is used to add
  * entries for the second sensor to the supply_map.
  */
-const struct dmi_system_id skl_int3472_regulator_second_sensor[] = {
+static const struct dmi_system_id skl_int3472_regulator_second_sensor[] = {
 	{
 		/* Lenovo Miix 510-12IKB */
 		.matches = {
-- 
2.27.0

