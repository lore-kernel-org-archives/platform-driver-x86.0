From: "Chen, Yu C" <yu.c.chen@intel.com>
Subject: RE: [PATCH v2] surface pro 4: Add support for Surface Pro 4 Buttons
Date: Sun, 27 Dec 2015 19:07:30 +0000
Message-ID: <36DF59CE26D8EE47B0655C516E9CE6402868F7D6@shsmsx102.ccr.corp.intel.com>
References: <1450988919-945-1-git-send-email-wengxt@gmail.com>
 <1451237389-7993-1-git-send-email-wengxt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:64930 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751648AbbL0THe convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Dec 2015 14:07:34 -0500
In-Reply-To: <1451237389-7993-1-git-send-email-wengxt@gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Weng Xuetian <wengxt@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>

Hi,

> -----Original Message-----
> From: Weng Xuetian [mailto:wengxt@gmail.com]
> Sent: Monday, December 28, 2015 1:30 AM
> To: Chen, Yu C
> Cc: Darren Hart; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; Weng Xuetian
> Subject: [PATCH v2] surface pro 4: Add support for Surface Pro 4 Buttons
> 
> Surface Pro 4 button is managed by a device with _HID "MSHW0040"
> different from Surface Pro 3.
> 
s/button is/buttons are
> This commit adds MSHW0040 to id list to Support Surface Pro 4, and rename
> the driver to surfacepro_button accordingly.
> 
s/Support/support the
s/rename/renames
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=109871
> Signed-off-by: Weng Xuetian <wengxt@gmail.com>
> ---
> v2:
>  - Reformat patch with -M -C
others look good to me, 

thanks,
yu
