Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAA2EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Jul 2023 07:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbjGRHFm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjGRHFl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Jul 2023 03:05:41 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559A61A2
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jul 2023 00:05:40 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31434226a2eso5334256f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jul 2023 00:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663939; x=1692255939;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5GpzNpzwmog1Aq4V5vyTLCPapVxMWhF1T/EypcZtmK0=;
        b=LBrFfg5oktKGtr+QIC47rQ3VA4jCV2B8d6bA44LlxX2PNXXsVDPAQQScXcqiwrD7EZ
         yxZeJad7E4coDKZZruzdA9kXLJ/qXYwW+4w03lb/NZ9ScXfyB1Et4ONGze0dzelVe1sx
         E97PW2RxxS0GxW3q079U9eEkbKQOGwnDXUCdSqScMwxBT5uKRwOgey4LB9hQ4jckjAid
         X63OQQxBlp3W2PoAJ3PiIYAy09uO9ehR/EWSTJriaRWgG5vyXgJCnxUh3P4llt7yyTxE
         y4U2MDqp/SaGxOyubOmDEmbS6i2qYV4dmrLkQpEUJm93ytaBSYQQak0PUhpjqBPWPXXM
         db/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663939; x=1692255939;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GpzNpzwmog1Aq4V5vyTLCPapVxMWhF1T/EypcZtmK0=;
        b=Cd4iKES//cnP+c45gu/imnweCGaR5PEAuPfXTLFrbcI3G4NlbXrvnKN08DJYH38pKd
         6jcbP4lxAFRVUZAjZMu9ji2hsdiYJdJbwPWCJ2ZkOrqFm0mVSFH+BTWh2h/QBmpCZjxU
         CnwLH19IjD5YmK866iLkKyT84A1Fi5pE72JiygbF6lzV7gBpf3rY35ey4gqQXQFQyrN/
         YCKd3HnDjA2oW49xCrwYLwrVQ5gbJua3LmtBgV1oklDAZDPw0CrPOhRsiKnPHJNiXriH
         22TLMdvXWWnXJJqtLIOYcN3TKkbk55rk8ItqAFKhWsCbcAdsVHSNUSO2T53T5KfQktqH
         Em/Q==
X-Gm-Message-State: ABy/qLaXIGsjyZtc/D49uwisFadlKBSC37eidk55W5lCNEzhy7i5cNey
        MFWQhotGHPqgrbPWMefEd/CPbA==
X-Google-Smtp-Source: APBJJlFIpsHlpw63Si1RtPAtVtFNhTKEGqyphH7ZjzSTPsR8B0a/ENbZJYSYQKT4dPvwHrbd3gqAGA==
X-Received: by 2002:a05:6000:1370:b0:316:f25f:ed3 with SMTP id q16-20020a056000137000b00316f25f0ed3mr9757085wrz.64.1689663938880;
        Tue, 18 Jul 2023 00:05:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y16-20020adffa50000000b003144b95e1ecsm1446255wrr.93.2023.07.18.00.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:05:37 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:05:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jorge Lopez <jorge.lopez2@hp.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: hp-bioscfg: prevent a small buffer overflow
Message-ID: <b4950310-e65f-412f-8d2b-90bb074a6572@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This function escapes certain special characters like \n.  So if the
last character in the string is a '\n' then it gets changed into two
characters '\' and '\n'.  But maybe we only have space for the '\' so
we need to check for that.

The "conv_dst_size" variable is always less than or to equal the "size"
variable.  It's easier to just check "conv_dst_size" instead of checking
both.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index b0a94640ff6f..32d9c36ca553 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -94,12 +94,15 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	utf16s_to_utf8s(src, src_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
 	dst[conv_dst_size] = 0;
 
-	for (i = 0; i < size && i < conv_dst_size; i++) {
+	for (i = 0; i < conv_dst_size; i++) {
 		if (*src == '\\' ||
 		    *src == '\r' ||
 		    *src == '\n' ||
-		    *src == '\t')
+		    *src == '\t') {
 			dst[i++] = '\\';
+			if (i == conv_dst_size)
+				break;
+		}
 
 		if (*src == '\r')
 			dst[i] = 'r';
-- 
2.39.2

