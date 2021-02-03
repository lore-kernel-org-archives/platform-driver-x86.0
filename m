Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE13C433E9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2A3C64F84
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhBCRhS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 12:37:18 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50949 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232138AbhBCRhR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 12:37:17 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 3 Feb 2021 19:36:24 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 113HaOOF001002;
        Wed, 3 Feb 2021 19:36:24 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH RFC platform-next 0/8] platform: mellanox: Introduce initial chassis management support for modular Ethernet system
Date:   Wed,  3 Feb 2021 19:36:14 +0200
Message-Id: <20210203173622.5845-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add initial chassis management support for Nvidia modular Ethernet
switch systems MSN4800, providing a high performance switching solution
for Enterprise Data Centers (EDC) for building Ethernet based clusters,
High-Performance Computing (HPC) and embedded environments.

This system could be equipped with the different types of replaceable
line cards and management board. The first system flavor will support
the line card type MSN4800-C16 equipped with Lattice CPLD devices aimed
for system and ASIC control, one Nvidia FPGA for gearboxes (PHYs)
management, and four Nvidia gearboxes for the port control and with
16x100GbE QSFP28 ports and also with various devices for electrical
control.

The system is equipped with eight slots for line cards, four slots for
power supplies and six slots for fans. It could be configured as fully
populated or with even only one line card. The line cards are
hot-pluggable.
In the future when more line card flavors are to be available (for
example line cards with 8x200Gb Eth port, with 4x400 Eth ports, or with
some kind of smart cards for offloading purpose), any type of line card
could be inserted at any slot.

The system is based on Nvidia Spectrum-3 ASIC. The switch height is
4U and it fits standard rack size.

The next coming  card generations are supposed to support:
- Line cards with 8x200Gbe QSFP28 Ethernet ports.
- Line cards with 4x400Gbe QSFP-DD Ethernet ports.
- Smart cards equipped with Nvidia ARM CPU for offloading and for fast
  access to the storage (EBoF).
- Fabric cards for inter-connection.

Patch set contains:
Patch #1 – adds new types for modular system support.
Patch #2 - adds support for the modular system equipped with replicable
		line cards.
Patches #3 & #8 – add documentation.
Patches #4 & #6 - extend logic for hotplug devices operations for the
		modular system support.
Patch #5 – extends number of hwmon attributes for mlxreg-io driver,
		since modular system introduces more attributes.  
Patches #7 - introduces initial support for Mellanox line card devices.

Vadim Pasternak (8):
  platform_data/mlxreg: Add new types to support for modular systems
  platform/x86: mlx-platform: Add initial support for new modular system
  Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
  platform/mellanox: mlxreg-hotplug: Extend logic for hotplug devices
    operations
  platform/mellanox: mlxreg-io: Extend number of hwmon attributes
  platform/mellanox: mlxreg-hotplug: Add line card event callbacks
    support for modular system
  platform/mellanox: mlxreg-lc: Add initial support for Mellanox line
    card devices
  Documentation/ABI: Add new line card attributes for mlxreg-io sysfs
    interfaces

 Documentation/ABI/stable/sysfs-driver-mlxreg-io |  195 +++
 drivers/platform/mellanox/Kconfig               |   12 +
 drivers/platform/mellanox/Makefile              |    1 +
 drivers/platform/mellanox/mlxreg-hotplug.c      |  120 +-
 drivers/platform/mellanox/mlxreg-io.c           |    2 +-
 drivers/platform/mellanox/mlxreg-lc.c           |  807 ++++++++++
 drivers/platform/x86/mlx-platform.c             | 1817 ++++++++++++++++++++---
 include/linux/platform_data/mlxreg.h            |   61 +
 8 files changed, 2785 insertions(+), 230 deletions(-)
 create mode 100644 drivers/platform/mellanox/mlxreg-lc.c

-- 
2.11.0

