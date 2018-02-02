From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 0/4] mlx-platform: Add support for new Mellanox systems, code improvement, fixes for msn21xx system
Date: Fri,  2 Feb 2018 08:45:44 +0000
Message-ID: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:48844 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750773AbeBBGtZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Feb 2018 01:49:25 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

The patchset:
- adds defines for bus numbers, used for system topology description;
- fixes definition for power cables for system family msn21xx;
- introduces support for new Mellanox systems;

Vadim Pasternak (4):
  platform/x86: mlx-platform: Use defines for bus assignment
  platform/x86: mlx-platform: Add define for the negative bus
  platform/x86: mlx-platform: Fix power cable setting for systems from
    msn21xx family
  platform/x86: mlx-platform: Add support for new Mellanox systems

 drivers/platform/x86/mlx-platform.c | 345 ++++++++++++++++++++++++++++++++++--
 1 file changed, 335 insertions(+), 10 deletions(-)

-- 
2.1.4
