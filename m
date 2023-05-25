Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F06BC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 20:50:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241242AbjEYUu6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 16:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241782AbjEYUuw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 16:50:52 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D664BD3
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 13:50:50 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-309382efe13so1803867f8f.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685047849; x=1687639849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+mpIuvVEBhYQv+k6FIeLYtDnkxDN/5dgCPu43XZjxs=;
        b=LqF7CrbDiTtBRKQpa2D+hkvZ2F+WUX2zVpagXB3e/oSj5ptoU0BUYRAEzD7jeZVT6n
         h3wmao3+Nt2CMoHXDTflOsuXKSBuzyHxOCh1dhRPpDY4FnjFW1IwoI92T7Akq79CPRQg
         xC5k6BOM+k8wFQ5/ewoz9e1WGMH0AeM3nCEsb3bd1pbuWefAZ/wTpHIL89pw7WoyGubt
         /E0g92p/g/gCTf53R8tveZHaxD8rHaJh+iR4VeJai1U2M0rTXS9AwP8LxvHm6fH1XNF7
         uDmSe5XwKl0an9avpFF6H9sW6jKlNc3OJQ9b6noJieUDukFoDP5VqJMiAbdFThe2qKB1
         z8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685047849; x=1687639849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+mpIuvVEBhYQv+k6FIeLYtDnkxDN/5dgCPu43XZjxs=;
        b=adK6aquTN0KLOw8dt5bj4U8tf5DVMtnpVYsl+dFL+xTnGRW3BgVXDfI2UPlZ6U8Qm2
         zTLs09F41Vvl0bJO122iBKQX8bhdWalYQ9W/0OG0CYySeKqRfIsDmdccJK61136mp4Cx
         LpSRCtYBixRoDlvFT49TklLfbMg4SWxuJBoevBUkdNqKAocnrDOXOvaAuTRGengTFezY
         k+AKxQfKwpwQ+EBVrSGyLigwI1B/0xsjqFfeKiGoqJx85YFVAzFCuyJ13iDWE/S61QQp
         0bCjnYP1n579eJVbua86uAboC+is48WoY0pRZIOtIciigKvBFcnjKYw/BOxjkcnWJSrV
         f3YA==
X-Gm-Message-State: AC+VfDweQqPGffkXYb8fBvVq6TG3AqTw1IrAkXjLngK2Ux7ohrVJvjSK
        KkAtHsq6tx4BAUKXf3k21f7O7l6L8wU=
X-Google-Smtp-Source: ACHHUZ6KnODzZON7JNeHKcc0iTy4aJ0Ar1ZCoiO/UmQzIqkPsu6/U82sdpIlQRJd6WPFb9jXXO2lsg==
X-Received: by 2002:adf:e5cb:0:b0:2f9:482f:c13f with SMTP id a11-20020adfe5cb000000b002f9482fc13fmr3192360wrn.46.1685047849119;
        Thu, 25 May 2023 13:50:49 -0700 (PDT)
Received: from xws.localdomain (pd9e5a196.dip0.t-ipconnect.de. [217.229.161.150])
        by smtp.gmail.com with ESMTPSA id d8-20020adffd88000000b003012030a0c6sm2884160wrr.18.2023.05.25.13.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 13:50:48 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH] platform/surface: aggregator: Make to_ssam_device_driver() respect constness
Date:   Thu, 25 May 2023 22:50:41 +0200
Message-Id: <20230525205041.2774947-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make to_ssam_device_driver() a bit safer by replacing container_of()
with container_of_const() to respect the constness of the passed in
pointer, instead of silently discarding any const specifications. This
change also makes it more similar to to_ssam_device(), which already
uses container_of_const().

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 include/linux/surface_aggregator/device.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
index df81043b9e718..42b249b4c24b1 100644
--- a/include/linux/surface_aggregator/device.h
+++ b/include/linux/surface_aggregator/device.h
@@ -243,11 +243,7 @@ static inline bool is_ssam_device(struct device *d)
  * Return: Returns the pointer to the &struct ssam_device_driver wrapping the
  * given device driver @d.
  */
-static inline
-struct ssam_device_driver *to_ssam_device_driver(struct device_driver *d)
-{
-	return container_of(d, struct ssam_device_driver, driver);
-}
+#define to_ssam_device_driver(d)	container_of_const(d, struct ssam_device_driver, driver)
 
 const struct ssam_device_id *ssam_device_id_match(const struct ssam_device_id *table,
 						  const struct ssam_device_uid uid);
-- 
2.40.1

