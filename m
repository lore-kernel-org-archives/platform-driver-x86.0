From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Fix USB Sleep and Music always disabled
Date: Thu, 10 Sep 2015 09:18:35 -0700
Message-ID: <20150910161835.GB113820@vmdeb7>
References: <1441819545-11619-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:60567 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbbIJQSm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Sep 2015 12:18:42 -0400
Content-Disposition: inline
In-Reply-To: <1441819545-11619-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 09, 2015 at 11:25:44AM -0600, Azael Avalos wrote:
> Commit e1a949c1b988 ("toshiba_acpi: Refactor *{get, set} functions return
> value") made changes on the return type of the HCI/SCI functions, but a
> typo on the USB Sleep and Music code is always reporting non existent
> support for such feature.
> 
> This patch corrects the typo, changing an assignment to a comparison,
> making the laptops with actual support for such feature to work again.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
> Darren,
> 
> Hopefully this patch can go into one of the 4.3 RCs, as the changes are
> there and to avoid shipping a broken feature support.

Queued for 4.3, thanks Azael.

-- 
Darren Hart
Intel Open Source Technology Center
