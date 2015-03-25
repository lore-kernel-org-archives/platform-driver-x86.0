From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/4] toshiba_bluetooth: Clean up driver plus a bugfix
Date: Wed, 25 Mar 2015 10:51:13 -0700
Message-ID: <20150325175113.GC19129@fury.dvhart.com>
References: <1426705979-11880-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53016 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752941AbbCYRvO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Mar 2015 13:51:14 -0400
Content-Disposition: inline
In-Reply-To: <1426705979-11880-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 18, 2015 at 01:12:54PM -0600, Azael Avalos wrote:
> These patches introduce three new functions, cleaning up the driver
> code, checking for errors and returning accordingly, and also fixes
> bug 93911.
> 
> Azael Avalos (4):
>   toshiba_bluetooth: Add three new functions to the driver
>   toshiba_bluetooth: Clean up *_add function and disable BT device at
>     removal
>   toshiba_bluetooth: Clean toshiba_bluetooth_enable function

These look good.

>   toshiba_bluetooth: Remove BT enable code from *_notify function

Questions on this one separately.

> 
>  drivers/platform/x86/toshiba_bluetooth.c | 133 ++++++++++++++++++++++---------
>  1 file changed, 97 insertions(+), 36 deletions(-)
> 
> -- 
> 2.2.2
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
