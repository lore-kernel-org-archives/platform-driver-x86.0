From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 11/11] platform/x86: fujitsu-laptop: remove redundant
 fields from struct fujitsu_bl
Date: Mon, 3 Apr 2017 18:16:28 -0700
Message-ID: <20170404011628.GA16584@fury>
References: <20170330103509.32509-1-kernel@kempniu.pl>
 <20170330103509.32509-12-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41796 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751668AbdDDBQb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2017 21:16:31 -0400
Content-Disposition: inline
In-Reply-To: <20170330103509.32509-12-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 30, 2017 at 12:35:09PM +0200, Michał Kępień wrote:
> The dev field of struct fujitsu_bl is assigned in acpi_fujitsu_bl_add(),
> but never used afterwards.  brightness_changed is set in get_lcd_level()
> and then its value is only printed in a debug message, so it does not
> influence execution flow.  Remove both fields as they are redundant.

Indeed, once that was removed from the platform device and the corresponding
sysfs entries were eliminated, we can drop it:

78b2602 platform/x86: fujitsu-laptop: remove backlight-related attributes from the platform device

:-)

-- 
Darren Hart
VMware Open Source Technology Center
