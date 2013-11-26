From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] sony-laptop: do not scribble keyboard backlight registers
 on resume
Date: Mon, 25 Nov 2013 20:16:03 -0800
Message-ID: <CA+55aFz89oqKmvaA-8OJK2=8d9sgjPYdgZznMGv4Kmbd5E=BNw@mail.gmail.com>
References: <52933DFD.8060206@babioch.de>
	<1385419430-4817-1-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve0-f170.google.com ([209.85.128.170]:49642 "EHLO
	mail-ve0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752092Ab3KZEQE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Nov 2013 23:16:04 -0500
In-Reply-To: <1385419430-4817-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, stable <stable@vger.kernel.org>

On Mon, Nov 25, 2013 at 2:43 PM, Mattia Dongili <malattia@linux.it> wrote:
> Follow-up to 294d31e8227c9892a89d6b3e58d17886b79ea4e6: avoid messing up
> the state on resume.

Tested fine here too, so I applied it directly to my tree since I have
the hardware..

              Linus
