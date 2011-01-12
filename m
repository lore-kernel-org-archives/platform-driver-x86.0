From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] OLPC XO-1.5 ebook switch driver
Date: Tue, 11 Jan 2011 21:48:28 -0800
Message-ID: <20110112054828.GA22944@core.coreip.homeip.net>
References: <20110111202555.D58CE9D401C@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:35608 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740Ab1ALFsg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 12 Jan 2011 00:48:36 -0500
Received: by iyj18 with SMTP id 18so194245iyj.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2011 21:48:36 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20110111202555.D58CE9D401C@zog.reactivated.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Drake <dsd@laptop.org>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, pgf@laptop.org

On Tue, Jan 11, 2011 at 08:25:55PM +0000, Daniel Drake wrote:
> From: Paul Fox <pgf@laptop.org>
> 
> The OLPC XO-1.5 has an ebook switch, triggered when the laptop
> screen is rotated then folding down, converting the device into ebook
> form.
> 
> This switch is exposed through ACPI. Add a driver that exposes it
> to userspace as an input device.
> 
> Signed-off-by: Daniel Drake <dsd@laptop.org>

Acked-by: Dmitry Torokhov <dtor@mail.ru>

Thanks for making the changes.

-- 
Dmitry
