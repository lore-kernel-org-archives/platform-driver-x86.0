From: Adam Lee <adam.lee@canonical.com>
Subject: Re: [PATCH 3/3] thinkpad_acpi: add LED quirks of models which don't
 have EC controllable LEDs
Date: Fri, 7 Jun 2013 23:06:51 +0800
Message-ID: <20130607150651.GA2227@adam-laptop>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
 <1370593209-21358-4-git-send-email-adam.lee@canonical.com>
 <1370611358.6315.48.camel@x230.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:44200 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754298Ab3FGPHG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Jun 2013 11:07:06 -0400
Received: by mail-pd0-f170.google.com with SMTP id x10so4934749pdj.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Jun 2013 08:07:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1370611358.6315.48.camel@x230.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>, Bjorn Mork <bjorn@mork.no>

On Fri, Jun 07, 2013 at 01:22:39PM +0000, Matthew Garrett wrote:
> On Fri, 2013-06-07 at 16:20 +0800, Adam Lee wrote:
> > Some new Lenovo or ThinkPad laptops don't have EC controllable LEDs.
> > This patch adds their quirks.
> 
> Can you detect this case? If this is a new way of doing things then
> you're going to have to add new entries to the quirk list every time
> Lenovo release a new machine, which isn't really going to work.

Thanks. The difference is their LED handle expects only one argument,
not two. Does kernel have a method detecting acpi_handle's arguments
number? (checking...)

About the new way:

Lenovo is going to assign a ACPI method to each operation. Like the
volume_toggle button and LED, hardware toggle is "SHDA", getting state
is "GSMS", setting state is "SSMS".

About the problem:

Some models only support the new way but containing internal EC LED
interfaces which makes our detecting failed at the same time. The new
interfaces accept only one argument(on, off, or blink), we couldn't
control LEDs by them because can't specify the LED number. If you give
them two arguments, it returns ACPI warning, so I wanna add these "0"
quirks.

-- 
Regards,
Adam Lee
Hardware Enablement
