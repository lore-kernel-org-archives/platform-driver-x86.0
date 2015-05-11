From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_bluetooth: Fix build warning
Date: Mon, 11 May 2015 10:40:43 -0700
Message-ID: <20150511174043.GA40110@vmdeb7>
References: <1431101729-4372-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35912 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbbEKRkm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 May 2015 13:40:42 -0400
Content-Disposition: inline
In-Reply-To: <1431101729-4372-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 08, 2015 at 10:15:29AM -0600, Azael Avalos wrote:
> This patch fixes the build warning caused by the BT status variable,
> it was previously printing a u64 value, but since it was moved to
> another function, the value is now an int, and thus causing such
> warning.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Integrated into:

toshiba_bluetooth: Change BT status message to debug

And now everything is in my public for-next branch.

Thanks Azael,

-- 
Darren Hart
Intel Open Source Technology Center
