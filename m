From: Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v1 0/3] IPC driver patches
Date: Mon, 22 Jul 2013 19:48:42 -0700
Message-ID: <cover.1374547036.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:23708 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753692Ab3GWCje (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Jul 2013 22:39:34 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: matthew.garrett@nebula.com, linux-kernel@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Following patches adds IPC support for addional intel platforms and provides
default interrupt mode support.

Please let me know your review comments.

Kuppuswamy Sathyanarayanan (3):
  ipc: Added platform data structure
  ipc: Enabled ipc support for additional intel platforms
  ipc: Add support for default interrupt mode

 drivers/platform/x86/Kconfig         |   15 +++++
 drivers/platform/x86/intel_scu_ipc.c |  114 ++++++++++++++++++++++++++++++----
 2 files changed, 118 insertions(+), 11 deletions(-)

-- 
1.7.9.5
