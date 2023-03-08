Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E095C678D5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Mar 2023 15:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjCHPYA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 10:24:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjCHPXt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 10:23:49 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65521149B5
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Mar 2023 07:23:47 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id az36so10057748wmb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Mar 2023 07:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678289025;
        h=content-transfer-encoding:subject:to:mime-version:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uvm/JPrLNIQNZCtgbYSFdh/LTyOoJqjd+Huoqusb7iY=;
        b=lm0IRy8nv35TzLFtAundXgrqiiBr0+B/8dZhsiHS9aVJtAV5If4LrD9xVD6hZuxdgJ
         rYc0rNvT4OpwsoJtI4BSz6ezI0kUQ19jx7VPT2F0fkp6pqAE6v5TIqyMT/cZsykKL7c/
         XLDXQt5N5dRTwyc6/hwKoCMM3HnI5Xn0DPL+jEpUvPeWP/cU/xBFqtYiMkO+GE4V214k
         oXgLKHYXE9bztqKk+h9aaoYVr8ChY0XrjAU5ozB+UH6GfVDP9O7C2NK4AQfo/Ql0hYF6
         mXs218kszmevYZi9ihNliFhZFIZWkt9a0SqBSEl8h6p6qsC+GKvWLaT5qSjs+wc/DVDq
         3Zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678289025;
        h=content-transfer-encoding:subject:to:mime-version:from:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvm/JPrLNIQNZCtgbYSFdh/LTyOoJqjd+Huoqusb7iY=;
        b=kSNP/Gjt4EYZ/zRu2dSk2umovG71EgMDA+YkD2moz4HDxHME1pPYBmwkNu8cGJiqpV
         0kRm6EI1gS4hP1LiOWntYhK5seeFBTw2PTZbIY13QWIUv8HV4BPFPScymCu9yO6UoayH
         QHaBqJwXwN8w3+MXuabfJo4OTlHqCEOPbUf1/4b++su696gz72nmLKUilAHCgbR60oSS
         zhFZEza7yI1lg1YlrpVXhTDElxHVe4+gGqV6/JnE8L5JqDZObmK4duUTXVaMQ2emVHVU
         2tf2GsphGKwlczdcZhGyKI4XZWqHzN/eyGdCiYG2DzbZ5IZrdoAN4K1hmgDEfj9pxxhx
         sYPg==
X-Gm-Message-State: AO0yUKXvzyjMtK1vLHDLqgRoay4ilTHqWbJ8TnpyPOTJSyGaLYxXWrh3
        3Lc9JZ2xvsCIdE8o99BG89WSF716UO4=
X-Google-Smtp-Source: AK7set81FdXybZe/Ts5NutKJicC9BS+dPLk42g6fItYcuSgB2xCnA5hsJw7jUWTH5k0zHsEGdXyR0Q==
X-Received: by 2002:a05:600c:1c85:b0:3ea:fc95:7bf with SMTP id k5-20020a05600c1c8500b003eafc9507bfmr16743633wms.30.1678289025704;
        Wed, 08 Mar 2023 07:23:45 -0800 (PST)
Received: from DESKTOP-8VK398V ([125.62.90.127])
        by smtp.gmail.com with ESMTPSA id s25-20020a05600c319900b003db03725e86sm15934617wmp.8.2023.03.08.07.23.44
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 08 Mar 2023 07:23:45 -0800 (PST)
Message-ID: <6408a881.050a0220.a5af1.2060@mx.google.com>
Date:   Wed, 08 Mar 2023 07:23:45 -0800 (PST)
X-Google-Original-Date: 8 Mar 2023 20:23:45 +0500
From:   yosefdeclan936@gmail.com
X-Google-Original-From: YosefDeclan936@gmail.com
MIME-Version: 1.0
To:     platform-driver-x86@vger.kernel.org
Subject: Estimate To Bid
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,=0D=0A=0D=0AWe are an estimation company. We provide estimate =
and takeoff services to the GC and subcontractors. We have expert=
ise in following trades:-=0D=0A=0D=0A(Civil, Mechanical, Electric=
al, Plumbing, HVAC=0D=0ARoofing, Painting, Windows, Glass and Gla=
zing, Countertops=0D=0ALumber, Drywall, Demolition, Networking an=
d IT, Fire Detection and Alarm System)=0D=0A =0D=0AAll you need t=
o do is just send us the drawings via email or dropbox and we wil=
l get back to you with our services fee proposal and turnaround t=
ime shortly. If you approve of the proposal we will start working=
 on your estimate.=0D=0A=0D=0AYou can ask for our sample take-off=
s & estimates to get a better idea of our work.=0D=0A=0D=0ABest R=
egards.=0D=0AYosef Declan=0D=0AMarketing Manager=0D=0ACrown Estim=
ation, LLC=0D=0A

