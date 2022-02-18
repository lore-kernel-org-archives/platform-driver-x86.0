Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8726EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Feb 2022 16:09:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237434AbiBRQJ0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Feb 2022 11:09:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236768AbiBRQJ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Feb 2022 11:09:26 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5E2106114
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Feb 2022 08:09:09 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id s1-20020a056830148100b005acfdcb1f4bso2274719otq.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Feb 2022 08:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzJdPADE+nA+Fh5KxykMMk/+5Ip4xq/eqrbbKued3T4=;
        b=PurEnga0A5X3uk1ew/7K0uq5nTmksIzkAmQqTqAKFwRU7DAOSLkfTIBDjCZObrFrEh
         ZMLRjPB44rA8da+QGXsOM+Wy1LZmJZOKU8nMOPwsGJuV3ayMoXCWZaWqW/xlPzSTF16R
         oolGyaKMZiK/GDRb4a5F1cmu1JQ21Y2cIL2Z3SeMY7r4WjRwc6w9yBCqBtFtGpD7UxmE
         DF5QHD2VTPqzCOhdQmn+amBZML1ofhMYke0ALImw/0tR+mQ0E5b9hhJw7VGhFhUKIUs3
         7qWB4sVpfED32qZTXKViRCmRX1LkS4DRXC5CZqyYRNd+EYPPQNOG7J7idkDo50wzx4BH
         Qlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzJdPADE+nA+Fh5KxykMMk/+5Ip4xq/eqrbbKued3T4=;
        b=kzI3x06ibyYnHnRHOUViErHOILZvR/xPmiP7/9pVfWd02RkO1x1fem2sf/pOI6/NBH
         gzYhGQbPEpkVkBG7/pg3gDwmW+x0AZzbBOeB7NdjeLRdVxCIvvDUBBKn7vqj7GggEC1d
         s19dtqF5H8IQ214M47ZTjHjprTthwJ7dq5BVeWuEHkiuScGOOZtGhivGIMXqt4t5bv5D
         MFbe+vk7o9zr+acPDteWHDiJI9KnrlSpzQ4TTOUm5N90KzKvRIoGcjVqvoBMZU2scF6X
         38cv4sl0D/TJ+mkteXO+PktzxB+/bSn21w6TunETXiyXwgMqhrGkhkCs12NM00qYkPMO
         fVCg==
X-Gm-Message-State: AOAM532AtjYF7mnX4C7dzY2EdK/rTAmVvZiwEpibBUbEkMmFlrXN1gbn
        AQrxIb49tT7ykDEKRMn25cm+BwWwDVs=
X-Google-Smtp-Source: ABdhPJxX8QQKyG0wx/tBZzpWRfikvdQ2hRN7+Jain+W/jEz/hKaJxAkoy4bmew8hyxSidja+AQQkmA==
X-Received: by 2002:a9d:8e2:0:b0:5a1:60c:dabf with SMTP id 89-20020a9d08e2000000b005a1060cdabfmr2667163otf.292.1645200548902;
        Fri, 18 Feb 2022 08:09:08 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:e8f4:b8ac:759b:cd87])
        by smtp.gmail.com with ESMTPSA id l1sm1648021otd.18.2022.02.18.08.09.08
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 08:09:08 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/3] Fix SW_TABLET_MODE detection method
Date:   Fri, 18 Feb 2022 10:09:04 -0600
Message-Id: <20220218160907.3422-1-jorge.lopez2@hp.com>
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
modes values. See patch v2 part 2 comments for list of WMI queries 
affected.  The driver now reports the appropriate states and values 
correctly.

Lastly, a limiting data size restriction was discovered. 
struct bios_args data member size limits all possible WMI commands 
to those requiring buffer size of 128 bytes or less.  Several WMI 
commands and queries require a buffer size larger than 128 bytes 
hence limiting current and new feature supported by the driver. 
hp_wmi_perform_query function changed to handle the memory 
allocation and release of any required buffer size. 


Jorge Lopez (3):

  Fix SW_TABLET_MODE detection method
  Fix 0x05 error code reported by several WMI calls
  Changing bios_args.data to be dynamically allocated

 drivers/platform/x86/hp-wmi.c | 160 ++++++++++++++++++++++------------
 1 file changed, 104 insertions(+), 56 deletions(-)

-- 
2.25.1

