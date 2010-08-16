From: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 15/16] drivers/platform/x86: Use available error codes
Date: Mon, 16 Aug 2010 20:13:06 +0200
Message-ID: <20100816181305.GD645@bicker>
References: <Pine.LNX.4.64.1008161828350.19313@ask.diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:45846 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751555Ab0HPSNZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Aug 2010 14:13:25 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1008161828350.19313@ask.diku.dk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Julia Lawall <julia@diku.dk>
Cc: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 16, 2010 at 06:28:52PM +0200, Julia Lawall wrote:
> ---
> This changes the semantics and has not been tested.  In each case, error is
> also assigned to the result of a function call.  Perhpas that should be
> changed to result as well, and error should be eliminated.
> 

Yep.  That should be changed to result as well.

regards,
dan carpenter
