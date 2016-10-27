From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform: x86: dell-laptop: use brightness_set_blocking
 for kbd_led_level_set
Date: Thu, 27 Oct 2016 12:33:48 +0200
Message-ID: <20161027103348.GS12154@pali>
References: <20161026151744.16638-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37938 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942862AbcJ0O2U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2016 10:28:20 -0400
Received: by mail-wm0-f46.google.com with SMTP id n67so46842930wme.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2016 07:28:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20161026151744.16638-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Wednesday 26 October 2016 17:17:44 Hans de Goede wrote:
> kbd_led_level_set uses dell_smbios call which block, so the kbd_led
> classdev should use the brightness_set_blocking callback.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Seems correct, Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com
