Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE235C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 19 Feb 2022 14:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbiBSOHv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 19 Feb 2022 09:07:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiBSOHu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 19 Feb 2022 09:07:50 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50AE1C7E9D
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Feb 2022 06:07:30 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id hw13so21598041ejc.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Feb 2022 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:from:date:subject:to:cc;
        bh=ekjmwlCbMcUck3zzhb0AscxbixRyYggMNXk469h8reQ=;
        b=cXOs5pO3cWwY2j51LqUUN2Apm8c8HOf/hMmMS/2zWqt23hGq4eMBc1yoaJDpWV/7d3
         /+8BrbkE045OSLtt44cQb0he8HZhJRu0Rs4QPMu+GbEr591WtcxOm87yt12nktYFVgTp
         1WgvDotjzhW15LGybnmA5YwfCeKO02HD/+7QkJMJHCP8o8QnBKg2gu4+6CEyrYDUOYJx
         xVZE/Y5cBPPUEgvC++mQxMZuCNZ+4AkSAFJQh8b5YIKeTclE9b7XWXxgSs6GmL1U9649
         zhUgUll46RjLz0M8PSfXKiRBd+GwUiKuBEqzIKSGF59JJcq/DJuVDVObKgXqFNpJWZ7M
         pNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:date:subject:to:cc;
        bh=ekjmwlCbMcUck3zzhb0AscxbixRyYggMNXk469h8reQ=;
        b=sXfUpcGvHyIYB9gNWe9xm6IoLZVU9pM+OdgEouyYhFZG/FfCDk6vOW1RioSjEUdt/M
         icBUW3fFs+JeYjNJnKwUlklL7y18QfIRTz3NeML85LXhIwGnqxmwDmrbMxxOJzGnF6aw
         /hWz8/HIM/T9bx0F43sCh/4+x7CRvoyGV1gPkF8iTL8EU/5w7rMKakS26/fjjEAtZhNf
         F+vvR4/RPonBklgsj4ibNjfS23EgACeOJMq5GexyefIfaiFtLXb6gjuIm0XXy9Byd8VH
         +GSgqJ3b9gP8rhAFsgQy0Qv5bVqTwMJBn8OcPjumdTWNcbM5XXYtkqu1L2PLfHwakf9R
         TfiA==
X-Gm-Message-State: AOAM532QJAH7zoQETX9IDTPpf05e2C0pETEH80FgUo+pSE/OTH5AIByj
        DkhTd7KkCJETsOZHW/jV6H2SXGIgGQjhLOg=
X-Google-Smtp-Source: ABdhPJw6/ZtqMtFsANAyZb4pd+gnxuB+yVXEsd5gLb9chANxZpDJvxNQe0lcdfDFM6SRg7XmX+SVwQ==
X-Received: by 2002:a17:906:824c:b0:6b8:d8e:c44c with SMTP id f12-20020a170906824c00b006b80d8ec44cmr10058922ejx.548.1645279649093;
        Sat, 19 Feb 2022 06:07:29 -0800 (PST)
Received: from localhost ([2a00:a040:195:22d0:fc1:2409:df36:9b25])
        by smtp.gmail.com with ESMTPSA id p9sm3304228ejn.104.2022.02.19.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 06:07:28 -0800 (PST)
Message-Id: <cover.1645278914.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 19 Feb 2022 15:55:14 +0200
Subject: [PATCH 0/2] lg-laptop: model recognition improvements, common battery charge limit location
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Correctly recognize 2021 and 2022 models in a way that will hopefully be
more future proof by excluding 2016 model strings, instead of including 
each year ofter 2019.

Use /sys/class/power_supply/CMB0/charge_control_end_threshold to set 
battery charge limit to 80% (or reset to 100%).

Leave a shadow of the file in the old location
/sys/devices/platform/lg-laptop/battery_care_limit and warn about it being
deprecated in the documentation.

Matan Ziv-Av (2):
  lg-laptop: Recognize more models correctly
  lg-laptop: Move setting of battery charge limit to common location

 .../ABI/testing/sysfs-platform-lg-laptop      |  2 +-
 .../admin-guide/laptops/lg-laptop.rst         |  2 +-
 drivers/platform/x86/lg-laptop.c              | 69 ++++++++++++++++---
 3 files changed, 63 insertions(+), 10 deletions(-)

-- 
Matan.

