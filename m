Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CF3C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Mar 2023 20:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjCIUK3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Mar 2023 15:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCIUK1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 15:10:27 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97AEF9D34
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 12:10:25 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q15so2557848oiw.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2023 12:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678392625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bE9vK55MOOdzeiOE2peanZRCSNeF47LBqFjByutMLQ=;
        b=XFrz9aMcl6Rdr2FsY5/E1b865bYbpfGzGQVtwHJaXEYRZoeOYC11vQq1rYlR8lRVmm
         ikbIY8WBRDU986EITG7dsYH+KjWKHOElsBs+9oa3k9ax8sGqXdAblaW0qrgbSRmMOObe
         sVTJ6wQBETr+y6aIfzVuhUfGBjC3xteFiJB+QOTb4e7oqIg5bgER0J/K/oXDEhzDqu1J
         U65ey1rBrw3RYpDnBbXwwuk7Wt56OO6HHJHOBi3Zpu7bruHKedERdkTfx6arvTcHTJhY
         /IqdM8EmijZa5/IZQFqJmAodKJkzLsVirIf++hdGrjuj5sQhwOhEFX3RWSx7O6C1Z7E1
         l1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678392625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bE9vK55MOOdzeiOE2peanZRCSNeF47LBqFjByutMLQ=;
        b=0DrlxKutyFOSulOcZ0QZUZzAXboxi8r04u3TRdNqQyFSV2N1xFdP8ofHvKlSZmlqHW
         oXYLiFMVrhAYi9Z0lHVhf4slEBri1Vx9Eu3RUeJMhChA4q4MOamWUmnQ4goO8rO4A/Hs
         hx+3wFw7uML6ZaHpjETuyHv4vbAQscwHzBiFaWggCCBUxMw5hfXoNyPiiWb1Y7e7E6GD
         grusVEYjg9S9i7dFWC6a2MlePiT00XMMM7pPqeugeCkUVTtEqAmj0DpDjeguhhmpB9l7
         0NzfQey+YdfDUOToSYsZrVo7XCJfyetyU+CwcAKXDrKmBowLyfIuPxHLsLzTKQ3plN2p
         pElw==
X-Gm-Message-State: AO0yUKVdVSimg1DfU7OnoHZklK+JHUJTWJbr50c2t1/hEJUT1wgqtHmu
        EEIQtPqoVq2/nNEwWOdIsFjK87faXUQ=
X-Google-Smtp-Source: AK7set9oiPBSl6BFt9sLgljhaJenxnXbi2/HL0LLGqxJ/AruKKBGwY/oJmjwADth9zQoqRRxPEqREg==
X-Received: by 2002:aca:1902:0:b0:384:3e58:2666 with SMTP id l2-20020aca1902000000b003843e582666mr9777016oii.5.1678392624982;
        Thu, 09 Mar 2023 12:10:24 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:44ca:abca:1f7c:b8e7])
        by smtp.gmail.com with ESMTPSA id r129-20020acaf387000000b00383f58e7e95sm98879oih.17.2023.03.09.12.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:10:24 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v6 0/4] Introduction of HP-BIOSCFG driver
Date:   Thu,  9 Mar 2023 14:10:18 -0600
Message-Id: <20230309201022.9502-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Version 6 restructures the patches submitted in previous versions.
Earlier hp-bioscfg patches were squashed together before creating
the new split.  SureAdmin-attributes was removed completely and 
new functionality was introduced to replace its behavior.  The
new functionality is fully compliant to firmware-attributes 
framework.
 

Version 6
	- Breaks down the changes into 4 patches
	- SureAdmin-attributes was removed


Jorge Lopez (4):
  Introduction of HP-BIOSCFG driver
  Introduction of HP-BIOSCFG driver [2]
  Introduction of HP-BIOSCFG driver [3]
  Introduction of HP-BIOSCFG driver [4]

 .../testing/sysfs-class-firmware-attributes   |  107 +-
 MAINTAINERS                                   |    6 +
 drivers/platform/x86/hp/hp-bioscfg/Makefile   |   13 +
 .../x86/hp/hp-bioscfg/biosattr-interface.c    |  303 +++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1017 +++++++++++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  654 +++++++++++
 .../x86/hp/hp-bioscfg/enum-attributes.c       |  553 +++++++++
 .../x86/hp/hp-bioscfg/int-attributes.c        |  472 ++++++++
 .../x86/hp/hp-bioscfg/ordered-attributes.c    |  571 +++++++++
 .../x86/hp/hp-bioscfg/passwdattr-interface.c  |   51 +
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  676 +++++++++++
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  460 ++++++++
 .../x86/hp/hp-bioscfg/string-attributes.c     |  459 ++++++++
 .../x86/hp/hp-bioscfg/surestart-attributes.c  |  149 +++
 14 files changed, 5490 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c

--
2.34.1

