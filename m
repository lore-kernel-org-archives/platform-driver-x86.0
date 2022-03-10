Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50667C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 21:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245447AbiCJVJ6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 16:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343889AbiCJVJ5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 16:09:57 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D16B4DF62
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:56 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id b67so5506063qkc.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaN2X6S2vmGHmBF2JvnqxMLfO356sLvA2TzLY2ExQw8=;
        b=FReYSSEA6QCa6/HKbNMenbpQj0Xbvk9IzVn5fqO9kwFIGtcfXMlSHJHHha/RGgW4QM
         jlFMig0SUxUqg33BMKbRI0/vTqgREje6wiXwKlEso7cx1B+1MdADhckHfktpke9+vnLR
         GfqyfAfUCsXHcogdrR/ZZEpOigKsDYpdA8Nq9X0Y2vZhRWhNxRapLEVOBh9DQZIFtgHZ
         PZd/d98XpFF3TRvRjemaDLAWrONN/dgmCWKvSMGrMZ8J0Bs7SQw94v8+itexgXJWTpru
         Wa9qkqAuSMxR2Y8fa16+86duyK0e/Pf8G7BAKWj3eCB862OJZ71ccAzKwkDLKkoPLgpM
         YWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaN2X6S2vmGHmBF2JvnqxMLfO356sLvA2TzLY2ExQw8=;
        b=n3fnN1Rw8fwSgVx/jxj6n1ej8gEIx+13kGu/xmT4YW/OTMO4v6k+PYDSq+ba/JEoC0
         MK3MdkW7rxA/twuzAxvVPGhMvdzAjIKcE8MR5Am7jLXOlR7me4TmuN0HwyXZDljKW5BI
         k/BBLYxIYVkCG9fB//YSoRRrD+ZJ8nzKuy+Il8x3Bj4t1HHN4MTAT86ANZFlNiSXPDHr
         rE/5NZ9cTw+rgEC+GEYJrnoxbb2Da/GXsZ/srOBY1ow/fAMJtlj4YkezhXEU1L6JiOAi
         hQ4fW9WaYM9T4X6KTB9N6P3zARPmvu6Y/qrHlrDbudSQFUXhRunrxiO9ZKUuAc3ybHTT
         y4wA==
X-Gm-Message-State: AOAM532QsCRmi9qlYQ7g+Yayngj7zk3yObBara3RwRFjQUO/GrQSU4WR
        DTOHylHMMuMgVeJhpNjDB92VcHd4ruE=
X-Google-Smtp-Source: ABdhPJxokPrbuD8b7nKsrykrFJIXqKAuGGPckcyPa2vE3TLbHflSyeMnffdB/wd4WwMeLHJFCdGgRg==
X-Received: by 2002:a05:620a:1665:b0:67b:305d:323c with SMTP id d5-20020a05620a166500b0067b305d323cmr4483592qko.781.1646946535036;
        Thu, 10 Mar 2022 13:08:55 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c0b0:4de4:5b27:f2e7])
        by smtp.gmail.com with ESMTPSA id k6-20020a378806000000b0064915d9584fsm2881727qkd.8.2022.03.10.13.08.53
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:08:54 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 0/4] Fix SW_TABLET_MODE detection method
Date:   Thu, 10 Mar 2022 15:08:49 -0600
Message-Id: <20220310210853.28367-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The intension for this patch was to address SW_TABLET_MODE detection 
problem.  It is during the initial investigation; two other issues were 
identified and are related to the initial task.  

First, several WMI queries were reporting error 0x05 including 
HPWMI_HARDWARE_QUERY that is responsible for returning dock and table 
modes values. See patch v5 part 2 and 3 comments for list of WMI queries 
affected.  The driver now reports the appropriate states and values 
correctly.

Lastly, a limiting data size restriction was discovered. 
struct bios_args data member size limits all possible WMI commands 
to those requiring buffer size of 128 bytes or less.  Several WMI 
commands and queries require a buffer size larger than 128 bytes 
hence limiting current and new feature supported by the driver. 
hp_wmi_perform_query function changed to handle the memory 
allocation and release of any required buffer size. 


Description of changes between version 4 and version 5
------------------------------------------------------

v5 patch 1: Fix hp_wmi_read_int() reporting error (0x05)
	-Moved hp_wmi_read_int() to a separate patch.
	-Initially part of v4 patch 1
	
v5 patch 2: Fix SW_TABLET_MODE detection method
	-Remaining part are changes included in v4 patch 1
	-Replaced return values with -ENODEV errors
	-Updated how the closing return value is calculated.
	-Patch 2 is dependent of patch 1 in order for tablet 
	 mode detection to work properly
	

v5 patch 3: Fix 0x05 error code reported by several WMI calls
	-No new changes were introduced.
	-Patch is identical to v4 patch 2
	
v5 patch 4: Changing bios_args.data to be dynamically allocated
	-Replace sizeof() with struct_size() and flex_array_size() helpers
	-Added ret variable value when the output buffer is zero


Jorge Lopez (4):
  Fix hp_wmi_read_int() reporting error (0x05)
  Fix SW_TABLET_MODE detection method
  Fix 0x05 error code reported by several WMI calls
  Changing bios_args.data to be dynamically allocated

 drivers/platform/x86/hp-wmi.c | 159 ++++++++++++++++++++++------------
 1 file changed, 106 insertions(+), 53 deletions(-)

-- 
2.25.1

