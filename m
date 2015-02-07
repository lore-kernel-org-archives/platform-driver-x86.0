From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Sony-laptop: fix sparse warning
Date: Sat, 7 Feb 2015 12:10:12 -0800
Message-ID: <20150207201012.GB42679@vmdeb7>
References: <1423147781-26018-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57454 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757986AbbBGUKQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 7 Feb 2015 15:10:16 -0500
Content-Disposition: inline
In-Reply-To: <1423147781-26018-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 05, 2015 at 02:49:41PM +0000, Lad Prabhakar wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> 
> this patch fixes following sparse warning:
> 
> sony-laptop.c:1035:29: warning: symbol 'sony_bl_props' was not declared. Should it be static?
> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Queued, thanks Lad.

-- 
Darren Hart
Intel Open Source Technology Center
