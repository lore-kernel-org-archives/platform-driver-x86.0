Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618E6C43219
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 20:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbiJRUfn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 16:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiJRUfm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 16:35:42 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133DABC449
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:39 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id m81so16956404oia.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saYWAicsNK3ifRFxBhPU/PlzIq/i9axiv/RpyDtF/kU=;
        b=E5aaYR7lC69SH6ThZbM5x68iRqygjIuVMHrCRHh7iB5+2bglwMLZNJ/+rILHh6M0p2
         rxTo7nA82lg2BZAZkV7txqaGuWJxQeLQ6zXy8/3FIsFPe4mJaHsCjdNP0kn3SG0BrG6k
         jJ5Vvc58i70gS/IJ0RpduNg0utAhIzTsYtEzkwYsh+PRP7EYaKx5+L02uOeP6N/ng1a5
         NJCuSOMcGW5SUqonyckgZ6b9l9reW2+W8FWvpqaOn17IRF1WtL8A/HZPJNdGu+rGv/b0
         phFWszgVppP+TU3lBX08N2bScBMAijuImvxmh5IsjGfF7cGt0IcttiFL5YydFNuDY29l
         T76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saYWAicsNK3ifRFxBhPU/PlzIq/i9axiv/RpyDtF/kU=;
        b=CNsFA3rFqnhdcj39Wvm4CBdFCgIrAYzKoudZSJaAXpaAKUDKDN2UpSi0e/Pc2K78dx
         +7Iq4qUpDHi8YTy6xtuXlfKX2MtqE2I+WN40nvMH8RyX/RFr/oH+5o+hg01WX58sdajU
         URebHHZPqEOL6J7d+pfaLf1b6K7rFziV1J8jgz5z65Mj2AHGYxi32trb4sAhRYMyWv62
         TP9DuZKNJxtYxht959E8GDrGnvGCYVSc6S0rgfABama9padTIXuAhoVuwxxg+0wXx1eH
         Ng5jiPwyL4Qnltllq0fVHWbvg4tlBZ+Qy7NZr3w8Fshq9uv7+ddkU4kePyoErPvj9RL2
         umdA==
X-Gm-Message-State: ACrzQf2hamPjO5LFQwDFmekZ5VRUplenx8f90b+etoNHQS4CEo1OST9c
        MalJWMB+IuOSo53YFW94PsCpzh8yC2E=
X-Google-Smtp-Source: AMsMyM5YtF++fXHXrlveRUqEu1tv9e6iUBN3IV0sx6iLedJRB8oY1WwbnriWZOVAdmi0Vdhn5iLT1g==
X-Received: by 2002:a05:6808:2183:b0:354:b70f:c2e2 with SMTP id be3-20020a056808218300b00354b70fc2e2mr16869246oib.25.1666125337874;
        Tue, 18 Oct 2022 13:35:37 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:6d8c:32db:7793:d4c0])
        by smtp.gmail.com with ESMTPSA id s4-20020a056870248400b00136cfb02a94sm6580722oaq.7.2022.10.18.13.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 13:35:37 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 6/6] Clarify how elements order list impacts priority
Date:   Tue, 18 Oct 2022 15:35:31 -0500
Message-Id: <20221018203531.17130-7-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018203531.17130-1-jorge.lopez2@hp.com>
References: <20221018203531.17130-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch provides additional clarification and describes how
priority is determined according to the order.  Elements listed first
are given higher priority to those listed last.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 Documentation/ABI/testing/sysfs-class-firmware-attributes | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index d3830b8a398f..ed2ff3a74163 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -143,7 +143,11 @@ Description:
 		elements:
 					A file that can be read to obtain the possible
 					list of values of the <attr>. Values are separated using
-					semi-colon (``;``)
+					semi-colon (``;``). The order individual elements are listed
++					according to their priority.  An Element listed first has the
++					hightest priority. Writing the list in a different order to
++					current_value alters the priority order for the particular
++					attribute.
 
 		"sure-admin"-type specific properties:
 
@@ -384,7 +388,7 @@ Description:
 			==	=========================================
 			0	All BIOS attributes setting are current
 			1	A reboot is necessary to get pending BIOS
-			        attribute changes applied
+				attribute changes applied
 			==	=========================================
 
 		Note, userspace applications need to follow below steps for efficient
-- 
2.34.1

