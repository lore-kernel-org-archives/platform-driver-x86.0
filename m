From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [patch v4] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Tue, 20 Sep 2016 09:10:54 +0200
Message-ID: <20160920071054.GD9768@kroah.com>
References: <1474352935-18108-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33562 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751532AbcITHKt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Sep 2016 03:10:49 -0400
Content-Disposition: inline
In-Reply-To: <1474352935-18108-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vadimp@mellanox.com
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, mchehab@kernel.org, linux@roeck-us.net, x86@kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Tue, Sep 20, 2016 at 06:28:55AM +0000, vadimp@mellanox.com wrote:
> +MODULE_LICENSE("GPL v2");

This license does not match up with what your comments at the top of the
file said, please fix that.

thanks,

greg k-h
