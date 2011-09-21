From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/6] toshiba_acpi: Convert to use acpi_driver
Date: Wed, 21 Sep 2011 09:28:30 +0200
Message-ID: <CAHR064iA1877cF1rmUhX_41U_yjRGs6siswpoMPjs=WEYEm8cQ@mail.gmail.com>
References: <1316555754-25949-1-git-send-email-seth.forshee@canonical.com>
	<1316555754-25949-2-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:44521 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283Ab1IUH2c (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Sep 2011 03:28:32 -0400
In-Reply-To: <1316555754-25949-2-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 20, 2011 at 11:55 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> Changes toshiba_acpi to register an acpi driver and eliminates the
> platform device it was using.

Why to you want to remove the platform device ? If you want to create
a sysfs interface later, you'll probably need it. Most of the platform
driver I know only use the acpi_device to send proc/netlink events and
the platform_device is used everywhere else. (And anyway, it's an x86
*platform* driver, not a pure acpi driver).

> Also eliminates most global
> variables, moving them into toshiba_acpi_dev, along with some
> other miscellaneous fixes and cleanup.

Good ! Next step would be to deprecate the /proc interface (keeping it
for compatibility) and adding a new shinny
/sys/platform/device/toshiba-acpi/ interface correctly documented in
Documentation/ABI/ :).

Thanks,

-- 
Corentin Chary
http://xf.iksaif.net
