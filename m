From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 5/5] toshiba_acpi: Change touchpad store to check for
 invalid values
Date: Thu, 11 Sep 2014 15:49:06 -0700
Message-ID: <20140911224906.GC18425@vmdeb7>
References: <1410404517-4209-1-git-send-email-coproscefalo@gmail.com>
 <1410404517-4209-2-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49014 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320AbaIKWtI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 11 Sep 2014 18:49:08 -0400
Content-Disposition: inline
In-Reply-To: <1410404517-4209-2-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 10, 2014 at 09:01:57PM -0600, Azael Avalos wrote:
> The function toshiba_touchpad_store is not checking
> for invalid values and simply returns silently.
> 
> This patch checks for invalid values and returns accordingly.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued, thanks Azael!

-- 
Darren Hart
Intel Open Source Technology Center
