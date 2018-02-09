From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v2 0/3] platform/x86: mlx-platform: Add support for new Mellanox systems
Date: Fri,  9 Feb 2018 23:59:29 +0000
Message-ID: <1518220772-98492-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37806 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752944AbeBIWWV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Feb 2018 17:22:21 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

Add support for the next new Mellanox system types: msn274x, msn201x,
qmb7, sn34, sn37. The current members of these types are:
- MSN2740 (32x100GbE Ethernet switch with cost reduction);
- MSN2010 (18x10GbE plus 4x4x25GbE);
- QMB700 (40x200GbE InfiniBand switch);
- SN3700 (32x200GbE and 16x400GbE Ethernet switch);
- SN3410 (6x400GbE plus 48x50GbE Ethernet switch).

Vadim Pasternak (3):
  platform/x86: mlx-platform: Add support for new msn274x system type
  platform/x86: mlx-platform: Add support for new  msn201x system type
  platform/x86: mlx-platform: Add support for new 200G IB and Ethernet
    systems

 drivers/platform/x86/mlx-platform.c | 325 ++++++++++++++++++++++++++++++++++++
 1 file changed, 325 insertions(+)

-- 
2.1.4
