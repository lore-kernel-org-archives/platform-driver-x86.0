From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 1/2] toshiba_acpi: Add extra check to backlight code
Date: Mon, 4 Aug 2014 11:19:43 -0700
Message-ID: <20140804181943.GA15598@kroah.com>
References: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
 <1407165662-1971-2-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52442 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750925AbaHDSTq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Aug 2014 14:19:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by gateway1.nyi.internal (Postfix) with ESMTP id 9B684228D2
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Aug 2014 14:19:44 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <1407165662-1971-2-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org

On Mon, Aug 04, 2014 at 09:21:01AM -0600, Azael Avalos wrote:
> Some Toshiba models (most notably Qosmios) come with an
> incomplete backlight method where the AML code doesn't
> check for write or read commands and always returns
> HCI_SUCCESS and the actual brightness (and in some
> cases the max brightness), thus allowing the backlight
> interface to be registered without write support.
> 
> This patch changes the set_lcd_brightness function,
> checking the returned values for values greater than
> zero to avoid registering a broken backlight interface.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
