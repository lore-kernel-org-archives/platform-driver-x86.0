From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] classmate-laptop: fix sparse warning
Date: Sat, 7 Feb 2015 12:12:23 -0800
Message-ID: <20150207201223.GA55117@vmdeb7>
References: <1423148264-6877-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57476 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755892AbbBGUMb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 7 Feb 2015 15:12:31 -0500
Content-Disposition: inline
In-Reply-To: <1423148264-6877-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Daniel Oliveira Nascimento <don@syst.com.br>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 05, 2015 at 02:57:44PM +0000, Lad Prabhakar wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> 
> this patch fixes following sparse warning:
> 
> classmate-laptop.c:523:61: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Queued, thanks Lad.

-- 
Darren Hart
Intel Open Source Technology Center
