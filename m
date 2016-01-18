From: "Chen, Yu C" <yu.c.chen@intel.com>
Subject: RE: [PATCH v5] surface pro 4: Add support for Surface Pro 4 Buttons
Date: Mon, 18 Jan 2016 03:18:08 +0000
Message-ID: <36DF59CE26D8EE47B0655C516E9CE640286BD8DE@shsmsx102.ccr.corp.intel.com>
References: <1452627835-20806-1-git-send-email-wengxt@gmail.com>
 <1453072238-14789-1-git-send-email-wengxt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:31467 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751699AbcARDSN convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Jan 2016 22:18:13 -0500
In-Reply-To: <1453072238-14789-1-git-send-email-wengxt@gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Weng Xuetian <wengxt@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

> -----Original Message-----
> From: Weng Xuetian [mailto:wengxt@gmail.com]
> Sent: Monday, January 18, 2016 7:11 AM
> To: Chen, Yu C
> Cc: Darren Hart; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; Weng Xuetian
> Subject: [PATCH v5] surface pro 4: Add support for Surface Pro 4 Buttons
> 
> Surface Pro 4 buttons are managed by a device with _HID "MSHW0040"
> different from Surface Pro 3.
> 
> This commit adds MSHW0040 to id list to support the Surface Pro 4.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=109871
> Signed-off-by: Weng Xuetian <wengxt@gmail.com>

Acked-by: Chen Yu <yu.c.chen@intel.com>
