Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F54C64ED8
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Feb 2023 07:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjB0HOW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Feb 2023 02:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB0HOV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Feb 2023 02:14:21 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040123598
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 23:14:21 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id v16so2273945wrn.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 23:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBB6vwXUEWqQg/dEoq1RdFtX85xEBRgsoxb5kedbeu0=;
        b=BVnMhT1l0hZub74Fi+NfthDg6diGmaEra1MMX264m+huImZy2NDddCDyhhUb5jwLxU
         Gw5+ZJUOPRcp/ysPJTViOaMMZ0yREglHdqxR9VNwNSIW/SmpJLTYg2Vzw2tiDNpGZ33q
         TVhVZ/4Alt5Uh5VroPt8KOP2F/rrai2lbI+6ZOmt0E1q9mZn1np8lHELnNgb2L/HI3LG
         tqKLy5K8nXW7cXlx2IBTjYq3KwLLxh93LCLwGZa3/gEScpfLXtIWuhOuY5CjOJO1trg+
         k+Kj1T+d0XDclSnFuS47B6Q6H+zbQTqQXNue477lln6MkbNNcd4MJlSoerN3OVJ21yDa
         zR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBB6vwXUEWqQg/dEoq1RdFtX85xEBRgsoxb5kedbeu0=;
        b=I0nFX+kS6OeT2GM07egak3qMu06ER3qmN5yA7SRpNYADNBvfRftgj9cpBQdD6+dDDm
         sqY9DHdFo+q/ib2I037JFQRMFDJ6Do9ps+zhxh7fLPu8kJpfyNdBcc/m+bXZCP0HA2k3
         EO5PyHeHz+KGfmuMB69AAvkbZVLRtcUkqzniQeEI1Z0yM4J00UZqFUVIAEEtHK8/X8In
         XqgeeQgEW+MQNTFra9TNg5v0CimOzACd/ahln0AYGgEJxrY5oy16niOXgTnWLBQ55V1e
         hvdhLr+XvT8CR0wD6p8eUHdEtVkIsxyV5O42PfP437mAhdx/jvFsd8WRDVRBXodNIZlS
         mDkg==
X-Gm-Message-State: AO0yUKUz2PlA89SfZQMBw1Pxb5ONxmo/NriWdMlpP5cieLabojiNymnX
        +rQzzQJ46FIIobPlhNQXS5E=
X-Google-Smtp-Source: AK7set9bsEXi6pYAaOh0EJmD9rFsdFVxpAUG6dOFIqcPvg6gk66dtIa8S3v10bqc6qxNcwiIA91mGQ==
X-Received: by 2002:a05:6000:15c4:b0:2c5:3fce:423b with SMTP id y4-20020a05600015c400b002c53fce423bmr6945524wry.4.1677482059449;
        Sun, 26 Feb 2023 23:14:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b002c7163660a9sm6375395wrs.105.2023.02.26.23.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 23:14:19 -0800 (PST)
Date:   Mon, 27 Feb 2023 10:14:15 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86/intel: Intel TPMI enumeration driver
Message-ID: <Y/xYR7WGiPayZu/R@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Srinivas Pandruvada,

The patch 47731fd2865f: "platform/x86/intel: Intel TPMI enumeration
driver" from Feb 1, 2023, leads to the following Smatch static
checker warning:

	drivers/platform/x86/intel/tpmi.c:253 tpmi_create_device()
	warn: 'feature_vsec_dev' was already freed.

drivers/platform/x86/intel/tpmi.c
    232         feature_vsec_dev->pcidev = vsec_dev->pcidev;
    233         feature_vsec_dev->resource = res;
    234         feature_vsec_dev->num_resources = pfs->pfs_header.num_entries;
    235         feature_vsec_dev->priv_data = &tpmi_info->plat_info;
    236         feature_vsec_dev->priv_data_size = sizeof(tpmi_info->plat_info);
    237         feature_vsec_dev->ida = &intel_vsec_tpmi_ida;
    238 
    239         /*
    240          * intel_vsec_add_aux() is resource managed, no explicit
    241          * delete is required on error or on module unload.
    242          */
    243         ret = intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
    244                                  feature_vsec_dev, feature_id_name);
                                         ^^^^^^^^^^^^^^^^
Freed.  Just from a glace the free here seems like the real bug.

    245         if (ret)
    246                 goto free_res;
    247 
    248         return 0;
    249 
    250 free_res:
    251         kfree(res);
    252 free_vsec:
--> 253         kfree(feature_vsec_dev);
                      ^^^^^^^^^^^^^^^^
Double freed.

    254 
    255         return ret;
    256 }

regards,
dan carpenter
