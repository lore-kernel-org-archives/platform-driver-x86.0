From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/4] toshiba_acpi: Change *available functions return
 type
Date: Tue, 28 Jul 2015 20:46:21 -0700
Message-ID: <20150729034621.GC3171@vmdeb7>
References: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
 <1438046548-3081-3-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36879 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836AbbG2FDC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jul 2015 01:03:02 -0400
Content-Disposition: inline
In-Reply-To: <1438046548-3081-3-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 27, 2015 at 07:22:25PM -0600, Azael Avalos wrote:
> This patch changes the *available functions return type from int to
> void.
> 
> The checks for support of their respective features are done inside
> such functions and there was no need to return anything as we can
> flag the queried feature as supported inside these functions.
> 
> The code was adapted accordingly to these changes and two new
> variables were created and another was changed from uint to bool.
> 
> While at the neighborhood, some of the functions were cleaned from

Please consider this a red flag in the future. "While in the neighborhood" means
you need to split the patch across distinct functional boundaries.

-- 
Darren Hart
Intel Open Source Technology Center
