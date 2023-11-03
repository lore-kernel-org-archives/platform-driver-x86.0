Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C1FC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 23:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjKCXyQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 19:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjKCXyP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 19:54:15 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E197FD49
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 16:54:12 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32f7bd27c2aso1748978f8f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Nov 2023 16:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699055651; x=1699660451; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUCKyVi/uPNyglBUAzsWxaTRBpeO0fPSBG4HNKrYO6I=;
        b=IDoUTMK9LJPcqwbjAykkLyBzHbshQxJZfyLYc7NiTJynxl5H6IfwYzVJcayCJZZwOx
         Ck88xSucKm20f7iC441o1HD27I+EQ6oosLmV2QRydCULUDBcTCyUHRBkmN0EGspoxVVj
         oHwCT2OXKXa/q38mRDhE/nnuIHtGTGV+ZJ/QtwYPh1KjSNMi5Qhnsc+EdWHullbwZTa0
         UqtyQOY8v1nY2aDn7YyH7hIFwDzhWOW7j0al4RtPBGXJeCv91sqk0l/9mXYR8t1FjnBJ
         X6BY7wIBUex6NkBkkSYaogi+2yi3U4gJ42ZfFwBUlDONVzkRhWgNCxgIbM1xJ2T2gad1
         1wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699055651; x=1699660451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUCKyVi/uPNyglBUAzsWxaTRBpeO0fPSBG4HNKrYO6I=;
        b=YItBpHVNsWKeWTCs6EiA7bYksfSbflSOVSETNryFt4FD6AQuGcJbEbNPmZhU5ZYVrq
         eFRDM8WiNejpQk2TzkOtJeZem5K7gzRB4Zc2gBg1AOtv5Se+9f+wGJVO74zGegXTQfdu
         yCWNWCmur/+0UDLNFK+gjWpqVs8SkDmcMiaXZFMJ+Y/p6OU/9WL5Tv5gB8ajUULseboU
         gq9GVZteK1grDrbfwswlJQ6UXOZDHsf4dJNB/DQT+5lQ3ESULiXmMyFmrxuuDg/3GhtL
         roRiyQzPUzPwNenaHjkhWyjLssOT0w42a/bcImQq5ImWsLYevJvJcPgbxv3FEaaB96CZ
         qBcQ==
X-Gm-Message-State: AOJu0YxRRNdV1mBRvCXvi3bFhigMQd5ganXgco/YPPNtV5YrWShZeZ/Z
        8kwOWTyA5DShZ57FQ93BhQ==
X-Google-Smtp-Source: AGHT+IEZFTHiDLqyp1+QCNXfPYNfXEVTtzmeETozsHpPjtaaL1j5aWgPRMVfeVOtx9RT4ZOhw2AWxQ==
X-Received: by 2002:adf:f808:0:b0:32d:93aa:3d63 with SMTP id s8-20020adff808000000b0032d93aa3d63mr17855082wrp.69.1699055650922;
        Fri, 03 Nov 2023 16:54:10 -0700 (PDT)
Received: from octinomon (202.51.199.146.dyn.plus.net. [146.199.51.202])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d46c7000000b003197869bcd7sm2969889wrs.13.2023.11.03.16.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:54:10 -0700 (PDT)
Date:   Fri, 3 Nov 2023 23:54:08 +0000
From:   Jules Irenge <jbi.octave@gmail.com>
To:     hdegoede@redhat.com
Cc:     lpo.jarvinen@linux.intel.com, markgross@kernel.org,
        vadimp@nvidia.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/mellanox: mlxbf-tmfifo: Remove unnecessary bool
 conversion
Message-ID: <ZUWIIKbz4vukl8qb@octinomon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This commit fixes coccinelle warning in macro function
IS_VRING_DROP() which complains conversion to bool not needed here.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index ab7d7a1235b8..88472c024680 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -91,7 +91,7 @@ struct mlxbf_tmfifo_vring {
 /* Check whether vring is in drop mode. */
 #define IS_VRING_DROP(_r) ({ \
 	typeof(_r) (r) = (_r); \
-	(r->desc_head == &r->drop_desc ? true : false); })
+	r->desc_head == &r->drop_desc; })
 
 /* A stub length to drop maximum length packet. */
 #define VRING_DROP_DESC_MAX_LEN		GENMASK(15, 0)
-- 
2.41.0

