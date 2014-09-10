From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 5/5] toshiba_acpi: Change touchpad store to check for
 invalid values
Date: Tue, 9 Sep 2014 21:17:40 -0700
Message-ID: <20140910041740.GE39541@vmdeb7>
References: <1409937247-2525-1-git-send-email-coproscefalo@gmail.com>
 <1409937247-2525-6-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55558 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876AbaIJERp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 10 Sep 2014 00:17:45 -0400
Content-Disposition: inline
In-Reply-To: <1409937247-2525-6-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 05, 2014 at 11:14:07AM -0600, Azael Avalos wrote:
> The function toshiba_touchpad_store is not checking
> for invalid values and simply returns silently.
> 
> This patch checks for invalid values and returns accordingly.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
