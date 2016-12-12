From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: x86: dell-laptop: use brightness_set_blocking
 for kbd_led_level_set
Date: Mon, 12 Dec 2016 11:03:09 -0800
Message-ID: <20161212190309.GD77230@f23x64.localdomain>
References: <20161026151744.16638-1-hdegoede@redhat.com>
 <20161027103348.GS12154@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34050 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751816AbcLLTDH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2016 14:03:07 -0500
Content-Disposition: inline
In-Reply-To: <20161027103348.GS12154@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Thu, Oct 27, 2016 at 12:33:48PM +0200, Pali Rohár wrote:
> On Wednesday 26 October 2016 17:17:44 Hans de Goede wrote:
> > kbd_led_level_set uses dell_smbios call which block, so the kbd_led
> > classdev should use the brightness_set_blocking callback.
> > 
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Seems correct, Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

Queued to testing, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
