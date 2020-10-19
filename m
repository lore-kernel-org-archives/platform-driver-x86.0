Return-Path: <SRS0=1m0M=D2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71D4C433DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 13:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A77D20747
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 13:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LiRqxkWb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgJSNcW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Oct 2020 09:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42428 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727297AbgJSNcW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Oct 2020 09:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603114341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=D2hS302BQIxFqkZJYdUZZRcM72hDYJNZ0L302XD6ZGk=;
        b=LiRqxkWbCLLWFVkWX/XKjoRrJU8zL5g+LgM55uvRpYFZaRSJzWSHVpvtX93YqPW3xECUgS
        HvtI/bh/SpLnzkRkVziLwzPOMNAAMo/Bhsse5R6se1sPqcREexIQcAqe30+KlDoWJlFGxQ
        x/uQ0UmZfj+jj1X0nb740/9+nUFZwSw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-1YIjBqCLODOUrbaqi4pkUg-1; Mon, 19 Oct 2020 09:32:19 -0400
X-MC-Unique: 1YIjBqCLODOUrbaqi4pkUg-1
Received: by mail-qk1-f199.google.com with SMTP id f126so7198147qke.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2020 06:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=D2hS302BQIxFqkZJYdUZZRcM72hDYJNZ0L302XD6ZGk=;
        b=f4o0UwkdQuOZ3qgQs8zwp8Nh89QrJGlcw9f4c4fu06BO5AjbcBcKJfYIH8DQXm+Vx9
         mKFi9G2EAdEB8cmg9GAmQpvltBr+gQHyr8koQWak0+0dZ2YOHAOS6thAiIoUSfTYgMNl
         BaLXqLZobGnbLoUkxv/q+l07KRRd4RtCcFaR2DlwPPvNZ43InpJqXJxuUKYC66rW5zJL
         e0L35JMjKb5YQ5pGuEeempUk1e0PF9NBbPJ+eiE0ugGSlF/R4gOJcDnTwOfJ91AlwCiT
         X3uQqaQY0/FbZ2tyzCmeBzsDk7J+iox+8fOfHQYst16ljExxF4tK1Zd0lbTT/AlZMUks
         7mHw==
X-Gm-Message-State: AOAM532Kaga7FPPklRiVQX9IcN07l4xnnZT0QKz9Tdfj1NYoe8p3sJcY
        6iXEr73pZO1gmhhsCdELYLLKmZ5vSiL+8MsLicoc9+W3/1eMV0jowaEMc6uEm1INes1XwdzgEKm
        vqZWfLNpmG04lA0TVb1kWLD1VmcyIyvKZ6w==
X-Received: by 2002:ac8:4313:: with SMTP id z19mr3069624qtm.44.1603114339020;
        Mon, 19 Oct 2020 06:32:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHb8SJ6O+i94TVTF66NpsJNTNc2ZYIp7y9RbXT/7XfCFdh5MzP4tfoLDA6mUyCEN0mfn5mCg==
X-Received: by 2002:ac8:4313:: with SMTP id z19mr3069601qtm.44.1603114338713;
        Mon, 19 Oct 2020 06:32:18 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id r62sm13097qkd.80.2020.10.19.06.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 06:32:18 -0700 (PDT)
From:   trix@redhat.com
To:     jlee@suse.com, hdegoede@redhat.com, mgross@linux.intel.com,
        malattia@linux.it
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86: remove unneeded break
Date:   Mon, 19 Oct 2020 06:32:12 -0700
Message-Id: <20201019133212.12671-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/acer-wmi.c    | 1 -
 drivers/platform/x86/sony-laptop.c | 3 ---
 drivers/platform/x86/wmi.c         | 3 ---
 3 files changed, 7 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 49f4b73be513..1c2084c74a57 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -792,7 +792,6 @@ static acpi_status AMW0_set_u32(u32 value, u32 cap)
 		switch (quirks->brightness) {
 		default:
 			return ec_write(0x83, value);
-			break;
 		}
 	default:
 		return AE_ERROR;
diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index e5a1b5533408..704813374922 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2467,13 +2467,11 @@ static int __sony_nc_gfx_switch_status_get(void)
 		 * 0: integrated GFX (stamina)
 		 */
 		return result & 0x1 ? SPEED : STAMINA;
-		break;
 	case 0x015B:
 		/* 0: discrete GFX (speed)
 		 * 1: integrated GFX (stamina)
 		 */
 		return result & 0x1 ? STAMINA : SPEED;
-		break;
 	case 0x0128:
 		/* it's a more elaborated bitmask, for now:
 		 * 2: integrated GFX (stamina)
@@ -2482,7 +2480,6 @@ static int __sony_nc_gfx_switch_status_get(void)
 		dprintk("GFX Status: 0x%x\n", result);
 		return result & 0x80 ? AUTO :
 			result & 0x02 ? STAMINA : SPEED;
-		break;
 	}
 	return -EINVAL;
 }
diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index d88f388a3450..44e802f9f1b4 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1260,13 +1260,10 @@ acpi_wmi_ec_space_handler(u32 function, acpi_physical_address address,
 	switch (result) {
 	case -EINVAL:
 		return AE_BAD_PARAMETER;
-		break;
 	case -ENODEV:
 		return AE_NOT_FOUND;
-		break;
 	case -ETIME:
 		return AE_TIME;
-		break;
 	default:
 		return AE_OK;
 	}
-- 
2.18.1

