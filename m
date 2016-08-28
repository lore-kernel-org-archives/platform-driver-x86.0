From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Fix the kbd_backlight_mode_show printed
 value
Date: Sun, 28 Aug 2016 10:06:08 -0700
Message-ID: <20160828170608.GE96930@f23x64.localdomain>
References: <20160816180755.1845-1-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52132 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755746AbcH1RGJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Aug 2016 13:06:09 -0400
Content-Disposition: inline
In-Reply-To: <20160816180755.1845-1-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 16, 2016 at 12:07:55PM -0600, Azael Avalos wrote:
> The mentioned function prints the value in decimal, but the
> documentation and its parent function available_kbd_modes_show
> are showing the value as hexadecimal.
> 
> This patch simply changes the value printed from decimal to hex,
> as stated in the documentation and the parent function.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Thanks, Queued to for-next.

-- 
Darren Hart
Intel Open Source Technology Center
